"""Compare stock Torrent Search Revolution 2.3.5 APKS with real patched output."""
import argparse
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


def verify(args):
    root = Path(__file__).resolve().parents[1]
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        with zipfile.ZipFile(io.BytesIO(bundle.read("base.apk"))) as base:
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name.startswith("assets/") or (name in dex and name not in {"classes3.dex", "classes7.dex"}):
                    assert base.read(name) == output.read(name), "Unrelated payload changed: " + name
            with tempfile.TemporaryDirectory(prefix="revolution-check-") as directory:
                work = Path(directory)
                stock = work / "stock.apk"
                stock.write_bytes(bundle.read("base.apk"))
                javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
                run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java",
                    root / "tests/RemoteAtvDexCheck.java", root / "tests/RevolutionDexCheck.java")
                print(run(args.java, "-Xmx2g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                          "RevolutionDexCheck", stock, args.output).strip())
        for name in bundle.namelist():
            if name.endswith(".apk"):
                with zipfile.ZipFile(io.BytesIO(bundle.read(name))) as split:
                    for native in split.namelist():
                        if native.startswith("lib/") and not native.endswith("/"):
                            assert split.read(native) == output.read(native), "Native library changed: " + native
        assert not any("ApplicazioniCR" in n for n in output.namelist()), "Reference injection copied"
    badging = run(args.aapt2, "dump", "badging", args.output)
    assert "package: name='torrent.search.revolutionv2'" in badging and "versionName='2.3.5'" in badging
    print("PASS: package/version, all DEX entries, assets and original native libraries retained")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())
