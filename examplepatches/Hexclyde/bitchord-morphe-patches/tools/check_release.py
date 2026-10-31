#!/usr/bin/env python3
"""Check required files, Markdown links and stray artifacts; optionally verify release assets."""

from pathlib import Path
import argparse
import ast
import hashlib
import json
import re
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
REQUIRED = [
    "README.md",
    "LICENSE",
    "THIRD_PARTY_NOTICES.md",
    "PRIVACY.md",
    "SECURITY.md",
    "CONTRIBUTING.md",
    "CHANGELOG.md",
    "PROVENANCE.json",
    "patches-bundle.json",
    "patches-list.json",
    "distribution/source.json",
    "docs/MOBILE.md",
    "docs/SETUP.md",
    "docs/FAQ.md",
    "docs/TROUBLESHOOTING.md",
    "docs/KNOWN_LIMITATIONS.md",
    "docs/BUILDING.md",
    "tools/prepare_mobile_source.py",
    "patches/src/main/kotlin/app/bitchord/patches/TelegramPatch.kt",
    "checks/VerifyDexControlFlow.java",
    ".github/ISSUE_TEMPLATE/bug_report.yml",
    ".github/ISSUE_TEMPLATE/feature_request.yml",
    ".github/workflows/source-checks.yml",
    ".github/workflows/mobile-release.yml",
]
EXCLUDED = {".git", ".deps", "build", "target", "__pycache__", "aar-libs"}
FORBIDDEN = {
    ".apk",
    ".apks",
    ".apkm",
    ".xapk",
    ".mpp",
    ".mpe",
    ".so",
    ".jks",
    ".keystore",
    ".p12",
    ".pem",
    ".key",
    ".session",
    ".db",
    ".mp3",
    ".flac",
    ".wav",
    ".m4a",
    ".ogg",
    ".opus",
}


def files():
    return [
        p
        for p in ROOT.rglob("*")
        if p.is_file() and not EXCLUDED.intersection(p.relative_to(ROOT).parts)
    ]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assets", type=Path)
    args = parser.parse_args()
    errors = []
    for name in REQUIRED:
        if not (ROOT / name).is_file():
            errors.append("Missing required file: " + name)
    count = 0
    for path in files():
        relative = str(path.relative_to(ROOT))
        if path.suffix.lower() in FORBIDDEN or path.name == ".env":
            errors.append(
                "Unexpected binary/media/account/signing artifact: " + relative
            )
        if path.suffix == ".py":
            try:
                ast.parse(path.read_text(), filename=relative)
            except SyntaxError as error:
                errors.append(str(error))
        if path.suffix == ".md":
            text = path.read_text()
            for link in re.findall(r"\]\(([^)]+)\)", text):
                link = link.strip("<>").split("#", 1)[0]
                if not link or re.match(r"[a-zA-Z][a-zA-Z0-9+.-]*:", link):
                    continue
                count += 1
                if not (path.parent / link).exists():
                    errors.append(relative + ": broken local link " + link)
        if path.suffix in {".md", ".java", ".kt", ".py", ".json", ".txt", ".yml"}:
            text = path.read_text(errors="replace")
            for pattern in [
                r"gh[pousr]_[A-Za-z0-9]{30,}",
                r"github_pat_[A-Za-z0-9_]{30,}",
                r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----",
            ]:
                if re.search(pattern, text):
                    errors.append(
                        "Possible secret in " + relative + " (value suppressed)"
                    )
    patch = (
        ROOT / "patches/src/main/kotlin/app/bitchord/patches/TelegramPatch.kt"
    ).read_text()
    if not re.search(r"default = 0,\s+required = false", patch) or not re.search(
        r'default = "",\s+required = false', patch
    ):
        errors.append("Blank API credential defaults need review")
    from prepare_mobile_source import load_config, validate_metadata

    source, metadata = load_config()
    validate_metadata(
        json.loads((ROOT / "patches-bundle.json").read_text()),
        json.loads((ROOT / "patches-list.json").read_text()),
        source,
        metadata,
    )
    if args.assets:
        from bootstrap_from_release import verify_bundle

        metadata = json.loads((ROOT / "PROVENANCE.json").read_text())
        bundle = args.assets / (
            "bitchord-patches-" + metadata["patch_bundle_version"] + ".mpp"
        )
        verify_bundle(bundle, metadata)
        rows = (args.assets / "SHA256SUMS").read_text().splitlines()
        expected_names = {bundle.name, "patches-bundle.json", "patches-list.json"}
        if len(rows) != len(expected_names):
            errors.append("Expected MPP and two metadata checksum rows")
        observed_names = set()
        for row in rows:
            expected, name = row.split("  ", 1)
            observed_names.add(name)
            if (
                name not in expected_names
                or hashlib.sha256((args.assets / name).read_bytes()).hexdigest()
                != expected
            ):
                errors.append("Release asset checksum mismatch")
        if observed_names != expected_names:
            errors.append("Release asset checksum names differ")
        for name in ("patches-bundle.json", "patches-list.json"):
            if (args.assets / name).read_bytes() != (ROOT / name).read_bytes():
                errors.append("Release/root source metadata differs: " + name)
        with zipfile.ZipFile(bundle) as archive:
            manifest = archive.read("META-INF/MANIFEST.MF").decode()
            if "Version: " + metadata["patch_bundle_version"] + "\n" not in manifest:
                errors.append("MPP manifest version mismatch")
    if errors:
        print("\n".join(errors), file=sys.stderr)
        raise SystemExit(1)
    print(
        f"PASS: {len(files())} repository files, {count} local Markdown links, Python syntax and narrow artifact/secret checks."
    )
    if args.assets:
        print("PASS: release MPP/native/API hashes, manifest version and SHA256SUMS.")


if __name__ == "__main__":
    main()
