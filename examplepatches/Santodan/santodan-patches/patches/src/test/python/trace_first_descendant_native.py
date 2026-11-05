"""Reproduce the static NGSM package-detection trace for the original 1.1.5 ELF.

Function labels describe observed roles; original C++ method names are stripped.
This tool reads the library and writes evidence only. It never patches the ELF.
"""

import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess


WORKSPACE = Path(__file__).resolve().parents[5]
EXPECTED_SHA256 = "4fe741656c3cbc6b98f726fed42956fbae97ce86ee7783cef731582f1c7e15d9"
FUNCTIONS = {
    "hacktool-file-worker": 0xB2E48C,
    "hacktool-file-scan": 0xB39A50,
    "rule-comparison": 0xB3E020,
    "package-collection": 0x803AF4,
    "package-enumerator": 0x868EA0,
    "abuse-jni-bridge": 0x861DE8,
    "java-void-call": 0x861948,
    "adb-check-worker": 0xAD4024,
}
EDGES = {
    "worker collects packages": (0xB2E920, 0x803AF4),
    "collector enumerates packages": (0x803D20, 0x868EA0),
    "worker invokes scan": (0xB2E948, 0xB39A50),
    "scan invokes comparison": (0xB3AC70, 0xB3E020),
    "scan reports detection": (0xB3C4D0, 0x861DE8),
    "bridge invokes Java helper": (0x862054, 0x861948),
}


class Elf:
    def __init__(self, data):
        self.data = data
        if data[:6] != b"\x7fELF\x02\x01" or struct.unpack_from("<H", data, 18)[0] != 183:
            raise ValueError("Expected little-endian AArch64 ELF64")
        section_offset = struct.unpack_from("<Q", data, 40)[0]
        entry_size, count, name_index = struct.unpack_from("<HHH", data, 58)
        entries = [struct.unpack_from("<IIQQQQIIQQ", data, section_offset + i * entry_size) for i in range(count)]
        strings = entries[name_index]
        names = data[strings[4]:strings[4] + strings[5]]
        self.sections = {names[e[0]:].split(b"\0", 1)[0].decode(): e for e in entries}

    def offset(self, address):
        for entry in self.sections.values():
            if entry[1] != 8 and entry[3] <= address < entry[3] + entry[5]:
                return address - entry[3] + entry[4]
        raise ValueError(f"Unmapped ELF address {address:#x}")

    def function_ranges(self):
        header = self.sections[".eh_frame_hdr"]
        data = self.data[header[4]:header[4] + header[5]]
        if data[:4] != bytes.fromhex("011b033b"):
            raise ValueError("Unexpected unwind table encoding")
        count = struct.unpack_from("<I", data, 8)[0]
        result = {}
        for i in range(count):
            relative_start, relative_fde = struct.unpack_from("<ii", data, 12 + i * 8)
            start, fde = header[3] + relative_start, header[3] + relative_fde
            # Original FDEs encode initial_location as PC-relative signed 32-bit,
            # followed by a 32-bit range. Verify the table entry before using it.
            _, _, pc, size = struct.unpack_from("<IIiI", self.data, self.offset(fde))
            if fde + 8 + pc != start:
                raise ValueError(f"Unexpected FDE location at {fde:#x}")
            result[start] = size
        return result

    def decoded_data_strings(self):
        entry = self.sections[".data"]
        cursor, limit = entry[4], entry[4] + entry[5]
        result = []
        while cursor < limit:
            end = self.data.find(b"\0", cursor, limit)
            if end < 0:
                break
            encoded = self.data[cursor:end]
            # Formula established from the native scalar decoder loop, including
            # its unsigned multiplication by 0x80808081 and shift by 39.
            decoded = bytes(c ^ ((122 + i + ((122 + i) * 0x80808081 >> 39)) & 255)
                            for i, c in enumerate(encoded))
            if len(decoded) > 3 and all(32 <= c < 127 for c in decoded):
                result.append({"file_offset": hex(cursor), "virtual_address": hex(cursor - entry[4] + entry[3]), "text": decoded.decode("ascii")})
            cursor = end + 1
        return result

    def direct_calls_to(self, target):
        entry = self.sections[".text"]
        result = []
        for delta in range(0, entry[5] - 3, 4):
            instruction = struct.unpack_from("<I", self.data, entry[4] + delta)[0]
            if instruction >> 26 != 0b100101:
                continue
            immediate = instruction & 0x03FFFFFF
            if immediate & 0x02000000:
                immediate -= 0x04000000
            address = entry[3] + delta
            if address + immediate * 4 == target:
                result.append(hex(address))
        return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--library", type=Path, default=WORKSPACE / "Skills/inspection-evidence/.inspect-first-descendant-1.1.5/arm64/lib/arm64-v8a/libngsme.so")
    parser.add_argument("--output", required=True, type=Path, help="New evidence directory")
    args = parser.parse_args()
    data = args.library.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_SHA256:
        raise ValueError("Library differs from original TFD Companion 1.1.5 libngsme.so")
    elf = Elf(data)
    ranges = elf.function_ranges()
    objdump = WORKSPACE / "SDK/ndk/29.0.14206865/toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-objdump.exe"
    if not objdump.is_file():
        raise FileNotFoundError(objdump)
    args.output.mkdir(parents=True, exist_ok=False)
    report = {"library": str(args.library.resolve()), "sha256": digest, "functions": {}, "decoded_data_strings": elf.decoded_data_strings(), "direct_abuse_bridge_calls": elf.direct_calls_to(0x861DE8)}
    report["verified_direct_calls"] = {}
    signature_offset = elf.offset(0x509977)
    signature = data[signature_offset:data.index(b"\0", signature_offset)].decode("ascii")
    if signature != "(ILjava/lang/String;Z)V":
        raise ValueError("Unexpected native callback signature")
    report["callback_signature"] = {"virtual_address": "0x509977", "signature": signature}
    for label, (caller, target) in EDGES.items():
        if hex(caller) not in elf.direct_calls_to(target):
            raise ValueError(f"Expected original direct call missing: {label}")
        report["verified_direct_calls"][label] = {"instruction": hex(caller), "target": hex(target)}
    for label, start in FUNCTIONS.items():
        size = ranges[start]
        end = start + size
        assembly = subprocess.run([str(objdump), "--disassemble", f"--start-address={start:#x}", f"--stop-address={end:#x}", str(args.library)], capture_output=True, check=True).stdout
        (args.output / (label + ".asm")).write_bytes(assembly)
        report["functions"][label] = {"virtual_address": hex(start), "file_offset": hex(elf.offset(start)), "size": hex(size), "end_exclusive": hex(end)}
    assert any(s["text"] == "onAbuseDetect" for s in report["decoded_data_strings"])
    assert any(s["text"] == "getInstalledPackages" for s in report["decoded_data_strings"])
    assert "0xb3c4d0" in report["direct_abuse_bridge_calls"]
    (args.output / "report.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(f"Native trace saved: {args.output.resolve()}")
    print(f"Recovered {len(report['decoded_data_strings'])} encoded strings; {len(report['direct_abuse_bridge_calls'])} direct abuse-bridge calls.")


if __name__ == "__main__":
    main()
