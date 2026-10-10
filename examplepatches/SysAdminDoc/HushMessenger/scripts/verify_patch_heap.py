#!/usr/bin/env python3
"""Apply every patch to pinned stock APKs with a 1024 MB Java heap."""

import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import zlib
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from zipfile import BadZipFile, ZipFile

if __package__:
    from .build_queue import queued, time_limit
    from .check_release import mutable_output, run_bounded, verify_development
    from .verify_changed_apk_failure import recorded_builds
else:
    from build_queue import queued, time_limit
    from check_release import mutable_output, run_bounded, verify_development
    from verify_changed_apk_failure import recorded_builds

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "patches/src/main/kotlin/app/hushmessenger/patches/MessengerTarget.kt"


def supported_codes(target=TARGET):
    """Every version code MessengerTarget.VERSIONS lists, across all supported version names."""
    block = re.search(
        r"val VERSIONS: .*?\n    \)", target.read_text(encoding="utf-8"), re.DOTALL
    )
    if not block:
        raise ValueError(f"{target.name}: VERSIONS table not found")
    return {int(code) for code in re.findall(r"\b\d{9}\b", block.group(0))}


def stock_apk(stock_dir, code):
    """The one stock APK for a version code, named messenger-<major version>-<code>.apk."""
    found = sorted(stock_dir.glob(f"messenger-*-{code}.apk"))
    if len(found) != 1:
        raise ValueError(
            f"{code}: expected one stock APK named messenger-<version>-{code}.apk, found {len(found)}"
        )
    return found[0]


def check_build(args, code, expected_hash, names):
    stock = stock_apk(args.stock_dir, code)
    with stock.open("rb") as source:
        if hashlib.file_digest(source, "sha256").hexdigest() != expected_hash:
            raise ValueError(f"{code}: stock APK does not match its recorded hash")
    if hashlib.sha256(args.bundle.read_bytes()).hexdigest() != args.bundle_sha256:
        raise ValueError(f"{code}: frozen bundle checksum changed")
    discovery = run_bounded(
        queued(
            [
                str(args.java),
                "-Xmx1024m",
                "-XX:ActiveProcessorCount=2",
                "-cp",
                args.compat_classpath,
                str(ROOT / "scripts" / "CompatReport.java"),
                str(stock),
            ],
            f"hushmessenger compat report {code}",
        ),
        cwd=ROOT,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        timeout=time_limit(300),
    )
    found = discovery.stdout + discovery.stderr
    surfaces = re.search(r"(\d+) dark surface constants", found)
    colors = re.search(r"(\d+) Color\.parseColor and Context\.getColor calls", found)
    classes = re.search(r"(\d+) Material You editable classes", found)
    if discovery.returncode or surfaces is None or colors is None or classes is None:
        raise RuntimeError(
            f"{code}: stock compatibility discovery failed (exit {discovery.returncode})\n"
            f"{found[-4000:]}"
        )
    with tempfile.TemporaryDirectory(prefix=f"hush-heap-{code}-") as scratch:
        root = Path(scratch)
        report_path = root / "result.json"
        output = root / "patched.apk"
        command = [
            str(args.java),
            "-Xmx1024m",
            "-XX:ActiveProcessorCount=2",
            "-jar",
            str(args.desktop_jar),
            "patch",
            f"--patches={args.bundle}",
            "--unsigned",
            f"--out={output}",
            f"--result-file={report_path}",
            f"--temporary-files-path={root / 'tmp'}",
            *[f"--enable={name}" for name in sorted(names)],
            str(stock),
        ]
        run = run_bounded(
            queued(command, f"hushmessenger heap patch {code}"),
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=time_limit(1800),
        )
        log = run.stdout + run.stderr
        if run.returncode or not report_path.is_file() or not output.is_file():
            raise RuntimeError(
                f"{code}: Desktop failed at 1024 MB (exit {run.returncode})\n"
                f"{log[-4000:]}"
            )
        report = json.loads(report_path.read_text(encoding="utf-8"))
        applied = [patch["name"] for patch in report["appliedPatches"]]
        steps = report["patchingSteps"]
        if (
            len(applied) != len(names)
            or set(applied) != names
            or report["failedPatches"]
            or not steps
            or any(step["success"] is not True for step in steps)
            or not {"PATCHING", "REBUILDING"} <= {step["step"] for step in steps}
        ):
            raise RuntimeError(f"{code}: incomplete patch result at 1024 MB")
        stats = re.search(
            r"Material You: (\d+) classes, (\d+) surfaces, (\d+) colour calls", log
        )
        if stats is None or any(int(value) <= 0 for value in stats.groups()):
            raise RuntimeError(f"{code}: missing theme edit counts\n{log[-4000:]}")
        if stats.groups() != (classes.group(1), surfaces.group(1), colors.group(1)):
            raise RuntimeError(
                f"{code}: patch theme counts disagree with stock discovery"
            )
        with stock.open("rb") as source:
            if hashlib.file_digest(source, "sha256").hexdigest() != expected_hash:
                raise RuntimeError(f"{code}: patcher changed the stock input")
        with output.open("rb") as source:
            if hashlib.file_digest(source, "sha256").hexdigest() == expected_hash:
                raise RuntimeError(f"{code}: output is the unchanged stock APK")
        with ZipFile(output) as apk:
            if apk.testzip() is not None:
                raise RuntimeError(f"{code}: output ZIP is corrupt")
            if not {"AndroidManifest.xml", "resources.arsc", "classes.dex"} <= set(
                apk.namelist()
            ):
                raise RuntimeError(f"{code}: output is not a complete APK")
            dex_files = [
                name
                for name in apk.namelist()
                if re.fullmatch(r"classes(?:\d+)?\.dex", name)
            ]
            extension = False
            for name in dex_files:
                data = apk.read(name)
                if len(data) < 112 or not data.startswith(b"dex\n"):
                    raise RuntimeError(f"{code}: invalid output DEX: {name}")
                extension |= b"Lapp/hushmessenger/extension/Settings;" in data
            if not extension:
                raise RuntimeError(f"{code}: output has no settings extension")
        if hashlib.sha256(args.bundle.read_bytes()).hexdigest() != args.bundle_sha256:
            raise RuntimeError(f"{code}: patcher input bundle changed")
        return f"PASS {code}: {len(applied)} patches, 1024 MB, theme {stats.group(0)}"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stock-dir", required=True, type=Path)
    parser.add_argument("--bundle", required=True, type=Path)
    parser.add_argument(
        "--bundle-sha256", required=True, help="recorded checksum of the frozen input"
    )
    parser.add_argument(
        "--held-index-sha256",
        required=True,
        help="recorded checksum of the held public feed",
    )
    parser.add_argument("--desktop-jar", required=True, type=Path)
    parser.add_argument(
        "--compat-classpath",
        required=True,
        help="dexlib2 and Guava classpath for the stock compatibility report",
    )
    parser.add_argument("--java", default=Path("java"), type=Path)
    parser.add_argument("--codes", nargs="+", type=int)
    args = parser.parse_args()
    try:
        builds = recorded_builds()
        if set(builds) != supported_codes():
            raise ValueError(
                "the complete gate requires a record for every supported build"
            )
        codes = args.codes or sorted(builds)
        if len(codes) != len(set(codes)) or not set(codes) <= builds.keys():
            raise ValueError("codes must be distinct recorded version codes")
        if mutable_output(ROOT, args.bundle):
            raise ValueError(
                "heap checks require a frozen bundle outside Gradle outputs"
            )
        if hashlib.sha256(args.bundle.read_bytes()).hexdigest() != args.bundle_sha256:
            raise ValueError("frozen bundle checksum changed")
        print(
            verify_development(
                ROOT,
                args.bundle,
                args.bundle.parent / "catalog-evidence.json",
                args.held_index_sha256,
            )
        )
        catalog = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        names = {patch["name"] for patch in catalog["patches"]}
        if (
            not names
            or len(names) != len(catalog["patches"])
            or "Material You theme" not in names
        ):
            raise ValueError(
                "the complete gate requires every distinct catalog patch including the theme"
            )
        # Limit simultaneous JVMs while keeping each output and temporary root separate.
        failures = []
        with ThreadPoolExecutor(max_workers=min(2, len(codes))) as pool:
            futures = {
                pool.submit(check_build, args, code, builds[code], names): code
                for code in codes
            }
            for future in as_completed(futures):
                try:
                    print(future.result(), flush=True)
                except (
                    OSError,
                    ValueError,
                    TypeError,
                    AttributeError,
                    KeyError,
                    RuntimeError,
                    BadZipFile,
                    zlib.error,
                    subprocess.TimeoutExpired,
                ) as error:
                    failures.append(futures[future])
                    print(f"CHECK FAILED: {error}", file=sys.stderr, flush=True)
        if failures:
            return 2
        if hashlib.sha256(args.bundle.read_bytes()).hexdigest() != args.bundle_sha256:
            raise ValueError("frozen bundle checksum changed during heap checks")
        if (
            hashlib.sha256((ROOT / "patches-bundle.json").read_bytes()).hexdigest()
            != args.held_index_sha256.lower()
        ):
            raise ValueError("held public metadata changed during heap checks")
        scope = "selected" if args.codes else "all"
        print(
            f"PASS: {scope} {len(codes)} builds applied {len(names)} patches at 1024 MB"
        )
        return 0
    except (
        OSError,
        ValueError,
        TypeError,
        AttributeError,
        KeyError,
        BadZipFile,
        zlib.error,
    ) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
