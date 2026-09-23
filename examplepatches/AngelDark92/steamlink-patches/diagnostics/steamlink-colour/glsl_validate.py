#!/usr/bin/env python3
"""Strict structural/semantic validator for the assembled GLSL ES 3.00 fragment
shaders emitted by Sdr10ShaderAssembleAudit (diagnostics/steamlink-colour).

This machine has no GLSL compiler (no glslangValidator/VulkanSDK), so this
validator is the static gate for the assembled .glsl files. It is NOT a driver
compile: it performs no code generation and no floating-point evaluation beyond
checking that numeric literals are finite and in range. It verifies, fail-closed:

  * preprocessor form: first directive is exactly "#version 300 es";
    "#extension <name> : enable" is well-formed; samplerExternalOES usage
    requires GL_OES_EGL_image_external_essl3 to be enabled;
  * declaration parsing (global and local scopes): precision statements,
    layout(location=N), in/out/uniform/const declarations, duplicate names,
    and that a default float precision is declared (fragment-shader float
    precision is undefined in ESSL 3.00 without it);
  * a full recursive-descent expression/statement parse with GLSL operator
    precedence, so any malformed syntax, unbalanced brace/paren/bracket, or
    missing semicolon fails;
  * declaration/usage resolution: every used identifier must be a declared
    variable/const/in/out/local, a GLSL ES 3.00 built-in function or variable,
    or a constructor; undeclared or duplicate uses fail;
  * operator/built-in/constructor kind rules (scalar/vector/matrix
    compatibility, e.g. pow(vec3,float) ok but pow(vec3,vec3) is not legal
    ESSL 3.00, texture(samplerExternalOES,vec2)->vec4);
  * literal validity: every numeric literal must be finite and in range;
  * const initializers must be constant expressions (no uniforms, no gl_*
    built-in variables, no texture/derivative calls);
  * assignment targets must be declared mutable values or vector members;
  * exactly one "void main()" with no parameters.

Usage:
    python glsl_validate.py <file-or-directory> [<file-or-directory> ...]

Exit codes: 0 = all files valid; 1 = at least one invalid; 2 = usage error.
"""

import math
import sys
from pathlib import Path

# --------------------------------------------------------------------------
# Types and errors
# --------------------------------------------------------------------------


class GlslError(Exception):
    pass


# Kind model: scalar F/I/B/U, vectors V<n><F|I|B|U>, matrices M2..M4,
# samplers SMP (non-shadow), SMPEXT (samplerExternalOES), SMPSH (shadow).
TYPE_KINDS = {
    "float": "F", "int": "I", "bool": "B", "uint": "U",
    "vec2": "V2F", "vec3": "V3F", "vec4": "V4F",
    "ivec2": "V2I", "ivec3": "V3I", "ivec4": "V4I",
    "bvec2": "V2B", "bvec3": "V3B", "bvec4": "V4B",
    "uvec2": "V2U", "uvec3": "V3U", "uvec4": "V4U",
    "mat2": "M2", "mat3": "M3", "mat4": "M4",
    "sampler1D": "SMP", "sampler2D": "SMP", "sampler3D": "SMP", "samplerCube": "SMP",
    "samplerExternalOES": "SMPEXT",
    "sampler1DShadow": "SMPSH", "sampler2DShadow": "SMPSH", "samplerCubeShadow": "SMPSH",
    "void": "VOID",
}

KEYWORDS = {
    "attribute", "const", "uniform", "varying", "buffer", "shared", "coherent",
    "volatile", "restrict", "layout", "centroid", "smooth", "flat", "in", "out",
    "inout", "break", "continue", "do", "for", "while", "switch", "case",
    "default", "discard", "return", "ifdef", "ifndef", "endif", "else",
    "pragma", "struct", "highp", "mediump", "lowp", "precision",
    "invariant", "precise", "atomic_uint", "filter",
}

BUILTIN_VARS = {
    "gl_FragCoord": "V4F", "gl_FragColor": "V4F", "gl_FragDepth": "F",
    "gl_FrontFacing": "B", "gl_PointCoord": "V2F",
    "gl_VertexID": "I", "gl_InstanceID": "I",
}

# Texture/derivative built-ins are the only non-constant built-ins.
NON_CONSTANT_BUILTINS = {
    "texture", "textureProj", "textureLod", "textureProjLod", "textureOffset",
    "texelFetch", "dFdx", "dFdy", "fwidth",
}

SCALAR_KINDS = ("F", "I", "B", "U")


def vec_n(kind):
    """Component count for a vector kind, else 0."""
    return int(kind[1]) if kind and kind.startswith("V") and len(kind) == 3 and kind[1].isdigit() else 0


def is_vec(kind):
    return vec_n(kind) != 0


def same_vec(a, b):
    return is_vec(a) and is_vec(b) and vec_n(a) == vec_n(b) and a[2] == b[2]


# --------------------------------------------------------------------------
# Tokenizer
# --------------------------------------------------------------------------

TWO_CHAR = {"<=", ">=", "==", "!=", "&&", "||", "+=", "-=", "*=", "/=", "%="}
ONE_CHAR = set("+-*/%<>?():{}[],;=.")
HEX_DIGITS = set("0123456789abcdefABCDEF")


class Tok:
    __slots__ = ("kind", "text", "line", "col", "value")

    def __init__(self, kind, text, line, col, value=None):
        self.kind = kind  # 'id' | 'int' | 'uint' | 'float' | 'hexfloat' | 'punct'
        self.text = text
        self.line = line
        self.col = col
        self.value = value


def fail_at(line, col, msg):
    raise GlslError(f"line {line}, col {col}: {msg}")


def tokenize(src):
    toks = []
    i = 0
    n = len(src)
    line = 1
    col = 1

    def advance(k=1):
        nonlocal i, line, col
        for _ in range(k):
            if i < n and src[i] == "\n":
                line += 1
                col = 1
            else:
                col += 1
        i += k

    while i < n:
        c = src[i]
        if c in " \t\r\n\f\v":
            advance()
            continue
        if c == "/" and i + 1 < n and src[i + 1] == "/":
            while i < n and src[i] != "\n":
                advance()
            continue
        if c == "/" and i + 1 < n and src[i + 1] == "*":
            start_line, start_col = line, col
            advance(2)
            closed = False
            while i < n:
                if src[i] == "*" and i + 1 < n and src[i + 1] == "/":
                    advance(2)
                    closed = True
                    break
                advance()
            if not closed:
                fail_at(start_line, start_col, "unterminated block comment")
            continue
        if c == '"' or c == "'":
            fail_at(line, col, "string/char literals are not valid in this shader")
        if c.isalpha() or c == "_":
            start_line, start_col = line, col
            start = i
            while i < n and (src[i].isalnum() or src[i] == "_"):
                advance()
            toks.append(Tok("id", src[start:i], start_line, start_col))
            continue
        if c.isdigit() or (c == "." and i + 1 < n and src[i + 1].isdigit()):
            start_line, start_col = line, col
            start = i
            if c == "0" and i + 1 < n and src[i + 1] in "xX":
                advance(2)
                hex_digits = 0
                while i < n and src[i] in HEX_DIGITS:
                    hex_digits += 1
                    advance()
                if hex_digits == 0:
                    fail_at(start_line, start_col, "empty hex literal")
                if i < n and src[i] in "pP":
                    advance()
                    if i < n and src[i] in "+-":
                        advance()
                    exp_digits = 0
                    while i < n and src[i].isdigit():
                        exp_digits += 1
                        advance()
                    if exp_digits == 0:
                        fail_at(start_line, start_col, "hex float needs an exponent")
                    mant_text = src[start + 2:start + 2 + hex_digits]
                    exp_text = src[start + 2 + hex_digits + 1:i]
                    try:
                        value = float.fromhex("0x" + mant_text + "p" + exp_text)
                    except ValueError:
                        fail_at(start_line, start_col, "invalid hex float literal")
                    if not math.isfinite(value):
                        fail_at(start_line, start_col, "non-finite hex float literal")
                    toks.append(Tok("hexfloat", src[start:i], start_line, start_col, value))
                    continue
                if i < n and src[i] in "uU":
                    advance()
                    value = int(src[start + 2:i], 16)
                    if value > 0xFFFFFFFF:
                        fail_at(start_line, start_col, "hex uint literal out of range")
                    toks.append(Tok("uint", src[start:i], start_line, start_col, value))
                    continue
                value = int(src[start + 2:i], 16)
                if value > 0x7FFFFFFF:
                    fail_at(start_line, start_col, "hex int literal out of range")
                toks.append(Tok("int", src[start:i], start_line, start_col, value))
                continue
            # Decimal literal.
            is_float = False
            saw_digits = False
            while i < n and src[i].isdigit():
                saw_digits = True
                advance()
            if i < n and src[i] == ".":
                is_float = True
                advance()
                while i < n and src[i].isdigit():
                    advance()
            if i < n and src[i] in "eE" and saw_digits:
                is_float = True
                advance()
                if i < n and src[i] in "+-":
                    advance()
                exp = 0
                while i < n and src[i].isdigit():
                    exp = exp * 10 + (ord(src[i]) - 48)
                    advance()
                if exp == 0:
                    fail_at(start_line, start_col, "decimal exponent needs digits")
            text = src[start:i]
            if i < n and src[i] in "uU":
                if is_float:
                    fail_at(start_line, start_col, "u suffix not allowed on float literal")
                advance()
                value = int(text)
                if value > 0xFFFFFFFF:
                    fail_at(start_line, start_col, "uint literal out of range")
                toks.append(Tok("uint", text, start_line, start_col, value))
                continue
            if is_float:
                value = float(text)
                if not math.isfinite(value):
                    fail_at(start_line, start_col, "non-finite float literal")
                toks.append(Tok("float", text, start_line, start_col, value))
                continue
            if not saw_digits:
                fail_at(start_line, start_col, "invalid numeric literal")
            value = int(text)
            if value < -0x80000000 or value > 0x7FFFFFFF:
                fail_at(start_line, start_col, "int literal out of range")
            toks.append(Tok("int", text, start_line, start_col, value))
            continue
        if src[i:i + 2] in TWO_CHAR:
            toks.append(Tok("punct", src[i:i + 2], line, col))
            advance(2)
            continue
        if c in ONE_CHAR:
            toks.append(Tok("punct", c, line, col))
            advance()
            continue
        fail_at(line, col, f"unexpected character {c!r}")
    return toks


# --------------------------------------------------------------------------
# AST
# --------------------------------------------------------------------------


class Node:
    pass


class GlobalDecl(Node):
    def __init__(self, layout, storage, precision, type_name, name, init, at):
        self.layout = layout          # int location or None
        self.storage = storage        # 'in' | 'out' | 'uniform' | 'const' | None
        self.precision = precision
        self.type_name = type_name
        self.name = name
        self.init = init              # Expr or None
        self.at = at                  # (line, col)


class PrecisionStmt(Node):
    def __init__(self, qual, type_name, at):
        self.qual = qual
        self.type_name = type_name
        self.at = at


class LocalDecl(Node):
    def __init__(self, type_name, name, init, const, at):
        self.type_name = type_name
        self.name = name
        self.init = init
        self.const = const
        self.at = at


class AssignStmt(Node):
    def __init__(self, target, op, value, at):
        self.target = target
        self.op = op
        self.value = value
        self.at = at


class ExprStmt(Node):
    def __init__(self, expr, at):
        self.expr = expr
        self.at = at


class IfStmt(Node):
    def __init__(self, cond, then_branch, else_branch, at):
        self.cond = cond
        self.then_branch = then_branch
        self.else_branch = else_branch
        self.at = at


class ForStmt(Node):
    def __init__(self, init, cond, step, body, at):
        self.init = init      # LocalDecl | ExprStmt | None
        self.cond = cond      # Expr or None
        self.step = step      # Expr or None
        self.body = body
        self.at = at


class WhileStmt(Node):
    def __init__(self, cond, body, at):
        self.cond = cond
        self.body = body
        self.at = at


class ReturnStmt(Node):
    def __init__(self, value, at):
        self.value = value
        self.at = at


class SimpleStmt(Node):  # break | continue | discard
    def __init__(self, kind, at):
        self.kind = kind
        self.at = at


class Block(Node):
    def __init__(self, stmts):
        self.stmts = stmts


class Lit(Node):
    def __init__(self, tok):
        self.tok = tok
        self.at = (tok.line, tok.col)


class Ident(Node):
    def __init__(self, name, at):
        self.name = name
        self.at = at


class Call(Node):
    def __init__(self, name, args, at):
        self.name = name
        self.args = args
        self.at = at


class Index(Node):
    def __init__(self, base, idx, at):
        self.base = base
        self.idx = idx
        self.at = at


class Member(Node):
    def __init__(self, base, member, at):
        self.base = base
        self.member = member
        self.at = at


class Bin(Node):
    def __init__(self, op, left, right, at):
        self.op = op
        self.left = left
        self.right = right
        self.at = at


class Unary(Node):
    def __init__(self, op, operand, at):
        self.op = op
        self.operand = operand
        self.at = at


class Ternary(Node):
    def __init__(self, cond, a, b, at):
        self.cond = cond
        self.a = a
        self.b = b
        self.at = at


# --------------------------------------------------------------------------
# Parser
# --------------------------------------------------------------------------

ASSIGN_OPS = {"=", "+=", "-=", "*=", "/=", "%="}
PRECISIONS = ("highp", "mediump", "lowp")


class Parser:
    def __init__(self, toks):
        self.toks = toks
        self.pos = 0

    # ---------------- token helpers ----------------

    def peek(self, k=0):
        p = self.pos + k
        return self.toks[p] if p < len(self.toks) else None

    def next(self):
        tok = self.peek()
        if tok is None:
            raise GlslError("unexpected end of shader (expected a token, got none)")
        self.pos += 1
        return tok

    def at_punct(self, text):
        tok = self.peek()
        return tok is not None and tok.kind == "punct" and tok.text == text

    def expect_punct(self, text):
        tok = self.next()
        if tok.kind != "punct" or tok.text != text:
            fail_at(tok.line, tok.col, f"expected {text!r}, got {tok.text!r}")
        return tok

    def at_id(self, text=None):
        tok = self.peek()
        if tok is None or tok.kind != "id":
            return False
        return text is None or tok.text == text

    def expect_id(self, text=None):
        tok = self.next()
        if tok.kind != "id" or (text is not None and tok.text != text):
            fail_at(tok.line, tok.col, f"expected identifier {text!r}, got {tok.text!r}")
        return tok

    # ---------------- global scope ----------------

    def parse_globals(self):
        decls = []
        while self.peek() is not None:
            decls.append(self.parse_global())
        return decls

    def parse_global(self):
        if self.at_id("precision"):
            start = self.next()
            if not self.at_id(PRECISIONS[0]) and not self.at_id(PRECISIONS[1]) and not self.at_id(PRECISIONS[2]):
                tok = self.next()
                fail_at(tok.line, tok.col, f"precision statement needs highp/mediump/lowp, got {tok.text!r}")
            qual = self.next().text
            type_tok = self.expect_id()
            if type_tok.text not in ("float", "int", "uint"):
                fail_at(type_tok.line, type_tok.col,
                        f"precision statement only applies to float/int/uint, got {type_tok.text!r}")
            self.expect_punct(";")
            return PrecisionStmt(qual, type_tok.text, (start.line, start.col))
        if self.at_id("layout"):
            start = self.next()
            location = self.parse_layout()
            tok = self.next()
            if tok.kind != "id" or tok.text not in ("in", "out", "uniform"):
                fail_at(tok.line, tok.col, "layout qualifier may only precede in/out/uniform")
            storage = tok.text
            precision = self.next().text if self.at_id("highp") or self.at_id("mediump") or self.at_id("lowp") else None
            type_tok = self.expect_id()
            if type_tok.text not in TYPE_KINDS:
                fail_at(type_tok.line, type_tok.col, f"unknown type {type_tok.text!r}")
            name_tok = self.expect_id()
            self.expect_punct(";")
            return GlobalDecl(location, storage, precision, type_tok.text, name_tok.text, None,
                              (start.line, start.col))
        return self.parse_global_var_or_fn()

    def parse_layout(self):
        self.expect_punct("(")
        location = None
        while not self.at_punct(")"):
            if self.at_punct(","):
                self.next()
                continue
            key = self.expect_id()
            if key.text != "location":
                fail_at(key.line, key.col, f"unknown layout qualifier {key.text!r}")
            self.expect_punct("=")
            val = self.next()
            if val.kind != "int" or val.value < 0:
                fail_at(val.line, val.col, "layout(location=N) requires a non-negative int literal")
            if location is not None and location != val.value:
                fail_at(val.line, val.col, "conflicting layout locations")
            location = val.value
        self.expect_punct(")")
        return location

    def parse_global_var_or_fn(self):
        start = self.next()
        if start.kind != "id":
            fail_at(start.line, start.col, f"expected a declaration, got {start.text!r}")
        kw = start.text
        if kw in ("struct", "do", "switch", "inout", "buffer", "shared"):
            fail_at(start.line, start.col, f"{kw!r} is not supported by this validator")
        storage = None
        if kw in ("in", "out", "uniform", "const"):
            storage = kw
            tok = self.next()
        else:
            tok = start
        precision = None
        if tok.kind == "id" and tok.text in PRECISIONS:
            precision = tok.text
            tok = self.next()
        if tok.kind != "id" or tok.text not in TYPE_KINDS:
            fail_at(tok.line, tok.col, f"expected a type, got {tok.text!r}")
        type_name = tok.text
        name_tok = self.expect_id()
        if self.at_punct("("):
            # Function definition: only void main() is legal here.
            params = self.parse_params()
            if (type_name, name_tok.text) != ("void", "main") or params:
                fail_at(name_tok.line, name_tok.col,
                        "only 'void main()' with no parameters may be defined")
            body = self.parse_block()  # consumes '{'
            decl = GlobalDecl(None, None, None, "void", "main", None, (start.line, start.col))
            decl.body = body
            return decl
        init = None
        if self.at_punct("="):
            self.next()
            if storage != "const":
                fail_at(name_tok.line, name_tok.col,
                        "global initializer requires const storage")
            init = self.parse_expr()
        self.expect_punct(";")
        if storage is None:
            fail_at(name_tok.line, name_tok.col,
                    "global variable requires in/out/uniform/const storage")
        return GlobalDecl(None, storage, precision, type_name, name_tok.text, init,
                          (start.line, start.col))

    def parse_params(self):
        self.expect_punct("(")
        params = []
        while not self.at_punct(")"):
            if self.at_punct(","):
                self.next()
                continue
            if self.at_id("highp") or self.at_id("mediump") or self.at_id("lowp"):
                self.next()
            type_tok = self.expect_id()
            if type_tok.text not in TYPE_KINDS:
                fail_at(type_tok.line, type_tok.col, f"unknown parameter type {type_tok.text!r}")
            name_tok = self.expect_id()
            params.append((type_tok.text, name_tok.text))
        self.expect_punct(")")
        return params

    # ---------------- blocks and statements ----------------

    def parse_block(self):
        self.expect_punct("{")  # consume the opening brace
        stmts = []
        while not self.at_punct("}"):
            if self.peek() is None:
                raise GlslError("unterminated block: missing '}'")
            stmts.append(self.parse_statement())
        self.next()  # consume '}'
        return Block(stmts)

    def parse_statement(self):
        start = self.next()
        if start.kind == "punct" and start.text == "{":
            self.pos -= 1
            return self.parse_block()
        if start.kind != "id":
            self.pos -= 1
            return self.parse_expression_statement()
        kw = start.text
        if kw == "if":
            self.expect_punct("(")
            cond = self.parse_expr()
            self.expect_punct(")")
            then_branch = self.parse_statement()
            else_branch = None
            if self.at_id("else"):
                self.next()
                else_branch = self.parse_statement()
            return IfStmt(cond, then_branch, else_branch, (start.line, start.col))
        if kw == "for":
            self.expect_punct("(")
            init = None if self.at_punct(";") else self.parse_for_init()
            self.expect_punct(";")
            cond = None if self.at_punct(";") else self.parse_expr()
            self.expect_punct(";")
            step = None if self.at_punct(")") else self.parse_expr()
            self.expect_punct(")")
            body = self.parse_statement()
            return ForStmt(init, cond, step, body, (start.line, start.col))
        if kw == "while":
            self.expect_punct("(")
            cond = self.parse_expr()
            self.expect_punct(")")
            body = self.parse_statement()
            return WhileStmt(cond, body, (start.line, start.col))
        if kw == "return":
            value = None
            if not self.at_punct(";"):
                value = self.parse_expr()
            self.expect_punct(";")
            return ReturnStmt(value, (start.line, start.col))
        if kw in ("break", "continue", "discard"):
            self.expect_punct(";")
            return SimpleStmt(kw, (start.line, start.col))
        if kw == "const":
            # Local const: const <type> <name> = <expr> ;
            self.pos -= 1
            self.next()  # consume 'const' again
            type_tok = self.next()
            if type_tok.kind != "id" or type_tok.text not in TYPE_KINDS:
                fail_at(type_tok.line, type_tok.col, f"unknown type {type_tok.text!r}")
            name_tok = self.expect_id()
            self.expect_punct("=")
            init = self.parse_expr()
            self.expect_punct(";")
            return LocalDecl(type_tok.text, name_tok.text, init, True, (start.line, start.col))
        if kw in KEYWORDS:
            fail_at(start.line, start.col, f"unexpected keyword {kw!r} in statement")
        self.pos -= 1  # put the first token back for the decl/expression decision
        if kw in TYPE_KINDS and self.at_id():
            # (pos already rewound to the type token above)
            type_tok = self.next()
            name_tok = self.expect_id()
            init = None
            if self.at_punct("="):
                self.next()
                init = self.parse_expr()
            self.expect_punct(";")
            return LocalDecl(type_tok.text, name_tok.text, init, False, (start.line, start.col))
        return self.parse_expression_statement()

    def parse_for_init(self):
        start = self.next()
        if start.kind == "id" and start.text in TYPE_KINDS:
            self.pos -= 1
            type_tok = self.next()
            name_tok = self.expect_id()
            init = None
            if self.at_punct("="):
                self.next()
                init = self.parse_expr()
            self.expect_punct(";")
            return LocalDecl(type_tok.text, name_tok.text, init, False, (start.line, start.col))
        self.pos -= 1
        expr = self.parse_expr()
        self.expect_punct(";")
        return ExprStmt(expr, (start.line, start.col))

    def parse_expression_statement(self):
        start = self.peek()
        lhs = self.parse_postfix()
        tok = self.peek()
        if tok is not None and tok.kind == "punct" and tok.text in ASSIGN_OPS:
            op_tok = self.next()
            value = self.parse_expr()
            self.expect_punct(";")
            return AssignStmt(lhs, op_tok.text, value, (start.line, start.col))
        # Plain expression statement: continue the expression at the mul level.
        expr = self.parse_mul_cont(lhs)
        self.expect_punct(";")
        return ExprStmt(expr, (start.line, start.col))

    # ---------------- expressions ----------------

    def parse_expr(self):
        return self.parse_ternary()

    def parse_ternary(self):
        cond = self.parse_lor()
        if self.at_punct("?"):
            q = self.next()
            a = self.parse_expr()
            self.expect_punct(":")
            b = self.parse_expr()
            return Ternary(cond, a, b, (q.line, q.col))
        return cond

    def parse_lor(self):
        left = self.parse_land()
        while self.at_punct("||"):
            op = self.next()
            left = Bin("||", left, self.parse_land(), (op.line, op.col))
        return left

    def parse_land(self):
        left = self.parse_eq()
        while self.at_punct("&&"):
            op = self.next()
            left = Bin("&&", left, self.parse_eq(), (op.line, op.col))
        return left

    def parse_eq(self):
        left = self.parse_rel()
        while self.at_punct("==") or self.at_punct("!="):
            op = self.next()
            left = Bin(op.text, left, self.parse_rel(), (op.line, op.col))
        return left

    def parse_rel(self):
        left = self.parse_add()
        while self.at_punct("<") or self.at_punct(">") or self.at_punct("<=") or self.at_punct(">="):
            op = self.next()
            left = Bin(op.text, left, self.parse_add(), (op.line, op.col))
        return left

    def parse_add(self):
        left = self.parse_mul()
        while self.at_punct("+") or self.at_punct("-"):
            op = self.next()
            left = Bin(op.text, left, self.parse_mul(), (op.line, op.col))
        return left

    def parse_mul(self):
        left = self.parse_unary()
        while self.at_punct("*") or self.at_punct("/") or self.at_punct("%"):
            op = self.next()
            left = Bin(op.text, left, self.parse_unary(), (op.line, op.col))
        return left

    def parse_unary(self):
        if self.at_punct("-") or self.at_punct("+") or self.at_punct("!") or self.at_punct("~"):
            op = self.next()
            return Unary(op.text, self.parse_unary(), (op.line, op.col))
        return self.parse_postfix()

    def parse_postfix(self):
        node = self.parse_primary()
        while True:
            if self.at_punct("("):
                p = self.next()
                args = self.parse_args()
                if not isinstance(node, Ident):
                    fail_at(p.line, p.col, "only named functions/constructors may be called")
                node = Call(node.name, args, (p.line, p.col))
            elif self.at_punct("["):
                self.next()
                idx = self.parse_expr()
                self.expect_punct("]")
                node = Index(node, idx, node.at)
            elif self.at_punct("."):
                self.next()
                member = self.expect_id()
                node = Member(node, member.text, (member.line, member.col))
            else:
                break
        return node

    def parse_args(self):
        args = []
        while not self.at_punct(")"):
            if self.at_punct(","):
                self.next()
                continue
            args.append(self.parse_expr())
        self.expect_punct(")")
        return args

    def parse_primary(self):
        tok = self.next()
        if tok.kind in ("int", "uint", "float", "hexfloat"):
            return Lit(tok)
        if tok.kind == "punct" and tok.text == "(":
            expr = self.parse_expr()
            self.expect_punct(")")
            return expr
        if tok.kind == "id":
            return Ident(tok.text, (tok.line, tok.col))
        fail_at(tok.line, tok.col, f"expected an expression, got {tok.text!r}")

    # "continue from node" chains for plain expression statements where the
    # left-hand postfix chain stopped at a binary operator.

    def parse_ternary_cont(self, node):
        if self.at_punct("?"):
            q = self.next()
            return Ternary(node, self.parse_expr(), self._after_colon(), (q.line, q.col))
        return node

    def _after_colon(self):
        self.expect_punct(":")
        return self.parse_expr()

    def parse_lor_cont(self, node):
        while self.at_punct("||"):
            op = self.next()
            node = Bin("||", node, self.parse_land(), (op.line, op.col))
        return self.parse_ternary_cont(node)

    def parse_land_cont(self, node):
        while self.at_punct("&&"):
            op = self.next()
            node = Bin("&&", node, self.parse_eq(), (op.line, op.col))
        return self.parse_lor_cont(node)

    def parse_eq_cont(self, node):
        while self.at_punct("==") or self.at_punct("!="):
            op = self.next()
            node = Bin(op.text, node, self.parse_rel(), (op.line, op.col))
        return self.parse_land_cont(node)

    def parse_rel_cont(self, node):
        while self.at_punct("<") or self.at_punct(">") or self.at_punct("<=") or self.at_punct(">="):
            op = self.next()
            node = Bin(op.text, node, self.parse_add(), (op.line, op.col))
        return self.parse_eq_cont(node)

    def parse_add_cont(self, node):
        while self.at_punct("+") or self.at_punct("-"):
            op = self.next()
            node = Bin(op.text, node, self.parse_mul(), (op.line, op.col))
        return self.parse_rel_cont(node)

    def parse_mul_cont(self, node):
        while self.at_punct("*") or self.at_punct("/") or self.at_punct("%"):
            op = self.next()
            node = Bin(op.text, node, self.parse_unary(), (op.line, op.col))
        return self.parse_add_cont(node)


# --------------------------------------------------------------------------
# Built-in function kind rules
# --------------------------------------------------------------------------


def err_kind(at, msg):
    raise GlslError(f"line {at[0]}, col {at[1]}: {msg}")


def kind_of_lit(tok_kind):
    return {"int": "I", "uint": "U", "float": "F", "hexfloat": "F"}[tok_kind]


def builtin_result(name, args, at):
    """Return the result kind of a built-in call, or raise GlslError."""
    n = len(args)

    def k(i):
        return args[i]

    if name in ("abs", "ceil", "cos", "cosh", "degrees", "exp", "exp2", "floor",
                "inversesqrt", "log", "log2", "radians", "round", "sinh", "sign",
                "sin", "sqrt", "tan", "tanh", "trunc", "dFdx", "dFdy", "fwidth",
                "fract"):
        if n != 1 or not (k(0) in ("F", "I", "U") or is_vec(k(0))):
            err_kind(at, f"{name}() needs exactly one scalar or vector argument")
        return k(0)

    if name == "not":
        if n != 1:
            err_kind(at, "not() takes exactly 1 argument")
        if k(0) == "B":
            return "B"
        if is_vec(k(0)) and k(0)[-1] == "B":
            return k(0)
        err_kind(at, "not() needs a bool or bvec argument")

    if name in ("asin", "acos"):
        if n != 1 or not (k(0) in ("F",) or is_vec(k(0)) and k(0)[-1] == "F"):
            err_kind(at, f"{name}() needs exactly one float or float-vector argument")
        return k(0)

    if name == "atan":
        if n == 1:
            if not (k(0) in ("F",) or is_vec(k(0)) and k(0)[-1] == "F"):
                err_kind(at, "atan() needs a float or float-vector argument")
            return k(0)
        if n == 2:
            if k(0) in ("F",) and k(1) in ("F",):
                return "F"
            if is_vec(k(0)) and k(0)[-1] == "F" and same_vec(k(0), k(1)):
                return k(0)
            err_kind(at, "atan(y,x) needs matching float or float-vector arguments")
        err_kind(at, "atan() takes 1 or 2 arguments")

    if name == "length":
        if n != 1 or not (is_vec(k(0)) and k(0)[-1] == "F"):
            err_kind(at, "length() needs a float vector")
        return "F"

    if name in ("distance", "dot"):
        if n != 2:
            err_kind(at, f"{name}() takes exactly 2 arguments")
        if k(0) == "F" and k(1) == "F":
            return "F"
        if is_vec(k(0)) and k(0)[-1] == "F" and same_vec(k(0), k(1)):
            return "F"
        err_kind(at, f"{name}() needs matching float or float-vector arguments")

    if name == "cross":
        if n != 2 or k(0) != "V3F" or k(1) != "V3F":
            err_kind(at, "cross() needs two vec3 arguments")
        return "V3F"

    if name == "normalize":
        if n != 1 or not (is_vec(k(0)) and k(0)[-1] == "F"):
            err_kind(at, "normalize() needs a float vector")
        return k(0)

    if name == "reflect":
        if n != 2 or not (is_vec(k(0)) and k(0)[-1] == "F" and same_vec(k(0), k(1))):
            err_kind(at, "reflect() needs two matching float vectors")
        return k(0)

    if name == "refract":
        if n != 3 or not (is_vec(k(0)) and k(0)[-1] == "F"
                          and same_vec(k(0), k(1)) and k(2) == "F"):
            err_kind(at, "refract() needs (float-vec, float-vec, float)")
        return k(0)

    if name == "faceforward":
        if n != 3 or not (is_vec(k(0)) and k(0)[-1] == "F"
                          and same_vec(k(0), k(1)) and same_vec(k(0), k(2))):
            err_kind(at, "faceforward() needs three matching float vectors")
        return k(0)

    if name == "clamp":
        if n != 3:
            err_kind(at, "clamp() takes exactly 3 arguments")
        if k(0) == "F" and k(1) == "F" and k(2) == "F":
            return "F"
        if is_vec(k(0)) and k(0)[-1] == "F" and (
                (k(1) == "F" and k(2) == "F") or (same_vec(k(0), k(1)) and same_vec(k(0), k(2)))):
            return k(0)
        err_kind(at, "clamp() argument kinds do not match")

    if name in ("min", "max"):
        if n not in (2, 3):
            err_kind(at, f"{name}() takes 2 or 3 arguments")
        base = k(0)
        if not (base in SCALAR_KINDS or is_vec(base)):
            err_kind(at, f"{name}() needs scalar or vector arguments")
        for i in range(1, n):
            if k(i) != base:
                err_kind(at, f"{name}() arguments must all have the same kind")
        return base

    if name == "mix":
        if n != 3:
            err_kind(at, "mix() takes exactly 3 arguments")
        if k(0) == "F" and k(1) == "F" and k(2) == "F":
            return "F"
        if is_vec(k(0)) and k(0)[-1] == "F" and same_vec(k(0), k(1)) and (
                k(2) == "F" or same_vec(k(0), k(2))):
            return k(0)
        err_kind(at, "mix() argument kinds do not match")

    if name == "step":
        if n != 2:
            err_kind(at, "step() takes exactly 2 arguments")
        if k(0) == "F" and k(1) == "F":
            return "F"
        if is_vec(k(1)) and k(1)[-1] == "F" and (k(0) == "F" or same_vec(k(1), k(0))):
            return k(1)
        err_kind(at, "step() argument kinds do not match")

    if name == "smoothstep":
        if n != 3:
            err_kind(at, "smoothstep() takes exactly 3 arguments")
        if k(0) == "F" and k(1) == "F" and k(2) == "F":
            return "F"
        if is_vec(k(2)) and k(2)[-1] == "F" and (
                (k(0) == "F" and k(1) == "F") or (same_vec(k(0), k(1)) and same_vec(k(0), k(2)))):
            return k(2)
        err_kind(at, "smoothstep() argument kinds do not match")

    if name == "pow":
        if n != 2:
            err_kind(at, "pow() takes exactly 2 arguments")
        if k(0) == "F" and k(1) == "F":
            return "F"
        if is_vec(k(0)) and k(0)[-1] == "F" and k(1) == "F":
            return k(0)
        if is_vec(k(0)) and k(0)[-1] == "F" and same_vec(k(0), k(1)):
            return k(0)
        err_kind(at, "pow() needs (float,float), (vec,float) or matching (vec,vec)")

    if name == "mod":
        if n != 2:
            err_kind(at, "mod() takes exactly 2 arguments")
        if (k(0), k(1)) in (("F", "F"), ("I", "I"), ("I", "U"), ("U", "U"), ("U", "I")):
            return "U" if "U" in (k(0), k(1)) else k(0)
        err_kind(at, "mod() needs scalar int/uint/float arguments")

    if name in ("any", "all"):
        if n != 1 or not (is_vec(k(0)) and k(0)[-1] == "B"):
            err_kind(at, f"{name}() needs a bvec")
        return "B"

    if name == "texture":
        if n not in (2, 3):
            err_kind(at, "texture() takes (sampler,coord[,bias])")
        smp, coord = k(0), k(1)
        if smp not in ("SMP", "SMPEXT", "SMPSH"):
            err_kind(at, "texture() first argument must be a sampler")
        if smp == "SMPEXT" and coord != "V2F":
            err_kind(at, "texture(samplerExternalOES, ...) needs a vec2 coordinate")
        if not (is_vec(coord) and coord[-1] == "F"):
            err_kind(at, "texture() coordinate must be a float vector")
        return "F" if smp == "SMPSH" else "V4F"

    if name in ("textureLod", "textureProjLod"):
        if n != 3:
            err_kind(at, f"{name}() takes (sampler,coord,lod)")
        if k(0) not in ("SMP", "SMPEXT"):
            err_kind(at, f"{name}() first argument must be a sampler")
        if not (is_vec(k(1)) and k(1)[-1] == "F"):
            err_kind(at, f"{name}() coordinate must be a float vector")
        if k(2) != "F":
            err_kind(at, f"{name}() lod must be float")
        return "V4F"

    if name == "determinant":
        if n != 1 or k(0) not in ("M2", "M3", "M4"):
            err_kind(at, "determinant() needs a matrix")
        return "F"

    if name in ("inverse", "transpose"):
        if n != 1 or k(0) not in ("M2", "M3", "M4"):
            err_kind(at, f"{name}() needs a matrix")
        return k(0)

    if name == "matrixCompMult":
        if n != 2 or k(0) != k(1) or k(0) not in ("M2", "M3", "M4"):
            err_kind(at, "matrixCompMult() needs two same-size matrices")
        return k(0)

    if name == "outerProduct":
        if n != 2:
            err_kind(at, "outerProduct() takes 2 arguments")
        pairs = {("V2F", "V2F"): "M2", ("V3F", "V3F"): "M3", ("V4F", "V4F"): "M4"}
        if (k(0), k(1)) not in pairs:
            err_kind(at, "outerProduct() needs two matching float vectors")
        return pairs[(k(0), k(1))]

    if name in ("float", "int", "uint"):
        if n != 1 or not (k(0) in SCALAR_KINDS or is_vec(k(0))):
            err_kind(at, f"{name}() needs a scalar or vector argument")
        return {"float": "F", "int": "I", "uint": "U"}[name]

    if name == "bool":
        if n != 1:
            err_kind(at, "bool() takes 1 argument")
        if k(0) in ("B", "F", "I", "U"):
            return "B"
        if is_vec(k(0)) and k(0)[-1] in ("F", "I", "U"):
            return k(0)[:-1] + "B"
        err_kind(at, "bool() needs a scalar or vector argument")

    # Vector/integer constructors.
    vec_size = {"vec2": 2, "vec3": 3, "vec4": 4,
                "ivec2": 2, "ivec3": 3, "ivec4": 4,
                "uvec2": 2, "uvec3": 3, "uvec4": 4,
                "bvec2": 2, "bvec3": 3, "bvec4": 4}.get(name)
    if vec_size is not None:
        fam = {"v": "F", "i": "I", "u": "U", "b": "B"}[name[0]]
        if n == 1:
            if k(0) == fam or (is_vec(k(0)) and k(0)[-1] == fam and vec_n(k(0)) >= vec_size):
                return TYPE_KINDS[name]
            err_kind(at, f"{name}() needs a {fam} scalar or same-family vector of "
                         f"size >= {vec_size}")
        total = 0
        for a in args:
            if a == fam:
                total += 1
            elif is_vec(a) and a[-1] == fam:
                total += vec_n(a)
            else:
                err_kind(at, f"{name}() arguments must be {fam} scalars or "
                             f"same-family vectors")
        if total != vec_size:
            err_kind(at, f"{name}() arguments must total {vec_size} components, got {total}")
        return TYPE_KINDS[name]

    mat_size = {"mat2": 2, "mat3": 3, "mat4": 4}.get(name)
    if mat_size is not None:
        if n == 1:
            if k(0) == "F":
                return TYPE_KINDS[name]
            if k(0) in ("M2", "M3", "M4") and int(k(0)[1]) <= mat_size:
                return TYPE_KINDS[name]
            err_kind(at, f"{name}() needs a float or a smaller matrix")
        if n == mat_size * mat_size and all(a == "F" for a in args):
            return TYPE_KINDS[name]
        err_kind(at, f"{name}() needs a float, a smaller matrix, or "
                     f"{mat_size * mat_size} floats")

    err_kind(at, f"unknown built-in or function {name!r}")


# --------------------------------------------------------------------------
# Semantic checker
# --------------------------------------------------------------------------

# Member (swizzle) characters allowed per vector size, in both naming forms.
SWIZZLE_CHARS = {
    2: set("xyrg"),
    3: set("xyzrgb"),
    4: set("xyzwrgba"),
}


def swizzle_kind(member, base_kind, at):
    """Validate a swizzle on a vector kind; return the resulting kind."""
    n = vec_n(base_kind)
    allowed = SWIZZLE_CHARS.get(n)
    if allowed is None:
        raise GlslError(f"line {at[0]}, col {at[1]}: swizzle on non-vector {base_kind!r}")
    if not (1 <= len(member) <= 4) or len(set(member)) != len(member):
        raise GlslError(f"line {at[0]}, col {at[1]}: invalid swizzle {member!r}")
    for ch in member:
        if ch not in allowed:
            raise GlslError(f"line {at[0]}, col {at[1]}: {base_kind} has no component {ch!r}")
    if len(member) == 1:
        return base_kind[-1]
    return "V" + str(len(member)) + base_kind[-1]


class Scope:
    def __init__(self, parent=None):
        self.parent = parent
        self.names = {}   # name -> (kind, mutable, is_const)

    def declare(self, name, kind, mutable, is_const):
        if name in self.names:
            raise GlslError(f"duplicate declaration of {name!r} in this scope")
        self.names[name] = (kind, mutable, is_const)

    def lookup(self, name):
        scope = self
        while scope is not None:
            if name in scope.names:
                return scope.names[name]
            scope = scope.parent
        if name in BUILTIN_VARS:
            return (BUILTIN_VARS[name], False, False)
        return None


class Checker:
    def __init__(self, decls):
        self.decls = decls
        self.global_scope = Scope()
        self.extensions = set()
        self.default_float_precision = False
        self.assigned_outs = set()
        self.main_count = 0
        self.warnings = []

    def check(self):
        for d in self.decls:
            if isinstance(d, PrecisionStmt) and d.type_name == "float":
                self.default_float_precision = True
        # Pass 1: declare globals (functions are counted, not declared).
        needs_external = False
        for d in self.decls:
            if not isinstance(d, GlobalDecl):
                continue
            if getattr(d, "body", None) is not None:
                self.main_count += 1
                continue
            kind = TYPE_KINDS.get(d.type_name)
            if kind is None or kind == "VOID":
                raise GlslError(f"line {d.at[0]}, col {d.at[1]}: "
                                f"global {d.name!r} has invalid type {d.type_name!r}")
            if kind == "SMPEXT":
                needs_external = True
            # Fragment-shader context: in/const/uniform are read-only, only out is assignable.
            mutable = d.storage == "out"
            self.global_scope.declare(d.name, kind, mutable, is_const=(d.storage == "const"))
        if self.main_count != 1:
            raise GlslError(f"expected exactly one void main(), found {self.main_count}")
        if not self.default_float_precision:
            raise GlslError("no 'precision highp/mediump/lowp float;' default precision "
                            "declared (fragment-shader float precision is undefined in ESSL 3.00)")
        if needs_external and "GL_OES_EGL_image_external_essl3" not in self.extensions:
            raise GlslError("samplerExternalOES is used without "
                            "'#extension GL_OES_EGL_image_external_essl3 : enable'")
        # Pass 2: check initializers and main body.
        for d in self.decls:
            if isinstance(d, GlobalDecl) and d.init is not None:
                expr_scope = Scope(self.global_scope)
                value_kind = self.eval(d.init, expr_scope, const_context=True)
                declared = TYPE_KINDS[d.type_name]
                if value_kind != declared:
                    raise GlslError(f"line {d.at[0]}, col {d.at[1]}: initializer kind "
                                    f"{value_kind!r} for {d.name!r} != declared kind {declared!r}")
        for d in self.decls:
            if isinstance(d, GlobalDecl) and getattr(d, "body", None) is not None:
                self.check_block(d.body, Scope(self.global_scope), loop_depth=0)
        for d in self.decls:
            if isinstance(d, GlobalDecl) and d.storage == "out" and d.name not in self.assigned_outs:
                self.warnings.append(f"out variable {d.name!r} is never assigned "
                                     "(legal; it defaults to zero)")
        return self.warnings

    # ---------------- blocks and statements ----------------

    def check_block(self, block, scope, loop_depth):
        for stmt in block.stmts:
            self.check_stmt(stmt, scope, loop_depth)

    def check_stmt(self, stmt, scope, loop_depth):
        if isinstance(stmt, Block):
            self.check_block(stmt, Scope(scope), loop_depth)
        elif isinstance(stmt, LocalDecl):
            kind = TYPE_KINDS.get(stmt.type_name)
            if kind is None or kind == "VOID":
                raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: "
                                f"invalid local type {stmt.type_name!r}")
            if stmt.init is not None:
                value_kind = self.eval(stmt.init, scope, const_context=False)
                if value_kind != kind:
                    raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: initializer kind "
                                    f"{value_kind!r} for {stmt.name!r} != declared kind {kind!r}")
            scope.declare(stmt.name, kind, mutable=not stmt.const, is_const=stmt.const)
        elif isinstance(stmt, AssignStmt):
            target_kind = self.eval_target(stmt.target, scope)
            value_kind = self.eval(stmt.value, scope, const_context=False)
            if stmt.op in ("+=", "-=", "*=", "/=", "%="):
                if not (target_kind in ("F",) or is_vec(target_kind) and target_kind[-1] == "F"):
                    raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: compound assignment "
                                    f"target must be a float vector, got {target_kind!r}")
                if not (value_kind == "F" or same_vec(target_kind, value_kind)):
                    raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: compound assignment "
                                    f"operand kind {value_kind!r} does not match target {target_kind!r}")
            elif value_kind != target_kind:
                raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: assignment kind "
                                f"{value_kind!r} != target kind {target_kind!r}")
            base_name = self.target_base_name(stmt.target)
            if base_name and self.is_out(base_name):
                self.assigned_outs.add(base_name)
        elif isinstance(stmt, ExprStmt):
            self.eval(stmt.expr, scope, const_context=False)
        elif isinstance(stmt, IfStmt):
            self.check_cond(stmt.cond, scope)
            self.check_stmt(stmt.then_branch, Scope(scope), loop_depth)
            if stmt.else_branch is not None:
                self.check_stmt(stmt.else_branch, Scope(scope), loop_depth)
        elif isinstance(stmt, ForStmt):
            fscope = Scope(scope)
            if stmt.init is not None:
                self.check_stmt(stmt.init, fscope, loop_depth)
            if stmt.cond is not None:
                self.check_cond(stmt.cond, fscope)
            if stmt.step is not None:
                self.eval(stmt.step, fscope, const_context=False)
            self.check_stmt(stmt.body, fscope, loop_depth + 1)
        elif isinstance(stmt, WhileStmt):
            self.check_cond(stmt.cond, scope)
            self.check_stmt(stmt.body, Scope(scope), loop_depth + 1)
        elif isinstance(stmt, ReturnStmt):
            raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: main() returns void")
        elif isinstance(stmt, SimpleStmt):
            if stmt.kind in ("break", "continue") and loop_depth == 0:
                raise GlslError(f"line {stmt.at[0]}, col {stmt.at[1]}: "
                                f"{stmt.kind} outside a loop")

    def check_cond(self, cond, scope):
        kind = self.eval(cond, scope, const_context=False)
        if kind != "B":
            raise GlslError(f"line {cond.at[0]}, col {cond.at[1]}: condition must be bool, "
                            f"got {kind!r}")

    def is_out(self, name):
        for d in self.decls:
            if isinstance(d, GlobalDecl) and d.name == name:
                return d.storage == "out"
        return False

    def target_base_name(self, target):
        node = target
        while isinstance(node, (Member, Index)):
            node = node.base
        return node.name if isinstance(node, Ident) else None

    # ---------------- expression evaluation ----------------

    def eval(self, node, scope, const_context):
        if isinstance(node, Lit):
            return kind_of_lit(node.tok.kind)
        if isinstance(node, Ident):
            info = scope.lookup(node.name)
            if info is None:
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: "
                                f"undeclared identifier {node.name!r}")
            kind, _mutable, is_const = info
            if const_context and not is_const:
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: const expression may "
                                f"not read non-constant {node.name!r}")
            return kind
        if isinstance(node, Call):
            if const_context and node.name in NON_CONSTANT_BUILTINS:
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: const expression may "
                                f"not call {node.name}()")
            args = [self.eval(a, scope, const_context) for a in node.args]
            return builtin_result(node.name, args, node.at)
        if isinstance(node, Index):
            base = self.eval(node.base, scope, const_context)
            idx = self.eval(node.idx, scope, const_context)
            if idx not in ("I", "U"):
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: index must be int/uint")
            if not (is_vec(base) or base in ("M2", "M3", "M4")):
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: base {base!r} is not indexable")
            return base[-1] if is_vec(base) else base
        if isinstance(node, Member):
            base = self.eval(node.base, scope, const_context)
            if not is_vec(base):
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: member access on {base!r}")
            return swizzle_kind(node.member, base, node.at)
        if isinstance(node, Unary):
            operand = self.eval(node.operand, scope, const_context)
            if node.op in ("-", "+"):
                ok = operand in ("F", "I") or (is_vec(operand) and operand[-1] in ("F", "I"))
                if not ok and node.op == "+":
                    ok = operand == "U" or (is_vec(operand) and operand[-1] == "U")
                if not ok:
                    raise GlslError(f"line {node.at[0]}, col {node.at[1]}: unary {node.op!r} "
                                    f"applies to {operand!r}")
                return operand
            if node.op == "!":
                if operand == "B" or (is_vec(operand) and operand[-1] == "B"):
                    return operand
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: '!' needs a bool")
            if node.op == "~":
                if operand in ("I", "U") or (is_vec(operand) and operand[-1] in ("I", "U")):
                    return operand
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: '~' needs int/uint")
            raise GlslError(f"line {node.at[0]}, col {node.at[1]}: unknown unary operator")
        if isinstance(node, Bin):
            left = self.eval(node.left, scope, const_context)
            right = self.eval(node.right, scope, const_context)
            return self.binary_kind(node.op, left, right, node.at)
        if isinstance(node, Ternary):
            self.check_cond(node.cond, scope)
            a = self.eval(node.a, scope, const_context)
            b = self.eval(node.b, scope, const_context)
            if a != b:
                raise GlslError(f"line {node.at[0]}, col {node.at[1]}: ternary branches have "
                                f"different kinds {a!r}/{b!r}")
            return a
        raise GlslError(f"unknown expression node {type(node).__name__}")

    def eval_target(self, target, scope):
        if isinstance(target, Ident):
            info = scope.lookup(target.name)
            if info is None:
                raise GlslError(f"line {target.at[0]}, col {target.at[1]}: "
                                f"assignment to undeclared {target.name!r}")
            kind, mutable, is_const = info
            if is_const or not mutable:
                raise GlslError(f"line {target.at[0]}, col {target.at[1]}: {target.name!r} "
                                f"is read-only")
            return kind
        if isinstance(target, Member):
            base = self.eval_target(target.base, scope)
            if not is_vec(base):
                raise GlslError(f"line {target.at[0]}, col {target.at[1]}: member target on {base!r}")
            return swizzle_kind(target.member, base, target.at)
        if isinstance(target, Index):
            base = self.eval_target(target.base, scope)
            self.eval(target.idx, scope, const_context=False)
            if not (is_vec(base) or base in ("M2", "M3", "M4")):
                raise GlslError(f"line {target.at[0]}, col {target.at[1]}: index target on {base!r}")
            return base
        raise GlslError("invalid assignment target")

    def binary_kind(self, op, left, right, at):
        def bad(msg):
            raise GlslError(f"line {at[0]}, col {at[1]}: {msg} ({op!r} {left!r} {right!r})")

        if op in ("&&", "||"):
            if left != "B" or right != "B":
                bad("logical operators need bool operands")
            return "B"
        if op in ("==", "!="):
            if left != right:
                bad("comparison operands must have the same kind")
            if left not in SCALAR_KINDS and not is_vec(left):
                bad("comparison needs scalar or vector operands")
            return "B"
        if op in ("<", ">", "<=", ">="):
            if left != right:
                bad("comparison operands must have the same kind")
            if left in ("I", "U", "F") or (is_vec(left) and left[-1] in ("I", "U", "F")):
                return "B"
            bad("comparison needs numeric scalar/vector operands")
        if op in ("+", "-"):
            if left == "F" and right == "F":
                return "F"
            if left == "F" and is_vec(right) and right[-1] == "F":
                return right
            if is_vec(left) and left[-1] == "F" and right == "F":
                return left
            if same_vec(left, right) and left[-1] == "F":
                return left
            if left in ("I", "U") and right in ("I", "U"):
                return "U" if "U" in (left, right) else "I"
            bad("additive operands do not match")
        if op in ("*", "/", "%"):
            if left == "F" and right == "F":
                return "F"
            if left == "F" and is_vec(right) and right[-1] == "F":
                return right
            if is_vec(left) and left[-1] == "F" and right == "F":
                return left
            if same_vec(left, right) and left[-1] == "F":
                return left
            if left in ("M2", "M3", "M4") and right == left and op != "%":
                return left
            if left in ("M2", "M3", "M4") and is_vec(right) and right[-1] == "F" \
                    and vec_n(right) == int(left[1]) and op != "%":
                return right
            if (left == "F" and right in ("M2", "M3", "M4")) or (
                    right == "F" and left in ("M2", "M3", "M4")) and op != "%":
                return left if right == "F" else right
            if left in ("I", "U") and right in ("I", "U"):
                return "U" if "U" in (left, right) else "I"
            bad("multiplicative operands do not match")
        bad("unknown operator")


# --------------------------------------------------------------------------
# Driver
# --------------------------------------------------------------------------


def validate_file(path: Path):
    """Return (ok, warnings, error)."""
    src = path.read_text(encoding="utf-8")
    extensions = set()
    body_lines = []
    seen_version = False
    first_directive_seen = False
    for raw in src.splitlines():
        stripped = raw.strip()
        if stripped.startswith("#"):
            content = stripped[1:].strip()
            if content.startswith("version"):
                if first_directive_seen or body_lines:
                    return False, [], "#version must be the first directive"
                first_directive_seen = True
                if content != "version 300 es":
                    return False, [], f"expected exactly '#version 300 es', got '{stripped}'"
                seen_version = True
                continue
            if content.startswith("extension"):
                parts = [p.strip() for p in content.split(":", 1)]
                if len(parts) != 2:
                    return False, [], f"malformed #extension directive: '{stripped}'"
                words = parts[0].split()
                name = words[1] if len(words) >= 2 else ""
                mode = parts[1]
                if not name or mode not in ("enable", "require", "preserve"):
                    return False, [], f"malformed #extension directive: '{stripped}'"
                if mode == "enable":
                    extensions.add(name)
                continue
            return False, [], f"unsupported preprocessor directive: '{stripped}'"
        body_lines.append(raw)
    if not seen_version:
        return False, [], "missing '#version 300 es' directive"
    body = "\n".join(body_lines)

    try:
        toks = tokenize(body)
        parser = Parser(toks)
        decls = parser.parse_globals()
        if parser.peek() is not None:
            tok = parser.peek()
            return False, [], (f"line {tok.line}, col {tok.col}: "
                               f"stray token {tok.text!r} after declarations")
        checker = Checker(decls)
        checker.extensions = extensions
        warnings = checker.check()
        return True, warnings, None
    except GlslError as exc:
        return False, [], str(exc)


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    paths = []
    for arg in argv[1:]:
        p = Path(arg)
        if p.is_dir():
            paths.extend(sorted(p.glob("*.glsl")))
        elif p.is_file():
            paths.append(p)
        else:
            print(f"error: no such file or directory: {arg}", file=sys.stderr)
            return 2
    if not paths:
        print("error: no .glsl files found", file=sys.stderr)
        return 2
    failed = 0
    for path in paths:
        ok, warnings, error = validate_file(path)
        if ok:
            print(f"PASS {path.name}")
            for w in warnings:
                print(f"  note: {w}")
        else:
            failed += 1
            print(f"FAIL {path.name}: {error}")
    total = len(paths)
    print(f"Summary: {total - failed} PASS, {failed} FAIL of {total} files")
    return 0 if failed == 0 else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
