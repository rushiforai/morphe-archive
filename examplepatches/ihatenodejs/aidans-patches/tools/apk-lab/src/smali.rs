//! Static Smali snippet validation.
//!
//! Ports the non-assembler passes of the retired Python implementation: directive and label
//! handling, register/format constraints, invoke return and `move-result`
//! sequencing, and CFG reachability/loop findings. Warnings stay warnings.
//! The external `smali assemble` oracle is represented by
//! [`SmaliAssemblerCommand`]; execution belongs to the calling process layer.

use crate::asm::{parse_base0, ParsedInteger};
use crate::error::Error;
use regex::Regex;
use serde::Serialize;
use std::collections::{HashMap, HashSet};
use std::path::Path;
use std::sync::LazyLock;

static DESCRIPTOR_RE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"^\((.*?)\)(V|\[*(?:[ZBCSIFJD]|L[^;]+;))$").expect("static method descriptor regex")
});
static METHOD_REF_RE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"->[^( \t\r\n]+\(.*\)(\[+(?:[ZBSCIJFD]|L[^;\s]+;)|[VZBSCIJFD]|L[^;\s]+;)$")
        .expect("static method reference regex")
});
static PROTO_RE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(
        r"(?:->[^( \t\r\n]+|[a-zA-Z0-9_$<>]+)?\([^)]*\)(\[+(?:[ZBSCIJFD]|L[^;\s]+;)|[VZBSCIJFD]|L[^;\s]+;)$",
    )
    .expect("static proto regex")
});
static CUSTOM_PROTO_RE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"\((?:[^()]*)\)(\[+(?:[ZBCSIFJD]|L[^;()\s]+;)|[VZBSCIFJD]|L[^;()\s]+;)")
        .expect("static custom proto regex")
});
static FALLBACK_PROTO_RE: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"\([^)]*\)(\S+)").expect("static fallback proto regex"));
static BRACES_RE: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"\{([^}]*)\}").expect("static register-list regex"));
static ASSEMBLER_DIAG_RE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"\[(\d+),\d+\]\s*(.*)").expect("static assembler diagnostic regex")
});

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Severity {
    Error,
    Warning,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Register {
    pub name: String,
    pub index: usize,
    pub is_param: bool,
    pub param_index: Option<usize>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct SmaliDiagnostic {
    pub line: usize,
    pub severity: Severity,
    pub code: &'static str,
    pub message: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SmaliValidationReport {
    pub snippet: String,
    pub locals_count: usize,
    pub params_count: usize,
    pub is_static: bool,
    pub total_registers: usize,
    /// Parameter type string used when synthesizing an assembler wrapper.
    pub parameter_types: String,
    pub diagnostics: Vec<SmaliDiagnostic>,
}

impl SmaliValidationReport {
    #[must_use]
    pub fn is_valid(&self) -> bool {
        !self
            .diagnostics
            .iter()
            .any(|diagnostic| diagnostic.severity == Severity::Error)
    }

    /// Human-readable summary, byte-compatible with the Python oracle.
    #[must_use]
    pub fn format_human(&self) -> String {
        let errors = self
            .diagnostics
            .iter()
            .filter(|diagnostic| diagnostic.severity == Severity::Error)
            .count();
        let warnings = self.diagnostics.len() - errors;
        let mut lines = Vec::new();
        if errors > 0 {
            lines.push(format!(
                "Validation failed with {errors} error(s) and {warnings} warning(s):"
            ));
        } else if warnings > 0 {
            lines.push(format!("Validation succeeded with {warnings} warning(s):"));
        } else {
            lines.push("Validation succeeded with 0 errors and 0 warnings.".to_string());
        }
        for diagnostic in &self.diagnostics {
            let prefix = match diagnostic.severity {
                Severity::Error => "ERROR",
                Severity::Warning => "WARNING",
            };
            lines.push(format!(
                "  [{prefix}] Line {} ({}): {}",
                diagnostic.line, diagnostic.code, diagnostic.message
            ));
        }
        lines.join("\n")
    }
}

fn is_format_22c(opcode: &str) -> bool {
    matches!(
        opcode,
        "instance-of"
            | "iget"
            | "iget-wide"
            | "iget-object"
            | "iget-boolean"
            | "iget-byte"
            | "iget-char"
            | "iget-short"
            | "iput"
            | "iput-wide"
            | "iput-object"
            | "iput-boolean"
            | "iput-byte"
            | "iput-char"
            | "iput-short"
    )
}

fn is_format_21c(opcode: &str) -> bool {
    matches!(
        opcode,
        "check-cast"
            | "new-instance"
            | "const-string"
            | "const-string/jumbo"
            | "const-class"
            | "sget"
            | "sget-wide"
            | "sget-object"
            | "sget-boolean"
            | "sget-byte"
            | "sget-char"
            | "sget-short"
            | "sput"
            | "sput-wide"
            | "sput-object"
            | "sput-boolean"
            | "sput-byte"
            | "sput-char"
            | "sput-short"
    )
}

fn is_invoke_35c(opcode: &str) -> bool {
    matches!(
        opcode,
        "invoke-virtual" | "invoke-super" | "invoke-direct" | "invoke-static" | "invoke-interface"
    )
}

fn is_invoke_3rc(opcode: &str) -> bool {
    matches!(
        opcode,
        "invoke-virtual/range"
            | "invoke-super/range"
            | "invoke-direct/range"
            | "invoke-static/range"
            | "invoke-interface/range"
    )
}

fn is_invoke_custom(opcode: &str) -> bool {
    matches!(opcode, "invoke-custom" | "invoke-custom/range")
}

fn is_invoke_polymorphic(opcode: &str) -> bool {
    matches!(opcode, "invoke-polymorphic" | "invoke-polymorphic/range")
}

fn is_invoke(opcode: &str) -> bool {
    is_invoke_35c(opcode)
        || is_invoke_3rc(opcode)
        || is_invoke_custom(opcode)
        || is_invoke_polymorphic(opcode)
}

fn is_move_result(opcode: &str) -> bool {
    matches!(
        opcode,
        "move-result" | "move-result-object" | "move-result-wide"
    )
}

fn is_filled_new_array(opcode: &str) -> bool {
    matches!(opcode, "filled-new-array" | "filled-new-array/range")
}

fn is_debug_directive(opcode: &str) -> bool {
    matches!(
        opcode,
        ".line"
            | ".local"
            | ".end local"
            | ".restart local"
            | ".prologue"
            | ".epilogue"
            | ".source"
            | ".param"
    )
}

fn is_goto(opcode: &str) -> bool {
    matches!(opcode, "goto" | "goto/16" | "goto/32")
}

fn is_conditional_branch(opcode: &str) -> bool {
    matches!(
        opcode,
        "if-eq" | "if-ne" | "if-lt" | "if-ge" | "if-gt" | "if-le"
    ) || matches!(
        opcode,
        "if-eqz" | "if-nez" | "if-ltz" | "if-gez" | "if-gtz" | "if-lez"
    )
}

fn is_return_or_throw(opcode: &str) -> bool {
    matches!(
        opcode,
        "return-void" | "return" | "return-wide" | "return-object" | "throw"
    )
}

/// Extracts the return type descriptor from a Smali method reference.
#[must_use]
pub fn extract_method_reference_return_type(operand: &str) -> Option<String> {
    METHOD_REF_RE
        .captures(operand.trim())
        .and_then(|captures| captures.get(1))
        .map(|matched| matched.as_str().to_string())
}

/// Extracts the return type descriptor from an invoke instruction's operands.
#[must_use]
pub fn extract_invoke_return_type(opcode: &str, tokens: &[String]) -> Option<String> {
    if tokens.is_empty() {
        return None;
    }

    if is_invoke_custom(opcode) {
        let joined_spec = tokens[1..].join(", ");
        let mut specs = vec![joined_spec
            .split_once('@')
            .map_or(joined_spec.as_str(), |(a, _)| a)];
        specs.extend(tokens[1..].iter().map(|token| {
            token
                .split_once('@')
                .map_or(token.as_str(), |(before, _)| before)
        }));
        for spec in specs {
            if let Some(captures) = CUSTOM_PROTO_RE.captures(spec) {
                if let Some(matched) = captures.get(1) {
                    return Some(matched.as_str().to_string());
                }
            }
            if let Some(captures) = FALLBACK_PROTO_RE.captures(spec) {
                if let Some(matched) = captures.get(1) {
                    let trimmed = matched
                        .as_str()
                        .trim_end_matches([')', ',', ';', ' ', '\t']);
                    if !trimmed.is_empty() {
                        return Some(trimmed.to_string());
                    }
                }
            }
        }
    }

    let mut candidates: Vec<&str> = Vec::new();
    if is_invoke_polymorphic(opcode) {
        if let Some(last) = tokens.last() {
            candidates.push(last);
        }
        candidates.push(tokens.get(1).map_or("", String::as_str));
    } else if is_invoke_custom(opcode) {
        candidates.push(tokens.get(1).map_or("", String::as_str));
        if let Some(last) = tokens.last() {
            candidates.push(last);
        }
    } else if let Some(last) = tokens.last() {
        candidates.push(last);
    }

    for candidate in candidates {
        let candidate = candidate.trim();
        if let Some(captures) = PROTO_RE.captures(candidate) {
            if let Some(matched) = captures.get(1) {
                return Some(matched.as_str().to_string());
            }
        }
        if let Some(return_type) = extract_method_reference_return_type(candidate) {
            return Some(return_type);
        }
    }
    None
}

/// Returns the expected `move-result` opcode for a return descriptor.
#[must_use]
pub fn expected_move_result_for_return_type(return_type: &str) -> Option<&'static str> {
    match return_type {
        "V" => None,
        "J" | "D" => Some("move-result-wide"),
        value if value.starts_with('[') || value.starts_with('L') => Some("move-result-object"),
        _ => Some("move-result"),
    }
}

fn is_python_space(ch: char) -> bool {
    ch.is_whitespace() || matches!(ch, '\u{1c}'..='\u{1f}')
}

fn trim_python(text: &str) -> &str {
    text.trim_matches(is_python_space)
}

/// Splits like Python's `str.splitlines()`.
#[must_use]
pub fn python_splitlines(text: &str) -> Vec<&str> {
    let mut lines = Vec::new();
    let mut start = 0_usize;
    let mut chars = text.char_indices().peekable();
    while let Some((index, ch)) = chars.next() {
        let is_break = matches!(
            ch,
            '\n' | '\r'
                | '\u{0b}'
                | '\u{0c}'
                | '\u{1c}'
                | '\u{1d}'
                | '\u{1e}'
                | '\u{85}'
                | '\u{2028}'
                | '\u{2029}'
        );
        if !is_break {
            continue;
        }
        lines.push(&text[start..index]);
        let mut end = index + ch.len_utf8();
        if ch == '\r' {
            if let Some((next_index, '\n')) = chars.peek().copied() {
                chars.next();
                end = next_index + 1;
            }
        }
        start = end;
    }
    if start < text.len() {
        lines.push(&text[start..]);
    }
    lines
}

fn split_once_python_whitespace(text: &str) -> Option<(&str, &str)> {
    let mut start = None;
    for (index, ch) in text.char_indices() {
        if is_python_space(ch) {
            if let Some(start) = start {
                return Some((&text[start..index], &text[index..]));
            }
        } else if start.is_none() {
            start = Some(index);
        }
    }
    start.map(|start| (&text[start..], ""))
}

/// Strips a Smali comment beginning with `#` outside a double-quoted string.
#[must_use]
pub fn strip_smali_comment(line: &str) -> String {
    let mut in_quote = false;
    let mut escape = false;
    for (index, ch) in line.char_indices() {
        if in_quote {
            if escape {
                escape = false;
            } else if ch == '\\' {
                escape = true;
            } else if ch == '"' {
                in_quote = false;
            }
        } else if ch == '"' {
            in_quote = true;
        } else if ch == '#' {
            return trim_python(&line[..index]).to_string();
        }
    }
    trim_python(line).to_string()
}

/// Splits Smali operands by commas outside quotes and braces.
#[must_use]
pub fn split_smali_operands(operands: &str) -> Vec<String> {
    let mut tokens = Vec::new();
    let mut current = String::new();
    let mut in_quote = false;
    let mut escape = false;
    let mut brace_depth = 0_i32;
    for ch in operands.chars() {
        if in_quote {
            current.push(ch);
            if escape {
                escape = false;
            } else if ch == '\\' {
                escape = true;
            } else if ch == '"' {
                in_quote = false;
            }
        } else if ch == '"' {
            in_quote = true;
            current.push(ch);
        } else if ch == '{' {
            brace_depth += 1;
            current.push(ch);
        } else if ch == '}' {
            brace_depth -= 1;
            current.push(ch);
        } else if ch == ',' && brace_depth == 0 {
            let token = trim_python(&current);
            if !token.is_empty() {
                tokens.push(token.to_string());
            }
            current.clear();
        } else {
            current.push(ch);
        }
    }
    let token = trim_python(&current);
    if !token.is_empty() {
        tokens.push(token.to_string());
    }
    tokens
}

/// Parses parameter types and register widths from a Dalvik descriptor.
///
/// Wide types occupy two registers unless reached through an array type,
/// matching the oracle's `start < i - 1` rule.
pub fn parse_method_descriptor_params(descriptor: &str) -> Result<(String, Vec<usize>), Error> {
    let trimmed = trim_python(descriptor);
    let captures = DESCRIPTOR_RE.captures(trimmed).ok_or_else(|| {
        Error::usage(format!(
            "Invalid method descriptor '{descriptor}', expected format like '(ILjava/lang/String;)V'"
        ))
    })?;
    let params_str = captures
        .get(1)
        .map_or("", |matched| matched.as_str())
        .to_string();

    let bytes = params_str.as_bytes();
    let mut widths = Vec::new();
    let mut index = 0_usize;
    while index < bytes.len() {
        let start = index;
        while index < bytes.len() && bytes[index] == b'[' {
            index += 1;
        }
        if index >= bytes.len() {
            return Err(Error::usage(format!(
                "Unterminated array type in descriptor '{descriptor}'"
            )));
        }
        let ch = bytes[index];
        if ch == b'L' {
            let Some(relative_semicolon) = bytes[index..].iter().position(|byte| *byte == b';')
            else {
                return Err(Error::usage(format!(
                    "Unterminated object descriptor in '{descriptor}'"
                )));
            };
            index += relative_semicolon + 1;
            widths.push(1);
        } else if matches!(ch, b'Z' | b'B' | b'C' | b'S' | b'I' | b'F') {
            index += 1;
            widths.push(1);
        } else if matches!(ch, b'J' | b'D') {
            index += 1;
            widths.push(if start < index - 1 { 1 } else { 2 });
        } else {
            return Err(Error::usage(format!(
                "Unexpected character '{}' in method descriptor '{descriptor}'",
                ch as char
            )));
        }
    }
    Ok((params_str, widths))
}

/// Parses a register token and maps it to an absolute register index.
pub fn parse_smali_register(
    token: &str,
    line_no: usize,
    locals_count: usize,
    parameter_count: usize,
    is_static: bool,
    total_registers: usize,
) -> (Option<Register>, Option<SmaliDiagnostic>) {
    let tok = trim_python(token).trim_end_matches(',');
    if tok.is_empty() {
        return (None, None);
    }

    if let Some(rest) = tok.strip_prefix('v') {
        let number = match parse_decimal(rest) {
            Ok(ParsedInteger::Value(value)) => value,
            Ok(ParsedInteger::Overflow) => i128::MAX,
            Err(()) => {
                return (
                    None,
                    Some(SmaliDiagnostic {
                        line: line_no,
                        severity: Severity::Error,
                        code: "INVALID_REGISTER_SYNTAX",
                        message: format!("Invalid register syntax '{tok}'"),
                    }),
                )
            }
        };
        if number < 0 || number >= total_registers as i128 {
            return (
                None,
                Some(SmaliDiagnostic {
                    line: line_no,
                    severity: Severity::Error,
                    code: "REGISTER_OUT_OF_RANGE",
                    message: format!(
                        "Register '{tok}' out of range for total {total_registers} registers (v0..v{})",
                        total_registers as i128 - 1
                    ),
                }),
            );
        }
        if number >= locals_count as i128 {
            let param_name = if is_static {
                format!("p{}", number - locals_count as i128)
            } else if number == locals_count as i128 {
                "p0 (this)".to_string()
            } else {
                format!("p{}", number - locals_count as i128)
            };
            return (
                None,
                Some(SmaliDiagnostic {
                    line: line_no,
                    severity: Severity::Error,
                    code: "REGISTER_ALIASES_PARAMETER",
                    message: format!(
                        "Register '{tok}' (index {number}) exceeds locals count ({locals_count}) \
                         and aliases parameter register '{param_name}'. Use '{param_name}' \
                         or increase method locals."
                    ),
                }),
            );
        }
        return (
            Some(Register {
                name: tok.to_string(),
                index: number as usize,
                is_param: false,
                param_index: None,
            }),
            None,
        );
    }

    if let Some(rest) = tok.strip_prefix('p') {
        let index = match parse_decimal(rest) {
            Ok(ParsedInteger::Value(value)) => value,
            Ok(ParsedInteger::Overflow) => i128::MAX,
            Err(()) => {
                return (
                    None,
                    Some(SmaliDiagnostic {
                        line: line_no,
                        severity: Severity::Error,
                        code: "INVALID_REGISTER_SYNTAX",
                        message: format!("Invalid register syntax '{tok}'"),
                    }),
                )
            }
        };

        if is_static {
            if index < 0 || index >= parameter_count as i128 {
                return (
                    None,
                    Some(SmaliDiagnostic {
                        line: line_no,
                        severity: Severity::Error,
                        code: "PARAMETER_OUT_OF_RANGE",
                        message: format!(
                            "Parameter register '{tok}' out of range for static method with \
                             {parameter_count} parameter(s) (p0..p{})",
                            (parameter_count as i128 - 1).max(0)
                        ),
                    }),
                );
            }
            let absolute = locals_count as i128 + index;
            return (
                Some(Register {
                    name: tok.to_string(),
                    index: absolute as usize,
                    is_param: true,
                    param_index: Some(index as usize),
                }),
                None,
            );
        }

        if index < 0 || index > parameter_count as i128 {
            return (
                None,
                Some(SmaliDiagnostic {
                    line: line_no,
                    severity: Severity::Error,
                    code: "PARAMETER_OUT_OF_RANGE",
                    message: format!(
                        "Parameter register '{tok}' out of range for instance method with \
                         {parameter_count} parameter(s) (p0=this, p1..p{parameter_count})"
                    ),
                }),
            );
        }
        let absolute = locals_count as i128 + index;
        return (
            Some(Register {
                name: tok.to_string(),
                index: absolute as usize,
                is_param: true,
                param_index: Some(index as usize),
            }),
            None,
        );
    }

    (None, None)
}

/// Parses a decimal integer accepting Python's sign and underscore forms.
fn parse_decimal(text: &str) -> Result<ParsedInteger, ()> {
    let text = trim_python(text);
    let bytes = text.as_bytes();
    let (negative, digits) = match bytes.first() {
        Some(b'+') => (false, &text[1..]),
        Some(b'-') => (true, &text[1..]),
        _ => (false, text),
    };
    if digits.is_empty() {
        return Err(());
    }
    let mut value: i128 = 0;
    let mut previous_was_digit = false;
    for (index, ch) in digits.char_indices() {
        if ch == '_' {
            if !previous_was_digit || index + 1 == digits.len() {
                return Err(());
            }
            previous_was_digit = false;
            continue;
        }
        let digit = ch.to_digit(10).ok_or(())?;
        previous_was_digit = true;
        value = match value
            .checked_mul(10)
            .and_then(|value| value.checked_add(i128::from(digit)))
        {
            Some(value) => value,
            None => return Ok(ParsedInteger::Overflow),
        };
    }
    if !previous_was_digit {
        return Err(());
    }
    Ok(ParsedInteger::Value(if negative { -value } else { value }))
}

fn parse_literal_token(token: &str) -> Result<ParsedInteger, ()> {
    let clean = trim_python(token).trim_end_matches(',');
    let clean = match clean.strip_prefix('#') {
        Some(rest) => trim_python(rest),
        None => clean,
    };
    parse_base0(clean)
}

#[derive(Debug)]
struct Instruction {
    line: usize,
    opcode: String,
    tokens: Vec<String>,
}

fn debug_directive_instruction(instruction: &Instruction) -> bool {
    is_debug_directive(&instruction.opcode)
        || instruction
            .tokens
            .first()
            .is_some_and(|first| is_debug_directive(&format!("{} {}", instruction.opcode, first)))
}

fn skip_debug_backward(instructions: &[Instruction], mut index: isize) -> Option<usize> {
    while index >= 0 {
        let current = &instructions[index as usize];
        if debug_directive_instruction(current) {
            index -= 1;
        } else {
            return Some(index as usize);
        }
    }
    None
}

fn skip_debug_forward(instructions: &[Instruction], mut index: usize) -> Option<usize> {
    while index < instructions.len() {
        if debug_directive_instruction(&instructions[index]) {
            index += 1;
        } else {
            return Some(index);
        }
    }
    None
}

/// Validates a Smali snippet without invoking an external assembler.
pub fn validate_smali_snippet(
    snippet: &str,
    locals_count: usize,
    parameter_count: Option<usize>,
    is_static: bool,
    descriptor: Option<&str>,
) -> Result<SmaliValidationReport, Error> {
    let (parameter_types, param_regs) = if let Some(descriptor) = descriptor {
        let (params, widths) = parse_method_descriptor_params(descriptor)?;
        let total = widths
            .iter()
            .try_fold(0_usize, |total, width| total.checked_add(*width))
            .ok_or_else(|| Error::usage("Parameter register count overflow"))?;
        (params, total)
    } else {
        let count = parameter_count.unwrap_or(0);
        let bytes = count
            .checked_mul("Ljava/lang/Object;".len())
            .ok_or_else(|| Error::usage("Parameter list is too large"))?;
        if bytes > isize::MAX as usize {
            return Err(Error::usage("Parameter list is too large"));
        }
        ("Ljava/lang/Object;".repeat(count), count)
    };

    let total_registers = locals_count
        .checked_add(param_regs)
        .and_then(|total| total.checked_add(usize::from(!is_static)))
        .ok_or_else(|| Error::usage("Register count overflow"))?;

    let mut report = SmaliValidationReport {
        snippet: snippet.to_string(),
        locals_count,
        params_count: param_regs,
        is_static,
        total_registers,
        parameter_types,
        diagnostics: Vec::new(),
    };

    let mut label_lines: Vec<(String, usize)> = Vec::new();
    let mut label_index: HashMap<String, usize> = HashMap::new();
    let mut instructions: Vec<Instruction> = Vec::new();

    for (index, raw_line) in python_splitlines(snippet).iter().enumerate() {
        let line_no = index + 1;
        let line = strip_smali_comment(raw_line);
        if line.is_empty() {
            continue;
        }

        if line.starts_with(".class")
            || line.starts_with(".super")
            || line.starts_with(".method")
            || line.starts_with(".end method")
        {
            report.diagnostics.push(SmaliDiagnostic {
                line: line_no,
                severity: Severity::Error,
                code: "METHOD_DIRECTIVE_DISALLOWED",
                message: "Method or class directives are not allowed in snippets".to_string(),
            });
            continue;
        }

        if line.starts_with(':') {
            let label_name = line.split_whitespace().next().unwrap_or(":").to_string();
            if let Some(previous) = label_index.get(&label_name).copied() {
                let previous_line = label_lines.get(previous).map_or(0, |(_, line)| *line);
                report.diagnostics.push(SmaliDiagnostic {
                    line: line_no,
                    severity: Severity::Error,
                    code: "DUPLICATE_LABEL",
                    message: format!(
                        "Duplicate label definition '{label_name}' (previously defined on line {previous_line})"
                    ),
                });
            } else {
                label_index.insert(label_name.clone(), label_lines.len());
                label_lines.push((label_name, line_no));
            }
            continue;
        }

        let (opcode, operands_str) = match split_once_python_whitespace(&line) {
            Some((opcode, rest)) => (opcode.to_string(), trim_python(rest)),
            None => (line.clone(), ""),
        };
        let tokens = split_smali_operands(operands_str);
        instructions.push(Instruction {
            line: line_no,
            opcode,
            tokens,
        });
    }

    // Pass 1: opcode format and register constraints.
    for instruction in &instructions {
        let line_idx = instruction.line;
        let opcode = instruction.opcode.as_str();
        let tokens = &instruction.tokens;

        if is_format_22c(opcode) {
            if tokens.len() >= 2 {
                for token in tokens.iter().take(2) {
                    let (register, diagnostic) = parse_smali_register(
                        token,
                        line_idx,
                        locals_count,
                        param_regs,
                        is_static,
                        total_registers,
                    );
                    if let Some(diagnostic) = diagnostic {
                        report.diagnostics.push(diagnostic);
                    } else if let Some(register) = register {
                        if register.index > 15 {
                            let remediation =
                                if opcode.contains("object") || opcode == "instance-of" {
                                    format!("move-object/from16 v1, {token}")
                                } else {
                                    format!("move/from16 v1, {token}")
                                };
                            report.diagnostics.push(SmaliDiagnostic {
                                line: line_idx,
                                severity: Severity::Error,
                                code: "FORMAT_22C_REGISTER_OVERFLOW",
                                message: format!(
                                    "Opcode '{opcode}' (format 22c) requires 4-bit registers (v0..v15). \
                                     '{token}' maps to v{}. Use '{remediation}' first.",
                                    register.index
                                ),
                            });
                        }
                    }
                }
            }
        } else if is_format_21c(opcode) {
            if let Some(token) = tokens.first() {
                let (register, diagnostic) = parse_smali_register(
                    token,
                    line_idx,
                    locals_count,
                    param_regs,
                    is_static,
                    total_registers,
                );
                if let Some(diagnostic) = diagnostic {
                    report.diagnostics.push(diagnostic);
                } else if let Some(register) = register {
                    if register.index > 255 {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "FORMAT_21C_REGISTER_OVERFLOW",
                            message: format!(
                                "Opcode '{opcode}' (format 21c) destination register '{token}' \
                                 maps to v{}, which exceeds 8-bit maximum (v0..v255).",
                                register.index
                            ),
                        });
                    }
                }
            }
        } else if opcode == "const/4" {
            if tokens.len() >= 2 {
                let (register, diagnostic) = parse_smali_register(
                    &tokens[0],
                    line_idx,
                    locals_count,
                    param_regs,
                    is_static,
                    total_registers,
                );
                if let Some(diagnostic) = diagnostic {
                    report.diagnostics.push(diagnostic);
                } else if let Some(register) = register {
                    if register.index > 15 {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "FORMAT_11N_REGISTER_OVERFLOW",
                            message: format!(
                                "Opcode 'const/4' requires 4-bit register (v0..v15). '{}' maps to v{}.",
                                tokens[0], register.index
                            ),
                        });
                    }
                }
                match parse_literal_token(&tokens[1]) {
                    Ok(ParsedInteger::Value(value)) if !(-8..=7).contains(&value) => {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "CONST4_LITERAL_OUT_OF_RANGE",
                            message: format!(
                                "Literal '{}' out of range for 'const/4' (-8..7). Use 'const/16' instead.",
                                tokens[1]
                            ),
                        });
                    }
                    Ok(ParsedInteger::Overflow) => {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "CONST4_LITERAL_OUT_OF_RANGE",
                            message: format!(
                                "Literal '{}' out of range for 'const/4' (-8..7). Use 'const/16' instead.",
                                tokens[1]
                            ),
                        });
                    }
                    _ => {}
                }
            }
        } else if opcode == "const/16" {
            if tokens.len() >= 2 {
                let (register, diagnostic) = parse_smali_register(
                    &tokens[0],
                    line_idx,
                    locals_count,
                    param_regs,
                    is_static,
                    total_registers,
                );
                if let Some(diagnostic) = diagnostic {
                    report.diagnostics.push(diagnostic);
                } else if let Some(register) = register {
                    if register.index > 255 {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "FORMAT_21S_REGISTER_OVERFLOW",
                            message: format!(
                                "Opcode 'const/16' destination register '{}' maps to v{}, \
                                 which exceeds 8-bit limit (v0..v255).",
                                tokens[0], register.index
                            ),
                        });
                    }
                }
                match parse_literal_token(&tokens[1]) {
                    Ok(ParsedInteger::Value(value)) if !(-32768..=32767).contains(&value) => {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "CONST16_LITERAL_OUT_OF_RANGE",
                            message: format!(
                                "Literal '{}' out of range for 'const/16' (-32768..32767). Use 'const' instead.",
                                tokens[1]
                            ),
                        });
                    }
                    Ok(ParsedInteger::Overflow) => {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "CONST16_LITERAL_OUT_OF_RANGE",
                            message: format!(
                                "Literal '{}' out of range for 'const/16' (-32768..32767). Use 'const' instead.",
                                tokens[1]
                            ),
                        });
                    }
                    _ => {}
                }
            }
        } else if is_invoke_35c(opcode) {
            if let Some(captures) = BRACES_RE.captures(&tokens.join(" ")) {
                if let Some(group) = captures.get(1) {
                    for register_token in group.as_str().split(',').map(trim_python) {
                        if register_token.is_empty() {
                            continue;
                        }
                        let (register, diagnostic) = parse_smali_register(
                            register_token,
                            line_idx,
                            locals_count,
                            param_regs,
                            is_static,
                            total_registers,
                        );
                        if let Some(diagnostic) = diagnostic {
                            report.diagnostics.push(diagnostic);
                        } else if let Some(register) = register {
                            if register.index > 15 {
                                report.diagnostics.push(SmaliDiagnostic {
                                    line: line_idx,
                                    severity: Severity::Error,
                                    code: "INVOKE_35C_REGISTER_OVERFLOW",
                                    message: format!(
                                        "Opcode '{opcode}' (format 35c) requires 4-bit registers (v0..v15). \
                                         '{register_token}' maps to v{}. Use '{opcode}/range' for registers above v15.",
                                        register.index
                                    ),
                                });
                            }
                        }
                    }
                }
            }
        }

        if is_goto(opcode) {
            let target = tokens.first().map_or("", String::as_str);
            if !target.starts_with(':') {
                report.diagnostics.push(SmaliDiagnostic {
                    line: line_idx,
                    severity: Severity::Error,
                    code: "INVALID_BRANCH_SYNTAX",
                    message: format!(
                        "Goto instruction requires label target starting with ':', got '{target}'"
                    ),
                });
            } else if !label_index.contains_key(target) {
                report.diagnostics.push(SmaliDiagnostic {
                    line: line_idx,
                    severity: Severity::Error,
                    code: "MISSING_BRANCH_TARGET",
                    message: format!("Target label '{target}' not defined in snippet"),
                });
            }
        } else if is_conditional_branch(opcode) {
            let target = tokens.last().map_or("", String::as_str);
            if !target.starts_with(':') {
                report.diagnostics.push(SmaliDiagnostic {
                    line: line_idx,
                    severity: Severity::Error,
                    code: "INVALID_BRANCH_SYNTAX",
                    message: format!(
                        "Conditional branch requires label target starting with ':', got '{target}'"
                    ),
                });
            } else if !label_index.contains_key(target) {
                report.diagnostics.push(SmaliDiagnostic {
                    line: line_idx,
                    severity: Severity::Error,
                    code: "MISSING_BRANCH_TARGET",
                    message: format!("Target label '{target}' not defined in snippet"),
                });
            }
        }
    }

    // Pass 2: invoke return and move-result sequencing.
    for (index, instruction) in instructions.iter().enumerate() {
        let line_idx = instruction.line;
        let opcode = instruction.opcode.as_str();
        let previous = skip_debug_backward(&instructions, index as isize - 1)
            .map(|previous| &instructions[previous]);

        if is_move_result(opcode) {
            match previous {
                None => report.diagnostics.push(SmaliDiagnostic {
                    line: line_idx,
                    severity: Severity::Error,
                    code: "ORPHAN_MOVE_RESULT",
                    message: format!(
                        "'{opcode}' must immediately follow an invoke or filled-new-array instruction."
                    ),
                }),
                Some(previous) if !is_invoke(&previous.opcode) && !is_filled_new_array(&previous.opcode) => {
                    report.diagnostics.push(SmaliDiagnostic {
                        line: line_idx,
                        severity: Severity::Error,
                        code: "ORPHAN_MOVE_RESULT",
                        message: format!(
                            "'{opcode}' must immediately follow an invoke or filled-new-array instruction."
                        ),
                    });
                }
                Some(previous) if is_filled_new_array(&previous.opcode) => {
                    if opcode != "move-result-object" {
                        report.diagnostics.push(SmaliDiagnostic {
                            line: line_idx,
                            severity: Severity::Error,
                            code: "INVALID_MOVE_RESULT",
                            message: format!(
                                "'{opcode}' cannot follow '{}'. Expected 'move-result-object'.",
                                previous.opcode
                            ),
                        });
                    }
                }
                Some(previous) => {
                    let return_type =
                        extract_invoke_return_type(&previous.opcode, &previous.tokens);
                    if let Some(return_type) = return_type {
                        if return_type == "V" {
                            report.diagnostics.push(SmaliDiagnostic {
                                line: line_idx,
                                severity: Severity::Error,
                                code: "INVALID_MOVE_RESULT",
                                message: format!(
                                    "'{opcode}' cannot follow method returning 'void'."
                                ),
                            });
                        } else if let Some(expected) =
                            expected_move_result_for_return_type(&return_type)
                        {
                            if opcode != expected {
                                report.diagnostics.push(SmaliDiagnostic {
                                    line: line_idx,
                                    severity: Severity::Error,
                                    code: "INVALID_MOVE_RESULT",
                                    message: format!(
                                        "'{opcode}' does not match return type '{return_type}'. \
                                         Expected '{expected}'."
                                    ),
                                });
                            }
                        }
                    }
                }
            }
        }

        if !is_invoke(opcode) {
            continue;
        }
        let return_type = extract_invoke_return_type(opcode, &instruction.tokens);
        let Some(return_type) = return_type else {
            continue;
        };
        if return_type == "V" {
            continue;
        }

        match skip_debug_forward(&instructions, index + 1) {
            None => report.diagnostics.push(SmaliDiagnostic {
                line: line_idx,
                severity: Severity::Warning,
                code: "UNCONSUMED_INVOKE_RETURN",
                message: format!(
                    "Method returns '{return_type}' but return value is not captured by move-result."
                ),
            }),
            Some(next) => {
                if !is_move_result(&instructions[next].opcode) {
                    report.diagnostics.push(SmaliDiagnostic {
                        line: line_idx,
                        severity: Severity::Warning,
                        code: "MISSING_MOVE_RESULT",
                        message: format!(
                            "Method returns '{return_type}' but next instruction is '{}', \
                             not a move-result instruction.",
                            instructions[next].opcode
                        ),
                    });
                }
            }
        }
    }

    // Pass 3: CFG reachability, backward edges, and closed cycles.
    let cfg_nodes: Vec<usize> = instructions
        .iter()
        .map(|instruction| instruction.line)
        .collect();
    if !cfg_nodes.is_empty() {
        let mut inst_index: HashMap<usize, usize> = HashMap::new();
        for (index, instruction) in instructions.iter().enumerate() {
            inst_index.insert(instruction.line, index);
        }

        let mut label_to_inst: Vec<(String, usize)> = Vec::new();
        for (label, label_line) in &label_lines {
            if let Some(following) = cfg_nodes.iter().copied().find(|line| line > label_line) {
                label_to_inst.push((label.clone(), following));
            }
        }
        let mut label_target: HashMap<&str, usize> = HashMap::new();
        for (label, line) in &label_to_inst {
            label_target.entry(label.as_str()).or_insert(*line);
        }

        let mut adjacency: HashMap<usize, Vec<usize>> = HashMap::new();
        for (node_index, line) in cfg_nodes.iter().enumerate() {
            adjacency.insert(*line, Vec::new());
            let Some(&instruction_index) = inst_index.get(line) else {
                continue;
            };
            let instruction = &instructions[instruction_index];
            let next_line = cfg_nodes.get(node_index + 1).copied();
            if is_goto(&instruction.opcode) {
                let target = instruction.tokens.first().map_or("", String::as_str);
                if let Some(target_line) = label_target.get(target) {
                    adjacency.entry(*line).or_default().push(*target_line);
                }
            } else if is_conditional_branch(&instruction.opcode) {
                let target = instruction.tokens.last().map_or("", String::as_str);
                if let Some(target_line) = label_target.get(target) {
                    adjacency.entry(*line).or_default().push(*target_line);
                }
                if let Some(next_line) = next_line {
                    adjacency.entry(*line).or_default().push(next_line);
                }
            } else if !is_return_or_throw(&instruction.opcode) {
                if let Some(next_line) = next_line {
                    adjacency.entry(*line).or_default().push(next_line);
                }
            }
        }

        let entry = cfg_nodes[0];
        let mut reachable: HashSet<usize> = HashSet::new();
        let mut queue = vec![entry];
        while let Some(current) = queue.pop() {
            if reachable.insert(current) {
                if let Some(successors) = adjacency.get(&current) {
                    for successor in successors {
                        if !reachable.contains(successor) {
                            queue.push(*successor);
                        }
                    }
                }
            }
        }

        for line in &cfg_nodes {
            if !reachable.contains(line) {
                let opcode = inst_index
                    .get(line)
                    .and_then(|index| instructions.get(*index))
                    .map_or("", |instruction| instruction.opcode.as_str());
                report.diagnostics.push(SmaliDiagnostic {
                    line: *line,
                    severity: Severity::Warning,
                    code: "UNREACHABLE_CODE",
                    message: format!("Unreachable instruction '{opcode}' at line {line}"),
                });
            }
        }

        for source in &cfg_nodes {
            if !reachable.contains(source) {
                continue;
            }
            if let Some(successors) = adjacency.get(source) {
                for successor in successors {
                    if successor <= source {
                        let matched_label = label_to_inst
                            .iter()
                            .find(|(_, line)| line == successor)
                            .map(|(label, _)| label.as_str());
                        let label_name = matched_label
                            .map_or_else(|| format!("line {successor}"), ToString::to_string);
                        report.diagnostics.push(SmaliDiagnostic {
                            line: *source,
                            severity: Severity::Warning,
                            code: "BACKWARD_BRANCH",
                            message: format!("Backward branch to '{label_name}' detected (loop)"),
                        });
                    }
                }
            }
        }

        let mut indices: HashMap<usize, usize> = HashMap::new();
        let mut lowlinks: HashMap<usize, usize> = HashMap::new();
        let mut on_stack: HashSet<usize> = HashSet::new();
        let mut tarjan_stack: Vec<usize> = Vec::new();
        let mut sccs: Vec<Vec<usize>> = Vec::new();
        let mut next_index = 0_usize;

        for root in &cfg_nodes {
            if !reachable.contains(root) || indices.contains_key(root) {
                continue;
            }
            indices.insert(*root, next_index);
            lowlinks.insert(*root, next_index);
            next_index += 1;
            tarjan_stack.push(*root);
            on_stack.insert(*root);
            let mut frames: Vec<(usize, usize)> = vec![(*root, 0)];

            while !frames.is_empty() {
                let (node, edge_index) = *frames.last().expect("frame present");
                let next_node = {
                    let neighbors = adjacency.get(&node).map_or(&[][..], Vec::as_slice);
                    neighbors.get(edge_index).copied()
                };
                if let Some(next_node) = next_node {
                    if let Some(frame) = frames.last_mut() {
                        frame.1 += 1;
                    }
                    match indices.entry(next_node) {
                        std::collections::hash_map::Entry::Vacant(entry) => {
                            entry.insert(next_index);
                            lowlinks.insert(next_node, next_index);
                            next_index += 1;
                            tarjan_stack.push(next_node);
                            on_stack.insert(next_node);
                            frames.push((next_node, 0));
                        }
                        std::collections::hash_map::Entry::Occupied(entry) => {
                            if on_stack.contains(&next_node) {
                                let next_low = *entry.get();
                                if let Some(low) = lowlinks.get_mut(&node) {
                                    *low = (*low).min(next_low);
                                }
                            }
                        }
                    }
                } else {
                    frames.pop();
                    let node_low = lowlinks.get(&node).copied().unwrap_or(0);
                    if let Some((parent, _)) = frames.last().copied() {
                        if let Some(low) = lowlinks.get_mut(&parent) {
                            *low = (*low).min(node_low);
                        }
                    }
                    if Some(&node_low) == indices.get(&node) {
                        let mut component = Vec::new();
                        while let Some(member) = tarjan_stack.pop() {
                            on_stack.remove(&member);
                            component.push(member);
                            if member == node {
                                break;
                            }
                        }
                        let self_loop = adjacency
                            .get(&node)
                            .is_some_and(|neighbors| neighbors.contains(&node));
                        if component.len() > 1 || self_loop {
                            sccs.push(component);
                        }
                    }
                }
            }
        }

        for component in sccs {
            let members: HashSet<usize> = component.iter().copied().collect();
            let mut has_exit = false;
            let mut has_return = false;
            for member in &component {
                let instruction = inst_index
                    .get(member)
                    .and_then(|index| instructions.get(*index));
                if instruction.is_some_and(|instruction| is_return_or_throw(&instruction.opcode)) {
                    has_return = true;
                }
                if let Some(neighbors) = adjacency.get(member) {
                    if neighbors.iter().any(|neighbor| !members.contains(neighbor)) {
                        has_exit = true;
                    }
                }
            }
            if !has_exit && !has_return {
                let min_line = component.iter().copied().min().unwrap_or(0);
                report.diagnostics.push(SmaliDiagnostic {
                    line: min_line,
                    severity: Severity::Warning,
                    code: "POSSIBLE_CLOSED_CYCLE",
                    message: "Possible closed loop detected: cycle has no exit or return/throw"
                        .to_string(),
                });
            }
        }
    }

    Ok(report)
}

/// Ready-to-run `smali assemble` invocation.
///
/// The caller owns temp paths, tool resolution, and execution; this type only
/// builds the Python-compatible synthetic source and maps its output back to
/// snippet-relative line numbers.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SmaliAssemblerCommand {
    pub program: String,
    pub args: Vec<String>,
    pub source: String,
    pub header_line_count: usize,
}

impl SmaliAssemblerCommand {
    #[must_use]
    pub fn new(
        snippet: &str,
        locals_count: usize,
        param_types: &str,
        is_static: bool,
        source_path: &Path,
        dex_path: &Path,
    ) -> Self {
        let method_mods = if is_static { "public static" } else { "public" };
        let synthetic_header = [
            ".class public LSynthetic;".to_string(),
            ".super Ljava/lang/Object;".to_string(),
            format!(".method {method_mods} testMethod({param_types})V"),
            format!("    .locals {locals_count}"),
        ];
        let header_line_count = synthetic_header.len();
        let mut lines = synthetic_header.to_vec();
        lines.push(snippet.to_string());
        lines.push("    return-void".to_string());
        lines.push(".end method".to_string());

        Self {
            program: "smali".to_string(),
            args: vec![
                "assemble".to_string(),
                source_path.to_string_lossy().into_owned(),
                "-o".to_string(),
                dex_path.to_string_lossy().into_owned(),
            ],
            source: lines.join("\n"),
            header_line_count,
        }
    }

    /// Maps assembler stdout/stderr to snippet diagnostics.
    #[must_use]
    pub fn diagnostics(
        &self,
        stderr: &str,
        stdout: &str,
        exit_code: Option<i32>,
    ) -> Vec<SmaliDiagnostic> {
        let error_text = format!("{stderr}\n{stdout}");
        let mut diagnostics = Vec::new();
        for line in python_splitlines(&error_text) {
            let Some(captures) = ASSEMBLER_DIAG_RE.captures(line) else {
                continue;
            };
            let Some(raw_line) = captures
                .get(1)
                .and_then(|matched| matched.as_str().parse::<usize>().ok())
            else {
                continue;
            };
            let adjusted_line = raw_line.saturating_sub(self.header_line_count).max(1);
            let message = captures
                .get(2)
                .map_or("", |matched| matched.as_str())
                .to_string();
            diagnostics.push(SmaliDiagnostic {
                line: adjusted_line,
                severity: Severity::Error,
                code: "ASSEMBLER_SYNTAX_ERROR",
                message,
            });
        }
        if diagnostics.is_empty() {
            let stripped = trim_python(&error_text);
            let message = if stripped.is_empty() {
                match exit_code {
                    Some(code) => format!("Smali assembler exited with code {code}"),
                    None => "Smali assembler exited without an exit code".to_string(),
                }
            } else {
                stripped.to_string()
            };
            diagnostics.push(SmaliDiagnostic {
                line: 1,
                severity: Severity::Error,
                code: "ASSEMBLER_ERROR",
                message,
            });
        }
        diagnostics
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn codes(report: &SmaliValidationReport) -> Vec<&'static str> {
        report
            .diagnostics
            .iter()
            .map(|diagnostic| diagnostic.code)
            .collect()
    }

    fn warnings(report: &SmaliValidationReport) -> Vec<&'static str> {
        report
            .diagnostics
            .iter()
            .filter(|diagnostic| diagnostic.severity == Severity::Warning)
            .map(|diagnostic| diagnostic.code)
            .collect()
    }

    #[test]
    fn register_mapping_instance_and_static() {
        let (reg, error) = parse_smali_register("p0", 1, 20, 2, false, 23);
        assert!(error.is_none());
        let reg = reg.unwrap();
        assert_eq!(reg.index, 20);
        assert!(reg.is_param);

        let (reg, error) = parse_smali_register("p1", 1, 20, 2, false, 23);
        assert!(error.is_none());
        assert_eq!(reg.unwrap().index, 21);

        let (_, error) = parse_smali_register("p3", 1, 20, 2, false, 23);
        assert_eq!(error.unwrap().code, "PARAMETER_OUT_OF_RANGE");

        let (reg, error) = parse_smali_register("p0", 1, 20, 2, true, 22);
        assert!(error.is_none());
        assert_eq!(reg.unwrap().index, 20);
        let (_, error) = parse_smali_register("p2", 1, 20, 2, true, 22);
        assert_eq!(error.unwrap().code, "PARAMETER_OUT_OF_RANGE");
    }

    #[test]
    fn register_aliasing_and_invalid_registers() {
        let report = validate_smali_snippet("const/4 v1, 0x0", 1, Some(1), false, None).unwrap();
        assert!(!report.is_valid());
        assert_eq!(report.diagnostics[0].code, "REGISTER_ALIASES_PARAMETER");
        assert!(report.diagnostics[0].message.contains("p0 (this)"));

        let report = validate_smali_snippet("const/4 v1, 0x0", 1, Some(2), true, None).unwrap();
        assert_eq!(report.diagnostics[0].code, "REGISTER_ALIASES_PARAMETER");
        assert!(report.diagnostics[0].message.contains("p0"));

        assert!(
            validate_smali_snippet("const/4 v0, 0x0", 1, Some(2), false, None)
                .unwrap()
                .is_valid()
        );
        assert_eq!(
            parse_smali_register("v99", 1, 1, 0, true, 1)
                .1
                .unwrap()
                .code,
            "REGISTER_OUT_OF_RANGE"
        );
        assert_eq!(
            parse_smali_register("vfoo", 1, 1, 0, true, 1)
                .1
                .unwrap()
                .code,
            "INVALID_REGISTER_SYNTAX"
        );
        assert!(parse_smali_register("sp", 1, 1, 0, true, 1).0.is_none());
        assert!(parse_smali_register("sp", 1, 1, 0, true, 1).1.is_none());
    }

    #[test]
    fn format_22c_overflow_remediation() {
        let report = validate_smali_snippet(
            "instance-of v0, p1, Lcom/example/Target;",
            20,
            Some(2),
            false,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        let errors: Vec<_> = report
            .diagnostics
            .iter()
            .filter(|diagnostic| diagnostic.severity == Severity::Error)
            .collect();
        assert_eq!(errors.len(), 1);
        assert_eq!(errors[0].code, "FORMAT_22C_REGISTER_OVERFLOW");
        assert!(errors[0].message.contains("p1"));
        assert!(errors[0].message.contains("v21"));
        assert!(errors[0].message.contains("move-object/from16"));
    }

    #[test]
    fn format_21c_and_const_ranges() {
        assert!(validate_smali_snippet(
            "check-cast v10, Lcom/example/Target;",
            15,
            Some(0),
            true,
            None
        )
        .unwrap()
        .is_valid());
        for literal in ["7", "-8"] {
            assert!(validate_smali_snippet(
                &format!("const/4 v0, {literal}"),
                5,
                Some(0),
                true,
                None
            )
            .unwrap()
            .is_valid());
        }
        let report = validate_smali_snippet("const/4 v0, 8", 5, Some(0), true, None).unwrap();
        assert!(!report.is_valid());
        assert_eq!(report.diagnostics[0].code, "CONST4_LITERAL_OUT_OF_RANGE");
        assert!(report.diagnostics[0].message.contains("const/16"));

        let report = validate_smali_snippet("const/16 v0, 32768", 5, Some(0), true, None).unwrap();
        assert_eq!(report.diagnostics[0].code, "CONST16_LITERAL_OUT_OF_RANGE");
    }

    #[test]
    fn invoke_35c_register_overflow() {
        let report = validate_smali_snippet(
            "invoke-virtual {v16}, Lcom/example/Target;->foo()V",
            20,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert_eq!(report.diagnostics[0].code, "INVOKE_35C_REGISTER_OVERFLOW");
        assert!(report.diagnostics[0]
            .message
            .contains("invoke-virtual/range"));
    }

    #[test]
    fn move_result_sequencing() {
        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;\nconst/4 v0, 0x0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(warnings(&report).contains(&"MISSING_MOVE_RESULT"));

        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;\nmove-result-object v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!warnings(&report).contains(&"MISSING_MOVE_RESULT"));

        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;\n.line 10\nmove-result-object v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!codes(&report).contains(&"ORPHAN_MOVE_RESULT"));
        assert!(!codes(&report).contains(&"MISSING_MOVE_RESULT"));
        assert!(report.is_valid());

        let report = validate_smali_snippet(
            "const/4 v0, 0x0\nmove-result-object v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert!(codes(&report).contains(&"ORPHAN_MOVE_RESULT"));
    }

    #[test]
    fn move_result_return_type_and_filled_array_rules() {
        let report = validate_smali_snippet(
            "invoke-custom {v0}, myCallSite()I, Lbsm;->metafactory()Ljava/lang/invoke/CallSite;\n\
             move-result v0\n\
             invoke-polymorphic {v0}, Ljava/lang/invoke/MethodHandle;->invoke([Ljava/lang/Object;)Ljava/lang/Object;, (I)Ljava/lang/String;\n\
             move-result-object v0\n\
             invoke-custom/range {v0 .. v0}, makeConcat()J, Lbsm;->bsm()Ljava/lang/invoke/CallSite;\n\
             move-result-wide v0\n",
            2,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!codes(&report).contains(&"ORPHAN_MOVE_RESULT"));
        assert!(!codes(&report).contains(&"INVALID_MOVE_RESULT"));

        let report = validate_smali_snippet(
            "invoke-custom {v0}, call_site_0(\"name\", ()I)@Ljava/lang/invoke/LambdaMetafactory;->metafactory(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;\nmove-result v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!codes(&report).contains(&"ORPHAN_MOVE_RESULT"));
        assert!(!codes(&report).contains(&"INVALID_MOVE_RESULT"));
        assert!(report.is_valid());

        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Target;->foo()V\nmove-result v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert!(report
            .diagnostics
            .iter()
            .any(|diagnostic| diagnostic.code == "INVALID_MOVE_RESULT"
                && diagnostic.message.contains("void")));

        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Target;->getCount()I\nmove-result-object v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert!(report
            .diagnostics
            .iter()
            .any(|diagnostic| diagnostic.code == "INVALID_MOVE_RESULT"));

        let report = validate_smali_snippet(
            "filled-new-array {v0}, [I\nmove-result-object v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!codes(&report).contains(&"INVALID_MOVE_RESULT"));
        let report = validate_smali_snippet(
            "filled-new-array {v0}, [I\nmove-result v0\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert!(report
            .diagnostics
            .iter()
            .any(|diagnostic| diagnostic.code == "INVALID_MOVE_RESULT"
                && diagnostic.message.contains("move-result-object")));
    }

    #[test]
    fn labels_and_branches() {
        let report = validate_smali_snippet("goto :undefined", 1, Some(0), true, None).unwrap();
        assert!(!report.is_valid());
        assert_eq!(report.diagnostics[0].code, "MISSING_BRANCH_TARGET");

        let report = validate_smali_snippet(
            ":my_label\nconst/4 v0, 1\n:my_label\nreturn-void\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(!report.is_valid());
        assert_eq!(report.diagnostics[0].code, "DUPLICATE_LABEL");

        let report = validate_smali_snippet(
            "    :again\n    const/4 v0, 0\n    goto :again\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(report.is_valid());
        assert!(!codes(&report).contains(&"MISSING_BRANCH_TARGET"));
    }

    #[test]
    fn cfg_unreachable_backward_and_closed_cycle() {
        let report = validate_smali_snippet(
            "goto :end\nconst/4 v0, 1\n:end\nif-eqz v0, :end\nreturn-void\n",
            2,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(report.is_valid());
        let warning_codes = warnings(&report);
        assert!(warning_codes.contains(&"UNREACHABLE_CODE"));
        assert!(warning_codes.contains(&"BACKWARD_BRANCH"));

        let report = validate_smali_snippet(
            ":loop\nadd-int/lit8 v0, v0, 1\ngoto :loop\n",
            2,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert!(report.is_valid());
        assert!(warnings(&report).contains(&"POSSIBLE_CLOSED_CYCLE"));
    }

    #[test]
    fn comments_directives_and_wide_descriptors() {
        assert_eq!(
            strip_smali_comment("const-string v0, \"Hello # world, test\" # real comment"),
            "const-string v0, \"Hello # world, test\""
        );
        assert!(validate_smali_snippet(
            "const-string v0, \"Hello # world\" # comment",
            1,
            Some(0),
            true,
            None
        )
        .unwrap()
        .is_valid());
        assert!(
            !validate_smali_snippet(".method public x()V", 1, Some(0), true, None)
                .unwrap()
                .is_valid()
        );

        let report =
            validate_smali_snippet("\nmove-wide/from16 v0, p1\n", 2, None, true, Some("(IJ)V"))
                .unwrap();
        assert!(report.is_valid());
        assert_eq!(report.params_count, 3);
        assert_eq!(report.total_registers, 5);
        assert_eq!(report.parameter_types, "IJ");
    }

    #[test]
    fn descriptor_validation_and_parameter_widths() {
        assert!(validate_smali_snippet("return-void", 0, None, true, Some("(I)")).is_err());
        assert!(validate_smali_snippet("return-void", 0, None, true, Some("(I)V extra")).is_err());
        assert!(validate_smali_snippet("return-void", 0, None, true, Some("(I)VX")).is_err());
        assert!(validate_smali_snippet("return-void", 0, None, true, Some("")).is_err());

        let report = validate_smali_snippet("return-void", 0, None, true, Some("()V")).unwrap();
        assert!(report.is_valid());
        let report = validate_smali_snippet(
            "return-void",
            0,
            None,
            true,
            Some("(ILjava/lang/String;)[I"),
        )
        .unwrap();
        assert!(report.is_valid());
        assert_eq!(report.params_count, 2);

        let (params, widths) = parse_method_descriptor_params("(IJLjava/lang/String;D)V").unwrap();
        assert_eq!(params, "IJLjava/lang/String;D");
        assert_eq!(widths, vec![1, 2, 1, 2]);
        let (_, widths) = parse_method_descriptor_params("([J[[D)V").unwrap();
        assert_eq!(widths, vec![1, 1]);
    }

    #[test]
    fn assembler_command_and_diagnostics() {
        let command = SmaliAssemblerCommand::new(
            "const/4 v0, 1\nbad_opcode\n",
            1,
            "",
            true,
            Path::new("/tmp/Synthetic.smali"),
            Path::new("/tmp/classes.dex"),
        );
        assert_eq!(command.program, "smali");
        assert_eq!(command.header_line_count, 4);
        assert_eq!(
            command.args,
            vec!["assemble", "/tmp/Synthetic.smali", "-o", "/tmp/classes.dex"]
        );
        assert!(command
            .source
            .contains(".method public static testMethod()V"));
        assert!(command.source.ends_with("    return-void\n.end method"));

        let diagnostics = command.diagnostics(
            "Synthetic.smali:[6,4] Invalid instruction 'bad_opcode'\n",
            "",
            Some(1),
        );
        assert_eq!(diagnostics.len(), 1);
        assert_eq!(diagnostics[0].line, 2);
        assert_eq!(diagnostics[0].code, "ASSEMBLER_SYNTAX_ERROR");
        assert!(diagnostics[0].message.contains("bad_opcode"));

        let diagnostics =
            command.diagnostics("FATAL: Out of memory during assembly\n", "", Some(1));
        assert_eq!(diagnostics.len(), 1);
        assert_eq!(diagnostics[0].line, 1);
        assert_eq!(diagnostics[0].code, "ASSEMBLER_ERROR");
        assert!(diagnostics[0].message.contains("Out of memory"));
    }

    #[test]
    fn human_formatting_matches_oracle() {
        let report = validate_smali_snippet("goto :undefined", 1, Some(0), true, None).unwrap();
        assert!(report
            .format_human()
            .starts_with("Validation failed with 1 error(s) and 0 warning(s):"));
        let report = validate_smali_snippet("const/4 v0, 0", 1, Some(0), true, None).unwrap();
        assert_eq!(
            report.format_human(),
            "Validation succeeded with 0 errors and 0 warnings."
        );
        let report = validate_smali_snippet(
            "invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;\nreturn-void\n",
            1,
            Some(0),
            true,
            None,
        )
        .unwrap();
        assert_eq!(
            report.format_human().lines().next().unwrap(),
            "Validation succeeded with 1 warning(s):"
        );
    }

    #[test]
    fn python_splitlines_matches_oracle_cases() {
        assert_eq!(python_splitlines(""), Vec::<&str>::new());
        assert_eq!(python_splitlines("a\n"), vec!["a"]);
        assert_eq!(python_splitlines("a\n\n"), vec!["a", ""]);
        assert_eq!(python_splitlines("\n"), vec![""]);
        assert_eq!(python_splitlines("a\r\nb"), vec!["a", "b"]);
        assert_eq!(python_splitlines("a\rb"), vec!["a", "b"]);
        assert_eq!(python_splitlines("a\u{2028}b"), vec!["a", "b"]);
        assert_eq!(python_splitlines("a\u{0b}b"), vec!["a", "b"]);
    }

    #[test]
    fn deterministic_malformed_snippets_never_panic() {
        let mut state = 0x5A11_u64;
        let alphabet = [
            'v', 'p', ':', ',', '{', '}', '#', '"', '\\', '\n', ' ', '0', '9', 'm', 'o', 'e', '.',
            'L', ';', '[', 'I', 'J', 'D', 'V', '(', ')',
        ];
        for _ in 0..256 {
            let mut snippet = String::new();
            let length = (state % 96) as usize;
            for _ in 0..length {
                state = state
                    .wrapping_mul(6_364_136_223_846_793_005)
                    .wrapping_add(1);
                let index = (state >> 33) as usize % alphabet.len();
                snippet.push(alphabet[index]);
            }
            let locals = (state % 40) as usize;
            let params = (state % 8) as usize;
            let is_static = state.is_multiple_of(2);
            let _ = validate_smali_snippet(&snippet, locals, Some(params), is_static, None);
            if let Ok(report) =
                validate_smali_snippet(&snippet, locals, Some(params), is_static, None)
            {
                let _ = report.format_human();
            }
        }
    }
}
