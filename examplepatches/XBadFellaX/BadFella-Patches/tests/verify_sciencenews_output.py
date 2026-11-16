"""Compare stock Science News Daily 23.8 APKS with real patched output."""
import argparse
import io
import os
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

GATE_DEX = "classes2.dex"
GATE = ("Lcom/appsfornexus/sciencenews/utils/AppPreferences;->"
        "getSubscriptionStatus(Landroid/content/Context;)Z")


def run(*args):
    result = subprocess.run(list(map(str, args)), text=True, encoding="utf-8",
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if result.returncode:
        raise RuntimeError(result.stdout)
    return result.stdout


def dex_names(apk):
    return {n for n in apk.namelist() if re.fullmatch(r"classes\d*\.dex", n)}


def verify(args):
    with zipfile.ZipFile(args.stock) as bundle, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entries"
        with zipfile.ZipFile(io.BytesIO(bundle.read("base.apk"))) as base:
            reviewed = dex_names(base)
            assert reviewed == dex_names(output), "DEX inventory changed"
            # Morphe rebuilds the resource table, manifest and the DEX holding the gate.
            # Every other DEX entry and payload must stay byte-identical to the stock base.
            edited = {"AndroidManifest.xml", "resources.arsc", GATE_DEX}
            for name in base.namelist():
                # Compiling resources rewrites the whole res/ tree into resources.arsc, so
                # individual entries are not byte-comparable; the manifest and table are
                # checked below through aapt2 and the DEX inventory above.
                if name.startswith("res/"):
                    continue
                if name in edited:
                    continue
                if name in reviewed:
                    assert base.read(name) == output.read(name), "Reviewed-untouched DEX changed: " + name
                    continue
                assert base.read(name) == output.read(name), "Unrelated payload changed: " + name
            with tempfile.TemporaryDirectory(prefix="sciencenews-check-") as directory:
                work = Path(directory)
                stock = work / "stock.apk"
                stock.write_bytes(bundle.read("base.apk"))
                javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
                run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java",
                    root / "tests/RemoteAtvDexCheck.java", root / "tests/ScienceNewsDexCheck.java")
                print(run(args.java, "-Xmx3g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                          "ScienceNewsDexCheck", stock, args.output).strip())
        for name in bundle.namelist():
            if name.endswith(".apk"):
                with zipfile.ZipFile(io.BytesIO(bundle.read(name))) as split:
                    for native in split.namelist():
                        if native.startswith("lib/") and not native.endswith("/"):
                            assert split.read(native) == output.read(native), "Native library changed: " + native
    badging = run(args.aapt2, "dump", "badging", args.output)
    assert re.search("package: name='com[.]appsfornexus[.]dailysciencenews'", badging), "Package changed"
    assert re.search("versionCode='238'", badging), "Version code changed"
    assert re.search("versionName='23[.]8'", badging), "Version name changed"
    print("PASS: subscription gate, package identity, split natives and unrelated payloads retained")


if __name__ == "__main__":
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())



