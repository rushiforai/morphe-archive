#!/usr/bin/env python3
"""Reject missing, duplicated or misplaced entries in split release bundles."""
import argparse
import hashlib
from pathlib import Path
import zipfile

FINAMP_CLASSES = "io/github/pengusto/patches/finamp/"
FINAMP_RESOURCES = "finamp/"
INDIVIDUAL_ENTRY = FINAMP_CLASSES + "FinampNativePatchKt"
COMPACT_ENTRY = FINAMP_CLASSES + "FinampCompactPatchKt"
ALL_FIXES_DELTA = "finamp/1.0.1/arm64-v8a/255.pfd"


def entries(archive):
    files = [entry for entry in archive.infolist() if not entry.is_dir()]
    result = {entry.filename: entry for entry in files}
    if len(result) != len(files):
        raise ValueError("Duplicate entries in bundle")
    return result


def verify(full_path, split_path, kind, compact_classes=None):
    if kind not in ("standard", "finamp", "finamp-individual", "combined"):
        raise ValueError("Unknown bundle kind")
    is_compact = kind in ("finamp", "combined")
    with zipfile.ZipFile(full_path) as full, zipfile.ZipFile(split_path) as split:
        source, actual = entries(full), entries(split)
        expected = set()
        for name in source:
            if name == "classes.dex":
                continue
            if name.endswith(".class") and kind != "combined" and name.startswith(FINAMP_CLASSES) != (kind != "standard"):
                continue
            if is_compact and name.startswith(INDIVIDUAL_ENTRY):
                continue
            if name.startswith(FINAMP_RESOURCES) and kind == "standard":
                continue
            if (is_compact and name.startswith(FINAMP_RESOURCES) and
                    name.endswith(".pfd") and name != ALL_FIXES_DELTA):
                continue
            if name.startswith("extensions/") and kind in ("finamp", "finamp-individual"):
                continue
            expected.add(name)
        extra = set()
        if is_compact:
            if compact_classes is None or ALL_FIXES_DELTA not in source:
                raise ValueError("Missing compact classes or all-fixes delta")
            root = Path(compact_classes)
            extra = {p.relative_to(root).as_posix() for p in root.glob(COMPACT_ENTRY + "*.class")}
            if COMPACT_ENTRY + ".class" not in extra:
                raise ValueError("Missing compact entry point")
        if set(actual) != expected | extra | {"classes.dex"}:
            raise ValueError(f"{kind}: unexpected or missing entries")
        if not any(n.startswith(FINAMP_CLASSES) for n in source) or not any(n.startswith(FINAMP_RESOURCES) for n in source):
            raise ValueError("Full bundle is missing Finamp")
        for name in expected - {"META-INF/MANIFEST.MF"}:
            if (actual[name].CRC, actual[name].file_size) != (source[name].CRC, source[name].file_size):
                raise ValueError(f"{kind}: changed entry {name}")
            with full.open(name) as before, split.open(name) as after:
                digest_before, digest_after = hashlib.sha256(), hashlib.sha256()
                for block in iter(lambda: before.read(1024 * 1024), b""):
                    digest_before.update(block)
                for block in iter(lambda: after.read(1024 * 1024), b""):
                    digest_after.update(block)
                if digest_before.digest() != digest_after.digest():
                    raise ValueError(f"{kind}: changed entry {name}")
        for name in extra:
            if split.read(name) != (Path(compact_classes) / name).read_bytes():
                raise ValueError(f"{kind}: changed compact entry {name}")
        manifest = split.read("META-INF/MANIFEST.MF")
        label = {"standard": "Standard", "finamp": "Finamp", "finamp-individual": "Finamp Individual"}.get(kind)
        expected_name = (f"Name: Penguin Patches - {label}\r\n" if label else "Name: Penguin Patches\r\n").encode()
        if expected_name not in manifest or not split.read("classes.dex").startswith(b"dex\n"):
            raise ValueError(f"{kind}: invalid manifest or Android DEX")
        print(f"{kind}: {len(actual)} entries; preserved original payloads")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--full", type=Path, required=True)
    parser.add_argument("--standard", type=Path, required=True)
    parser.add_argument("--finamp", type=Path, required=True)
    parser.add_argument("--finamp-individual", type=Path, required=True)
    parser.add_argument("--combined", type=Path, required=True)
    parser.add_argument("--compact-classes", type=Path, required=True)
    args = parser.parse_args()
    verify(args.full, args.standard, "standard")
    verify(args.full, args.finamp, "finamp", args.compact_classes)
    verify(args.full, args.finamp_individual, "finamp-individual", args.compact_classes)
    verify(args.full, args.combined, "combined", args.compact_classes)
