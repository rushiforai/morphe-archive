#!/usr/bin/env python3
"""Produce independent Android/JVM patch bundles from the verified full bundle."""
import argparse
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile

from finamp_catalogue import catalogue

FINAMP_CLASSES = "io/github/pengusto/patches/finamp/"
FINAMP_RESOURCES = "finamp/"
COMPACT_ENTRY = FINAMP_CLASSES + "FinampCompactPatchKt"
INDIVIDUAL_ENTRY = FINAMP_CLASSES + "FinampNativePatchKt"
_, _, COMPLETE_MASK, EXPECTED_MASKS = catalogue()
ALL_FIXES_DELTA = f"finamp/1.0.1/arm64-v8a/{COMPLETE_MASK}.pfd"
EXPECTED_DELTAS = {f"finamp/1.0.1/arm64-v8a/{mask}.pfd" for mask in EXPECTED_MASKS}


def make_bundle(source, destination, kind, d8, android_jar, classpath, compact_classes=None):
    if kind not in ("standard", "finamp", "finamp-individual", "combined"):
        raise ValueError("Unknown bundle kind")
    is_compact = kind in ("finamp", "combined")
    with tempfile.TemporaryDirectory(prefix="penguin-split-", dir=destination.parent) as tmp:
        classes = Path(tmp) / "classes.jar"
        dex_dir = Path(tmp) / "dex"
        dex_dir.mkdir()
        with zipfile.ZipFile(source) as original:
            names = original.namelist()
            if len(names) != len(set(names)):
                raise ValueError("Full bundle has duplicate ZIP entries")
            class_names = [n for n in names if n.endswith(".class") and
                           (kind == "combined" or n.startswith(FINAMP_CLASSES) == (kind != "standard")) and
                           not (is_compact and n.startswith(INDIVIDUAL_ENTRY))]
            if not class_names or not any(n.startswith(FINAMP_CLASSES) for n in names):
                raise ValueError("Missing expected patch classes")
            extras = []
            if is_compact:
                if compact_classes is None:
                    raise ValueError("Missing compact compiled classes")
                root = Path(compact_classes)
                extras = sorted(root.glob(COMPACT_ENTRY + "*.class"))
                if not extras or not (root / (COMPACT_ENTRY + ".class")).is_file():
                    raise ValueError("Missing compact patch entry point")
                native_deltas = {n for n in names if n.startswith(FINAMP_RESOURCES) and n.endswith(".pfd")}
                if native_deltas != EXPECTED_DELTAS or any(n.startswith(COMPACT_ENTRY) for n in names):
                    raise ValueError("Unexpected Finamp selection matrix or compact entry leaked into full bundle")
            with zipfile.ZipFile(classes, "w") as selected:
                for name in class_names:
                    selected.writestr(name, original.read(name))
                for path in extras:
                    selected.write(path, path.relative_to(compact_classes).as_posix())
            cmd = [str(d8), "--release", "--min-api", "26", "--lib", str(android_jar),
                   "--classpath", str(classpath), "--output", str(dex_dir), str(classes)]
            subprocess.run(cmd, check=True)
            dex = dex_dir / "classes.dex"
            if not dex.is_file() or len(list(dex_dir.glob("*.dex"))) != 1:
                raise ValueError("Expected exactly one DEX file")
            with zipfile.ZipFile(destination, "w", allowZip64=True) as result:
                for info in original.infolist():
                    name = info.filename
                    if info.is_dir() or name == "classes.dex":
                        continue
                    if name.endswith(".class") and name not in class_names:
                        continue
                    if (is_compact and name.endswith(".pfd") and
                            name.startswith(FINAMP_RESOURCES) and name != ALL_FIXES_DELTA):
                        continue
                    if kind == "standard" and name.startswith(FINAMP_RESOURCES):
                        continue
                    if name.startswith("extensions/") and kind in ("finamp", "finamp-individual"):
                        continue
                    if name == "META-INF/MANIFEST.MF":
                        manifest = original.read(name)
                        old = b"Name: Penguin Patches\r\n"
                        label = {"standard": "Standard", "finamp": "Finamp", "finamp-individual": "Finamp Individual"}.get(kind)
                        new = f"Name: Penguin Patches - {label}\r\n".encode() if label else old
                        if manifest.count(old) != 1:
                            raise ValueError("Unexpected bundle manifest name")
                        result.writestr(info, manifest.replace(old, new))
                    else:
                        with original.open(info) as src, result.open(info, "w") as dst:
                            shutil.copyfileobj(src, dst, 1024 * 1024)
                for path in extras:
                    result.write(path, path.relative_to(compact_classes).as_posix(), compress_type=zipfile.ZIP_DEFLATED)
                result.write(dex, "classes.dex", compress_type=zipfile.ZIP_DEFLATED)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bundle", type=Path, required=True)
    parser.add_argument("--version", required=True)
    parser.add_argument("--metadata", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--metadata-dir", type=Path, required=True)
    parser.add_argument("--d8", type=Path, required=True)
    parser.add_argument("--android-jar", type=Path, required=True)
    parser.add_argument("--classpath", type=Path, required=True)
    parser.add_argument("--compact-classes", type=Path, required=True)
    args = parser.parse_args()
    metadata = json.loads(args.metadata.read_text())
    if metadata["version"] != args.version:
        raise ValueError("Full bundle metadata version does not match release")
    expected_suffix = f"/patches-{args.version}.mpp"
    if not metadata["download_url"].endswith(expected_suffix):
        raise ValueError("Unexpected full bundle download URL")
    for kind in ("standard", "finamp", "finamp-individual", "combined"):
        output = args.output_dir / f"patches-{kind}-{args.version}.mpp"
        make_bundle(args.bundle, output, kind, args.d8, args.android_jar, args.classpath, args.compact_classes)
        if kind == "combined":
            print(f"{kind}: {output.stat().st_size:,} bytes -> {output}")
            continue
        split_metadata = dict(metadata)
        split_metadata["download_url"] = metadata["download_url"][:-len(expected_suffix)] + f"/patches-{kind}-{args.version}.mpp"
        descriptions = {"finamp-individual": "Finamp patches with individual selection.",
                        "finamp": "Finamp: all available fixes in one compact patch.",
                        "standard": "Infinity+ and all supported apps except Finamp."}
        split_metadata["description"] = descriptions[kind] + "\n\n" + metadata["description"]
        target = args.metadata_dir / kind / "patches-bundle.json"
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(json.dumps(split_metadata, indent=2, ensure_ascii=False) + "\n")
        print(f"{kind}: {output.stat().st_size:,} bytes -> {output}")


if __name__ == "__main__":
    main()
