"""Reconstruct ARM64 initialization from two independent original-signed captures.

Capture files: capture-RUN.jsonl (native-base and all-maps payloads),
native-before-INDEX-FIRST.bin, native-after-INDEX-RUN.bin and
string-values-RUN.json. INDEX is the ELF PT_LOAD order, each dump p_filesz bytes.
Keep the exact captured system ARM64 libraries in system-arm64/.
Requires lief==1.0.0 and pyelftools==0.33. Never accepts an unresolved pointer.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from elftools.elf.elffile import ELFFile
import lief


def digest(data):
    return hashlib.sha256(data).hexdigest()


def capture(folder, run):
    messages = [json.loads(line).get("payload", {})
                for line in (folder / f"capture-{run}.jsonl").read_text().splitlines()]
    bases = {int(m["base"], 16) for m in messages if m.get("kind") == "native-base"}
    if len(bases) != 1:
        raise ValueError(f"Capture {run} must contain one native load base")
    maps = next(m["maps"] for m in messages if m.get("kind") == "all-maps")
    modules = {}
    for row in maps.splitlines():
        parts = row.split()
        if len(parts) >= 6 and "/arm64/" in parts[-1] and parts[-1].endswith(".so"):
            modules.setdefault(parts[-1], int(parts[0].split("-")[0], 16) - int(parts[2], 16))
    return bases.pop(), modules


def reconstruct(folder, first, second, output, ifuncs):
    original = (folder / "libcocos2dcpp.so").read_bytes()
    with (folder / "libcocos2dcpp.so").open("rb") as stream:
        elf = ELFFile(stream)
        if elf["e_machine"] != "EM_AARCH64":
            raise ValueError("Capture must be ARM64")
        loads = [dict(s.header) for s in elf.iter_segments() if s["p_type"] == "PT_LOAD"]
    base, modules = capture(folder, first)
    other_base, other_modules = capture(folder, second)
    if base == other_base:
        raise ValueError("Captures need independent ASLR load bases")
    if (folder / f"string-values-{first}.json").read_bytes() != (folder / f"string-values-{second}.json").read_bytes():
        raise ValueError("String initialization differs between captures")

    # Resolve both observations against exact ELF symbols, not runtime addresses.
    symbols = {}
    module_ranges = []
    for path, module_base in modules.items():
        if path not in other_modules:
            continue
        library = folder / "system-arm64" / Path(path).name
        with library.open("rb") as stream:
            module = ELFFile(stream)
            module_ranges.extend((module_base + s["p_vaddr"], module_base + s["p_vaddr"] + s["p_memsz"])
                                 for s in module.iter_segments() if s["p_type"] == "PT_LOAD")
            table = module.get_section_by_name(".dynsym")
            if table:
                for symbol in table.iter_symbols():
                    if symbol["st_shndx"] != "SHN_UNDEF" and symbol["st_value"] and symbol["st_info"]["type"] == "STT_FUNC":
                        symbols.setdefault(module_base + symbol["st_value"], []).append(
                            (path, symbol.name, other_modules[path] + symbol["st_value"]))
        for entry in ifuncs:
            if entry["module"] != path:
                continue
            if digest(library.read_bytes()) != entry["sha256"]:
                raise ValueError(f"Reviewed IFUNC belongs to another system library: {path}")
            offset = int(entry["target"], 0)
            symbols.setdefault(module_base + offset, []).append(
                (path, entry["symbol"], other_modules[path] + offset))

    result = bytearray(original)
    relative, imports = [], []
    constants = executable = 0
    for index, segment in enumerate(loads):
        before = (folder / f"native-before-{index}-{first}.bin").read_bytes()
        after = (folder / f"native-after-{index}-{first}.bin").read_bytes()
        other = (folder / f"native-after-{index}-{second}.bin").read_bytes()
        size, file_offset, address = segment["p_filesz"], segment["p_offset"], segment["p_vaddr"]
        if not len(before) == len(after) == len(other) == size:
            raise ValueError(f"Truncated PT_LOAD capture {index}")
        if segment["p_flags"] & 1:
            if after != other:
                raise ValueError(f"Executable PT_LOAD {index} differs between starts")
            for offset, (a, b) in enumerate(zip(before, after)):
                if a != b:
                    result[file_offset + offset] = b
                    executable += 1
            continue
        for offset in range(0, size - 7, 8):
            a, b, c = (struct.unpack_from("<Q", data, offset)[0] for data in (before, after, other))
            if a == b:
                continue
            destination, slot = file_offset + offset, address + offset
            candidates = [s for s in symbols.get(b, []) if s[2] == c]
            if candidates:
                # A preloaded system library can keep the same base across starts.
                # Such a function is still an import, never a captured constant.
                imports.append((slot, candidates[0][1]))
                struct.pack_into("<Q", result, destination, 0)
            elif b == c and not any(start <= b < end for start, end in module_ranges):
                struct.pack_into("<Q", result, destination, b)
                constants += 1
            elif any(s["p_vaddr"] <= b - base < s["p_vaddr"] + s["p_memsz"] for s in loads) and b - base == c - other_base:
                relative.append((slot, b - base))
                struct.pack_into("<Q", result, destination, 0)
            else:
                raise ValueError(f"Unresolved two-run pointer at native slot 0x{slot:x}; review the exact system SDK/IFUNC")
        tail = size % 8
        if tail and before[-tail:] != after[-tail:]:
            raise ValueError(f"Unclassified trailing data in PT_LOAD {index}")

    output.mkdir(parents=True, exist_ok=True)
    prelink = output / "native-restored-prelink.so"
    prelink.write_bytes(result)
    binary = lief.parse(str(prelink))
    relocations = {r.address: r for r in binary.dynamic_relocations}
    for address, addend in relative:
        if address in relocations:
            relocation = relocations[address]
            if relocation.type != lief.ELF.Relocation.TYPE.AARCH64_RELATIVE:
                raise ValueError(f"Existing non-relative relocation at {address:x}")
            relocation.addend = addend
        else:
            relocation = lief.ELF.Relocation(address, lief.ELF.Relocation.TYPE.AARCH64_RELATIVE, lief.ELF.Relocation.ENCODING.RELA)
            relocation.addend = addend
            binary.add_dynamic_relocation(relocation)
    dynamic_symbols = {s.name: s for s in binary.dynamic_symbols}
    for address, name in imports:
        if name not in dynamic_symbols:
            symbol = lief.ELF.Symbol()
            symbol.name, symbol.type, symbol.binding, symbol.shndx = name, lief.ELF.Symbol.TYPE.FUNC, lief.ELF.Symbol.BINDING.GLOBAL, 0
            dynamic_symbols[name] = binary.add_dynamic_symbol(symbol, lief.ELF.SymbolVersion.global_)
        relocation = lief.ELF.Relocation(address, lief.ELF.Relocation.TYPE.AARCH64_JUMP_SLOT, lief.ELF.Relocation.ENCODING.RELA)
        relocation.symbol = dynamic_symbols[name]
        binary.add_pltgot_relocation(relocation)
    initialization = binary.get(lief.ELF.DynamicEntry.TAG.INIT)
    if initialization is None or not any(s["p_flags"] & 1 and s["p_vaddr"] <= initialization.value < s["p_vaddr"] + s["p_filesz"] for s in loads):
        raise ValueError("Native constructor is missing or outside captured executable segments")
    init = initialization.value
    binary.remove(lief.ELF.DynamicEntry.TAG.INIT)
    restored = output / "libcocos2dcpp-restored.so"
    binary.write(str(restored))
    report = dict(restored_executable_bytes=executable, constant_qwords=constants,
                  relative_relocations=len(relative), imports=len(imports), removed_init=hex(init),
                  input_sha256=digest(original), output_sha256=digest(restored.read_bytes()),
                  first_run=first, second_run=second)
    (output / "native-reconstruction.json").write_text(json.dumps(report, indent=2))
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("evidence", type=Path)
    parser.add_argument("--first-run", required=True)
    parser.add_argument("--second-run", required=True)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--ifuncs", type=Path, help="Reviewed module/SHA256/target/symbol records; no guessed pointer fallback")
    args = parser.parse_args()
    print(json.dumps(reconstruct(args.evidence, args.first_run, args.second_run, args.output,
                                 json.loads(args.ifuncs.read_text()) if args.ifuncs else []), indent=2))
