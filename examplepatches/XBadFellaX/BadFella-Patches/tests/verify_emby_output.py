"""Verify a stock 3.5.72 APK against the output with both Emby patches selected."""
import argparse
import json
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile


def run(*command):
    return subprocess.check_output(list(map(str, command)), text=True, encoding="utf-8", stderr=subprocess.STDOUT)


def verify(args):
    root = Path(__file__).resolve().parents[1]
    native = "assets/www/native/android/iap.js"
    shared = "assets/www/modules/iap.js"
    with zipfile.ZipFile(args.stock) as before, zipfile.ZipFile(args.output) as after:
        assert len(after.namelist()) == len(set(after.namelist())), "Duplicate ZIP entries"
        for name in before.namelist():
            if name.startswith("META-INF/"): continue
            assert name in after.namelist(), "Unexpected deletion: " + name
            if name not in {native, shared, "AndroidManifest.xml", "resources.arsc"} and not re.fullmatch(r"classes\d*\.dex", name):
                assert before.read(name) == after.read(name), "Unrelated entry changed: " + name
            if name.startswith("lib/"):
                assert before.getinfo(name).compress_type == after.getinfo(name).compress_type, "Native compression changed"
        assert {n for n in after.namelist() if not n.endswith("/")} <= set(before.namelist()), "Unexpected runtime hook/extension entry"
        n, s = after.read(native).decode(), after.read(shared).decode()
        expected = before.read(native).decode()
        for function, following, body in [("isUnlockedByDefault", "allowNonPremiere", "return Promise.resolve();"),
                                            ("allowNonPremiere", "restorePurchase", "return true;")]:
            pattern = rf"function {function}\(feature\) \{{[\s\S]*?\n  }}(?=\n  function {following})"
            expected, count = re.subn(pattern, f"function {function}(feature) {{\n    {body}\n  }}", expected)
            assert count == 1, "Native anchor drift"
        assert n == expected, "Unexpected native IAP edit"
        expected, count = re.subn(r"isUnlockedByDefault:function\(feature,options\)\{[^{}]+}",
                                  "isUnlockedByDefault:function(feature,options){return Promise.resolve()}", before.read(shared).decode())
        assert count == 1 and s == expected, "Unexpected shared IAP edit"
        with tempfile.TemporaryDirectory(prefix="emby-output-") as directory:
            work = Path(directory)
            for name, text in [("native.js", n), ("shared.js", s)]:
                path = work / name; path.write_text(text, encoding="utf-8")
                run(args.node, "--check", path)
            functions = [re.search(r"function isUnlockedByDefault\(feature\) \{[^{}]+}", n)[0],
                         re.search(r"function allowNonPremiere\(feature\) \{[^{}]+}", n)[0],
                         re.search(r"isUnlockedByDefault:(function\(feature,options\)\{[^{}]+})", s)[1]]
            code = "const vm=require('vm'),assert=require('assert');const fs=" + json.dumps(functions) + ";"
            code += "(async()=>{for(const f of ['playback','playback-tv','download','sync','unknown']){for(const i of [0,2])await vm.runInNewContext('('+fs[i]+')')(f,{});assert.equal(vm.runInNewContext('('+fs[1]+')')(f),true)}})().catch(e=>{console.error(e);process.exit(1)})"
            run(args.node, "-e", code)
            jar = args.dexlib_jar.resolve()
            run(args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac"), "-cp", jar, "-d", work,
                root / "tools/DexInventory.java", root / "tests/EmbyDexCheck.java")
            import os
            print(run(args.java, "-Xmx2g", "-cp", str(work) + os.pathsep + str(jar), "EmbyDexCheck", args.stock, args.output).strip())
    manifest = run(args.aapt2, "dump", "xmltree", args.output, "--file", "AndroidManifest.xml")
    assert not any(x in manifest for x in ["com.google.firebase", "com.google.android.datatransport", "FcmFirebaseMessagingService"])
    assert "com.mb.android.MainActivity" in manifest
    print("PASS: exact JS edits and behavior, manifest removal, original assets/native bytes/compression, no added archive entries")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for arg in ["stock", "output"]: parser.add_argument(arg, type=Path)
    parser.add_argument("--java", type=Path, required=True)
    parser.add_argument("--dexlib-jar", type=Path, required=True)
    parser.add_argument("--aapt2", type=Path, required=True)
    parser.add_argument("--node", default="node")
    verify(parser.parse_args())
