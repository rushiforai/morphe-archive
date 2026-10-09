from __future__ import annotations

import re

# Minimum and maximum signed 26-bit immediate branch deltas (+/- 128 MB)
MIN_BRANCH_DELTA = -134217728
MAX_BRANCH_DELTA = 134217724


def parse_register_number(reg_str: str, expected_type: str = "x") -> int:
    """Parses an ARM64 register name and returns its 0-31 index.

    Supports x0-x30, lr (x30), w0-w30, xzr/wzr (31).
    """
    cleaned = reg_str.strip().lower()
    if cleaned == "xzr":
        rtype = "x"
        rnum = 31
    elif cleaned == "wzr":
        rtype = "w"
        rnum = 31
    elif cleaned == "lr":
        rtype = "x"
        rnum = 30
    else:
        match = re.match(r"^([xw])(\d+)$", cleaned)
        if not match:
            raise ValueError(f"Invalid ARM64 register name: '{reg_str}'")

        rtype, rnum_str = match.groups()
        rnum = int(rnum_str)
        if not (0 <= rnum <= 30):
            raise ValueError(f"Register number out of range (0-30): '{reg_str}'")

    if expected_type in ("x", "w") and rtype != expected_type:
        raise ValueError(
            f"Register width mismatch: expected '{expected_type}', got '{rtype}' for '{reg_str}'"
        )

    return rnum


def encode_branch(mnemonic: str, pc: int, target: int) -> int:
    """Encodes an ARM64 unconditional branch (`b`) or branch with link (`bl`).

    Both `pc` and `target` must be 4-byte aligned. The branch delta must fit
    within a 26-bit signed immediate (shifted by 2), spanning +/-128 MB.
    """
    mnemonic_lower = mnemonic.strip().lower()
    if mnemonic_lower not in ("b", "bl"):
        raise ValueError(
            f"Unsupported branch mnemonic: '{mnemonic}' (must be 'b' or 'bl')"
        )

    if pc % 4 != 0:
        raise ValueError(f"Program counter pc (0x{pc:x}) must be 4-byte aligned")
    if target % 4 != 0:
        raise ValueError(f"Target address (0x{target:x}) must be 4-byte aligned")

    delta = target - pc
    if not (MIN_BRANCH_DELTA <= delta <= MAX_BRANCH_DELTA):
        raise ValueError(
            f"Branch delta {delta} bytes (from 0x{pc:x} to 0x{target:x}) "
            f"exceeds ARM64 26-bit range [{MIN_BRANCH_DELTA}, {MAX_BRANCH_DELTA}]"
        )

    imm26 = (delta >> 2) & 0x03FFFFFF
    if mnemonic_lower == "b":
        return 0x14000000 | imm26
    else:  # bl
        return 0x94000000 | imm26


def encode_ret(reg: str = "x30") -> int:
    """Encodes an ARM64 return instruction (`ret [reg]`).

    Default register is x30 (lr).
    """
    reg_num = parse_register_number(reg, expected_type="x")
    return 0xD65F0000 | (reg_num << 5)


def encode_mov(dest_reg: str, src: str | int) -> int:
    """Encodes an ARM64 move instruction.

    Supported patterns:
      - mov xN, xzr -> orr xN, xzr, xzr
      - mov wN, wzr -> orr wN, wzr, wzr
      - mov wN, #imm (or movz wN, #imm) for imm in 0..65535
      - mov xN, #imm (or movz xN, #imm) for imm in 0..65535
    """
    dest_cleaned = dest_reg.strip().lower()
    if not dest_cleaned.startswith(("x", "w")):
        raise ValueError(f"Invalid destination register: '{dest_reg}'")

    is_64bit = dest_cleaned.startswith("x")
    dest_num = parse_register_number(dest_cleaned, expected_type="any")

    if isinstance(src, str):
        src_cleaned = src.strip().lower()
        if src_cleaned.startswith("#"):
            imm_val = int(src_cleaned[1:], 0)
            return _encode_mov_immediate(dest_num, imm_val, is_64bit)
        if src_cleaned in ("xzr", "wzr"):
            if is_64bit:
                return 0xAA1F03E0 | dest_num
            else:
                return 0x2A1F03E0 | dest_num
        # Check if src is numeric string like "0x1" or "42"
        try:
            imm_val = int(src_cleaned, 0)
        except ValueError:
            raise ValueError(f"Unsupported mov source operand: '{src}'") from None
        return _encode_mov_immediate(dest_num, imm_val, is_64bit)
    elif isinstance(src, int):
        return _encode_mov_immediate(dest_num, src, is_64bit)
    else:
        raise TypeError(f"Unsupported source type: {type(src)}")


def _encode_mov_immediate(dest_num: int, imm_val: int, is_64bit: bool) -> int:
    if not (0 <= imm_val <= 0xFFFF):
        raise ValueError(
            f"Immediate value {imm_val} (0x{imm_val:x}) exceeds supported range [0, 65535]"
        )
    if is_64bit:
        return 0xD2800000 | (imm_val << 5) | dest_num
    else:
        return 0x52800000 | (imm_val << 5) | dest_num


def format_kotlin_byte_array(data: bytes) -> str:
    """Formats bytes into Morphe-compatible Kotlin byteArrayOf(...) format."""
    elements = []
    for b in data:
        if b > 127:
            elements.append(f"0x{b:02x}.toByte()")
        else:
            elements.append(f"0x{b:02x}")
    return f"byteArrayOf({', '.join(elements)})"


def format_instruction(opcode: int, fmt: str = "hex") -> str:
    """Formats a 32-bit unsigned ARM64 instruction opcode according to requested format.

    Supported formats:
      - 'hex': Space-separated lowercase hex bytes in little-endian order ('7f 25 73 94')
      - 'kotlin': Kotlin byteArrayOf(...) with .toByte() suffix for bytes > 127
      - 'int': Hex string of 32-bit opcode ('0x9473257f')
      - 'bytes': Python bytes repr or raw 4 bytes
    """
    raw_bytes = opcode.to_bytes(4, "little")
    fmt_lower = fmt.strip().lower()

    if fmt_lower == "hex":
        return " ".join(f"{b:02x}" for b in raw_bytes)
    elif fmt_lower == "kotlin":
        return format_kotlin_byte_array(raw_bytes)
    elif fmt_lower == "int":
        return f"0x{opcode:08x}"
    elif fmt_lower == "bytes":
        return repr(raw_bytes)
    elif fmt_lower == "raw":
        return " ".join(f"{b:02x}" for b in raw_bytes)
    else:
        raise ValueError(f"Unsupported output format: '{fmt}'")


def assemble_statement(
    statement: str, pc: int = 0, explicit_target: int | None = None
) -> int:
    """Parses a single ARM64 assembly statement string and encodes it to a 32-bit opcode."""
    stmt = statement.strip()
    if not stmt:
        raise ValueError("Empty assembly statement")

    # Split mnemonic from operands
    parts = stmt.split(maxsplit=1)
    mnemonic = parts[0].lower()
    operands = parts[1].strip() if len(parts) > 1 else ""

    if mnemonic in ("b", "bl"):
        if explicit_target is not None:
            target = explicit_target
        elif operands:
            target = int(operands, 0)
        else:
            raise ValueError(
                f"Branch instruction '{mnemonic}' requires a target address"
            )
        return encode_branch(mnemonic, pc, target)

    elif mnemonic == "ret":
        reg = operands if operands else "x30"
        return encode_ret(reg)

    elif mnemonic in ("mov", "movz"):
        if not operands:
            raise ValueError(f"'{mnemonic}' requires operands: '<dest>, <src>'")
        op_parts = [p.strip() for p in operands.split(",", 1)]
        if len(op_parts) != 2:
            raise ValueError(
                f"'{mnemonic}' requires two comma-separated operands: '<dest>, <src>'"
            )
        dest, src = op_parts
        return encode_mov(dest, src)

    else:
        raise ValueError(f"Unsupported mnemonic: '{mnemonic}'")
