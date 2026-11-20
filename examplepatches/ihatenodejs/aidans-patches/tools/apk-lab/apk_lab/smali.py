from __future__ import annotations

import argparse
import re
import tempfile
from dataclasses import dataclass, field
from pathlib import Path
from typing import Literal

from apk_lab.models import ExitCode
from apk_lab.tools import ToolManager


@dataclass(frozen=True)
class Register:
    name: str  # e.g. "v0", "p1"
    index: int  # absolute 0-based register index
    is_param: bool
    param_index: int | None = None


@dataclass(frozen=True)
class SmaliDiagnostic:
    line: int
    severity: Literal["error", "warning"]
    code: str
    message: str


@dataclass
class SmaliValidationReport:
    snippet: str
    locals_count: int
    params_count: int
    is_static: bool
    total_registers: int
    diagnostics: list[SmaliDiagnostic] = field(default_factory=list)

    @property
    def is_valid(self) -> bool:
        return not any(d.severity == "error" for d in self.diagnostics)

    def format_human(self) -> str:
        lines: list[str] = []
        errors = [d for d in self.diagnostics if d.severity == "error"]
        warnings = [d for d in self.diagnostics if d.severity == "warning"]
        if errors:
            lines.append(
                f"Validation failed with {len(errors)} error(s) and {len(warnings)} warning(s):"
            )
        elif warnings:
            lines.append(f"Validation succeeded with {len(warnings)} warning(s):")
        else:
            lines.append("Validation succeeded with 0 errors and 0 warnings.")

        for d in self.diagnostics:
            prefix = "ERROR" if d.severity == "error" else "WARNING"
            lines.append(f"  [{prefix}] Line {d.line} ({d.code}): {d.message}")
        return "\n".join(lines)


# Opcode specifications
# Categories:
# - format_22c: instance-of, iget*, iput* (2 registers, each 4-bit v0..v15)
# - format_21c: check-cast, new-instance, sget*, sput*, const-string, const-class (1 register, 8-bit v0..v255)
# - format_11n: const/4 (1 register 4-bit v0..v15, signed 4-bit literal -8..7)
# - format_21s: const/16 (1 register 8-bit v0..v255, signed 16-bit literal -32768..32767)
# - format_31i: const (1 register 8-bit v0..v255, 32-bit literal)
# - format_12x: move, move-wide, move-object, etc. (2 registers, each 4-bit v0..v15)
# - format_22x: move/from16, move-wide/from16, move-object/from16 (dest 8-bit v0..255, src 16-bit v0..65535)
# - format_32x: move/16, move-wide/16, move-object/16 (dest 16-bit, src 16-bit)
# - format_35c: invoke-virtual, invoke-super, invoke-direct, invoke-static, invoke-interface (list of 4-bit v0..v15)
# - format_3rc: invoke-virtual/range, etc. (range of 16-bit)
# - format_22t: if-eq, if-ne, if-lt, if-ge, if-gt, if-le (2 registers 4-bit v0..v15, branch label)
# - format_21t: if-eqz, if-nez, if-ltz, if-gez, if-gtz, if-lez (1 register 8-bit v0..v255, branch label)
# - format_10t_20t_30t: goto, goto/16, goto/32 (branch label)
# - returns: return-void, return, return-wide, return-object, throw

FORMAT_22C_OPCODES = {
    "instance-of",
    "iget",
    "iget-wide",
    "iget-object",
    "iget-boolean",
    "iget-byte",
    "iget-char",
    "iget-short",
    "iput",
    "iput-wide",
    "iput-object",
    "iput-boolean",
    "iput-byte",
    "iput-char",
    "iput-short",
}

FORMAT_21C_OPCODES = {
    "check-cast",
    "new-instance",
    "const-string",
    "const-string/jumbo",
    "const-class",
    "sget",
    "sget-wide",
    "sget-object",
    "sget-boolean",
    "sget-byte",
    "sget-char",
    "sget-short",
    "sput",
    "sput-wide",
    "sput-object",
    "sput-boolean",
    "sput-byte",
    "sput-char",
    "sput-short",
}

INVOKE_35C_OPCODES = {
    "invoke-virtual",
    "invoke-super",
    "invoke-direct",
    "invoke-static",
    "invoke-interface",
}

INVOKE_3RC_OPCODES = {
    "invoke-virtual/range",
    "invoke-super/range",
    "invoke-direct/range",
    "invoke-static/range",
    "invoke-interface/range",
}
INVOKE_CUSTOM_OPCODES = {
    "invoke-custom",
    "invoke-custom/range",
}

INVOKE_POLYMORPHIC_OPCODES = {
    "invoke-polymorphic",
    "invoke-polymorphic/range",
}


ALL_MOVE_RESULT_OPCODES = {
    "move-result",
    "move-result-object",
    "move-result-wide",
}

FILLED_NEW_ARRAY_OPCODES = {"filled-new-array", "filled-new-array/range"}

DEBUG_DIRECTIVES = {
    ".line",
    ".local",
    ".end local",
    ".restart local",
    ".prologue",
    ".epilogue",
    ".source",
    ".param",
}


def extract_method_reference_return_type(operand: str) -> str | None:
    """Extracts the return type descriptor from a Smali method reference."""
    match = re.search(
        r"->[^( \t\r\n]+\(.*\)(\[+(?:[ZBSCIJFD]|L[^;\s]+;)|[VZBSCIJFD]|L[^;\s]+;)$",
        operand.strip(),
    )
    return match.group(1) if match else None


def extract_invoke_return_type(opcode: str, tokens: list[str]) -> str | None:
    """Extracts the return type descriptor from an invoke instruction's operands."""
    if not tokens:
        return None

    if opcode in INVOKE_CUSTOM_OPCODES:
        custom_proto_pattern = re.compile(
            r"\((?:[^()]*)\)(\[+(?:[ZBSCIJFD]|L[^;()\s]+;)|[VZBSCIJFD]|L[^;()\s]+;)"
        )
        joined_spec = ", ".join(tokens[1:])
        specs = [joined_spec.split("@", 1)[0]] + [
            tok.split("@", 1)[0] for tok in tokens[1:]
        ]
        for spec in specs:
            m = custom_proto_pattern.search(spec)
            if m:
                return m.group(1)
            m_fallback = re.search(r"\([^)]*\)(\S+)", spec)
            if m_fallback:
                ret = m_fallback.group(1).rstrip("),; \t")
                if ret:
                    return ret

    candidates: list[str] = []
    if opcode in INVOKE_POLYMORPHIC_OPCODES:
        candidates.extend([tokens[-1], tokens[1] if len(tokens) > 1 else ""])
    elif opcode in INVOKE_CUSTOM_OPCODES:
        candidates.extend([tokens[1] if len(tokens) > 1 else "", tokens[-1]])
    else:
        candidates.append(tokens[-1])

    proto_pattern = re.compile(
        r"(?:->[^( \t\r\n]+|[a-zA-Z0-9_$<>]+)?\([^)]*\)(\[+(?:[ZBSCIJFD]|L[^;\s]+;)|[VZBSCIJFD]|L[^;\s]+;)$"
    )
    for cand in candidates:
        cand_str = cand.strip()
        m = proto_pattern.search(cand_str)
        if m:
            return m.group(1)
        res = extract_method_reference_return_type(cand_str)
        if res:
            return res
    return None


def expected_move_result_for_return_type(return_type: str) -> str | None:
    """Returns the expected move-result opcode for a given return type descriptor, or None if void."""
    if return_type == "V":
        return None
    if return_type in ("J", "D"):
        return "move-result-wide"
    if return_type.startswith(("[", "L")):
        return "move-result-object"
    return "move-result"


BRANCH_22T_OPCODES = {
    "if-eq",
    "if-ne",
    "if-lt",
    "if-ge",
    "if-gt",
    "if-le",
}

BRANCH_21T_OPCODES = {
    "if-eqz",
    "if-nez",
    "if-ltz",
    "if-gez",
    "if-gtz",
    "if-lez",
}

GOTO_OPCODES = {"goto", "goto/16", "goto/32"}

RETURN_THROW_OPCODES = {
    "return-void",
    "return",
    "return-wide",
    "return-object",
    "throw",
}


def parse_smali_register(
    token: str,
    line_no: int,
    locals_count: int,
    parameter_count: int,
    is_static: bool,
    total_registers: int,
) -> tuple[Register | None, SmaliDiagnostic | None]:
    """Parses a register token (e.g. 'v0', 'p1') and maps it to absolute register index."""
    tok = token.strip().rstrip(",")
    if not tok:
        return None, None

    if tok.startswith("v"):
        try:
            num = int(tok[1:])
        except ValueError:
            return None, SmaliDiagnostic(
                line=line_no,
                severity="error",
                code="INVALID_REGISTER_SYNTAX",
                message=f"Invalid register syntax '{tok}'",
            )
        if num < 0 or num >= total_registers:
            return None, SmaliDiagnostic(
                line=line_no,
                severity="error",
                code="REGISTER_OUT_OF_RANGE",
                message=f"Register '{tok}' out of range for total {total_registers} registers (v0..v{total_registers - 1})",
            )
        if num >= locals_count:
            if is_static:
                param_name = f"p{num - locals_count}"
            elif num == locals_count:
                param_name = "p0 (this)"
            else:
                param_name = f"p{num - locals_count}"
            return None, SmaliDiagnostic(
                line=line_no,
                severity="error",
                code="REGISTER_ALIASES_PARAMETER",
                message=(
                    f"Register '{tok}' (index {num}) exceeds locals count ({locals_count}) "
                    f"and aliases parameter register '{param_name}'. Use '{param_name}' "
                    "or increase method locals."
                ),
            )
        return Register(name=tok, index=num, is_param=False), None

    if tok.startswith("p"):
        try:
            p_idx = int(tok[1:])
        except ValueError:
            return None, SmaliDiagnostic(
                line=line_no,
                severity="error",
                code="INVALID_REGISTER_SYNTAX",
                message=f"Invalid register syntax '{tok}'",
            )

        if is_static:
            if p_idx < 0 or p_idx >= parameter_count:
                return None, SmaliDiagnostic(
                    line=line_no,
                    severity="error",
                    code="PARAMETER_OUT_OF_RANGE",
                    message=f"Parameter register '{tok}' out of range for static method with {parameter_count} parameter(s) (p0..p{max(0, parameter_count - 1)})",
                )
            abs_idx = locals_count + p_idx
            return Register(
                name=tok, index=abs_idx, is_param=True, param_index=p_idx
            ), None
        else:
            # instance method: p0 is this
            max_p = parameter_count
            if p_idx < 0 or p_idx > max_p:
                return None, SmaliDiagnostic(
                    line=line_no,
                    severity="error",
                    code="PARAMETER_OUT_OF_RANGE",
                    message=f"Parameter register '{tok}' out of range for instance method with {parameter_count} parameter(s) (p0=this, p1..p{max_p})",
                )
            abs_idx = locals_count + p_idx
            return Register(
                name=tok, index=abs_idx, is_param=True, param_index=p_idx
            ), None

    return None, None


def parse_literal_int(tok: str) -> int:
    """Parses numeric literal in decimal or hex (e.g. 10, -5, 0x10, -0x8)."""
    clean = tok.strip().rstrip(",")
    if clean.startswith("#"):
        clean = clean[1:].strip()
    return int(clean, 0)


def strip_smali_comment(line: str) -> str:
    """Strips smali comments starting with # outside double-quoted strings."""
    in_quote = False
    escape = False
    for idx, ch in enumerate(line):
        if in_quote:
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == '"':
                in_quote = False
        else:
            if ch == '"':
                in_quote = True
            elif ch == "#":
                return line[:idx].strip()
    return line.strip()


def split_smali_operands(operands_str: str) -> list[str]:
    """Splits smali operands by comma outside double-quoted strings and braces."""
    tokens: list[str] = []
    current: list[str] = []
    in_quote = False
    escape = False
    brace_depth = 0
    for ch in operands_str:
        if in_quote:
            current.append(ch)
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == '"':
                in_quote = False
        else:
            if ch == '"':
                in_quote = True
                current.append(ch)
            elif ch == "{":
                brace_depth += 1
                current.append(ch)
            elif ch == "}":
                brace_depth -= 1
                current.append(ch)
            elif ch == "," and brace_depth == 0:
                tok = "".join(current).strip()
                if tok:
                    tokens.append(tok)
                current = []
            else:
                current.append(ch)
    tok = "".join(current).strip()
    if tok:
        tokens.append(tok)
    return tokens


def parse_method_descriptor_params(descriptor: str) -> tuple[str, list[int]]:
    """Parses parameter types string and register widths from a Dalvik method descriptor.

    Returns (param_types_str, register_widths).
    For example, '(IJLjava/lang/String;D)V' returns ('IJLjava/lang/String;D', [1, 2, 1, 2]).
    """
    m = re.match(r"^\((.*?)\)(V|\[*(?:[ZBCSIFJD]|L[^;]+;))$", descriptor.strip())
    if not m:
        raise ValueError(
            f"Invalid method descriptor '{descriptor}', expected format like '(ILjava/lang/String;)V'"
        )
    params_str = m.group(1)
    widths: list[int] = []
    i = 0
    n = len(params_str)
    while i < n:
        start = i
        while i < n and params_str[i] == "[":
            i += 1
        if i >= n:
            raise ValueError(f"Unterminated array type in descriptor '{descriptor}'")
        ch = params_str[i]
        if ch == "L":
            semi = params_str.find(";", i)
            if semi == -1:
                raise ValueError(f"Unterminated object descriptor in '{descriptor}'")
            i = semi + 1
            widths.append(1)
        elif ch in "ZBCSIF":
            i += 1
            widths.append(1)
        elif ch in "JD":
            i += 1
            widths.append(1 if start < i - 1 else 2)
        else:
            raise ValueError(
                f"Unexpected character '{ch}' in method descriptor '{descriptor}'"
            )
    return params_str, widths


def validate_smali_snippet(
    snippet: str,
    locals_count: int,
    parameter_count: int | None = None,
    is_static: bool = False,
    descriptor: str | None = None,
    tool_manager: ToolManager | None = None,
) -> SmaliValidationReport:
    """Performs static syntax, opcode constraint, CFG, and assembler validation on Smali snippet.

    Parameter Width Limitations:
    When validating via `parameter_count` (e.g. CLI `--params`), every parameter is assumed
    to occupy a single register (e.g. 32-bit integer, reference). If validating a method
    with 64-bit wide parameters ('J' for long or 'D' for double, each requiring 2 registers),
    pass the exact method `descriptor` (e.g. '(IJLjava/lang/String;)V') instead so parameter
    types and multi-register widths are accurately configured.
    """
    if locals_count < 0:
        raise ValueError("locals_count must be non-negative")

    if descriptor is not None:
        param_types_str, param_widths = parse_method_descriptor_params(descriptor)
        param_regs = sum(param_widths)
    else:
        if parameter_count is None:
            parameter_count = 0
        if parameter_count < 0:
            raise ValueError("parameter_count must be non-negative")
        param_regs = parameter_count
        param_types_str = "".join(["Ljava/lang/Object;"] * parameter_count)

    parameter_count = param_regs
    total_regs = locals_count + param_regs + (0 if is_static else 1)
    report = SmaliValidationReport(
        snippet=snippet,
        locals_count=locals_count,
        params_count=param_regs,
        is_static=is_static,
        total_registers=total_regs,
    )

    lines = snippet.splitlines()

    # Pre-pass: collect labels and directives
    label_lines: dict[str, int] = {}
    instructions: list[tuple[int, str, list[str]]] = []

    for line_idx, raw_line in enumerate(lines, start=1):
        line = strip_smali_comment(raw_line)
        if not line:
            continue

        # Check for disallowed method/class directives
        if line.startswith((".class", ".super", ".method", ".end method")):
            report.diagnostics.append(
                SmaliDiagnostic(
                    line=line_idx,
                    severity="error",
                    code="METHOD_DIRECTIVE_DISALLOWED",
                    message="Method or class directives are not allowed in snippets",
                )
            )
            continue

        if line.startswith(":"):
            label_name = line.split()[0]
            if label_name in label_lines:
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="DUPLICATE_LABEL",
                        message=f"Duplicate label definition '{label_name}' (previously defined on line {label_lines[label_name]})",
                    )
                )
            else:
                label_lines[label_name] = line_idx
            continue

        # Split instruction into opcode and operand tokens
        parts = line.split(None, 1)
        opcode = parts[0]
        operands_str = parts[1] if len(parts) > 1 else ""

        # Parse operand tokens
        tokens = split_smali_operands(operands_str)
        instructions.append((line_idx, opcode, tokens))

    # Pass 1: Opcode and Register constraints
    for line_idx, opcode, tokens in instructions:
        # 1. Format 22c: instance-of, iget*, iput*
        if opcode in FORMAT_22C_OPCODES:
            if len(tokens) >= 2:
                for tok in tokens[:2]:
                    reg, diag = parse_smali_register(
                        tok,
                        line_idx,
                        locals_count,
                        parameter_count,
                        is_static,
                        total_regs,
                    )
                    if diag:
                        report.diagnostics.append(diag)
                    elif reg and reg.index > 15:
                        remediation = (
                            f"move-object/from16 v1, {tok}"
                            if "object" in opcode or opcode == "instance-of"
                            else f"move/from16 v1, {tok}"
                        )
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=line_idx,
                                severity="error",
                                code="FORMAT_22C_REGISTER_OVERFLOW",
                                message=(
                                    f"Opcode '{opcode}' (format 22c) requires 4-bit registers (v0..v15). "
                                    f"'{tok}' maps to v{reg.index}. Use '{remediation}' first."
                                ),
                            )
                        )

        # 2. Format 21c: check-cast, new-instance, etc.
        elif opcode in FORMAT_21C_OPCODES:
            if tokens:
                reg, diag = parse_smali_register(
                    tokens[0],
                    line_idx,
                    locals_count,
                    parameter_count,
                    is_static,
                    total_regs,
                )
                if diag:
                    report.diagnostics.append(diag)
                elif reg and reg.index > 255:
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=line_idx,
                            severity="error",
                            code="FORMAT_21C_REGISTER_OVERFLOW",
                            message=(
                                f"Opcode '{opcode}' (format 21c) destination register '{tokens[0]}' "
                                f"maps to v{reg.index}, which exceeds 8-bit maximum (v0..v255)."
                            ),
                        )
                    )

        # 3. Format 11n: const/4
        elif opcode == "const/4":
            if len(tokens) >= 2:
                reg, diag = parse_smali_register(
                    tokens[0],
                    line_idx,
                    locals_count,
                    parameter_count,
                    is_static,
                    total_regs,
                )
                if diag:
                    report.diagnostics.append(diag)
                elif reg and reg.index > 15:
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=line_idx,
                            severity="error",
                            code="FORMAT_11N_REGISTER_OVERFLOW",
                            message=f"Opcode 'const/4' requires 4-bit register (v0..v15). '{tokens[0]}' maps to v{reg.index}.",
                        )
                    )
                try:
                    val = parse_literal_int(tokens[1])
                    if not (-8 <= val <= 7):
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=line_idx,
                                severity="error",
                                code="CONST4_LITERAL_OUT_OF_RANGE",
                                message=f"Literal '{tokens[1]}' out of range for 'const/4' (-8..7). Use 'const/16' instead.",
                            )
                        )
                except ValueError:
                    pass

        # 4. Format 21s: const/16
        elif opcode == "const/16":
            if len(tokens) >= 2:
                reg, diag = parse_smali_register(
                    tokens[0],
                    line_idx,
                    locals_count,
                    parameter_count,
                    is_static,
                    total_regs,
                )
                if diag:
                    report.diagnostics.append(diag)
                elif reg and reg.index > 255:
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=line_idx,
                            severity="error",
                            code="FORMAT_21S_REGISTER_OVERFLOW",
                            message=f"Opcode 'const/16' destination register '{tokens[0]}' maps to v{reg.index}, which exceeds 8-bit limit (v0..v255).",
                        )
                    )
                try:
                    val = parse_literal_int(tokens[1])
                    if not (-32768 <= val <= 32767):
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=line_idx,
                                severity="error",
                                code="CONST16_LITERAL_OUT_OF_RANGE",
                                message=f"Literal '{tokens[1]}' out of range for 'const/16' (-32768..32767). Use 'const' instead.",
                            )
                        )
                except ValueError:
                    pass

        # 5. Format 35c: invoke-*
        elif opcode in INVOKE_35C_OPCODES:
            # tokens[0] is typically {vA, vB, ...}
            raw_regs_match = re.search(r"\{([^}]*)\}", " ".join(tokens))
            if raw_regs_match:
                reg_tokens = [
                    r.strip() for r in raw_regs_match.group(1).split(",") if r.strip()
                ]
                for r_tok in reg_tokens:
                    reg, diag = parse_smali_register(
                        r_tok,
                        line_idx,
                        locals_count,
                        parameter_count,
                        is_static,
                        total_regs,
                    )
                    if diag:
                        report.diagnostics.append(diag)
                    elif reg and reg.index > 15:
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=line_idx,
                                severity="error",
                                code="INVOKE_35C_REGISTER_OVERFLOW",
                                message=(
                                    f"Opcode '{opcode}' (format 35c) requires 4-bit registers (v0..v15). "
                                    f"'{r_tok}' maps to v{reg.index}. Use '{opcode}/range' for registers above v15."
                                ),
                            )
                        )

        # 6. Branch instructions target checks
        if opcode in GOTO_OPCODES:
            target = tokens[0] if tokens else ""
            if not target.startswith(":"):
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="INVALID_BRANCH_SYNTAX",
                        message=f"Goto instruction requires label target starting with ':', got '{target}'",
                    )
                )
            elif target not in label_lines:
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="MISSING_BRANCH_TARGET",
                        message=f"Target label '{target}' not defined in snippet",
                    )
                )

        elif opcode in BRANCH_22T_OPCODES or opcode in BRANCH_21T_OPCODES:
            target = tokens[-1] if tokens else ""
            if not target.startswith(":"):
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="INVALID_BRANCH_SYNTAX",
                        message=f"Conditional branch requires label target starting with ':', got '{target}'",
                    )
                )
            elif target not in label_lines:
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="MISSING_BRANCH_TARGET",
                        message=f"Target label '{target}' not defined in snippet",
                    )
                )

    # Pass 2: Invoke return and move-result sequencing.
    invoke_opcodes = (
        INVOKE_35C_OPCODES
        | INVOKE_3RC_OPCODES
        | INVOKE_CUSTOM_OPCODES
        | INVOKE_POLYMORPHIC_OPCODES
    )
    for index, (line_idx, opcode, tokens) in enumerate(instructions):
        prev_idx = index - 1
        while prev_idx >= 0 and (
            instructions[prev_idx][1] in DEBUG_DIRECTIVES
            or (
                instructions[prev_idx][2]
                and f"{instructions[prev_idx][1]} {instructions[prev_idx][2][0]}"
                in DEBUG_DIRECTIVES
            )
        ):
            prev_idx -= 1
        previous_inst = instructions[prev_idx] if prev_idx >= 0 else None
        previous_opcode = previous_inst[1] if previous_inst else None
        if opcode in ALL_MOVE_RESULT_OPCODES:
            if previous_opcode not in invoke_opcodes | FILLED_NEW_ARRAY_OPCODES:
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=line_idx,
                        severity="error",
                        code="ORPHAN_MOVE_RESULT",
                        message=(
                            f"'{opcode}' must immediately follow an invoke or filled-new-array "
                            "instruction."
                        ),
                    )
                )
            elif previous_opcode in FILLED_NEW_ARRAY_OPCODES:
                if opcode != "move-result-object":
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=line_idx,
                            severity="error",
                            code="INVALID_MOVE_RESULT",
                            message=(
                                f"'{opcode}' cannot follow '{previous_opcode}'. "
                                "Expected 'move-result-object'."
                            ),
                        )
                    )
            elif previous_opcode in invoke_opcodes and previous_inst is not None:
                prev_return_type = extract_invoke_return_type(
                    previous_opcode, previous_inst[2]
                )
                if prev_return_type == "V":
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=line_idx,
                            severity="error",
                            code="INVALID_MOVE_RESULT",
                            message=(
                                f"'{opcode}' cannot follow method returning 'void'."
                            ),
                        )
                    )
                elif prev_return_type is not None:
                    expected_opcode = expected_move_result_for_return_type(
                        prev_return_type
                    )
                    if expected_opcode and opcode != expected_opcode:
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=line_idx,
                                severity="error",
                                code="INVALID_MOVE_RESULT",
                                message=(
                                    f"'{opcode}' does not match return type "
                                    f"'{prev_return_type}'. Expected '{expected_opcode}'."
                                ),
                            )
                        )

        if opcode not in invoke_opcodes:
            continue

        return_type = extract_invoke_return_type(opcode, tokens)
        if return_type is None or return_type == "V":
            continue

        next_idx = index + 1
        while next_idx < len(instructions) and (
            instructions[next_idx][1] in DEBUG_DIRECTIVES
            or (
                instructions[next_idx][2]
                and f"{instructions[next_idx][1]} {instructions[next_idx][2][0]}"
                in DEBUG_DIRECTIVES
            )
        ):
            next_idx += 1

        if next_idx == len(instructions):
            report.diagnostics.append(
                SmaliDiagnostic(
                    line=line_idx,
                    severity="warning",
                    code="UNCONSUMED_INVOKE_RETURN",
                    message=(
                        f"Method returns '{return_type}' but return value is not captured "
                        "by move-result."
                    ),
                )
            )
        elif instructions[next_idx][1] not in ALL_MOVE_RESULT_OPCODES:
            next_opcode = instructions[next_idx][1]
            report.diagnostics.append(
                SmaliDiagnostic(
                    line=line_idx,
                    severity="warning",
                    code="MISSING_MOVE_RESULT",
                    message=(
                        f"Method returns '{return_type}' but next instruction is "
                        f"'{next_opcode}', not a move-result instruction."
                    ),
                )
            )

    # Pass 3: Control Flow Graph (CFG) analysis
    # Map instruction indices to lines
    cfg_nodes: list[int] = [i[0] for i in instructions]
    if cfg_nodes:
        # Build adjacency list: node_line -> list of successor lines
        adj: dict[int, list[int]] = {ln: [] for ln in cfg_nodes}
        inst_by_line = {i[0]: (i[1], i[2]) for i in instructions}

        # Associate each label with the line of the instruction that immediately follows it
        label_to_inst_line: dict[str, int] = {}
        for lbl, lbl_line in label_lines.items():
            following = [ln for ln in cfg_nodes if ln > lbl_line]
            if following:
                label_to_inst_line[lbl] = following[0]

        for idx, ln in enumerate(cfg_nodes):
            opcode, tokens = inst_by_line[ln]
            has_next = idx + 1 < len(cfg_nodes)
            next_line = cfg_nodes[idx + 1] if has_next else None

            if opcode in GOTO_OPCODES:
                target_lbl = tokens[0] if tokens else ""
                if target_lbl in label_to_inst_line:
                    adj[ln].append(label_to_inst_line[target_lbl])

            elif opcode in BRANCH_22T_OPCODES or opcode in BRANCH_21T_OPCODES:
                target_lbl = tokens[-1] if tokens else ""
                if target_lbl in label_to_inst_line:
                    adj[ln].append(label_to_inst_line[target_lbl])
                if next_line:
                    adj[ln].append(next_line)

            elif opcode in RETURN_THROW_OPCODES:
                # Terminal instruction: does not fall through
                pass
            else:
                # Normal instruction: falls through to next line
                if next_line:
                    adj[ln].append(next_line)

        # Reachability analysis from entry (cfg_nodes[0])
        entry = cfg_nodes[0]
        reachable: set[int] = set()
        queue = [entry]
        while queue:
            curr = queue.pop()
            if curr not in reachable:
                reachable.add(curr)
                for succ in adj.get(curr, []):
                    if succ not in reachable:
                        queue.append(succ)

        for ln in cfg_nodes:
            if ln not in reachable:
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=ln,
                        severity="warning",
                        code="UNREACHABLE_CODE",
                        message=f"Unreachable instruction '{inst_by_line[ln][0]}' at line {ln}",
                    )
                )

        # Backward edges and closed cycle detection
        # A backward edge exists if an edge goes from a node to an earlier node in line order
        for u in cfg_nodes:
            if u in reachable:
                for v in adj.get(u, []):
                    if v <= u:
                        matched_lbls = [
                            lbl
                            for lbl, l_line in label_to_inst_line.items()
                            if l_line == v
                        ]
                        lbl_name = matched_lbls[0] if matched_lbls else f"line {v}"
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=u,
                                severity="warning",
                                code="BACKWARD_BRANCH",
                                message=f"Backward branch to '{lbl_name}' detected (loop)",
                            )
                        )

        # Strongly connected components (Tarjan's algorithm) to find closed cycles
        index = 0
        indices: dict[int, int] = {}
        lowlinks: dict[int, int] = {}
        on_stack: dict[int, bool] = {}
        stack: list[int] = []
        sccs: list[list[int]] = []

        def strongconnect(v_node: int) -> None:
            nonlocal index
            indices[v_node] = index
            lowlinks[v_node] = index
            index += 1
            stack.append(v_node)
            on_stack[v_node] = True

            for w in adj.get(v_node, []):
                if w not in indices:
                    strongconnect(w)
                    lowlinks[v_node] = min(lowlinks[v_node], lowlinks[w])
                elif on_stack.get(w, False):
                    lowlinks[v_node] = min(lowlinks[v_node], indices[w])

            if lowlinks[v_node] == indices[v_node]:
                scc: list[int] = []
                while True:
                    w = stack.pop()
                    on_stack[w] = False
                    scc.append(w)
                    if w == v_node:
                        break
                if len(scc) > 1 or (len(scc) == 1 and v_node in adj.get(v_node, [])):
                    sccs.append(scc)

        for node in reachable:
            if node not in indices:
                strongconnect(node)

        for scc in sccs:
            # Check if SCC has any outgoing edge outside SCC
            has_exit = False
            has_return = False
            for member in scc:
                op, _ = inst_by_line[member]
                if op in RETURN_THROW_OPCODES:
                    has_return = True
                for nxt in adj.get(member, []):
                    if nxt not in scc:
                        has_exit = True
            if not has_exit and not has_return:
                min_line = min(scc)
                report.diagnostics.append(
                    SmaliDiagnostic(
                        line=min_line,
                        severity="warning",
                        code="POSSIBLE_CLOSED_CYCLE",
                        message="Possible closed loop detected: cycle has no exit or return/throw",
                    )
                )

    # Pass 4: Assembler Oracle (invoke pinned smali assemble)
    # Only if report has no errors so far
    tm = tool_manager or ToolManager()
    if report.is_valid and tm.is_tool_installed("smali"):
        with tempfile.TemporaryDirectory(prefix="apk-lab-smali-val-") as tmp_dir:
            tmp_path = Path(tmp_dir)
            synth_smali = tmp_path / "Synthetic.smali"
            out_dex = tmp_path / "classes.dex"

            # Construct synthetic class wrapper
            param_types = param_types_str
            method_mods = "public static" if is_static else "public"
            synth_lines = [
                ".class public LSynthetic;",
                ".super Ljava/lang/Object;",
                f".method {method_mods} testMethod({param_types})V",
                f"    .locals {locals_count}",
            ]
            header_line_count = len(synth_lines)
            synth_lines.append(snippet)
            synth_lines.append("    return-void")
            synth_lines.append(".end method")

            synth_smali.write_text("\n".join(synth_lines), encoding="utf-8")

            proc = tm.run_tool_cmd(
                "smali",
                ["assemble", str(synth_smali), "-o", str(out_dex)],
                capture_output=True,
                check=False,
            )
            if proc.returncode != 0:
                err_text = f"{proc.stderr}\n{proc.stdout}"
                diagnostics_parsed = False
                for err_line in err_text.splitlines():
                    match = re.search(r"\[(\d+),\d+\]\s*(.*)", err_line)
                    if match:
                        raw_line_no = int(match.group(1))
                        adjusted_line = max(1, raw_line_no - header_line_count)
                        msg = match.group(2)
                        report.diagnostics.append(
                            SmaliDiagnostic(
                                line=adjusted_line,
                                severity="error",
                                code="ASSEMBLER_SYNTAX_ERROR",
                                message=msg,
                            )
                        )
                        diagnostics_parsed = True
                if not diagnostics_parsed:
                    report.diagnostics.append(
                        SmaliDiagnostic(
                            line=1,
                            severity="error",
                            code="ASSEMBLER_ERROR",
                            message=err_text.strip()
                            or f"Smali assembler exited with code {proc.returncode}",
                        )
                    )
    return report


def run_validate_smali(args: argparse.Namespace) -> int:
    """CLI handler for validate-smali subcommand."""
    descriptor = getattr(args, "descriptor", None)
    params = getattr(args, "params", None)
    if params is None and descriptor is None:
        params = 0
    report = validate_smali_snippet(
        snippet=args.snippet,
        locals_count=args.locals,
        parameter_count=params,
        is_static=args.is_static,
        descriptor=descriptor,
    )
    print(report.format_human())
    return ExitCode.SUCCESS if report.is_valid else ExitCode.USAGE_OR_TOOL_ERROR
