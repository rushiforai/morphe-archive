"""Compare a real MIT Tech Review APKM with the patched output APK."""
import argparse
import io
import os
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile


def run(*args):
    return subprocess.check_output(list(map(str, args)), text=True, encoding="utf-8", stderr=subprocess.STDOUT)


def verify(args):
    root = Path(__file__).resolve().parents[1]
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        with zipfile.ZipFile(io.BytesIO(bundle.read("base.apk"))) as base:
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name.startswith("assets/"):
                    assert base.read(name) == output.read(name), "Bundled configuration or asset changed: " + name
            with tempfile.TemporaryDirectory(prefix="mit-review-check-") as directory:
                work = Path(directory)
                stock = work / "stock.apk"
                stock.write_bytes(bundle.read("base.apk"))
                javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
                run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java", root / "tests/MitReviewDexCheck.java")
                print(run(args.java, "-Xmx3g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                    "MitReviewDexCheck", stock, args.output).strip())
        for name in bundle.namelist():
            if name.endswith(".apk"):
                with zipfile.ZipFile(io.BytesIO(bundle.read(name))) as split:
                    for native in split.namelist():
                        if native.startswith("lib/") and not native.endswith("/"):
                            assert split.read(native) == output.read(native), "Native library changed: " + native
    print("PASS: original assets/configuration, DEX inventory and native libraries retained")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    verify(parser.parse_args())
