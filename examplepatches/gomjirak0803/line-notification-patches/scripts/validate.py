"""Verify known inputs, patch both APKMs, and check emitted DEX contracts. No signing/install."""
from pathlib import Path
import hashlib
import json
import os
import subprocess
import zipfile
from build import ROOT, tool_paths, BUILD, VERSION

INPUTS = [
    ("arm64", "jp.naver.line.android_26.16.0-261600106_1arch_2dpi_431a0327635030679c9237e883e37ffe_apkmirror.com.apkm",
     "e059b2a35a0c5bcacb9fd0fe1512d099fbc18c2fcab16e0b47788455eff03338",
     "26331d398d421c0bc61d439c6df5fd9492519dd8940f342b5784df4676b96c42"),
    ("universal", "jp.naver.line.android_26.16.0-261600106_2arch_6dpi_27e24416bed2114af71681c9f1fc7b86_apkmirror.com.apkm",
     "4a82c3173a935c52dbe96b8768b73a2dda7284b860f37e4982d72b5672dbf1af", "a2a39613d1899d967cd016725e12e14268b6fc6d79386eee8ff821d3a9a90d16"),
]


def sha256(path):
    with path.open("rb") as source:
        return hashlib.file_digest(source, "sha256").hexdigest()


def main():
    java, android, _, runtime, _ = tool_paths()
    bundle = ROOT / f"patches/build/libs/line-notification-patches-{VERSION}.mpp"
    output = ROOT / "artifacts"
    output.mkdir(exist_ok=True)
    tests = BUILD / "tests"
    tests.mkdir(parents=True, exist_ok=True)
    subprocess.run([str(java.with_name("javac.exe")), "-encoding", "UTF-8", "-cp", str(runtime),
                    "-d", str(tests), str(ROOT / "tests/integration/ApkContractTest.java")], check=True)
    outcomes = []
    for label, name, container_hash, base_hash in INPUTS:
        source = ROOT / "apk" / name
        actual = sha256(source)
        if container_hash and actual != container_hash:
            raise SystemExit(f"Unrecognized input container: {name}")
        with zipfile.ZipFile(source) as archive:
            if hashlib.sha256(archive.read("base.apk")).hexdigest() != base_hash:
                raise SystemExit(f"Unrecognized input base.apk: {name}")
        apk = output / f"line-{label}-validation-unsigned.apk"
        report = output / f"{label}-validation.json"
        log = output / f"{label}-validation.log"
        command = [java, "-Xmx4g", "-jar", runtime, "patch", "--exclusive", "-p", bundle]
        for patch in ("Notification settings", "Not Too Much Silent", "More Chat Info", "No reply", "Mark as read", "Restore push registration"):
            command.extend(["-e", patch])
        command.extend(["--unsigned", "--validate", "--bytecode-mode", "FULL", "-r", report, "-o", apk, source])
        print("Patching", label, flush=True)
        with log.open("w", encoding="utf-8") as stream:
            subprocess.run([str(v) for v in command], cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT, check=True)
        result = json.loads(report.read_text(encoding="utf-8"))
        if not result.get("success") or result.get("failedPatches"):
            raise SystemExit(f"Patching failed; inspect {log}")
        result = subprocess.run([str(java), "-Xmx2g", "-cp", os.pathsep.join([str(tests), str(runtime), str(android)]),
                                 "ApkContractTest", str(apk)], capture_output=True, text=True)
        if result.returncode:
            print(result.stderr, flush=True)
            result.check_returncode()
        print(result.stdout.strip(), flush=True)
        outcomes.append({"variant": label, "inputSha256": actual, "outputSha256": sha256(apk),
                         "staticContracts": result.stdout.strip(), "patching": True, "deviceTested": False})
    # A separate selection catches accidental dependencies on More Chat Info, its
    # resources, or quiet-mode service hooks. This APK is never signed/installed.
    selection_apk = output / "line-arm64-read-only-validation-unsigned.apk"
    selection_report = output / "arm64-read-only-validation.json"
    selection_log = output / "arm64-read-only-validation.log"
    command = [java, "-Xmx4g", "-jar", runtime, "patch", "--exclusive", "-p", bundle,
               "-e", "Mark as read", "--unsigned", "--validate", "--bytecode-mode", "FULL",
               "-r", selection_report, "-o", selection_apk, ROOT / "apk" / INPUTS[0][1]]
    print("Patching arm64 with Mark as read only", flush=True)
    with selection_log.open("w", encoding="utf-8") as stream:
        subprocess.run([str(v) for v in command], cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT, check=True)
    result = json.loads(selection_report.read_text(encoding="utf-8"))
    if not result.get("success") or result.get("failedPatches"):
        raise SystemExit(f"Read-only selection failed; inspect {selection_log}")
    result = subprocess.run([str(java), "-Xmx2g", "-cp", os.pathsep.join([str(tests), str(runtime), str(android)]),
                             "ApkContractTest", str(selection_apk), "read-only"], capture_output=True, text=True)
    if result.returncode:
        print(result.stderr, flush=True)
        result.check_returncode()
    print(result.stdout.strip(), flush=True)
    summary = {"bundleSha256": sha256(bundle), "inputs": outcomes, "signed": False, "installed": False,
               "selectionMatrix": [{"variant": "arm64", "selectedPatches": ["Mark as read"],
                                    "outputSha256": sha256(selection_apk), "staticContracts": result.stdout.strip(),
                                    "patching": True, "deviceTested": False}]}
    (output / "validation-summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print("Both APKMs passed. Outputs are unsigned local validation files, not installable releases.")


if __name__ == "__main__":
    main()
