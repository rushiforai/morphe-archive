"""Read-only exact-build decoder/redirect audit; never patches the input ELF."""
from __future__ import annotations

import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_OUTPUT = ROOT / "../builds/steamlink-patches/diagnostics/decoder-redirect"

PINS = {
    ("2.0.20", "5001712"): (
        2_221_072,
        "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495",
        ROOT / "android-steamlinkvr-release-base-2.0.20-5001712",
    ),
    ("2.0.24", "5002395"): (
        2_301_432,
        "5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b",
        ROOT / "android-steamlinkvr-release-base-2.0.24-5002395",
    ),
}

REQUIRED_SYMBOLS = {
    "codec_init": "_ZN12QSVLCodecNDK4InitEv",
    "codec_image_available": "_ZN12QSVLCodecNDK22HandleOnImageAvailableEP12AImageReader",
    "codec_media_thread": "_ZN12QSVLCodecNDK11MediaThreadEv",
    "frame_server_enqueue": "_ZN15QSVLFrameServer21EnqueueHardwareBufferEO18HardwareBufferInfo",
    "renderer_flip": "_ZN14QSVLRendererXR9FlipFrameERK10XRQContextPll",
    "renderer_setup": "_ZN14QSVLRendererXR15SetupSwapchainsERK10XRQContextjj9AtlasMode",
}

REQUIRED_CALLS = {
    "codec_init": [
        "AImageReader_newWithUsage",
        "AImageReader_getWindow",
        "AMediaCodec_configure",
    ],
    "codec_image_available": [
        "AImageReader_acquireLatestImage",
        "AImage_getTimestamp",
        "_ZN15QSVLFrameServer21EnqueueHardwareBuffer",
    ],
    "codec_media_thread": [
        "AMediaCodec_dequeueOutputBuffer",
        "AMediaCodec_releaseOutputBuffer",
    ],
    "renderer_flip": [
        "AImage_getHardwareBuffer",
        "eglCreateImageKHR",
        "_ZN6SVLFEC21GetMetadataForFrameId",
        "_ZN11SVLDataLink31FrameHasBeenSubmittedForDisplay",
    ],
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def safe_name(name: str) -> str:
    return re.sub(r"[^A-Za-z0-9_.-]+", "-", name).strip("-") or "base"


def load_dependencies() -> None:
    dependency_dir = ROOT / "../builds/steamlink-patches/build/oled-native-audit/python"
    if dependency_dir.is_dir():
        sys.path.insert(0, str(dependency_dir))


def audit_base(version: str, code: str, output_root: Path) -> dict:
    load_dependencies()
    from elftools.elf.elffile import ELFFile
    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

    size, sha256, default_base = PINS[(version, code)]
    base = Path(default_base)
    source = base / "lib/arm64-v8a/libvrlink_scene.so"
    require(source.is_file(), f"Missing exact {version}/{code} scene: {source}")
    data = source.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    require(len(data) == size, f"Unsupported {version}/{code} size={len(data)} expected={size}")
    require(digest == sha256, f"Unsupported {version}/{code} sha256={digest} expected={sha256}")

    metadata = (base / "apktool.yml").read_text(encoding="utf-8")
    for field, expected in (("versionName", version), ("versionCode", code)):
        match = re.search(r"^\s*" + field + r":\s*['\"]?([^'\"\s]+)", metadata, re.MULTILINE)
        require(match is not None and match.group(1) == expected, f"Unexpected {field}")

    elf = ELFFile(io.BytesIO(data))
    dynsym = elf.get_section_by_name(".dynsym")
    require(dynsym is not None, "Missing .dynsym")
    symbols = list(dynsym.iter_symbols())
    named = {symbol.name: symbol for symbol in symbols if symbol.name}
    names = {symbol["st_value"]: symbol.name for symbol in symbols if symbol["st_value"]}

    plt = elf.get_section_by_name(".plt")
    rela = elf.get_section_by_name(".rela.plt")
    require(plt is not None and rela is not None, "Missing .plt/.rela.plt")
    for index, relocation in enumerate(rela.iter_relocations()):
        names[plt["sh_addr"] + 32 + index * 16] = symbols[relocation["r_info_sym"]].name

    def offset(address: int) -> int:
        for segment in elf.iter_segments():
            if segment["p_type"] == "PT_LOAD" and \
                    segment["p_vaddr"] <= address < segment["p_vaddr"] + segment["p_filesz"]:
                return address - segment["p_vaddr"] + segment["p_offset"]
        raise ValueError(f"Unmapped virtual address {address:#x}")

    disassembler = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    functions: dict[str, dict] = {}
    missing_symbols: list[str] = []
    missing_calls: list[str] = []
    text_lines: list[str] = []
    for key, symbol_name in REQUIRED_SYMBOLS.items():
        symbol = named.get(symbol_name)
        if symbol is None or not symbol["st_value"] or not symbol["st_size"]:
            missing_symbols.append(f"{key}:{symbol_name}")
            continue
        address = symbol["st_value"]
        start = offset(address)
        calls: list[dict] = []
        lines: list[str] = []
        for instruction in disassembler.disasm(data[start:start + symbol["st_size"]], address):
            target = ""
            if instruction.mnemonic in ("b", "bl") and instruction.op_str.startswith("#0x"):
                target = names.get(int(instruction.op_str[1:], 16), "")
            if target:
                calls.append({"address": instruction.address, "mnemonic": instruction.mnemonic,
                              "target": target})
            lines.append(f"{instruction.address:#x} {instruction.mnemonic} {instruction.op_str} {target}")
        functions[key] = {
            "symbol": symbol_name,
            "address": address,
            "size": symbol["st_size"],
            "calls": calls,
        }
        text_lines.append(f"\n{key} {symbol_name} @ {address:#x} size={symbol['st_size']:#x}")
        text_lines.extend(lines)
        present = {call["target"] for call in calls}
        for required in REQUIRED_CALLS.get(key, []):
            if not any(required in target for target in present):
                missing_calls.append(f"{key}:{required}")

    require(not missing_symbols, "Missing required symbols: " + ", ".join(missing_symbols))
    require(not missing_calls, "Missing required calls: " + ", ".join(missing_calls))
    require(hashlib.sha256(source.read_bytes()).hexdigest() == sha256,
            "Input hash changed during audit")

    result = {
        "base": f"{version}/{code}",
        "source": str(source),
        "size": len(data),
        "sha256": digest,
        "functions": functions,
        "required_calls": REQUIRED_CALLS,
        "ok": True,
    }
    case = output_root / safe_name(f"{version}-{code}")
    case.mkdir(parents=True, exist_ok=True)
    (case / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    (case / "resolved-disassembly.txt").write_text("\n".join(text_lines) + "\n", encoding="utf-8")
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", action="append", default=[],
                        help="version/code to audit; repeatable. Default: all pinned bases")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    output = args.output.resolve()
    build_root = (ROOT / "../builds/steamlink-patches").resolve()
    require(output.is_relative_to(build_root), "Output must stay below builds/steamlink-patches/")
    selected = args.base or [f"{version}/{code}" for version, code in PINS]
    for pair in selected:
        version, code = pair.split("/", 1)
        require((version, code) in PINS, f"Unknown base: {pair}")
        result = audit_base(version, code, output)
        print(f"PASS {result['base']} size={result['size']} sha256={result['sha256']} "
              f"functions={len(result['functions'])}")
    print(f"Evidence: {output}")


if __name__ == "__main__":
    main()
