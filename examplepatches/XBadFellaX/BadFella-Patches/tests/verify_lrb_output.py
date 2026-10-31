"""Compare a real LRB 4.6.0 APK with the patched output APK."""
import argparse
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
    with zipfile.ZipFile(args.stock) as stock, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        dex = {n for n in stock.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
        assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}, "DEX inventory changed"
        # Morphe rebuilds AndroidManifest.xml and resources.arsc and adds META-INF signatures;
        # everything the patch must leave alone lives under assets/ and lib/ (plus the DEX).
        # The only reviewed asset change is the branded settings banner in the text store.
        branded = "assets/bundle/en-gb/strings.xml"
        for name in stock.namelist():
            if name.endswith("/") or not (name.startswith("assets/") or name.startswith("lib/")):
                continue
            assert name in output.namelist(), "Original entry missing: " + name
            if name == branded:
                text = output.read(name).decode("utf-8")
                assert "Patched by BadFella\nPowered by Pugpig Bolt" in text, "Settings banner not branded"
                continue
            assert stock.read(name) == output.read(name), "Original payload changed: " + name
        with tempfile.TemporaryDirectory(prefix="lrb-check-") as directory:
            work = Path(directory)
            javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
            run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java", root / "tests/LrbDexCheck.java")
            print(run(args.java, "-Xmx3g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                "LrbDexCheck", args.stock, args.output).strip())
    print("PASS: single reviewed paywall-gate edit; DEX inventory, bundled assets and native "
          "libraries retained (Morphe rebuilt the manifest and resource table as usual)")
    branding = run(args.aapt2, "dump", "resources", args.output)
    start = branding.find("string/version_info_message")
    assert start >= 0, "Version banner missing"
    block = branding[start:start + 600]
    assert "Patched by BadFella" in block, "Settings branding missing"
    assert "Timeline version" in block, "Version diagnostics lost"


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())
