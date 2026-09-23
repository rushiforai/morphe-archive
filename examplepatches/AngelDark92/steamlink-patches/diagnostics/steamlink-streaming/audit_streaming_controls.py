"""Read-only ARM64 ELF evidence for streaming codec and bandwidth research."""

import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("library", type=Path)
    parser.add_argument("--python-tools", type=Path)
    parser.add_argument("--function", default=r"QSVLCodecNDK4Init|GetRequestedConnectionInfo")
    parser.add_argument("--strings", default=r"video/|codec|bitrate|bandwidth|h264|hevc|av1")
    parser.add_argument("--callers", action="store_true")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    sys.path.insert(0, str(args.python_tools or root / "build/oled-native-audit/python"))
    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN
    from elftools.elf.elffile import ELFFile

    data = args.library.read_bytes()
    elf = ELFFile(io.BytesIO(data))
    if elf["e_machine"] != "EM_AARCH64" or not elf.little_endian:
        raise ValueError("Expected little-endian ARM64 ELF")
    segments = [segment for segment in elf.iter_segments() if segment["p_type"] == "PT_LOAD"]

    def file_offset(address, size=1):
        matches = [segment for segment in segments if
                   segment["p_vaddr"] <= address and
                   address + size <= segment["p_vaddr"] + segment["p_filesz"]]
        if len(matches) != 1:
            raise ValueError(f"No unique file mapping for {address:#x}+{size:#x}")
        segment = matches[0]
        return segment["p_offset"] + address - segment["p_vaddr"]

    symbols = list(elf.get_section_by_name(".dynsym").iter_symbols())
    names = {symbol["st_value"]: symbol.name for symbol in symbols if symbol["st_value"]}
    plt = elf.get_section_by_name(".plt")
    relocations = elf.get_section_by_name(".rela.plt")
    if plt is not None and relocations is not None:
        if plt["sh_size"] != 32 + 16 * relocations.num_relocations():
            raise ValueError("Unexpected ARM64 PLT layout")
        linked_symbols = elf.get_section(relocations["sh_link"])
        for index, relocation in enumerate(relocations.iter_relocations()):
            names[plt["sh_addr"] + 32 + index * 16] = (
                linked_symbols.get_symbol(relocation["r_info_sym"]).name + "@plt")
    strings = []
    pattern = re.compile(args.strings, re.IGNORECASE)
    for match in re.finditer(rb"[\x20-\x7e]{4,}\x00", data):
        text = match.group()[:-1].decode("ascii")
        if not pattern.search(text):
            continue
        mappings = [segment for segment in segments if
                    segment["p_offset"] <= match.start() < segment["p_offset"] + segment["p_filesz"]]
        if len(mappings) == 1:
            segment = mappings[0]
            strings.append({"offset": hex(match.start()), "va": hex(
                segment["p_vaddr"] + match.start() - segment["p_offset"]), "text": text})
    disassembler = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
    selected = [symbol for symbol in symbols if symbol["st_size"] and
                symbol["st_info"]["type"] == "STT_FUNC" and re.search(args.function, symbol.name)]
    functions = []
    for symbol in selected:
        address, size = symbol["st_value"], symbol["st_size"]
        offset = file_offset(address, size)
        body = data[offset:offset + size]
        instructions = []
        decoded_size = 0
        previous = None
        for instruction in disassembler.disasm(body, address):
            decoded_size += instruction.size
            target = None
            if instruction.mnemonic in ("b", "bl") and instruction.op_str.startswith("#"):
                target = names.get(int(instruction.op_str[1:], 0))
            operands = instruction.op_str.split(", ")
            if (previous is not None and previous.mnemonic == "adrp" and
                    instruction.mnemonic == "add" and len(operands) == 3):
                page_operands = previous.op_str.split(", ")
                if (operands[1] == page_operands[0] and operands[2].startswith("#") and
                        page_operands[1].startswith("#")):
                    reference = int(page_operands[1][1:], 0) + int(operands[2][1:], 0)
                    target = f"address {reference:#x}"
                    try:
                        reference_offset = file_offset(reference)
                        literal = re.match(rb"[\x20-\x7e]{4,}\x00", data[reference_offset:reference_offset + 512])
                        if literal:
                            target += " " + repr(literal.group()[:-1].decode("ascii"))
                    except ValueError:
                        pass
            instructions.append(f"{instruction.address:#x}: {instruction.mnemonic} "
                                f"{instruction.op_str}" + (f" ; {target}" if target else ""))
            previous = instruction
        functions.append({"symbol": symbol.name, "va": hex(address), "offset": hex(offset),
                          "size": size, "sha256": hashlib.sha256(body).hexdigest(),
                          "decoded_size": decoded_size, "complete": decoded_size == size,
                          "instructions": instructions})
    callers = []
    caller_scan = []
    if args.callers:
        disassembler.skipdata = True
        targets = {address for address, name in names.items()
                   if re.search(args.function, name.removesuffix("@plt"))}
        for section in elf.iter_sections():
            if section["sh_type"] != "SHT_PROGBITS" or not section["sh_flags"] & 4:
                continue
            scan = {"section": section.name, "size": section["sh_size"],
                    "scanned_size": 0, "skipped_size": 0, "complete": section["sh_size"] == 0}
            caller_scan.append(scan)
            for address, size, mnemonic, operands in disassembler.disasm_lite(section.data(), section["sh_addr"]):
                scan["scanned_size"] += size
                scan["complete"] = scan["scanned_size"] == section["sh_size"]
                if mnemonic == ".byte":
                    scan["skipped_size"] += size
                if mnemonic not in ("b", "bl") or not operands.startswith("#"):
                    continue
                target = int(operands[1:], 0)
                if target in targets:
                    owners = sorted({symbol.name for symbol in symbols if symbol["st_size"] and
                                     symbol["st_value"] <= address < symbol["st_value"] + symbol["st_size"]})
                    callers.append({"va": hex(address), "target": names[target], "owners": owners})
    print(json.dumps({"library": str(args.library), "size": len(data),
                      "sha256": hashlib.sha256(data).hexdigest(),
                      "scope": "Static evidence only; linear direct-call scan excludes indirect dispatch; "
                               "address annotations resolve adjacent ADRP/ADD pairs only",
                      "strings": strings, "functions": functions, "direct_callers": callers,
                      "caller_scan": caller_scan}, indent=2))


if __name__ == "__main__":
    main()