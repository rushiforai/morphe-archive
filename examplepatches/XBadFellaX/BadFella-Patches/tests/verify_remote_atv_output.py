"""Verify actual Remote ATV 6.1.0 APKM -> patched APK output, including all ABIs."""
import argparse
import hashlib
import io
import os
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

NATIVE = {
    "arm64-v8a": "74df8163897c74ee439085f18b31e69145c56999ef12926f9e24b1232cb78552",
    "armeabi-v7a": "5b3e03551904793eea5cef98c3a14b380d3f00e1bff66bf9c3273075b6b79691",
    "x86_64": "5cfd55baf59893c11a2a32ec441cd05b9e7d45085493a595ea2baf2900a2c413",
}
STATUS = {
    "arm64-v8a": "27a54169f0134529b675b5aa0f097a1debb83394f92c1d9cad8db8b3431687c1",
    "armeabi-v7a": "c5c71d38e6b0e725ec6104f71c25793f3f978d11eab087e0d44bca23d4d480b5",
    "x86_64": "cb36a443217cd5bce6246364ff38a7c0a68c050338d9fb5cf0557cc3dd1d95fb",
}


def run(*command):
    return subprocess.check_output(list(map(str, command)), text=True, encoding="utf-8", stderr=subprocess.STDOUT)


def verify(args):
    root = Path(__file__).resolve().parents[1]
    with zipfile.ZipFile(args.stock) as stock, zipfile.ZipFile(args.output) as output:
        entries = output.namelist()
        assert len(entries) == len(set(entries)), "Duplicate archive entries"
        assert not any(n.startswith("assets/audience_network/") or n.endswith("/libpairipcore.so") for n in entries)
        natives = {}
        for name in stock.namelist():
            if not name.endswith(".apk"): continue
            with zipfile.ZipFile(io.BytesIO(stock.read(name))) as split:
                for item in split.infolist():
                    if not item.filename.startswith("lib/"): continue
                    natives[item.filename] = (split.read(item), item.compress_type)
        expected = {n for n in natives if not n.endswith("/libpairipcore.so")}
        assert {n for n in entries if n.startswith("lib/") and not n.endswith("/")} == expected
        for name in expected:
            data, compression = natives[name]
            actual = output.read(name)
            if name.endswith("/libflutter.so"):
                assert hashlib.sha256(actual).hexdigest() == NATIVE[name.split("/")[1]], "Wrong Flutter engine"
            elif name.endswith("/libapp.so"):
                abi = name.split("/")[1]
                assert hashlib.sha256(actual).hexdigest() == STATUS[abi], "Wrong status labels"
                restored = bytearray(actual)
                for text in [b"Activate premium", b"Upgrade to premium for an Ad-Free Experience"]:
                    assert data.count(text) == 1
                    offset = data.index(text)
                    restored[offset:offset + len(text)] = text
                    if abi == "armeabi-v7a": restored[offset - 8:offset - 4] = data[offset - 8:offset - 4]
                assert restored == data, "Dart instructions or data outside reviewed labels changed"
            else:
                assert actual == data, "App/Dart or shared-counter native code changed: " + name
            assert output.getinfo(name).compress_type == compression, "Native compression changed: " + name
        with zipfile.ZipFile(io.BytesIO(stock.read("base.apk"))) as base:
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex | {"classes4.dex"} == {n for n in entries if re.fullmatch(r"classes\d*\.dex", n)}, "DEX set changed"
            for name in base.namelist():
                if name.startswith("assets/flutter_assets/"):
                    assert base.read(name) == output.read(name), "Flutter asset changed: " + name
        with tempfile.TemporaryDirectory(prefix="remote-atv-check-") as directory:
            work = Path(directory)
            base = work / "stock.apk"
            base.write_bytes(stock.read("base.apk"))
            javac = args.java.with_name("javac.exe" if args.java.suffix == ".exe" else "javac")
            run(javac, "-cp", args.dexlib_jar, "-d", work, root / "tools/DexInventory.java", root / "tests/RemoteAtvDexCheck.java")
            print(run(args.java, "-Xmx3g", "-cp", str(work) + os.pathsep + str(args.dexlib_jar),
                "RemoteAtvDexCheck", base, args.output, root / "patches/src/main/resources/remoteatv/strings-6.1.0.tsv").strip())
    manifest = run(args.aapt2, "dump", "xmltree", args.output, "--file", "AndroidManifest.xml")
    assert "com.pairip." not in manifest
    assert "tech.simha.androidtvremote.MainActivity" in manifest
    for permission in ["INTERNET", "RECORD_AUDIO", "CHANGE_WIFI_MULTICAST_STATE", "ACCESS_WIFI_STATE", "ACCESS_NETWORK_STATE"]:
        assert "android.permission." + permission in manifest, "Required permission removed: " + permission
    for permission in ["com.google.android.gms.permission.AD_ID", "com.android.vending.CHECK_LICENSE", "android.permission.ACCESS_ADSERVICES_"]:
        assert permission not in manifest, "Advertising/licensing permission retained"
    abi_count = len({name.split("/")[1] for name in expected})
    print(f"PASS: {abi_count} supplied native ABI(s), only reviewed Dart display labels changed, original assets/compression, restored engine checksums and retained remote-control permissions")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ["stock", "output"]: parser.add_argument(name, type=Path)
    for name in ["java", "dexlib-jar", "aapt2"]: parser.add_argument("--" + name, type=Path, required=True)
    verify(parser.parse_args())
