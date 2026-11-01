"""Apply and inspect each real APK patch selection. Does not install on a device."""
import argparse
import json
from pathlib import Path
import re
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "build/validation"
DESKTOP = ROOT / ".tools/morphe-desktop-1.19.1-all.jar"


def run(command: list[str], name: str) -> None:
    result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (OUT / f"{name}.log").write_text(result.stdout)
    if result.returncode:
        print(result.stdout)
        raise SystemExit(f"Failed {name}; exit {result.returncode}")


def decoded(apk: Path, name: str, ads: bool, premium: bool) -> None:
    destination = OUT / f"decoded-{name}"
    run(["apktool", "d", "-f", "-o", str(destination), str(apk)], f"decode-{name}")
    command = [sys.executable, "tests/verify_decoded.py", str(destination)]
    if ads:
        command.append("--ads")
    if premium:
        command.append("--premium")
    run(command, f"verify-{name}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--bundle", type=Path, help="Override the bundle for the current project version")
    args = parser.parse_args()
    original = args.apk.resolve()
    if args.bundle:
        bundle = args.bundle.resolve()
    else:
        version = re.search(r"^version\s*=\s*(\S+)\s*$", (ROOT / "gradle.properties").read_text(), re.M)
        if version is None:
            raise SystemExit("No project version in gradle.properties; specify --bundle")
        bundle = ROOT / "patches/build/libs" / f"patches-{version[1]}.mpp"
    if not bundle.is_file():
        raise SystemExit(f"Build the bundle first: {bundle}")
    OUT.mkdir(parents=True, exist_ok=True)
    run([sys.executable, "scripts/bootstrap.py"], "bootstrap")
    reference = original
    if original.suffix.lower() != ".apk":
        with zipfile.ZipFile(original) as archive:
            bases = [n for n in archive.namelist() if Path(n).name == "base.apk"]
            if len(bases) != 1:
                raise SystemExit("APK set must contain one base.apk for baseline inspection")
            reference = OUT / "input-base.apk"
            reference.write_bytes(archive.read(bases[0]))
    run(["apksigner", "verify", "--print-certs", str(reference)], "input-certificate")
    certificate = re.search(r"Signer #1 certificate SHA-256 digest: ([0-9a-f]{64})", (OUT / "input-certificate.log").read_text())
    assert certificate, "Read the independently verified input signing certificate"
    decoded(reference, "original", False, False)
    for name, selections, ads, premium in [
        ("google", ["Fix Google services"], False, False),
        ("ads", ["Hide ads"], True, False),
        ("premium", ["Hide Premium banner"], False, True),
        ("both", ["Hide ads", "Hide Premium banner"], True, True),
    ]:
        output = OUT / f"buienalarm-{name}.apk"
        report = OUT / f"{name}.json"
        command = ["java", "-jar", str(DESKTOP), "patch", "-p", str(bundle),
                   "--exclusive", "--validate", "--bytecode-mode", "FULL",
                   "-o", str(output), "-r", str(report)]
        for selection in selections:
            command += ["-e", selection]
        command.append(str(original))
        run(command, f"patch-{name}")
        result = json.loads(report.read_text())
        assert result["success"] and not result["failedPatches"]
        # The CLI report names top-level selections, not implicitly executed
        # dependencies. The decoded-DEX verifier below checks the Google fix.
        assert set(result["appliedPatches"]) == set(selections)
        run(["apksigner", "verify", "--verbose", str(output)], f"signature-{name}")
        decoded(output, name, ads, premium)
        run([sys.executable, "tests/verify_google_compatibility.py", str(OUT / f"decoded-{name}"), certificate[1]], f"google-{name}")
        print(f"PASS: {name}; patch report, signature, decoded resources, original certificate and SDK wrappers", flush=True)


if __name__ == "__main__":
    main()
