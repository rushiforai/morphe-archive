"""Patch real Remote ATV inputs with every ABI retained or with each ABI alone."""
import argparse
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile

from verify_remote_atv_output import verify


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ["stock", "bundle"]: parser.add_argument(name, type=Path)
    for name in ["java", "dexlib-jar", "aapt2"]: parser.add_argument("--" + name, type=Path, required=True)
    args = parser.parse_args()
    args.dexlib_jar = args.dexlib_jar.resolve()
    args.bundle = args.bundle.resolve()
    args.stock = args.stock.resolve()
    split_tokens = {"arm64-v8a": "arm64", "armeabi-v7a": "armeabi", "x86_64": "x86_64"}
    with tempfile.TemporaryDirectory(prefix="remote-atv-abis-") as directory:
        work = Path(directory)
        for abi in ["all", *split_tokens, "none"]:
            candidate = work / (abi + ".apkm")
            with zipfile.ZipFile(args.stock) as source, zipfile.ZipFile(candidate, "w") as target:
                for item in source.infolist():
                    architecture = next((k for k, token in split_tokens.items()
                                         if item.filename.endswith(".apk") and token in item.filename), None)
                    if architecture and abi != "all" and architecture != abi: continue
                    target.writestr(item, source.read(item))
            result = work / (abi + ".json")
            output = work / (abi + ".apk")
            run = subprocess.run([str(args.java), "-Xmx3g", "-jar", str(args.dexlib_jar), "patch",
                "-p", str(args.bundle), "--validate", "--unsigned", "-o", str(output),
                "-r", str(result), str(candidate)], capture_output=True, text=True)
            assert result.is_file(), run.stdout[-2000:] + run.stderr[-2000:]
            report = json.loads(result.read_text())
            if abi == "none":
                assert not report["success"] and "has no Flutter library" in report.get("failureReason", ""), report
                assert not output.exists()
                print("PASS: native-free input rejected clearly", flush=True)
                continue
            assert run.returncode == 0 and report["success"], report.get("failureReason", run.stderr[-2000:])
            print("Checking architecture selection:", abi, flush=True)
            verify(argparse.Namespace(stock=candidate, output=output, java=args.java,
                dexlib_jar=args.dexlib_jar, aapt2=args.aapt2))
    print("PASS: universal and all 3 single-ABI selections; no-native input rejected")


if __name__ == "__main__": main()
