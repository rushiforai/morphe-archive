//! ARM64 instruction encoding and formatting.
//!
//! This ports the retired Python implementation's behavior: the same accepted
//! mnemonics, signed 26-bit branch bounds, alignment checks, register aliases,
//! and output formats. Every arithmetic operation that can overflow is checked
//! or performed in a widened type; malformed input becomes an [`Error`].

use crate::error::Error;

/// Minimum signed 26-bit branch delta, in bytes.
pub const MIN_BRANCH_DELTA: i64 = -134_217_728;
/// Maximum signed 26-bit branch delta, in bytes.
pub const MAX_BRANCH_DELTA: i64 = 134_217_724;

/// Source operand for [`encode_mov`].
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MovSource<'a> {
    /// A textual operand: a register name, `#imm`, or plain integer text.
    Text(&'a str),
    /// An already-parsed integer immediate.
    Immediate(i64),
}

impl<'a> From<&'a str> for MovSource<'a> {
    fn from(value: &'a str) -> Self {
        Self::Text(value)
    }
}

impl From<i64> for MovSource<'_> {
    fn from(value: i64) -> Self {
        Self::Immediate(value)
    }
}

impl From<i32> for MovSource<'_> {
    fn from(value: i32) -> Self {
        Self::Immediate(i64::from(value))
    }
}

/// Result of parsing a base-0 integer literal.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum ParsedInteger {
    Value(i128),
    Overflow,
}

/// Parses a register name (`x0`-`x30`, `w0`-`w30`, `xzr`, `wzr`, `lr`) and
/// returns its index. `expected_type` is `"x"`, `"w"`, or anything else for a
/// width-agnostic lookup, matching the Python oracle.
pub fn parse_register_number(reg_str: &str, expected_type: &str) -> Result<u8, Error> {
    let cleaned = reg_str.trim().to_lowercase();
    let (rtype, rnum) = if cleaned == "xzr" {
        ('x', 31_u16)
    } else if cleaned == "wzr" {
        ('w', 31_u16)
    } else if cleaned == "lr" {
        ('x', 30_u16)
    } else {
        let rest = match cleaned
            .strip_prefix('x')
            .or_else(|| cleaned.strip_prefix('w'))
        {
            Some(rest) => rest,
            None => {
                return Err(Error::usage(format!(
                    "Invalid ARM64 register name: '{reg_str}'"
                )))
            }
        };
        let rtype = if cleaned.starts_with('x') { 'x' } else { 'w' };
        let number = match parse_ascii_unsigned_decimal(rest) {
            Some(number) => number,
            None => {
                return Err(Error::usage(format!(
                    "Invalid ARM64 register name: '{reg_str}'"
                )))
            }
        };
        if number > u16::MAX as u128 {
            return Err(Error::usage(format!(
                "Register number out of range (0-30): '{reg_str}'"
            )));
        }
        let number = number as u16;
        if number > 30 {
            return Err(Error::usage(format!(
                "Register number out of range (0-30): '{reg_str}'"
            )));
        }
        (rtype, number)
    };

    if (expected_type == "x" || expected_type == "w") && rtype.to_string() != expected_type {
        return Err(Error::usage(format!(
            "Register width mismatch: expected '{expected_type}', got '{rtype}' for '{reg_str}'"
        )));
    }

    Ok(rnum as u8)
}

/// Encodes an unconditional branch (`b`) or branch with link (`bl`).
///
/// Both addresses must be 4-byte aligned and the delta must fit a signed
/// 26-bit immediate shifted by two, i.e. `[-128 MiB, +128 MiB - 4]`.
pub fn encode_branch(mnemonic: &str, pc: i64, target: i64) -> Result<u32, Error> {
    let mnemonic_lower = mnemonic.trim().to_lowercase();
    if mnemonic_lower != "b" && mnemonic_lower != "bl" {
        return Err(Error::usage(format!(
            "Unsupported branch mnemonic: '{mnemonic}' (must be 'b' or 'bl')"
        )));
    }

    if pc % 4 != 0 {
        return Err(Error::usage(format!(
            "Program counter pc (0x{pc:x}) must be 4-byte aligned"
        )));
    }
    if target % 4 != 0 {
        return Err(Error::usage(format!(
            "Target address (0x{target:x}) must be 4-byte aligned"
        )));
    }

    let delta = (target as i128) - (pc as i128);
    if delta < MIN_BRANCH_DELTA as i128 || delta > MAX_BRANCH_DELTA as i128 {
        return Err(Error::usage(format!(
            "Branch delta {delta} bytes (from 0x{pc:x} to 0x{target:x}) \
             exceeds ARM64 26-bit range [{MIN_BRANCH_DELTA}, {MAX_BRANCH_DELTA}]"
        )));
    }

    // `delta` is within a 28-bit range, so the shift cannot overflow.
    let imm26 = ((delta >> 2) & 0x03FF_FFFF) as u32;
    Ok(if mnemonic_lower == "b" {
        0x1400_0000 | imm26
    } else {
        0x9400_0000 | imm26
    })
}

/// Encodes `ret [reg]`; the default register is `x30` (`lr`).
pub fn encode_ret(reg: &str) -> Result<u32, Error> {
    let reg_num = parse_register_number(reg, "x")?;
    Ok(0xD65F_0000 | (u32::from(reg_num) << 5))
}

/// Encodes a supported `mov`/`movz` form.
pub fn encode_mov<'a, S>(dest_reg: &str, src: S) -> Result<u32, Error>
where
    S: Into<MovSource<'a>>,
{
    let dest_cleaned = dest_reg.trim().to_lowercase();
    if !(dest_cleaned.starts_with('x') || dest_cleaned.starts_with('w')) {
        return Err(Error::usage(format!(
            "Invalid destination register: '{dest_reg}'"
        )));
    }

    let is_64bit = dest_cleaned.starts_with('x');
    let dest_num = parse_register_number(&dest_cleaned, "any")?;

    match src.into() {
        MovSource::Text(src) => {
            let src_cleaned = src.trim().to_lowercase();
            if let Some(rest) = src_cleaned.strip_prefix('#') {
                let imm_val = parse_base0_or_error(rest)?;
                return encode_mov_immediate(dest_num, imm_val, is_64bit);
            }
            if src_cleaned == "xzr" || src_cleaned == "wzr" {
                return Ok(if is_64bit {
                    0xAA1F_03E0 | u32::from(dest_num)
                } else {
                    0x2A1F_03E0 | u32::from(dest_num)
                });
            }
            match parse_base0(&src_cleaned) {
                Ok(parsed) => encode_mov_immediate(dest_num, parsed, is_64bit),
                Err(()) => Err(Error::usage(format!(
                    "Unsupported mov source operand: '{src}'"
                ))),
            }
        }
        MovSource::Immediate(value) => {
            encode_mov_immediate(dest_num, ParsedInteger::Value(i128::from(value)), is_64bit)
        }
    }
}

fn encode_mov_immediate(
    dest_num: u8,
    imm_val: ParsedInteger,
    is_64bit: bool,
) -> Result<u32, Error> {
    let imm_val = match imm_val {
        ParsedInteger::Value(value) => value,
        ParsedInteger::Overflow => {
            return Err(Error::usage(
                "Immediate value exceeds supported range [0, 65535]".to_string(),
            ))
        }
    };
    if !(0..=0xFFFF).contains(&imm_val) {
        return Err(Error::usage(format!(
            "Immediate value {imm_val} (0x{imm_val:x}) exceeds supported range [0, 65535]"
        )));
    }
    let imm = (imm_val as u32) << 5;
    Ok(if is_64bit {
        0xD280_0000 | imm | u32::from(dest_num)
    } else {
        0x5280_0000 | imm | u32::from(dest_num)
    })
}

/// Formats bytes as a Morphe-compatible Kotlin `byteArrayOf(...)` literal.
pub fn format_kotlin_byte_array(data: &[u8]) -> String {
    let mut elements = Vec::with_capacity(data.len());
    for &byte in data {
        if byte > 127 {
            elements.push(format!("0x{byte:02x}.toByte()"));
        } else {
            elements.push(format!("0x{byte:02x}"));
        }
    }
    format!("byteArrayOf({})", elements.join(", "))
}

/// Formats a 32-bit instruction in the requested output representation.
pub fn format_instruction(opcode: u32, fmt: &str) -> Result<String, Error> {
    let raw_bytes = opcode.to_le_bytes();
    match fmt.trim().to_lowercase().as_str() {
        "hex" => Ok(raw_bytes
            .iter()
            .map(|byte| format!("{byte:02x}"))
            .collect::<Vec<_>>()
            .join(" ")),
        "kotlin" => Ok(format_kotlin_byte_array(&raw_bytes)),
        "int" => Ok(format!("0x{opcode:08x}")),
        "bytes" => Ok(python_bytes_repr(&raw_bytes)),
        "raw" => Ok(raw_bytes
            .iter()
            .map(|byte| format!("{byte:02x}"))
            .collect::<Vec<_>>()
            .join(" ")),
        _ => Err(Error::usage(format!("Unsupported output format: '{fmt}'"))),
    }
}

/// Reproduces CPython's `repr(bytes)` quoting and escapes.
fn python_bytes_repr(data: &[u8]) -> String {
    let has_single = data.contains(&b'\'');
    let has_double = data.contains(&b'"');
    let quote = if has_single && !has_double {
        b'"'
    } else {
        b'\''
    };

    let mut out = String::with_capacity(data.len() + 3);
    out.push('b');
    out.push(char::from(quote));
    for &byte in data {
        if byte == quote || byte == b'\\' {
            out.push('\\');
            out.push(char::from(byte));
        } else if byte == b'\t' {
            out.push_str("\\t");
        } else if byte == b'\n' {
            out.push_str("\\n");
        } else if byte == b'\r' {
            out.push_str("\\r");
        } else if (0x20..=0x7E).contains(&byte) {
            out.push(char::from(byte));
        } else {
            out.push_str(&format!("\\x{byte:02x}"));
        }
    }
    out.push(char::from(quote));
    out
}

/// Parses and encodes one assembly statement.
pub fn assemble_statement(
    statement: &str,
    pc: i64,
    explicit_target: Option<i64>,
) -> Result<u32, Error> {
    let stmt = statement.trim();
    if stmt.is_empty() {
        return Err(Error::usage("Empty assembly statement"));
    }

    let (mnemonic, operands) = match split_once_python_whitespace(stmt) {
        Some((mnemonic, rest)) => (mnemonic.to_lowercase(), rest.trim()),
        None => (stmt.to_lowercase(), ""),
    };

    match mnemonic.as_str() {
        "b" | "bl" => {
            let target = if let Some(target) = explicit_target {
                target
            } else if !operands.is_empty() {
                match parse_base0(operands) {
                    Ok(ParsedInteger::Value(value)) => i64::try_from(value)
                        .map_err(|_| Error::usage("Branch target out of range"))?,
                    Ok(ParsedInteger::Overflow) => {
                        return Err(Error::usage("Branch target out of range"))
                    }
                    Err(()) => {
                        return Err(Error::usage(format!(
                            "invalid literal for int() with base 0: '{operands}'"
                        )))
                    }
                }
            } else {
                return Err(Error::usage(format!(
                    "Branch instruction '{mnemonic}' requires a target address"
                )));
            };
            encode_branch(&mnemonic, pc, target)
        }
        "ret" => {
            let reg = if operands.is_empty() { "x30" } else { operands };
            encode_ret(reg)
        }
        "mov" | "movz" => {
            if operands.is_empty() {
                return Err(Error::usage(format!(
                    "'{mnemonic}' requires operands: '<dest>, <src>'"
                )));
            }
            let (dest, src) = match operands.split_once(',') {
                Some(parts) => parts,
                None => {
                    return Err(Error::usage(format!(
                        "'{mnemonic}' requires two comma-separated operands: '<dest>, <src>'"
                    )))
                }
            };
            encode_mov(dest.trim(), MovSource::Text(src.trim()))
        }
        _ => Err(Error::usage(format!("Unsupported mnemonic: '{mnemonic}'"))),
    }
}

/// Splits on the first run of Python whitespace, matching `str.split(None, 1)`.
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

fn is_python_space(ch: char) -> bool {
    ch.is_whitespace() || matches!(ch, '\u{1c}'..='\u{1f}')
}

fn parse_base0_or_error(text: &str) -> Result<ParsedInteger, Error> {
    parse_base0(text.trim()).map_err(|()| {
        Error::usage(format!(
            "invalid literal for int() with base 0: '{}'",
            text.trim()
        ))
    })
}

/// Parses an integer the way Python's `int(text, 0)` does: optional sign,
/// `0x`/`0o`/`0b` prefixes, underscores between digits, and no leading zeroes
/// in the decimal form.
pub(crate) fn parse_base0(text: &str) -> Result<ParsedInteger, ()> {
    let text = text.trim();
    if text.is_empty() {
        return Err(());
    }
    let bytes = text.as_bytes();
    let (negative, rest) = match bytes[0] {
        b'+' => (false, &text[1..]),
        b'-' => (true, &text[1..]),
        _ => (false, text),
    };
    if rest.is_empty() {
        return Err(());
    }

    let (radix, digits, explicit_prefix) =
        if let Some(after) = rest.strip_prefix("0x").or_else(|| rest.strip_prefix("0X")) {
            (16, after, true)
        } else if let Some(after) = rest.strip_prefix("0o").or_else(|| rest.strip_prefix("0O")) {
            (8, after, true)
        } else if let Some(after) = rest.strip_prefix("0b").or_else(|| rest.strip_prefix("0B")) {
            (2, after, true)
        } else {
            (10, rest, false)
        };

    if digits.is_empty() {
        return Err(());
    }
    if !explicit_prefix && digits.len() > 1 && digits.starts_with('0') {
        return Err(());
    }

    let mut value: u128 = 0;
    let mut overflow = false;
    let mut previous_was_digit = false;
    for (index, ch) in digits.char_indices() {
        if ch == '_' {
            // Underscores are only valid between two digits.
            if !previous_was_digit || index + 1 == digits.len() {
                return Err(());
            }
            previous_was_digit = false;
            continue;
        }
        let digit = ch.to_digit(radix).ok_or(())?;
        previous_was_digit = true;
        if let Some(next) = value
            .checked_mul(u128::from(radix))
            .and_then(|value| value.checked_add(u128::from(digit)))
        {
            value = next;
        } else {
            overflow = true;
        }
    }
    if !previous_was_digit {
        return Err(());
    }
    if overflow || value > i128::MAX as u128 {
        return Ok(ParsedInteger::Overflow);
    }
    let signed = i128::try_from(value).map_err(|_| ())?;
    Ok(ParsedInteger::Value(if negative {
        -signed
    } else {
        signed
    }))
}

/// Parses the numeric suffix of `xN`/`wN`. Python's `^([xw])(\d+)$` allows no
/// sign, whitespace, or underscores; overflow is reported separately so the
/// caller can emit the same out-of-range message.
fn parse_ascii_unsigned_decimal(text: &str) -> Option<u128> {
    if text.is_empty() {
        return None;
    }
    let mut value: u128 = 0;
    for ch in text.chars() {
        let digit = ch.to_digit(10)?;
        value = value.checked_mul(10)?.checked_add(u128::from(digit))?;
    }
    Some(value)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn branch_forward_and_backward() {
        assert_eq!(encode_branch("b", 0x1000, 0x2000).unwrap(), 0x1400_0400);
        assert_eq!(encode_branch("bl", 0x1000, 0x2000).unwrap(), 0x9400_0400);
        assert_eq!(
            encode_branch("b", 0x2000, 0x1000).unwrap(),
            0x1400_0000 | ((-1024_i32) & 0x03FF_FFFF) as u32
        );
        assert_eq!(
            encode_branch("bl", 0x2000, 0x1000).unwrap(),
            0x9400_0000 | ((-1024_i32) & 0x03FF_FFFF) as u32
        );
        assert_eq!(
            encode_branch("bl", 0x1FCF6E8, 0x3C98CE4).unwrap(),
            0x9473_257F
        );
    }

    #[test]
    fn branch_signed_boundaries_are_inclusive() {
        assert_eq!(
            encode_branch("b", 0, MAX_BRANCH_DELTA).unwrap(),
            0x1400_0000 | ((MAX_BRANCH_DELTA >> 2) as u32 & 0x03FF_FFFF)
        );
        assert_eq!(
            encode_branch("b", 0x1000_0000, 0x1000_0000 + MIN_BRANCH_DELTA).unwrap(),
            0x1400_0000 | ((MIN_BRANCH_DELTA >> 2) as u32 & 0x03FF_FFFF)
        );
        assert!(encode_branch("b", 0, MAX_BRANCH_DELTA + 4).is_err());
        assert!(encode_branch("b", 0x1000_0000, 0x1000_0000 + MIN_BRANCH_DELTA - 4).is_err());
    }

    #[test]
    fn branch_alignment_and_mnemonic_errors() {
        assert!(encode_branch("b", 1, 0x1000)
            .unwrap_err()
            .to_string()
            .contains("must be 4-byte aligned"));
        assert!(encode_branch("b", 0x1000, 3)
            .unwrap_err()
            .to_string()
            .contains("must be 4-byte aligned"));
        assert!(encode_branch("bx", 0, 4).is_err());
    }

    #[test]
    fn register_parsing_matches_python_rules() {
        assert_eq!(parse_register_number("x0", "x").unwrap(), 0);
        assert_eq!(parse_register_number("x30", "x").unwrap(), 30);
        assert_eq!(parse_register_number("lr", "x").unwrap(), 30);
        assert_eq!(parse_register_number("XZR", "x").unwrap(), 31);
        assert_eq!(parse_register_number("w30", "w").unwrap(), 30);
        assert_eq!(parse_register_number("wzr", "w").unwrap(), 31);
        assert_eq!(parse_register_number("x5", "any").unwrap(), 5);
        assert_eq!(parse_register_number("w5", "any").unwrap(), 5);

        assert!(parse_register_number("w0", "x").is_err());
        assert!(parse_register_number("x0", "w").is_err());
        assert!(parse_register_number("wzr", "x").is_err());
        assert!(parse_register_number("xzr", "w").is_err());
        assert!(parse_register_number("lr", "w").is_err());
        assert!(parse_register_number("sp", "any").is_err());
        assert!(parse_register_number("x31", "x").is_err());
        assert!(parse_register_number("x", "x").is_err());
    }

    #[test]
    fn ret_and_mov_encodings() {
        assert_eq!(encode_ret("x30").unwrap(), 0xD65F_03C0);
        assert_eq!(encode_ret("lr").unwrap(), 0xD65F_03C0);
        assert_eq!(encode_ret("x0").unwrap(), 0xD65F_0000);
        assert!(encode_ret("sp").is_err());
        assert!(encode_ret("wzr").is_err());

        assert_eq!(encode_mov("x0", "xzr").unwrap(), 0xAA1F_03E0);
        assert_eq!(encode_mov("w0", "wzr").unwrap(), 0x2A1F_03E0);
        assert_eq!(encode_mov("w1", "#1").unwrap(), 0x5280_0021);
        assert_eq!(encode_mov("w1", 1_i32).unwrap(), 0x5280_0021);
        assert_eq!(encode_mov("x2", "#0x10").unwrap(), 0xD280_0202);
        assert_eq!(encode_mov("x2", 0_i64).unwrap(), 0xD280_0002);
        assert!(encode_mov("x0", "malformed").is_err());
        assert!(encode_mov("x0", "65536").is_err());
        assert!(encode_mov("x0", "#65536").is_err());
        assert!(encode_mov("yzr", "xzr").is_err());
    }

    #[test]
    fn mov_source_uses_destination_width_for_zero_registers() {
        // The zero-register ORR form is selected from the destination width.
        assert_eq!(encode_mov("w0", "xzr").unwrap(), 0x2A1F_03E0);
        assert_eq!(encode_mov("w0", "wzr").unwrap(), 0x2A1F_03E0);
        assert_eq!(encode_mov("x0", "wzr").unwrap(), 0xAA1F_03E0);
        assert_eq!(encode_mov("x0", "xzr").unwrap(), 0xAA1F_03E0);
    }

    #[test]
    fn formatting_matches_python() {
        assert_eq!(
            format_instruction(0x9473_257F, "hex").unwrap(),
            "7f 25 73 94"
        );
        assert_eq!(
            format_instruction(0x9473_257F, "int").unwrap(),
            "0x9473257f"
        );
        assert_eq!(
            format_instruction(0xD65F_03C0, "kotlin").unwrap(),
            "byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())"
        );
        assert_eq!(
            format_instruction(0xD65F_03C0, "bytes").unwrap(),
            "b'\\xc0\\x03_\\xd6'"
        );
        assert_eq!(
            format_kotlin_byte_array(&[0x00, 0x7F, 0x80, 0xFF]),
            "byteArrayOf(0x00, 0x7f, 0x80.toByte(), 0xff.toByte())"
        );
        assert!(format_instruction(0, "nope").is_err());
    }

    #[test]
    fn python_bytes_repr_quote_selection() {
        assert_eq!(python_bytes_repr(b"abc'def"), "b\"abc'def\"");
        assert_eq!(python_bytes_repr(b"abc\"def"), "b'abc\"def'");
        assert_eq!(python_bytes_repr(b"a'b\"c"), "b'a\\'b\"c'");
        assert_eq!(
            python_bytes_repr(b"\x00\x0b\x0c\x7f"),
            "b'\\x00\\x0b\\x0c\\x7f'"
        );
    }

    #[test]
    fn assemble_statement_supported_forms_and_errors() {
        assert_eq!(assemble_statement("ret", 0, None).unwrap(), 0xD65F_03C0);
        assert_eq!(
            assemble_statement("mov x0, xzr", 0, None).unwrap(),
            0xAA1F_03E0
        );
        assert_eq!(
            assemble_statement("mov w1, #1", 0, None).unwrap(),
            0x5280_0021
        );
        assert_eq!(
            assemble_statement("bl 0x3c98ce4", 0x1FCF6E8, None).unwrap(),
            0x9473_257F
        );
        assert_eq!(
            assemble_statement("b 0x1000", 0, Some(0x1004)).unwrap(),
            0x1400_0401
        );
        assert!(assemble_statement("", 0, None).is_err());
        assert!(assemble_statement("invalid_instruction_xyz", 0, None).is_err());
        assert!(assemble_statement("b", 0, None).is_err());
        assert!(assemble_statement("mov x0", 0, None).is_err());
        assert!(assemble_statement("mov x0, 65536", 0, None).is_err());
    }

    #[test]
    fn integer_literal_forms_and_rejections() {
        assert_eq!(parse_base0("0").unwrap(), ParsedInteger::Value(0));
        assert_eq!(parse_base0("0x10").unwrap(), ParsedInteger::Value(16));
        assert_eq!(parse_base0("-0x8").unwrap(), ParsedInteger::Value(-8));
        assert_eq!(parse_base0("1_000").unwrap(), ParsedInteger::Value(1000));
        assert!(parse_base0("010").is_err());
        assert!(parse_base0("00").is_err());
        assert!(parse_base0("1__0").is_err());
        assert!(parse_base0("0x").is_err());
        assert!(parse_base0("+").is_err());
        assert_eq!(
            parse_base0("999999999999999999999999999999999999999999").unwrap(),
            ParsedInteger::Overflow
        );
    }

    #[test]
    fn deterministic_malformed_asm_inputs_never_panic() {
        let seed = 0x5EED_u64;
        let mut state = seed;
        for length in 0..64_usize {
            for _ in 0..16 {
                let mut bytes = Vec::with_capacity(length);
                for _ in 0..length {
                    state = state
                        .wrapping_mul(6_364_136_223_846_793_005)
                        .wrapping_add(1);
                    bytes.push((state >> 33) as u8);
                }
                let text = String::from_utf8_lossy(&bytes);
                let _ = assemble_statement(&text, 0, None);
                let _ = format_instruction(state as u32, &text);
                let _ = parse_register_number(&text, "x");
            }
        }
    }
}
