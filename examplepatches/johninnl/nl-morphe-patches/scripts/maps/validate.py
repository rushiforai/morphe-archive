"""Apply every Maps patch profile to the exact supported standalone APK."""
import argparse
import hashlib
import json
import re
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
TARGET_SHA256 = "81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004"
PROFILES = {
    "defaults": [],
    "microg-re": ["Add microG-RE support"],
    "original-microg": ["Add original microG support"],
    "media": ["Follow playing media"],
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--bundle", type=Path, required=True)
    parser.add_argument("--desktop", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--android-jar", type=Path, help="Check emitted references against this Android SDK boot API")
    parser.add_argument("--profile", choices=PROFILES, default="defaults")
    parser.add_argument("--continue-on-error", action="store_true", help="Diagnostic inventory only; failures still fail validation")
    args = parser.parse_args()
    if hashlib.sha256(args.apk.read_bytes()).hexdigest() != TARGET_SHA256:
        raise SystemExit("Input differs from the reviewed Maps APK")
    bundle_digest = hashlib.sha256(args.bundle.read_bytes()).hexdigest()
    args.out.mkdir(parents=True, exist_ok=True)
    name = args.profile
    report = args.out / f"{name}.json"
    output = args.out / f"{name}.apk"
    command = ["java", "-Xmx10g", "-jar", str(args.desktop.resolve()), "patch",
               "-p", str(args.bundle.resolve()), "--validate", "--bytecode-mode", "FULL",
               "-o", str(output.resolve()), "-r", str(report.resolve())]
    if args.continue_on_error:
        command.append("--continue-on-error")
    for patch in PROFILES[name]:
        command += ["-e", patch]
    command.append(str(args.apk.resolve()))
    with (args.out / f"{name}.log").open("w") as log:
        result = subprocess.run(command, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT)
    log_text = (args.out / f"{name}.log").read_text()
    if re.search(r"Invalid register:|[Ss]mali.*(?:error|exception)|[0-9]+,[0-9]+\].*(?:mismatched input|no viable alternative)", log_text):
        raise SystemExit("Assembler errors appeared despite patcher report; inspect the log")
    data = json.loads(report.read_text()) if report.exists() else {}
    print(json.dumps({"profile": name, "exit": result.returncode, "success": data.get("success"),
                      "failed": [x["name"] if isinstance(x,dict) else x for x in data.get("failedPatches",[])], "applied": data.get("appliedPatches")}, indent=2))
    if result.returncode or not data.get("success") or data.get("failedPatches"):
        raise SystemExit(1)
    if hashlib.sha256(args.bundle.read_bytes()).hexdigest() != bundle_digest:
        raise SystemExit("Bundle changed while patching; validation cannot bind an artifact")
    subprocess.run(["apksigner", "verify", "--verbose", str(output)], check=True)
    if args.android_jar:
        subprocess.run(["java", "-cp", str(args.desktop.resolve()),
                        str(ROOT / "scripts/maps/VerifyReferences.java"),
                        str(output.resolve()), str(args.android_jar.resolve())], check=True)
    (args.out / f"{name}-evidence.json").write_text(json.dumps({
        "input_sha256": TARGET_SHA256, "bundle_sha256": bundle_digest,
        "output_sha256": hashlib.sha256(output.read_bytes()).hexdigest(),
        "applied": data["appliedPatches"], "failed": [],
        "signature_verified": True, "references_verified": bool(args.android_jar),
    }, indent=2) + "\n")


if __name__ == "__main__":
    main()
