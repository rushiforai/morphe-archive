"""Verify known inputs, patch both APKMs, and check emitted DEX contracts. No signing/install."""
from pathlib import Path
import hashlib
import json
import os
import subprocess
import zipfile
from build import ROOT, tool_paths, BUILD, VERSION

INPUTS = [
    ("arm64", "jp.naver.line.android_26.19.0-261900178_1arch_2dpi_292f9559936301977ea38a3dfc409fe9_apkmirror.com.apkm",
     "854c7c98b4880d30ff7a363210016f0d2fed70bccbe32d8a188a8df3d8fbd040",
     "04c4e969baa75d4f72efdd953aea850c7d3ecb3527a2044aee3ac0aff4189d99"),
    ("universal", "jp.naver.line.android_26.19.0-261900178_2arch_6dpi_3e9e3b0118e8a92f31c5e21c4bcff579_apkmirror.com.apkm",
     "ce7be5ca770739731ec44665cdd94e4e0d601149144e416aef1c0b904a3701e2",
     "5234750455cf0757edcc9de5c1d4e05ed7c5ee1a82405225fae99455e2adefe6"),
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
    # Standalone patch selections catch accidental cross-patch dependencies on
    # hooks, resources, or runtime flags. These APKs are never signed/installed.
    selection_matrix = []
    for mode, patch_name in (
        ("read-only", "Mark as read"),
        ("info-only", "More Chat Info"),
        ("silent-only", "Not Too Much Silent"),
    ):
        selection_apk = output / f"line-arm64-{mode}-validation-unsigned.apk"
        selection_report = output / f"arm64-{mode}-validation.json"
        selection_log = output / f"arm64-{mode}-validation.log"
        command = [java, "-Xmx4g", "-jar", runtime, "patch", "--exclusive", "-p", bundle,
                   "-e", patch_name, "--unsigned", "--validate", "--bytecode-mode", "FULL",
                   "-r", selection_report, "-o", selection_apk, ROOT / "apk" / INPUTS[0][1]]
        print(f"Patching arm64 with {patch_name} only", flush=True)
        with selection_log.open("w", encoding="utf-8") as stream:
            subprocess.run([str(v) for v in command], cwd=ROOT, stdout=stream, stderr=subprocess.STDOUT, check=True)
        result = json.loads(selection_report.read_text(encoding="utf-8"))
        if not result.get("success") or result.get("failedPatches"):
            raise SystemExit(f"{mode} selection failed; inspect {selection_log}")
        result = subprocess.run([str(java), "-Xmx2g", "-cp", os.pathsep.join([str(tests), str(runtime), str(android)]),
                                 "ApkContractTest", str(selection_apk), mode], capture_output=True, text=True)
        if result.returncode:
            print(result.stderr, flush=True)
            result.check_returncode()
        print(result.stdout.strip(), flush=True)
        selection_matrix.append({"variant": "arm64", "selectedPatches": [patch_name],
                                 "outputSha256": sha256(selection_apk), "staticContracts": result.stdout.strip(),
                                 "patching": True, "deviceTested": False})
    summary = {"bundleSha256": sha256(bundle), "inputs": outcomes, "signed": False, "installed": False,
               "selectionMatrix": selection_matrix}
    (output / "validation-summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print("Both APKMs passed. Outputs are unsigned local validation files, not installable releases.")


if __name__ == "__main__":
    main()
