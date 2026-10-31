"""Verify Wanderlog APKM output: reviewed HBC98 edits, footer, OTA guard and unchanged payloads."""
import argparse
import hashlib
import io
from pathlib import Path
import re
import subprocess
import zipfile


TIER_OPERANDS = (
    0x13FD429, 0x13FD4A1, 0x13FD56A, 0x13FD5E4,
    0x13FD6A8, 0x13FD722, 0x13FD7E7, 0x13FD861,
    0x13FD924, 0x13FD99E, 0x13FDAAD, 0x13FDB24,
)
RETURN_UNDEFINED = b"\x93\x00\x76\x00\x00\x00"
# (offset, stock bytes, patched bytes, description)
SPAN_EDITS = (
    (0x13FD537, b"\x17\x03\x05\x03", b"\x96\x03\x96\x04", "prompt guard"),
    (2677060, b"Pro guides you from idea to itinerary",
     b"Pro is Activated by BadFella for you!", "billing headline"),
    (0x158918C, b"\x34\x07\x00\x89\x03\x01", RETURN_UNDEFINED, "home Pro star"),
    (4931283, b"faRedditSquare", b"Pro Activated\x65", "profile label storage"),
    (1127260, b"\x14\x2f\x4a\x07", b"\xa6\x2f\x4a\x0d", "profile label entry"),
    (0x0146C90B, b"\x34\x0b\x00\x89\x06\x01", RETURN_UNDEFINED, "paywall gate base"),
    (0x01771119, b"\x34\x04\x00\x04\x03\x89", RETURN_UNDEFINED, "paywall gate store a"),
    (0x01771201, b"\x34\x05\x00\x34\x06\x01", RETURN_UNDEFINED, "paywall gate store b"),
)


def verify(args):
    with zipfile.ZipFile(args.stock) as stock, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entry"
        with zipfile.ZipFile(io.BytesIO(stock.read("base.apk"))) as base:
            before = base.read("assets/index.android.bundle")
            after = output.read("assets/index.android.bundle")
            assert len(before) == len(after) and int.from_bytes(after[8:12], "little") == 98
            assert hashlib.sha1(after[:-20]).digest() == after[-20:], "Invalid HBC footer"
            restored = bytearray(after)
            for offset in TIER_OPERANDS:
                assert before[offset:offset + 2] == b"\x66\x44"
                assert after[offset:offset + 2] == b"\xd0\x3e", "Pro return operand missing"
                assert before[offset - 4] == 69 and before[offset + 2] == 82
                restored[offset:offset + 2] = before[offset:offset + 2]
            for offset, stock_bytes, patched_bytes, name in SPAN_EDITS:
                assert before[offset:offset + len(stock_bytes)] == stock_bytes, f"Stock {name} missing"
                assert after[offset:offset + len(patched_bytes)] == patched_bytes, f"{name} missing"
                restored[offset:offset + len(stock_bytes)] = stock_bytes
            restored[-20:] = before[-20:]
            assert restored == before, "Unreviewed Hermes bytecode or metadata change"
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name in dex or name.startswith("assets/") and name != "assets/index.android.bundle":
                    assert base.read(name) == output.read(name), "Original payload changed: " + name
        natives = {}
        for name in stock.namelist():
            if not name.endswith(".apk"):
                continue
            with zipfile.ZipFile(io.BytesIO(stock.read(name))) as split:
                for item in split.infolist():
                    if item.filename.startswith("lib/") and not item.is_dir():
                        natives[item.filename] = (split.read(item), item.compress_type)
        assert set(natives) == {n for n in output.namelist() if n.startswith("lib/") and not n.endswith("/")}
        for name, (data, compression) in natives.items():
            assert output.read(name) == data and output.getinfo(name).compress_type == compression, "Native payload changed"
    manifest = subprocess.check_output([str(args.aapt2), "dump", "xmltree", str(args.output),
        "--file", "AndroidManifest.xml"], text=True, encoding="utf-8")
    assert re.search(r'expo.modules.updates.ENABLED[^\n]*\n[^\n]*=false', manifest), "Expo OTA enabled"
    assert re.search(r'expo.modules.updates.EXPO_UPDATE_URL[^\n]*\n[^\n]*=""', manifest), "OTA URL remains"
    print("PASS: twelve HBC98 tier operands, prompt guard, billing headline, home Pro star, "
          "Pro Activated profile label and three paywall auto-open gates; valid footer; "
          "all DEX, other assets and native payloads unchanged; OTA disabled")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())
