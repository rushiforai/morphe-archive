"""Apply the Podimo patches and verify them with independent decodes and ART probes.

Podimo's obfuscated package names differ only by letter case (Db/db, Tc/tc, ...), so
every apktool decode must happen on a case-sensitive volume. The default work volume
is /Volumes/podimo-re when mounted; any case-sensitive directory works via --work.

The flow mirrors scripts/validate_targets.py:

- verify the original input has none of the patch effects;
- apply each patch alone and both together with Morphe Desktop, checking each report;
- for every selection, decode original and patched output independently and run
  tests/verify_podimo.py (full method-inventory comparison);
- run tests/run_podimo_guest.py against the original and the patched output on the
  connected phone (no installation needed);
- optionally install the combined output with --install for runtime evidence.

Usage:
  python3 tests/validate_podimo.py ~/Downloads/Podimo-3.5.1-....apks [--serial SERIAL] [--install]
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tests"))
from podimo_contracts import BASE_SHA256, PATCH_NAMES  # noqa: E402

DESKTOP = ROOT / ".tools/morphe-desktop-1.19.1-all.jar"
INPUT_FILES = ("base.apk", "split_config.arm64_v8a.apk", "split_config.xxxhdpi.apk")


def run(command, **kwargs):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True, **kwargs)
    if result.returncode:
        print(result.stdout[-4000:])
        print(result.stderr[-4000:])
        raise SystemExit(f"Failed: {' '.join(str(x) for x in command[:4])}; exit {result.returncode}")
    return result.stdout


def case_sensitive(directory: Path) -> bool:
    probe = directory / ".case-probe"
    probe.write_text("upper")
    lower = directory / ".CASE-PROBE"
    distinct = not lower.exists() or lower.read_text() == "upper"
    probe.unlink(missing_ok=True)
    if lower.exists() and distinct:
        lower.unlink()
    return distinct


def prepare_input(original: Path, out: Path) -> Path:
    if original.is_dir():
        files = sorted(p for p in original.iterdir() if p.suffix.lower() == ".apk")
        unexpected = [p.name for p in original.iterdir() if not p.is_file() or p.suffix.lower() != ".apk"]
        if unexpected:
            raise SystemExit(f"Unexpected non-APK input: {unexpected}")
    elif original.suffix.lower() == ".apks":
        files = [out / name for name in INPUT_FILES]
        with zipfile.ZipFile(original) as archive:
            for name in INPUT_FILES:
                (out / name).write_bytes(archive.read(name))
    else:
        raise SystemExit("Provide the Podimo .apks bundle or a directory of base and split APKs")
    staged = out / "input.apks"
    if staged.resolve() != original.resolve():
        with zipfile.ZipFile(staged, "w", compression=zipfile.ZIP_STORED) as archive:
            for apk in files:
                archive.write(apk, apk.name)
    return staged


def decode(apk: Path, destination: Path) -> Path:
    run(["apktool", "d", "-f", "-o", str(destination), str(apk)])
    return destination


def apply_patch(bundle: Path, staged: Path, selection: list[str], output: Path, report: Path) -> None:
    command = ["java", "-jar", DESKTOP, "patch", "-p", bundle, "--exclusive", "--validate",
               "--bytecode-mode", "FULL", "-o", str(output), "-r", str(report)]
    for name in selection:
        command += ["-e", name]
    command.append(str(staged))
    run(command)
    report_data = json.loads(report.read_text())
    assert report_data["success"], f"Patching failed: {report_data.get('failedPatches')}"
    applied = set(report_data["appliedPatches"])
    expected = set(selection)
    assert applied == expected, f"Patch report mismatch: applied {applied}, expected {expected}"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path, help="Podimo .apks bundle or a directory with base and split APKs")
    parser.add_argument("--work", type=Path, default=Path("/Volumes/podimo-re/validation"),
                        help="Case-sensitive work directory")
    parser.add_argument("--serial", default="3B164A01H1Z00000", help="USB phone serial for the ART probe")
    parser.add_argument("--install", action="store_true", help="Install the combined output on the phone afterwards")
    parser.add_argument("--skip-art", action="store_true", help="Skip the on-device ART probe")
    args = parser.parse_args()
    work = args.work
    work.mkdir(parents=True, exist_ok=True)
    if not case_sensitive(work):
        raise SystemExit(f"Work directory must be case-sensitive: {work}")
    version = (ROOT / "gradle.properties").read_text().split("version = ")[1].splitlines()[0].strip()
    bundle = ROOT / "patches/build/libs" / f"patches-{version}.mpp"
    if not bundle.is_file():
        raise SystemExit(f"Build the bundle first: {bundle}")

    staged = prepare_input(args.input, work)
    base = work / "base.apk"
    if not base.is_file():
        with zipfile.ZipFile(staged) as archive:
            base.write_bytes(archive.read("base.apk"))
    digest = hashlib.sha256(base.read_bytes()).hexdigest()
    assert digest == BASE_SHA256, f"Unexpected base.apk: {digest}"

    original_tree = decode(base, work / "decoded-original")
    run([sys.executable, "tests/verify_podimo.py", str(original_tree), "--apk", str(base)], cwd=ROOT)
    if not args.skip_art:
        run([sys.executable, "tests/run_podimo_guest.py", "--serial", args.serial, "--apk", str(base)], cwd=ROOT)

    outputs = {}
    for selection in [[name] for name in sorted(PATCH_NAMES)] + [sorted(PATCH_NAMES)]:
        name = "-".join(p.lower().replace(" ", "-") for p in selection)
        output = work / f"podimo-{name}.apk"
        if output.resolve() in {staged.resolve(), base.resolve()}:
            raise SystemExit(f"Refusing to replace original input: {output}")
        report = work / f"report-{name}.json"
        apply_patch(bundle, staged, selection, output, report)
        patched_tree = decode(output, work / f"decoded-{name}")
        command = [sys.executable, "tests/verify_podimo.py", str(original_tree), "--patched", str(patched_tree)]
        for patch in selection:
            command += ["-e", patch]
        run(command, cwd=ROOT)
        outputs[tuple(selection)] = output
        print(f"PASS: podimo {selection}", flush=True)

    combined = outputs[tuple(sorted(PATCH_NAMES))]
    if not args.skip_art:
        # The behavioral ART probe covers the complete feature: both patches together.
        run([sys.executable, "tests/run_podimo_guest.py", "--serial", args.serial,
             "--apk", str(combined), "--patched"], cwd=ROOT)

    combined = outputs[tuple(sorted(PATCH_NAMES))]
    if args.install:
        adb = Path.home() / "Library/Android/sdk/platform-tools/adb"
        state = run([adb, "-s", args.serial, "get-state"]).strip()
        if state != "device":
            raise SystemExit("Device unavailable for installation")
        run([adb, "-s", args.serial, "install", "-r", str(combined)])
        print(f"Installed {combined} on {args.serial}")
    print("PASS: Podimo patch validation complete")


if __name__ == "__main__":
    main()
