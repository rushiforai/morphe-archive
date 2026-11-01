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
MEDIA_REFERENCES = {
    "kijk": ("nl.sbs.kijk", 2026101500),
    "videoland": ("nl.rtl.videoland.v2", 1627),
    "videolandatv": ("nl.rtl.videoland.v2", 1622),
    "medium": ("com.medium.reader", 1784911033),
    "npo": ("nl.uitzendinggemist", 240497937),
    "npostarttv": ("nl.uitzendinggemist", 245497937),
}

APPS = {
    "at4k": {"Unlock Premium": []},
    "rollerbank": {
        "Fix Google services": [], "Hide ads": ["Fix Google services"],
        "Disable tracking": ["Hide ads", "Fix Google services"],
        "Skip consent screens": ["Disable tracking", "Hide ads", "Fix Google services"],
        "Hide Premium banner": ["Fix Google services"],
        "Enable En Route alerts": ["Fix Google services"],
    },
    "buienalarm": {
        "Fix Google services": [], "Hide ads": ["Fix Google services"],
        "Hide Premium banner": ["Fix Google services"],
        "Disable tracking": ["Hide ads", "Fix Google services"],
        "Skip consent screens": ["Disable tracking", "Hide ads", "Fix Google services"],
    },
    'medium': {'Disable optional tracking': [], 'Hide native promotions': [], 'Read full articles natively': []},
    **{app: {'Fix PairIP startup': [], 'Hide ads': ['Fix PairIP startup'],
             'Disable tracking': ['Fix PairIP startup']} for app in ('npo', 'npostarttv')},
    'videolandatv': {'Hide ads': [], 'Disable tracking': [], 'Hide unavailable content': []},
    "kijk": {"Hide ads": [], "Disable tracking": [], "Skip consent screens": ["Disable tracking"]},
    "videoland": {"Hide ads": [], "Disable tracking": [], "Skip consent screens": ["Disable tracking"]},
    "detijd": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Skip onboarding": [],
        "Read full articles": ["Hide ads"], "Hide Mijn Tijd (expert)": [],
        "Hide newspaper shortcut": [],
    },
    **{app: {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
        **({"Hide empty listening carousel": []} if app == "hln" else {}),
    } for app in ("demorgen", "humo", "hln")},
    **{app: {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [],
    } for app in ("nieuwsblad", "dsnieuws", "hbvl", "gva")},
    "ed": {
        "Hide ads": [], "Disable tracking": ["Hide ads"],
        "Skip consent screens": ["Disable tracking", "Hide ads"],
        "Hide Premium banner": [], "Read full articles": [],
        "Hide empty listening carousel": [],
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

for _newspaper_app in ("hbvl", "gva"):
    APPS[_newspaper_app]["Hide newspaper navigation"] = []


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
        entries = archive.infolist()

        def macos_metadata(entry: zipfile.ZipInfo) -> bool:
            parts = Path(entry.filename).parts
            return "__MACOSX" in parts or any(part.startswith("._") for part in parts)

        usable = [entry for entry in entries if not macos_metadata(entry)]
        names = set()
        for entry in entries:
            name = entry.filename
            parts = name.rstrip("/").split("/")
            if (name.startswith("/") or "\\" in name or ".." in parts or
                    any(part in {"", "."} for part in parts) or ":" in parts[0]):
                raise ValueError(f"Unsafe archive member path: {name}")
            if name in names:
                raise ValueError(f"Duplicate archive member: {name}")
            names.add(name)
        apks = [entry for entry in usable if not entry.is_dir() and entry.filename.lower().endswith(".apk")]
        by_basename = {}
        for entry in apks:
            name = Path(entry.filename).name
            if name in by_basename:
                raise ValueError(f"Colliding APK basenames: {name}")
            by_basename[name] = entry
        base = by_basename.get("base.apk")
        if base is None:
            manifests = [entry for entry in usable if entry.filename == "manifest.json"]
            hints = []
            if manifests:
                try:
                    metadata = json.loads(archive.read(manifests[0]))
                    splits = metadata.get("split_apks", [])
                    if not isinstance(splits, list):
                        raise ValueError("Expected manifest split_apks list")
                    hints = [row for row in splits if isinstance(row, dict) and row.get("id") == "base"]
                except (AttributeError, UnicodeDecodeError, json.JSONDecodeError) as error:
                    raise ValueError("Invalid XAPK base manifest") from error
            if hints:
                if len(hints) != 1 or not isinstance(hints[0].get("file"), str):
                    raise ValueError("Ambiguous XAPK base hints")
                matches = [entry for entry in apks if entry.filename == hints[0]["file"]]
                if len(matches) != 1:
                    raise ValueError("XAPK base hint does not identify one APK")
                base = matches[0]
            else:
                candidates = [entry for name, entry in by_basename.items()
                              if not name.lower().startswith(("config.", "split_", "split."))]
                if len(candidates) != 1:
                    raise ValueError("Expected one unambiguous base APK")
                base = candidates[0]
        reference = out / "input-base.apk"
        reference.write_bytes(archive.read(base))
        if base.filename != "base.apk":
            # Normalize only the outer container. APK payloads, including their
            # signing blocks, remain byte-for-byte publisher originals.
            with zipfile.ZipFile(staged, "w", compression=zipfile.ZIP_STORED) as canonical:
                for entry in apks:
                    name = "base.apk" if entry is base else Path(entry.filename).name
                    canonical.writestr(name, archive.read(entry))
        elif len(usable) != len(entries):
            with zipfile.ZipFile(staged, "w", compression=zipfile.ZIP_STORED) as cleaned:
                for entry in usable:
                    cleaned.writestr(entry.filename, archive.read(entry))
        else:
            shutil.copyfile(original, staged)
    return staged, reference


def verifier_command(app: str, destination: Path, effective: set[str], apk: Path | None = None,
                     original_reference: Path | None = None, original_input: Path | None = None) -> list[str]:
    if app == 'at4k':
        if original_reference is None or not original_reference.is_dir():
            raise ValueError('AT4K verification needs the decoded original APK')
        command = [sys.executable, 'tests/verify_at4k.py', str(original_reference), str(destination)]
        for patch in sorted(effective):
            command += ['-e', patch]
        if apk is not None:
            if original_input is None:
                raise ValueError('AT4K verification needs the original APK payloads')
            command += ['--original-apk', str(original_input), '--patched-apk', str(apk)]
        return command
    if app == 'buienalarm':
        if original_reference is None:
            raise ValueError('Buienalarm verification needs the publisher original')
        command = [sys.executable, 'tests/verify_buienalarm.py', str(destination), '--original', str(original_reference)]
        for patch in sorted(effective):
            command += ['-e', patch]
        return command
    if app in {'medium', 'npo', 'npostarttv', 'videolandatv'}:
        if original_reference is None:
            raise ValueError(f'{app} validation needs the decoded publisher original')
        script = 'verify_npo' if app in {'npo', 'npostarttv'} else 'verify_videoland_atv' if app == 'videolandatv' else 'verify_medium'
        command = [sys.executable, f'tests/{script}.py', str(original_reference), str(destination)]
        if app == 'npo':
            command.append('--phone')
        if app == 'videolandatv':
            for patch, flag in [('Hide ads', '--ads'), ('Disable tracking', '--tracking'),
                                ('Hide unavailable content', '--unavailable')]:
                if patch in effective:
                    command.append(flag)
        else:
            for patch in sorted(effective):
                command += ['-e', patch]
        if apk is not None:
            if original_input is None:
                raise ValueError(f'{app} validation needs the whole original split input')
            command += ['--original-apks', str(original_input), '--patched-apk', str(apk)]
        return command
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
    if app == "rollerbank":
        if original_reference is None or not original_reference.is_dir():
            raise ValueError("Rollerbank validation needs the decoded original APK")
        command = [sys.executable, "tests/verify_rollerbank.py", str(destination), "--original-root", str(original_reference)]
    elif app in {"detijd", "demorgen", "humo", "hln", "nieuwsblad", "dsnieuws", "hbvl", "gva", "tvgids", "marktplaats", "9292", "weerplaza", "nunl", "volkskrant", "trouw", "parool", "ftm", "flitsmeister", "ad", "tubantia", "ed", "nrc", "dumpert", "rtl", "brabant", "west", "vi", "teletekst"}:
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


def verify_reference_input(app: str, original: Path, reference: Path) -> None:
    """Require an inspected complete media profile, including the right form factor."""
    if app in STREAMING_ORIGINALS and hashlib.sha256(reference.read_bytes()).hexdigest() == STREAMING_ORIGINALS[app]:
        # Retain the previously inspected KIJK APK and three-member Videoland set.
        # Their downstream verifiers also check the complete packaged payload.
        return
    sys.path.insert(0, str(ROOT / "tests"))
    from media_inputs import verify_input
    profile, _ = verify_input(original)
    if (profile["package"], profile["version_code"]) != MEDIA_REFERENCES[app]:
        raise ValueError(f"Publisher input is for a different {app} form factor or build")


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
    parser.add_argument("--sdk", type=Path,
                        help="Opt in to additional DEX/APK verification using this Android SDK root")
    parser.add_argument("--selection", action="append", help="Validate only this patch name, or 'all'; repeatable")
    parser.add_argument("--output", type=Path, help="Keep this input variant's reports and APKs in a separate directory")
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
    out = args.output.resolve() if args.output else ROOT / "build/validation" / args.app
    out.mkdir(parents=True, exist_ok=True)
    run([sys.executable, "scripts/bootstrap.py"], out / "bootstrap.log")

    patches = APPS[args.app]
    try:
        selections = patch_selections(patches, args.selection)
        patch_input, reference = prepare_input(original, out)
    except (ValueError, KeyError, zipfile.BadZipFile) as error:
        parser.error(str(error))
    trusted_decoded = None
    if args.app in {"rollerbank", "at4k"}:
        digest = {"rollerbank": "d8e32f93fe1d9697a9897076b2cbfac8f20f6f98cf5113098cfe6a8d60243d7c",
                  "at4k": "ac34c0abf1ceee5d5133dc3e99bde9173a00c5a16132852507ed23c0fbd41341"}[args.app]
        if hashlib.sha256(reference.read_bytes()).hexdigest() != digest:
            raise SystemExit(f"Expected inspected {args.app} original base APK")
        trusted_decoded = out / "decoded-original"
        run(["apktool", "d", "-f", "-o", str(trusted_decoded), str(reference)], out / "decode-original.log")
        run(verifier_command(args.app, trusted_decoded, set(), original_reference=trusted_decoded), out / "verify-original.log")
        print(f"PASS: {args.app} original input and decoded reference", flush=True)
    elif args.app in MEDIA_REFERENCES:
        try:
            verify_reference_input(args.app, patch_input, reference)
        except (AssertionError, ValueError) as error:
            raise SystemExit(f"Unsupported original {args.app} APK: {error}") from error
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
        command = ["java", "-Xmx2g", "-jar", str(DESKTOP), "patch", "-p", str(bundle),
                   "--exclusive", "--validate", "--bytecode-mode", "FULL",
                   "-o", str(output), "-r", str(report)]
        if args.sdk:
            command += [f"--verify-with-sdk={args.sdk.resolve()}"]
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
