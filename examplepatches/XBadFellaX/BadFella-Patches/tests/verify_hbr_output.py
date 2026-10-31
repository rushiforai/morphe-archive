"""Verify HBR XAPK output: meter edits, alignment anchors, footer and unchanged payloads."""
import argparse
import hashlib
import io
from pathlib import Path
import re
import zipfile

STOCK_BUNDLE_SHA256 = "8a4cfeb1dd1d219b840acc815ffb79bf6c7f8f6708cdba3b4c6773b5b97612ce"
OUTPUT_BUNDLE_SHA256 = "c1dabf690ee70489c63c6999b58dc21c2b0677277f25b037bef5563231f37edb"
# (offset, stock bytes, patched bytes, description)
EDITS = (
    (0x3A62A7, b"\x8b\x02\x02", b"\x8b\x02\xc8", "MAX_GUEST_ARTICLES"),
    (0x3A62B0, b"\x8b\x00\x04", b"\x8b\x00\xc8", "MAX_SIGNED_ARTICLES"),
    (0x586FB1, b"\x34\x09\x00\x41\x13\x02", b"\x93\x00\x76\x00\x00\x00", "ArticleCounter banner"),
    (0x579FE0,
     b"\x34\x01\x00\x3b\x02\x01\x00\x3b\x01\x01\x01\x5e\x01\x01\x0c\x93"
     b"\x00\x6e\x02\x02\x00\x01\x89\x01\x01\xb0\x0b\x01\x45\x01\x02\x00"
     b"\x1c\x69\xae\x08\x45\x01\x02\x01\x3d\x73\x76\x01",
     b"\x8c\x00\xdc\x05\x00\x00\x76\x00" + bytes(44 - 8), "getMaxArticleCount -> 1500"),
)
NEIGHBOURS = (
    (0x3A62B9, b"\x8b\x00\x05", "TOTAL_BOTTOM_TAB"),
    (0x3A62C2, b"\x8b\x00\x03", "TAB_NUMBER_FOR_FEATURE_CALLOUT_MODAL"),
)


def verify(args):
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        with zipfile.ZipFile(io.BytesIO(bundle.read("com.maz.combo1126.apk"))) as base:
            before = base.read("assets/index.android.bundle")
            after = output.read("assets/index.android.bundle")
            assert len(before) == len(after), "Bundle length changed"
            assert hashlib.sha256(before).hexdigest() == STOCK_BUNDLE_SHA256, "Unreviewed stock bundle"
            assert hashlib.sha256(after).hexdigest() == OUTPUT_BUNDLE_SHA256, "Patched bundle checksum mismatch"
            assert int.from_bytes(after[8:12], "little") == 98, "Hermes bytecode version changed"
            assert hashlib.sha1(after[:-20]).digest() == after[-20:], "Invalid HBC footer"
            restored = bytearray(after)
            for offset, stock, patched, name in EDITS:
                assert before[offset:offset + len(stock)] == stock, f"Stock {name} missing"
                assert after[offset:offset + len(patched)] == patched, f"{name} edit missing"
                restored[offset:offset + len(stock)] = stock
            for offset, stock, name in NEIGHBOURS:
                assert before[offset:offset + 3] == stock, f"Stock {name} missing"
                assert after[offset:offset + 3] == stock, f"{name} changed"
            restored[-20:] = before[-20:]
            assert restored == before, "Unreviewed Hermes bytecode or metadata change"
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name in dex or name.startswith("assets/") and name != "assets/index.android.bundle":
                    assert base.read(name) == output.read(name), "Original payload changed: " + name
        natives = {}
        for name in bundle.namelist():
            if not name.endswith(".apk"):
                continue
            with zipfile.ZipFile(io.BytesIO(bundle.read(name))) as split:
                for item in split.infolist():
                    if item.filename.startswith("lib/") and not item.is_dir():
                        natives[item.filename] = (split.read(item), item.compress_type)
        assert set(natives) == {n for n in output.namelist() if n.startswith("lib/") and not n.endswith("/")}
        for name, (data, compression) in natives.items():
            assert output.read(name) == data and output.getinfo(name).compress_type == compression, "Native payload changed"
    print("PASS: meter raised to 1500 per 30 days, free-views banner hidden, alignment anchors "
          "untouched; valid footer; all DEX, other assets and native payloads unchanged")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    verify(parser.parse_args())
