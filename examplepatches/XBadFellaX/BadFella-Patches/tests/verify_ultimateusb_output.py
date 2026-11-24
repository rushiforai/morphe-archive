"""Compare stock Ultimate USB 12.5.0 APKS with real patched output."""
import argparse
import hashlib
import io
import os
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile


def run(*args):
    result = subprocess.run(list(map(str, args)), text=True, encoding="utf-8", stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if result.returncode:
        raise RuntimeError(result.stdout)
    return result.stdout


def verify_native(stock, output):
    assert hashlib.sha256(stock).hexdigest() == "0d8ddb95ca3df6eea13a4537c4b4848973298933e7719a90a8e5c4d7c9615824", "Unreviewed native driver"
    expected = bytearray(stock)
    for offset, before, after in (
        (0x3cf9b8, "07000014", "56000014"),
        (0x3d4a44, "41500054", "1f2003d5"),
        (0x576c60, "5f2403d5", "c0035fd6"),
    ):
        assert stock[offset:offset + 4] == bytes.fromhex(before), "Unexpected native instruction"
        expected[offset:offset + 4] = bytes.fromhex(after)
    assert output == expected, "Native integrity edits missing or unrelated driver bytes changed"


def verify(args):
    root = Path(__file__).resolve().parents[1]
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        with zipfile.ZipFile(io.BytesIO(bundle.read("base.apk"))) as base:
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name.startswith("assets/") or (name in dex and name not in {"classes5.dex"}):
                    assert base.read(name) == output.read(name), "Unrelated payload changed: " + name
            with tempfile.TemporaryDirectory(prefix="ultimateusb-check-") as directory:
                work = Path(directory)
                stock = work / "stock.apk"
                stock.write_bytes(bundle.read("base.apk"))
                javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
                run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java",
                    root / "tests/RemoteAtvDexCheck.java", root / "tests/RevolutionDexCheck.java", root / "tests/UltimateUsbDexCheck.java")
                print(run(args.java, "-Xmx2g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                          "UltimateUsbDexCheck", stock, args.output).strip())
        for name in bundle.namelist():
            if name.endswith(".apk"):
                with zipfile.ZipFile(io.BytesIO(bundle.read(name))) as split:
                    for native in split.namelist():
                        if native.startswith("lib/") and not native.endswith("/"):
                            if native == "lib/arm64-v8a/libmixapplications.so":
                                verify_native(split.read(native), output.read(native))
                            else:
                                assert split.read(native) == output.read(native), "Native library changed: " + native
    badging = run(args.aapt2, "dump", "badging", args.output)
    assert "package: name='com.mixapplications.ultimateusb'" in badging and "versionName='12.5.0'" in badging
    print("PASS: package/version, all DEX entries, assets; 3 native integrity instructions and every other driver byte verified")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())
