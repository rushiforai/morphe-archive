#!/usr/bin/env python3
"""Apply every patch to pinned stock APKs with a 1024 MB Java heap."""

import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from zipfile import BadZipFile, ZipFile

if __package__:
    from .verify_changed_apk_failure import recorded_builds
else:
    from verify_changed_apk_failure import recorded_builds

ROOT = Path(__file__).resolve().parent.parent


def check_build(args, code, expected_hash, names):
    stock = args.stock_dir / f"messenger-580-{code}.apk"
    with stock.open("rb") as source:
        if hashlib.file_digest(source, "sha256").hexdigest() != expected_hash:
            raise ValueError(f"{code}: stock APK does not match its recorded hash")
    discovery = subprocess.run(
        [
            str(args.java),
            "-Xmx1024m",
            "-cp",
            args.compat_classpath,
            str(ROOT / "scripts" / "CompatReport.java"),
            str(stock),
        ],
        cwd=ROOT,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        timeout=300,
        check=False,
    )
    found = discovery.stdout + discovery.stderr
    surfaces = re.search(r"(\d+) dark surface constants", found)
    colors = re.search(r"(\d+) Color\.parseColor and Context\.getColor calls", found)
    classes = re.search(r"(\d+) Material You editable classes", found)
    if discovery.returncode or surfaces is None or colors is None or classes is None:
        raise RuntimeError(
            f"{code}: stock compatibility discovery failed\n{found[-4000:]}"
        )
    with tempfile.TemporaryDirectory(prefix=f"hush-heap-{code}-") as scratch:
        root = Path(scratch)
        report_path = root / "result.json"
        output = root / "patched.apk"
        command = [
            str(args.java),
            "-Xmx1024m",
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
        run = subprocess.run(
            command,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=1800,
            check=False,
        )
        log = run.stdout + run.stderr
        if run.returncode or not report_path.is_file() or not output.is_file():
            raise RuntimeError(f"{code}: Desktop failed at 1024 MB\n{log[-4000:]}")
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
        return f"PASS {code}: {len(applied)} patches, 1024 MB, theme {stats.group(0)}"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stock-dir", required=True, type=Path)
    parser.add_argument("--bundle", required=True, type=Path)
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
        if len(builds) != 21:
            raise ValueError("the complete gate requires 21 recorded builds")
        codes = args.codes or sorted(builds)
        if len(codes) != len(set(codes)) or not set(codes) <= builds.keys():
            raise ValueError("codes must be distinct recorded version codes")
        catalog = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        names = {patch["name"] for patch in catalog["patches"]}
        if (
            len(catalog["patches"]) != 31
            or len(names) != 31
            or "Material You theme" not in names
        ):
            raise ValueError(
                "the complete gate requires 31 distinct patches including the theme"
            )
        # Each process owns its output and temporary root. Inputs remain read-only.
        failures = []
        with ThreadPoolExecutor(max_workers=len(codes)) as pool:
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
                    KeyError,
                    RuntimeError,
                    BadZipFile,
                    subprocess.TimeoutExpired,
                ) as error:
                    failures.append(futures[future])
                    print(f"CHECK FAILED: {error}", file=sys.stderr, flush=True)
        if failures:
            return 2
        scope = "selected" if args.codes else "all"
        print(
            f"PASS: {scope} {len(codes)} builds applied {len(names)} patches at 1024 MB"
        )
        return 0
    except (OSError, ValueError, TypeError, KeyError) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
