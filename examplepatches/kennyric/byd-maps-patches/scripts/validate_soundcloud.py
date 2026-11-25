"""Rebuild each SoundCloud port independently and together with Android Auto Home."""
import argparse
import io
import json
from pathlib import Path
import subprocess
import zipfile


PATCHES = ["Disable analytics", "Disable consent popup", "Enable SoundCloud Go", "Ignore device limit"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apkm", type=Path)
    parser.add_argument("mpp", type=Path)
    parser.add_argument("cli", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(args.apkm) as archive:
        expected_abis = set()
        for name in archive.namelist():
            if not name.endswith(".apk"):
                continue
            with zipfile.ZipFile(io.BytesIO(archive.read(name))) as split:
                expected_abis.update(p.split("/")[1] for p in split.namelist()
                                     if p.startswith("lib/") and p.endswith(".so"))
    scenarios = [("single-" + str(i), [name]) for i, name in enumerate(PATCHES)]
    scenarios += [("combined", PATCHES), ("with-home", PATCHES + ["Home in Android Auto"])]
    for label, names in scenarios:
        report = (args.output / (label + ".json")).resolve()
        output = (args.output / (label + ".apk")).resolve()
        command = ["java", "-Xmx4g", "-jar", str(args.cli.resolve()), "patch", str(args.apkm.resolve()),
                   "-p", str(args.mpp.resolve()), "--exclusive", "--validate", "--unsigned",
                   "-o", str(output), "-r", str(report),
                   "-t", str((args.output / (label + "-temp")).resolve())]
        for name in names:
            command += ["-e", name]
        with (args.output / (label + ".log")).open("w") as log:
            subprocess.run(command, check=True, stdout=log, stderr=subprocess.STDOUT)
        result = json.loads(report.read_text())
        assert result.get("success") and not result.get("failedPatches"), result
        assert set(result.get("appliedPatches", [])) == set(names), result
        assert (result.get("packageName"), result.get("packageVersion")) == (
            "com.soundcloud.android", "2026.11.02-release"), result
        assert {s["step"] for s in result["stepResults"]} >= {"PATCHING", "REBUILDING"}
        assert all(s["success"] for s in result["stepResults"]), result
        with zipfile.ZipFile(output) as rebuilt:
            actual_abis = {p.split("/")[1] for p in rebuilt.namelist()
                           if p.startswith("lib/") and p.endswith(".so")}
            manifest = rebuilt.read("AndroidManifest.xml")

        def manifest_has(value):
            utf16 = value.encode("utf-16-le")
            return value.encode() in manifest or utf16 in manifest

        assert manifest_has("com.soundcloud.android.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"), "manifest lost SoundCloud permissions"
        assert actual_abis == expected_abis, (actual_abis, expected_abis)
        subprocess.run(["java", "-cp", str(args.cli.resolve()),
                        str(Path(__file__).resolve().parents[1] / "tests/SoundcloudDexRegression.java"),
                        str(output), *names], check=True)
        print("PASS " + label + ": " + ", ".join(names), flush=True)


if __name__ == "__main__":
    main()
