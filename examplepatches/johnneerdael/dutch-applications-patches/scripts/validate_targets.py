"""Apply and inspect app-specific patch selections. Does not install on a device."""
import argparse
from contextlib import contextmanager
import json
import hashlib
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
DESKTOP = ROOT / ".tools/morphe-desktop-1.19.1-all.jar"
# Patch -> patches it includes through dependencies.
STREAMING_ORIGINALS = {
    "kijk": "695ec882393b98385046423da5b8d8ca8126e4a5c175e7731cb209ef43452d63",
    "videoland": "c990c0339ac1b8c79031aabccba0046f63ca005266031a18c35051c8b7a73810",
}
APPS = {
    "kijk": {"Hide ads": [], "Disable tracking": [], "Skip consent screens": ["Disable tracking"]},
    "videoland": {"Hide ads": [], "Disable tracking": [], "Skip consent screens": ["Disable tracking"]},
    **{app: {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [],
    } for app in ("nieuwsblad", "dsnieuws", "hbvl")},
    "hln": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
    },
    "detijd": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Skip onboarding": [],
        "Read full articles": ["Hide ads"], "Hide Mijn Tijd (expert)": [],
    },
    "humo": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
    },
    "tvgids": {"Hide ads": [], "Disable tracking": ["Hide ads"],
               "Skip consent screens": ["Disable tracking", "Hide ads"]},
    "marktplaats": {"Hide ads": [], "Disable tracking": ["Hide ads"], "Disable ThreatMetrix": [], "Skip consent screens": ["Disable tracking", "Hide ads"], "Google sign-in via microG-Re": []},
    "9292": {"Fix PairIP startup": [], "Hide ads": ["Fix PairIP startup"],
             "Disable tracking": ["Hide ads", "Fix PairIP startup"],
             "Skip consent screens": ["Disable tracking", "Hide ads", "Fix PairIP startup"]},
    "buienradar": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": [],
        "Disable Swrve and location upload": ["Disable tracking"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "weeronline": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": [], "Unlock Plus": [],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "weerplaza": {
        "Fix Google Maps": [],
        "Hide ads": ["Fix Google Maps"], "Hide Premium banner": ["Fix Google Maps"],
        "Disable tracking": ["Hide ads", "Fix Google Maps"],
        "Skip consent screens": ["Disable tracking", "Hide ads", "Fix Google Maps"],
    },
    "nunl": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "volkskrant": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"], "Read full articles": [],
    },
    "dumpert": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "rtl": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Disable Swrve (expert)": ["Skip consent screens", "Disable tracking", "Hide ads"],
    },
    "vi": {"Read full articles": [], "Hide ads": [], "Disable tracking": ["Hide ads"], "Skip consent screens": ["Disable tracking", "Hide ads"]},
    "teletekst": {"Disable tracking": [], "Hide promotions": []},
    "brabant": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "west": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
    },
    "parool": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"], "Read full articles": [],
    },
    "demorgen": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
    },
    "trouw": {
        "Hide ads": [], "Hide Premium banner": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"], "Read full articles": [],
    },
    **{app: {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
    } for app in ("ad", "tubantia")},
    "nrc": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [], "Hide newspaper tab": [],
    },
    "ftm": {
        "Hide ads": [], "Disable tracking": ["Hide ads"], "Skip consent screens": ["Disable tracking"],
        "Hide Premium banner": [], "Read full articles": [],
    },
    "flitsmeister": {
        "Fix PairIP startup": [], "Unlock Pro": [], "Hide Pro notices": [],
        "Disable partner services": [], "Hide ads": [], "Disable tracking": [],
    },
}


def prepare_input(original: Path, out: Path) -> tuple[Path, Path]:
    """Stage a whole split set; retain an untouched base for code inspection."""
    if original.is_dir():
        files = sorted(original.iterdir())
        if not (original / "base.apk").is_file():
            raise ValueError(f"Split input directory needs base.apk: {original}")
        unexpected = [p.name for p in files if not p.is_file() or p.suffix.lower() != ".apk"]
        if unexpected:
            raise ValueError(f"Unexpected non-APK input: {', '.join(unexpected)}")
        staged = out / "input.apks"
        with zipfile.ZipFile(staged, "w", compression=zipfile.ZIP_STORED) as archive:
            for apk in files:
                archive.write(apk, apk.name)
        return staged, original / "base.apk"
    if original.suffix.lower() == ".apk":
        return original, original
    # Desktop extracts bundles beside their input, not under java.io.tmpdir.
    # Stage on the work volume: extraction on ExFAT can generate AppleDouble
    # ._*.apk files that the merger subsequently mistakes for real APKs.
    staged = out / "input.apks"
    if staged.resolve() == original.resolve():
        raise ValueError("Staged archive would replace the original input")
    with zipfile.ZipFile(original) as archive:
        reference = out / "input-base.apk"
        reference.write_bytes(archive.read("base.apk"))
        entries = archive.infolist()
        def macos_metadata(entry: zipfile.ZipInfo) -> bool:
            parts = Path(entry.filename).parts
            return "__MACOSX" in parts or any(part.startswith("._") for part in parts)
        if any(macos_metadata(entry) for entry in entries):
            with zipfile.ZipFile(staged, "w", compression=zipfile.ZIP_STORED) as cleaned:
                for entry in entries:
                    if not macos_metadata(entry):
                        cleaned.writestr(entry.filename, archive.read(entry))
        else:
            shutil.copyfile(original, staged)
    return staged, reference


def verifier_command(app: str, destination: Path, effective: set[str], apk: Path | None = None,
                     original_reference: Path | None = None, original_input: Path | None = None) -> list[str]:
    if app == "videoland":
        if original_reference is None:
            raise ValueError("Videoland mobile validation needs the decoded original")
        command = [sys.executable, "tests/verify_videoland.py", str(original_reference), str(destination)]
        for patch, flag in [("Hide ads", "--ads"), ("Disable tracking", "--tracking"), ("Skip consent screens", "--consent")]:
            if patch in effective:
                command.append(flag)
        if apk is not None:
            if original_input is None:
                raise ValueError("Videoland mobile validation needs the whole original split input")
            command += ["--original-apks", str(original_input), "--patched-apk", str(apk)]
        return command
    if app == "kijk":
        if original_reference is None:
            raise ValueError("KIJK validation needs the decoded publisher original")
        command = [sys.executable, "tests/verify_kijk_consent.py", "--original", str(original_reference), "--patched", str(destination)]
        for patch in sorted(effective):
            command += ["-e", patch]
        if apk is not None:
            if original_input is None:
                raise ValueError("KIJK validation needs the original APK for payload checks")
            command += ["--original-apk", str(original_input), "--patched-apk", str(apk)]
        return command
    if app in {"hbvl", "tubantia", "nieuwsblad", "dsnieuws", "hln", "detijd", "humo", "demorgen", "tvgids", "marktplaats", "9292", "weerplaza", "nunl", "volkskrant", "trouw", "parool", "ftm", "flitsmeister", "ad", "nrc", "dumpert", "rtl", "brabant", "west", "vi", "teletekst"}:
        command = [sys.executable, f"tests/verify_{app}.py", str(destination)]
    else:
        command = [sys.executable, "tests/verify_targets.py", app, str(destination)]
    if app in {"detijd", "tvgids", "marktplaats", "9292", "dumpert", "rtl", "brabant", "west", "vi", "teletekst"} and apk is not None:
        command += ["--apk", str(apk)]
    if app == "tvgids":
        if original_reference is None:
            raise ValueError("TVgids native verification needs the trusted original APK")
        command += ["--original", str(original_reference)]
    for patch in sorted(effective):
        command += ["-e", patch]
    return command


def patch_selections(patches: dict[str, list[str]], requested: list[str] | None) -> list[list[str]]:
    if requested is None:
        return [[patch] for patch in patches] + [list(patches)]
    unknown = set(requested) - set(patches) - {"all"}
    if unknown:
        raise ValueError(f"Unknown selection: {', '.join(sorted(unknown))}")
    return [list(patches) if name == "all" else [name] for name in dict.fromkeys(requested)]


@contextmanager
def decoded_destination(out: Path, name: str, compact: bool):
    if compact:
        destination = Path(tempfile.mkdtemp(prefix=f"decoded-{name}-", dir=out))
        try:
            yield destination
        except BaseException:
            print(f"Retained failed validation output: {destination}", file=sys.stderr)
            raise
        else:
            shutil.rmtree(destination)
    else:
        yield out / f"decoded-{name}"


def run(command: list[str], log: Path) -> None:
    result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    log.write_text(result.stdout)
    if result.returncode:
        print(result.stdout)
        raise SystemExit(f"Failed {log.stem}; exit {result.returncode}")


def decode_and_verify(out: Path, app: str, apk: Path, name: str, effective: set[str], compact: bool = False,
                      original_reference: Path | None = None, original_input: Path | None = None) -> None:
    with decoded_destination(out, name, compact) as destination:
        run(["apktool", "d", "-f", "-o", str(destination), str(apk)], out / f"decode-{name}.log")
        run(verifier_command(app, destination, effective, apk=apk, original_reference=original_reference, original_input=original_input), out / f"verify-{name}.log")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("app", choices=sorted(APPS))
    parser.add_argument("input", type=Path, help="Original APK, APKM/APKS set, or directory of base and split APKs")
    parser.add_argument("--bundle", type=Path, help="Override the bundle for the current project version")
    parser.add_argument("--selection", action="append", help="Validate only this patch name, or 'all'; repeatable")
    parser.add_argument("--compact", action="store_true", help="Remove transient decoded trees and single-selection APKs after successful verification")
    args = parser.parse_args()
    original = args.input.resolve()
    if args.bundle:
        bundle = args.bundle.resolve()
    else:
        version = re.search(r"^version\s*=\s*(\S+)\s*$", (ROOT / "gradle.properties").read_text(), re.M)
        if version is None:
            raise SystemExit("No project version in gradle.properties; specify --bundle")
        bundle = ROOT / "patches/build/libs" / f"patches-{version[1]}.mpp"
    if not bundle.is_file():
        raise SystemExit(f"Build the bundle first: {bundle}")
    out = ROOT / "build/validation" / args.app
    out.mkdir(parents=True, exist_ok=True)
    run([sys.executable, "scripts/bootstrap.py"], out / "bootstrap.log")

    patches = APPS[args.app]
    try:
        selections = patch_selections(patches, args.selection)
        patch_input, reference = prepare_input(original, out)
    except (ValueError, KeyError, zipfile.BadZipFile) as error:
        parser.error(str(error))
    trusted_decoded = None
    if args.app in STREAMING_ORIGINALS:
        if hashlib.sha256(reference.read_bytes()).hexdigest() != STREAMING_ORIGINALS[args.app]:
            raise SystemExit(f"Unsupported original {args.app} APK; inspect this publisher build first")
        trusted_decoded = out / "decoded-original"
        run(["apktool", "d", "-f", "-o", str(trusted_decoded), str(reference)], out / "decode-original.log")
        print(f"PASS: {args.app} publisher input digest and decoded reference", flush=True)
    else:
        decode_and_verify(out, args.app, reference, "original", set(), args.compact, reference)
        print(f"PASS: {args.app} original has none of the patch effects", flush=True)

    for selection in selections:
        name = "all" if len(selection) > 1 else re.sub(r"\W+", "-", selection[0].lower())
        output = out / f"{args.app}-{name}.apk"
        if output.resolve() in {original, patch_input.resolve(), reference.resolve()}:
            raise SystemExit(f"Refusing to replace original input: {output}")
        report = out / f"{name}.json"
        command = ["java", "-jar", str(DESKTOP), "patch", "-p", str(bundle),
                   "--exclusive", "--validate", "--bytecode-mode", "FULL",
                   "-o", str(output), "-r", str(report)]
        for patch in selection:
            command += ["-e", patch]
        command.append(str(patch_input))
        run(command, out / f"patch-{name}.log")
        result = json.loads(report.read_text())
        assert result["success"] and not result["failedPatches"], f"{name}: {result['failedPatches']}"
        assert set(result["appliedPatches"]) == set(selection)
        run(["apksigner", "verify", str(output)], out / f"signature-{name}.log")
        effective = set(selection) | {dependency for patch in selection for dependency in patches[patch]}
        decode_and_verify(out, args.app, output, name, effective, args.compact,
                          trusted_decoded or reference, patch_input if trusted_decoded else None)
        print(f"PASS: {args.app} {name}; patch report, signature and decoded effects", flush=True)
        if args.compact and name != "all":
            output.unlink()

    if args.compact and trusted_decoded is not None:
        shutil.rmtree(trusted_decoded)


if __name__ == "__main__":
    main()
