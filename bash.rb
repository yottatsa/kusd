#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.10
# from Racc grammer file "".
#

require 'racc/parser.rb'

# $Id$
require './bashlex'
class Bash < Racc::Parser


  def load(str)
    @q = []
    lex = Lexer.new(str)
    lex.run { |q| @q << q }
  end

  def setq(qs)
    @q = qs
    self
  end

  def squote(s)
    s[1 ... -1]
  end

  def next_token
    n = @q.shift
    n
  end

  def dolist(kind, car, cdr)
    if cdr.is_a?(Hash) and cdr[:type] == kind
      {type: kind, values: [car, *cdr[:values]].compact}
    elsif car.is_a?(Hash) and car[:type] == kind
#      raise RuntimeError, "wtf: #{car.inspect} : #{cdr.inspect}"
      {type: kind, values: [*car[:values], cdr]}
    else
      {type: kind, values: [car, cdr].compact}
    end
  end

  def next
    while @q[0] and @q[0][0] != :EOF and parsed = do_parse
      yield parsed unless parsed == "\n"
    end
    raise StopIteration
  end

  def each(*a,&b)
    if b
      begin
        self.next { |u| b.call(u) } while true 
      rescue StopIteration
      end
    else
      units = []
      begin
	self.next { |u| units << u } while true
      rescue StopIteration
      end
      units.each(*a,&b)
    end
  end

##### State transition tables begin ###

racc_action_table = [
   -26,    13,    65,   -26,   -26,    65,    84,   -26,    64,    25,
    65,    80,   121,    36,    90,     8,    18,    24,    19,    72,
    35,    34,    20,    73,    74,   -26,    13,    21,   -26,   -26,
   -27,   110,   -26,   -27,   -27,    65,    71,   -27,    30,    31,
     8,    18,    38,    19,    69,    41,    40,    20,   116,    39,
   -26,    13,    21,   -26,   -26,   117,    61,   -26,    13,    60,
    65,    13,    62,    30,    31,     8,    18,    65,    19,    64,
    65,    49,    20,    18,    46,    19,    18,    21,    19,    20,
    13,     4,    20,    42,    21,    73,    74,    21,    22,     3,
    13,    36,   124,   102,     8,    18,   126,    19,    35,    34,
    13,    20,    30,    31,     8,    18,    21,    19,   nil,    65,
    13,    20,   nil,   nil,     8,    18,    21,    19,   nil,    65,
    13,    20,   nil,   nil,     8,    18,    21,    19,   nil,    65,
    13,    20,   nil,   nil,     8,    18,    21,    19,   nil,    65,
   nil,    20,   nil,   nil,     8,    18,    21,    19,    13,    -7,
   nil,    20,    99,   100,   102,   nil,    21,    -7,    13,    -8,
   nil,   nil,     8,    18,   nil,    19,   nil,    -8,    13,    20,
   nil,   nil,     8,    18,    21,    19,    13,    65,   nil,    20,
   nil,   nil,     8,    18,    21,    19,    13,   nil,   nil,    20,
     8,    18,   nil,    19,    21,    65,    13,    20,   nil,   nil,
     8,    18,    21,    19,    13,    65,   nil,    20,   nil,   nil,
     8,    18,    21,    19,    13,   nil,   nil,    20,     8,    18,
   nil,    19,    21,    65,   nil,    20,   nil,   nil,     8,    18,
    21,    19,   nil,   nil,    38,    20,   nil,    41,    40,    38,
    21,    39,    41,    40,    38,   nil,    39,    41,    40,    61,
    61,    39,    60,    60,    61,    62,    62,    60,   nil,   nil,
    62,    86,    87,    85,    88,    89,    26,    27,   nil,    28,
    29,   112,   113,   114,   112,   113,   114 ]

racc_action_check = [
    94,    94,   115,    94,    94,    70,    64,    94,    84,     2,
    94,    59,   115,    98,    70,    94,    94,     2,    94,    48,
    98,    98,    94,    76,    76,    93,    93,    94,    93,    93,
    63,   101,    93,    63,    63,    93,    47,    63,    77,    77,
    93,    93,    37,    93,    44,    37,    37,    93,   109,    37,
    95,    95,    93,    95,    95,   111,    62,    95,    54,    62,
    95,    55,    62,    78,    78,    95,    95,    54,    95,    42,
    55,    22,    95,    54,    19,    54,    55,    95,    55,    54,
     0,     0,    55,    13,    54,    75,    75,    55,     1,     0,
     8,     8,   122,   122,     0,     0,   123,     0,     8,     8,
    96,     0,     7,     7,     8,     8,     0,     8,   nil,    96,
   120,     8,   nil,   nil,    96,    96,     8,    96,   nil,   120,
   119,    96,   nil,   nil,   120,   120,    96,   120,   nil,   119,
   118,   120,   nil,   nil,   119,   119,   120,   119,   nil,   118,
   nil,   119,   nil,   nil,   118,   118,   119,   118,    26,    26,
   nil,   118,    91,    91,    91,   nil,   118,    26,    27,    27,
   nil,   nil,    26,    26,   nil,    26,   nil,    27,    97,    26,
   nil,   nil,    27,    27,    26,    27,    73,    97,   nil,    27,
   nil,   nil,    97,    97,    27,    97,    52,   nil,   nil,    97,
    73,    73,   nil,    73,    97,    52,    53,    73,   nil,   nil,
    52,    52,    73,    52,    74,    53,   nil,    52,   nil,   nil,
    53,    53,    52,    53,    43,   nil,   nil,    53,    74,    74,
   nil,    74,    53,    43,   nil,    74,   nil,   nil,    43,    43,
    74,    43,   nil,   nil,    90,    43,   nil,    90,    90,    12,
    43,    90,    12,    12,    58,   nil,    12,    58,    58,    61,
    60,    58,    61,    60,    40,    61,    60,    40,   nil,   nil,
    40,    66,    66,    66,    66,    66,     5,     5,   nil,     5,
     5,   106,   106,   106,   107,   107,   107 ]

racc_action_pointer = [
    77,    88,     5,   nil,   nil,   256,   nil,    87,    87,   nil,
   nil,   nil,   237,    81,   nil,   nil,   nil,   nil,   nil,    72,
   nil,   nil,    71,   nil,   nil,   nil,   145,   155,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    40,   nil,   nil,
   252,   nil,    66,   211,    25,   nil,   nil,    11,   -11,   nil,
   nil,   nil,   183,   193,    55,    58,   nil,   nil,   242,     4,
   248,   247,    54,    28,     4,   nil,   251,   nil,   nil,   nil,
    -7,   nil,   nil,   173,   201,    75,    13,    23,    48,   nil,
   nil,   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,   nil,
   232,   126,   nil,    23,    -2,    48,    97,   165,     9,   nil,
   nil,     5,   nil,   nil,   nil,   nil,   261,   264,   nil,    22,
   nil,    30,   nil,   nil,   nil,   -10,   nil,   nil,   127,   117,
   107,   nil,    65,    73,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -26,   -67,   -67,    -2,    -3,    -6,   -13,   -14,   -26,   -19,
   -22,   -23,   -67,   -67,   -41,   -42,   -43,   -44,   -20,   -67,
   -20,   -20,   -67,    -1,    -4,    -5,   -26,   -26,   -20,   -20,
   -20,   -20,   -15,   -16,   -38,   -39,   -40,   -36,   -28,   -29,
   -32,   -31,   -26,   -26,   -67,   -55,   -20,   -67,   -67,   128,
   -11,   -12,   -26,   -26,   -26,   -26,   -24,   -37,   -36,   -67,
   -32,   -32,   -32,   -25,   -67,   -21,   -56,   -57,   -66,   -46,
   -67,   -20,   -54,   -26,   -26,    -9,   -10,   -17,   -18,   -45,
   -30,   -33,   -34,   -35,   -26,   -20,   -20,   -20,   -20,   -20,
   -67,   -67,   -27,   -58,   -59,   -60,   -26,   -26,   -67,   -48,
   -20,   -67,   -20,   -65,   -63,   -64,   -61,   -62,   -20,   -67,
   -50,   -67,   -20,   -20,   -20,   -67,   -49,   -20,   -26,   -26,
   -26,   -20,   -51,   -67,   -20,   -53,   -47,   -52 ]

racc_goto_table = [
    44,    33,    47,    48,    66,    63,   101,     5,    52,    53,
    54,    55,    56,    77,    78,     1,    98,    37,    59,    23,
     2,    67,     6,   nil,   nil,   nil,    70,   nil,   nil,   nil,
    32,   nil,   nil,    79,    51,   nil,   nil,   125,    81,    82,
    83,   nil,   nil,   nil,   nil,   nil,   nil,    92,     6,     6,
   nil,   nil,   nil,    91,   nil,   104,   105,   106,   107,    75,
    76,   nil,   nil,   nil,   nil,    93,    94,    95,    96,    97,
   nil,   nil,   nil,   nil,     6,     6,   nil,   nil,   nil,   104,
   105,    51,   109,   nil,   111,   nil,   nil,   nil,   115,   nil,
   nil,   108,   118,   119,   120,     6,     6,   nil,   nil,   122,
   nil,   nil,   nil,   123,   nil,   nil,   127 ]

racc_goto_check = [
    21,     8,    21,    21,    24,    12,    22,     4,     5,     5,
     5,     5,    14,     7,     7,     1,    16,    13,    15,     3,
     2,    25,     6,   nil,   nil,   nil,     5,   nil,   nil,   nil,
     6,   nil,   nil,    14,     4,   nil,   nil,    22,    15,    15,
    15,   nil,   nil,   nil,   nil,   nil,   nil,    12,     6,     6,
   nil,   nil,   nil,    21,   nil,    24,    24,    24,    24,     4,
     4,   nil,   nil,   nil,   nil,     5,     5,     5,     5,     5,
   nil,   nil,   nil,   nil,     6,     6,   nil,   nil,   nil,    24,
    24,     4,    21,   nil,    21,   nil,   nil,   nil,     5,   nil,
   nil,     8,     5,     5,     5,     6,     6,   nil,   nil,    21,
   nil,   nil,   nil,    21,   nil,   nil,    21 ]

racc_goto_pointer = [
   nil,    15,    20,    17,     7,   -20,    22,   -41,    -7,   nil,
   nil,   nil,   -37,     5,   -25,   -22,   -74,   nil,   nil,   nil,
   nil,   -18,   -85,   nil,   -39,   -22 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,    50,    43,    68,     7,   nil,     9,
    10,    11,    12,    58,   nil,   nil,    57,    14,    15,    16,
    17,   nil,   nil,    45,   103,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 32, :_reduce_1,
  1, 32, :_reduce_2,
  1, 32, :_reduce_3,
  1, 34, :_reduce_4,
  1, 34, :_reduce_5,
  1, 33, :_reduce_none,
  2, 33, :_reduce_none,
  2, 33, :_reduce_none,
  4, 35, :_reduce_9,
  4, 35, :_reduce_10,
  3, 35, :_reduce_11,
  3, 35, :_reduce_12,
  1, 35, :_reduce_none,
  1, 37, :_reduce_none,
  2, 37, :_reduce_15,
  2, 37, :_reduce_16,
  4, 38, :_reduce_17,
  4, 38, :_reduce_18,
  1, 38, :_reduce_none,
  0, 36, :_reduce_none,
  2, 36, :_reduce_21,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  3, 41, :_reduce_24,
  3, 41, :_reduce_25,
  0, 43, :_reduce_26,
  3, 43, :_reduce_27,
  1, 44, :_reduce_28,
  1, 44, :_reduce_29,
  3, 44, :_reduce_30,
  1, 44, :_reduce_31,
  0, 46, :_reduce_32,
  2, 46, :_reduce_33,
  2, 46, :_reduce_34,
  2, 46, :_reduce_35,
  0, 45, :_reduce_36,
  1, 45, :_reduce_none,
  1, 39, :_reduce_38,
  1, 39, :_reduce_39,
  1, 39, :_reduce_40,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  2, 47, :_reduce_45,
  3, 51, :_reduce_46,
  10, 48, :_reduce_47,
  5, 49, :_reduce_48,
  7, 49, :_reduce_49,
  6, 49, :_reduce_50,
  4, 53, :_reduce_51,
  6, 53, :_reduce_52,
  5, 53, :_reduce_53,
  3, 50, :_reduce_54,
  1, 52, :_reduce_none,
  2, 52, :_reduce_56,
  2, 54, :_reduce_57,
  3, 56, :_reduce_58,
  3, 56, :_reduce_59,
  3, 56, :_reduce_60,
  4, 55, :_reduce_61,
  4, 55, :_reduce_62,
  4, 55, :_reduce_63,
  4, 55, :_reduce_64,
  4, 55, :_reduce_65,
  1, 55, :_reduce_none ]

racc_reduce_n = 67

racc_shift_n = 128

racc_token_table = {
  false => 0,
  :error => 1,
  :WORD => 2,
  :ASGNWORD => 3,
  :EOF => 4,
  :BACKTICK => 5,
  :DQUOTE => 6,
  :ENDDQUOTE => 7,
  :VAR => 8,
  :SQUOTE => 9,
  "&" => 10,
  ";" => 11,
  "\n" => 12,
  "&&" => 13,
  "||" => 14,
  "|" => 15,
  "|&" => 16,
  "!" => 17,
  "(" => 18,
  ")" => 19,
  "for" => 20,
  "in" => 21,
  "do" => 22,
  "done" => 23,
  "if" => 24,
  "then" => 25,
  "fi" => 26,
  "else" => 27,
  "elif" => 28,
  "{" => 29,
  "}" => 30 }

racc_nt_base = 31

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "WORD",
  "ASGNWORD",
  "EOF",
  "BACKTICK",
  "DQUOTE",
  "ENDDQUOTE",
  "VAR",
  "SQUOTE",
  "\"&\"",
  "\";\"",
  "\"\\n\"",
  "\"&&\"",
  "\"||\"",
  "\"|\"",
  "\"|&\"",
  "\"!\"",
  "\"(\"",
  "\")\"",
  "\"for\"",
  "\"in\"",
  "\"do\"",
  "\"done\"",
  "\"if\"",
  "\"then\"",
  "\"fi\"",
  "\"else\"",
  "\"elif\"",
  "\"{\"",
  "\"}\"",
  "$start",
  "inputunit",
  "simple_list",
  "simple_list_terminator",
  "simple_list1",
  "newline_list",
  "pipeline_command",
  "pipeline",
  "list_terminator",
  "command",
  "simple_command",
  "shell_command",
  "assignations",
  "simple_command_element",
  "simple_command_elements",
  "quoted",
  "word_list",
  "for_command",
  "if_command",
  "group_command",
  "subshell",
  "compound_list",
  "elif_clause",
  "list",
  "list1",
  "list0" ]

Racc_debug_parser = true

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = val[0]; yyaccept 
    result
end

def _reduce_2(val, _values, result)
 result = :xx; yyaccept 
    result
end

def _reduce_3(val, _values, result)
 yyerror 
    result
end

def _reduce_4(val, _values, result)
 result = :xx 
    result
end

def _reduce_5(val, _values, result)
 result = :yy 
    result
end

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

def _reduce_9(val, _values, result)
 result = {type: :flow, op: val[1], car: val[0], cdr: val[3]} 
    result
end

def _reduce_10(val, _values, result)
 result = {type: :flow, op: val[1], car: val[0], cdr: val[3]} 
    result
end

def _reduce_11(val, _values, result)
 result = dolist(:list, {type: :bg, value: val[0]}, val[3]) 
    result
end

def _reduce_12(val, _values, result)
 result = dolist(:list, val[0], val[3]) 
    result
end

# reduce 13 omitted

# reduce 14 omitted

def _reduce_15(val, _values, result)
 result = {type: :not, value: val[1]} 
    result
end

def _reduce_16(val, _values, result)
 result = {type: :exec, asgn: [], car: "false", cdr: []} 
    result
end

def _reduce_17(val, _values, result)
 result = dolist(:pipe, val[0], val[3]) 
    result
end

def _reduce_18(val, _values, result)
 result = dolist(:pipe, {type: :wrap_stderr, value: val[0]}, val[3]) 
    result
end

# reduce 19 omitted

# reduce 20 omitted

def _reduce_21(val, _values, result)
 result = :xx 
    result
end

# reduce 22 omitted

# reduce 23 omitted

def _reduce_24(val, _values, result)
 result = {type: :exec, asgn: val[0], car: val[1], cdr: val[2]} 
    result
end

def _reduce_25(val, _values, result)
 result = {type: :let, asgn: [{type: :assign, key: val[0], value: val[1]}, *val[2]]} 
    result
end

def _reduce_26(val, _values, result)
 result = [] 
    result
end

def _reduce_27(val, _values, result)
 result = [{type: :assign, key: val[0], value: val[1]}, *val[2]] 
    result
end

def _reduce_28(val, _values, result)
 result = {type: :lit, value: val[0]} 
    result
end

def _reduce_29(val, _values, result)
 result = {type: :lit, value: squote(val[0])} 
    result
end

def _reduce_30(val, _values, result)
 result = {type: :str, values: val[1]} 
    result
end

def _reduce_31(val, _values, result)
 result = {type: :backtick, value: Bash.new.setq(val[0]).each} 
    result
end

def _reduce_32(val, _values, result)
 result = [] 
    result
end

def _reduce_33(val, _values, result)
 result = [{type: :backtick, value: Bash.new.setq(val[0]).each}, *val[1]] 
    result
end

def _reduce_34(val, _values, result)
 result = [{type: :lit, value: val[0]}, *val[1]] 
    result
end

def _reduce_35(val, _values, result)
 result = [{type: :var, value: val[0][1..-1]}, *val[1]] 
    result
end

def _reduce_36(val, _values, result)
 result = [] 
    result
end

# reduce 37 omitted

def _reduce_38(val, _values, result)
 result = :xx 
    result
end

def _reduce_39(val, _values, result)
 result = :zz 
    result
end

def _reduce_40(val, _values, result)
 result = :yy 
    result
end

# reduce 41 omitted

# reduce 42 omitted

# reduce 43 omitted

# reduce 44 omitted

def _reduce_45(val, _values, result)
 result = [val[0], *val[1]] 
    result
end

def _reduce_46(val, _values, result)
 result = {type: :fork, value: val[1]} 
    result
end

def _reduce_47(val, _values, result)
 result = {type: :for, var: val[1], list: val[4], value: val[8]} 
    result
end

def _reduce_48(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3]} 
    result
end

def _reduce_49(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3], else: val[5] } 
    result
end

def _reduce_50(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3], else: val[4] } 
    result
end

def _reduce_51(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3]} 
    result
end

def _reduce_52(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3], else: val[5] } 
    result
end

def _reduce_53(val, _values, result)
 result = {type: :if, cond: val[1], then: val[3], else: val[4] } 
    result
end

def _reduce_54(val, _values, result)
 result = val[1] 
    result
end

# reduce 55 omitted

def _reduce_56(val, _values, result)
 result = val[1] 
    result
end

def _reduce_57(val, _values, result)
 result = val[1] 
    result
end

def _reduce_58(val, _values, result)
 result = dolist(:list, val[0], val[2]) 
    result
end

def _reduce_59(val, _values, result)
 result = dolist(:list, {type: :bg, value: val[0]}, val[2]) 
    result
end

def _reduce_60(val, _values, result)
 result = dolist(:list, val[0], val[2]) 
    result
end

def _reduce_61(val, _values, result)
 result = {type: :flow, op: val[1], car: val[0], cdr: val[3]} 
    result
end

def _reduce_62(val, _values, result)
 result = {type: :flow, op: val[1], car: val[0], cdr: val[3]} 
    result
end

def _reduce_63(val, _values, result)
 result = dolist(:list, {type: :bg, value: val[0]}, val[3]) 
    result
end

def _reduce_64(val, _values, result)
 result = dolist(:list, val[0], val[3]) 
    result
end

def _reduce_65(val, _values, result)
 result = dolist(:list, val[0], val[3]) 
    result
end

# reduce 66 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Bash


def unparse(exp)
  case exp
  when Array, Enumerator
    exp.map{|x| unparse(x)}.join(' ')
  when Hash
    case exp[:type]
    when :lit
      "\"#{exp[:value]}\""
    when :exec
      (
        exp[:asgn].map{|e| unparse(e)} +	# list of "assign"s
	[exp[:car][:value]] +
	exp[:cdr].map{|e| unparse(e)}		# list of "lit/backtick"s
      ).join(' ')
    when :not
      "! " + unparse(exp[:value])
    when :var
      "${#{exp[:value]}}"
    when :str
      exp[:values].map{|e| unparse(e)}.join
    when :assign
      exp[:key] + exp[:value]
    when :list
      exp[:values].reject{|x| x =~ /^\s*$/}.map{|e| unparse(e)}.join(" ; ")
    when :pipe
      exp[:values].map{|e| unparse(e)}.join(" | ")
    when :simple
      unparse(exp[:value])
    when :backtick
      "$( #{unparse(exp[:value])} )"
    when :fork
      "(#{unparse(exp[:value])})"
    when :for
      "for #{exp[:var]} in #{exp[:list].map{|x| unparse(x)}.join(' ')} do ; #{unparse exp[:value]} ; done"
    when :let
      exp[:asgn].map{|e| unparse(e)}.join(" ")
    else
      raise NotImplementedError, exp.inspect
    end
  when NilClass
    ""
  else
    raise NotImplementedError, exp.inspect
  end
end

if $PROGRAM_NAME == __FILE__
  require 'pp'
  parser = Bash.new
  p "INIT OK"
  program = <<-EOF
#!/bin/sh
    cat | shuf | head 
    special
    z=0 n=0
    ( a ; b ) | ( c
    d )
    for i in `ls *.txt` ; do 
      echo "Foo $i has $(get_bucks $i) \\$"
      echo $(get_bucks $i)
      echo bar | POSIXLY_CORRECT=1 grep --color=auto 'a'
      ! test -d "$i"
    done # This is a comment
    exit 0
  EOF
  program = "a --arg value | b | c"
  parser.load(program)
  parser.each do |parsed|
    pp parsed
    puts unparse( parsed )
    puts "--"
  end
end
