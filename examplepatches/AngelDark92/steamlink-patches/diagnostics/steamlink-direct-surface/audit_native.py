"""Read-only exact-build decoder/atlas audit; never patches the input ELF."""
from __future__ import annotations

import argparse
import hashlib
import io
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
EXPECTED_SIZE = 2_283_400
EXPECTED_SHA256 = "e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f"
DEFAULT_BASE = ROOT / "decoded-apk-android-steamlinkvr-release-base-2.0.22-5002322"

# Addresses are verified virtual addresses for this exact ELF, not generic offsets.
FUNCTIONS = {
    0xFC928: "_ZN12QSVLCodecNDK4InitEv",
    0xFCD28: "_ZN12QSVLCodecNDK11MediaThreadEv",
    0xFD5A4: "_ZN12QSVLCodecNDK22HandleOnImageAvailableEP12AImageReader",
    0x10BF38: "_ZN14QSVLRendererXR9FlipFrameERK10XRQContextPll",
    0x10B9B8: "_ZN14QSVLRendererXR15SetupSwapchainsERK10XRQContextjj9AtlasMode",
    0xF0D70: "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
}
CALLS = {
    0xFCAF4: "AImageReader_newWithUsage",
    0xFCB2C: "AImageReader_setImageListener",
    0xFCB58: "AImageReader_getWindow",
    0xFCB90: "AMediaCodec_configure",
    0xFCE1C: "AMediaCodec_dequeueOutputBuffer",
    0xFCE34: "AMediaCodec_releaseOutputBuffer",
    0xFD62C: "_ZN10QSVLClient15GotDecodedFrameEv",
    0xFD638: "_ZN10QSVLClient24PhaseEventDecodeCompleteEv",
    0xFD650: "AImageReader_acquireLatestImage",
    0xFD678: "AImage_getTimestamp",
    0xFD74C: "_ZN6SVLFEC21GetMetadataForFrameIdEt",
    0xFD76C: "_ZN11SVLDataLink19FrameHasBeenDecodedEjj",
    0xFD78C: "_ZN15QSVLFrameServer21EnqueueHardwareBufferEO18HardwareBufferInfo",
    0x10C1EC: "AImage_getHardwareBuffer",
    0x10C228: "eglCreateImageKHR",
    0x10C244: "_ZN6SVLFEC21GetMetadataForFrameIdEt",
    0x10C2D0: "_ZN11SVLDataLink31FrameHasBeenSubmittedForDisplayEjjj",
    0x10C440: "_ZN14QSVLRendererXR15SetupSwapchainsERK10XRQContextjj9AtlasMode",
    0x10C880: "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
    0x10C8DC: "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
    0x10C960: "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
    0x10C9BC: "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
}
SHADERS = {
    0x99555: "opaque_vertex",
    0xA9245: "masked_vertex",
    0x96BA5: "video_fragment_prefix",
    0xA2B93: "masked_fragment_suffix",
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", type=Path, default=DEFAULT_BASE)
    parser.add_argument("--output", type=Path, default=ROOT / "build/direct-surface-native-audit")
    args = parser.parse_args()
    base = args.base.resolve()
    output = args.output.resolve()
    require(output.is_relative_to(ROOT / "build"), "Output must remain below repository build/")
    source = base / "lib/arm64-v8a/libvrlink_scene.so"
    data = source.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    require(len(data) == EXPECTED_SIZE and digest == EXPECTED_SHA256,
            f"Unsupported native layout: size={len(data)}, sha256={digest}")
    import re
    metadata = (base / "apktool.yml").read_text(encoding="utf-8")
    for field, value in (("versionName", "2.0.22"), ("versionCode", "5002322")):
        match = re.search(r"^\s*" + field + r":\s*['\"]?([^'\"\s]+)", metadata, re.MULTILINE)
        require(match is not None and match.group(1) == value, f"Unexpected {field}")

    # Existing local audit dependencies; ordinary installed packages also work.
    dependency_dir = ROOT / "build/oled-native-audit/python"
    if dependency_dir.is_dir():
        sys.path.insert(0, str(dependency_dir))
    from elftools.elf.elffile import ELFFile
    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

    elf = ELFFile(io.BytesIO(data))
    symbols = list(elf.get_section_by_name(".dynsym").iter_symbols())
    named = {s.name: s for s in symbols}
    names = {s["st_value"]: s.name for s in symbols if s["st_value"]}
    plt = elf.get_section_by_name(".plt")
    for index, relocation in enumerate(elf.get_section_by_name(".rela.plt").iter_relocations()):
        names[plt["sh_addr"] + 32 + index * 16] = symbols[relocation["r_info_sym"]].name

    def offset(address: int) -> int:
        for segment in elf.iter_segments():
            if segment["p_type"] == "PT_LOAD" and segment["p_vaddr"] <= address < segment["p_vaddr"] + segment["p_filesz"]:
                return address - segment["p_vaddr"] + segment["p_offset"]
        raise ValueError(f"Unmapped virtual address {address:#x}")

    disassembler = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    instructions = {}
    lines = []
    for address, name in FUNCTIONS.items():
        symbol = named.get(name)
        require(symbol is not None and symbol["st_value"] == address, f"Symbol mismatch: {name}")
        start = offset(address)
        lines.append(f"\n{name} @ {address:#x}")
        for instruction in disassembler.disasm(data[start:start + symbol["st_size"]], address):
            instructions[instruction.address] = instruction
            target = ""
            if instruction.mnemonic in ("b", "bl") and instruction.op_str.startswith("#0x"):
                target = names.get(int(instruction.op_str[1:], 16), "")
            lines.append(f"{instruction.address:#x} {instruction.mnemonic} {instruction.op_str} {target}")
    for address, name in CALLS.items():
        instruction = instructions.get(address)
        require(instruction is not None and instruction.mnemonic == "bl", f"Missing call at {address:#x}")
        require(names.get(int(instruction.op_str[1:], 16)) == name, f"Call target mismatch at {address:#x}")
    shaders = {}
    for address, label in SHADERS.items():
        start = offset(address)
        end = data.index(b"\0", start)
        shaders[label] = {"address": hex(address), "text": data[start:end].decode("utf-8")}
    require("group*0.5" in shaders["opaque_vertex"]["text"], "Opaque atlas formula missing")
    require("gl_Position = vec4( 0.0, 0.0, 0.0, 1.0 )" in shaders["masked_vertex"]["text"], "Mode2 mask disable missing")
    require("color.a = pow(" in shaders["masked_fragment_suffix"]["text"], "Synthesized alpha missing")
    require(hashlib.sha256(source.read_bytes()).hexdigest() == digest, "Input changed during audit")
    # Create outputs only after all exact-layout and evidence checks pass.
    output.mkdir(parents=True, exist_ok=True)
    (output / "resolved-disassembly.txt").write_text("\n".join(lines), encoding="utf-8")
    (output / "shaders.json").write_text(json.dumps(shaders, indent=2), encoding="utf-8")
    result = {"versionName": "2.0.22", "versionCode": "5002322", "source": str(source),
              "size": len(data), "sha256": digest, "symbolChecks": len(FUNCTIONS),
              "callChecks": len(CALLS), "shaderChecks": 3, "inputUnchanged": True,
              "scope": "Static native trace only; no direct-surface patch or runtime validation"}
    (output / "result.json").write_text(json.dumps(result, indent=2), encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
