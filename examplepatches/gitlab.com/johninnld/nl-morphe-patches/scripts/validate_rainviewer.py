"""Apply RainViewer controls together and independently to the complete original APKM."""
import argparse
import json
from pathlib import Path
import subprocess

PATCHES = ["Hide ads", "Disable tracking", "Skip consent screens", "Skip subscription screens"]
OPTIONAL_PATCHES = ["Fix Google services", "Fix integrity", "Enable local Pro features", "Hide AI insights", "Hide weather warnings overlay"]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("apkm", type=Path)
    p.add_argument("mpp", type=Path)
    p.add_argument("cli", type=Path)
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--compatibility-only", action="store_true", help="Validate compatibility/UI controls independently and with privacy controls")
    a = p.parse_args()
    a.output.mkdir(parents=True, exist_ok=True)
    singles = OPTIONAL_PATCHES if a.compatibility_only else PATCHES + OPTIONAL_PATCHES
    scenarios = [("combined", PATCHES), ("combined-local-pro", PATCHES + OPTIONAL_PATCHES)]
    scenarios += [("single-" + str(i), [n]) for i, n in enumerate(singles)]
    for label, patches in scenarios:
        report = a.output / (label + ".json")
        cmd = ["java", "-Xmx4g", "-jar", str(a.cli.resolve()), "patch", str(a.apkm.resolve()),
               "-p", str(a.mpp.resolve()), "--exclusive", "--validate", "--unsigned", "--striplibs", "arm64-v8a",
               "-o", str((a.output / (label + ".apk")).resolve()), "-r", str(report.resolve()),
               "-t", str((a.output / (label + "-temp")).resolve())]
        for name in patches:
            cmd += ["-e", name]
        with (a.output / (label + ".log")).open("w") as log:
            subprocess.run(cmd, check=True, stdout=log, stderr=subprocess.STDOUT)
        result = json.loads(report.read_text())
        assert result.get("success") and not result.get("failedPatches"), result
        assert set(result.get("appliedPatches", [])) == set(patches), result
        assert (result.get("packageName"), result.get("packageVersion")) == ("com.lucky_apps.RainViewer", "8.4.1")
        assert {s["step"] for s in result["stepResults"]} >= {"PATCHING", "REBUILDING"}
        assert all(s["success"] for s in result["stepResults"])
        print("PASS " + label + ": " + ", ".join(patches), flush=True)


if __name__ == "__main__":
    main()
