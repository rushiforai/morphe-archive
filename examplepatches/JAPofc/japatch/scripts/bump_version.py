#!/usr/bin/env python3
"""Move the version, everywhere it is written, in one step.

    python3 scripts/bump_version.py 1.0.4          # from 1.0.3 to 1.0.4
    python3 scripts/bump_version.py --check        # fail if the places disagree
    python3 scripts/bump_version.py --current      # print the version everything agrees on

Four places carry the version, and a release is wrong when any of them disagrees:

    patches/src/main/resources/japatch/bootstrap.js   const revision = "..."
    gradle.properties                                 version, releaseTag, releaseAsset
    patches-list.json                                 "version": ""   (build.py writes it)
    patches-bundle.json                               "version": ""   (build.py writes it)
    docs/badges/release.svg                           the version on the README badge

The last two are generated, so --bump rewrites them too when they exist (including the
download address in patches-bundle.json, which is what Morphe Manager actually installs).
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROPERTIES = ROOT / "gradle.properties"
BOOTSTRAP = ROOT / "patches/src/main/resources/japatch/bootstrap.js"
LIST = ROOT / "patches-list.json"
BUNDLE = ROOT / "patches-bundle.json"
BADGE = ROOT / "docs" / "badges" / "release.svg"
VERSION = re.compile(r"^\d+\.\d+\.\d+$")


def props():
    found = {}
    for line in PROPERTIES.read_text().splitlines():
        if "=" in line and not line.strip().startswith("#"):
            key, value = line.split("=", 1)
            found[key.strip()] = value.strip()
    return found


def bootstrap_revision():
    text = BOOTSTRAP.read_text(encoding="utf-8")
    match = re.search(r'^\s*const revision = "([^"]+)";', text, re.M)
    if not match:
        raise SystemExit("bootstrap.js: no `const revision = \"...\";` line found")
    return match.group(1)


def generated_versions():
    out = {}
    for path in (LIST, BUNDLE):
        if path.exists():
            out[path.name] = json.loads(path.read_text()).get("version")
    return out


def found_versions():
    p = props()
    versions = {
        "bootstrap.js revision": bootstrap_revision(),
        "gradle.properties version": p.get("version"),
        "gradle.properties releaseTag": (p.get("releaseTag") or "").lstrip("v"),
        "gradle.properties releaseAsset": re.sub(r"^patches-|\.mpp$", "", p.get("releaseAsset") or ""),
    }
    for name, version in generated_versions().items():
        versions[name] = version
    if BADGE.exists():
        found = re.search(r"release: v(\d+\.\d+\.\d+)", BADGE.read_text(encoding="utf-8"))
        versions["docs/badges/release.svg"] = found.group(1) if found else None
    return versions


def check():
    versions = found_versions()
    bad = {name: version for name, version in versions.items() if version != versions["bootstrap.js revision"]}
    if bad:
        for name, version in bad.items():
            print(f"{name}: {version}", file=sys.stderr)
        raise SystemExit(f"version mismatch: bootstrap.js says {versions['bootstrap.js revision']}")
    print(f"version {versions['bootstrap.js revision']} everywhere ({len(versions)} places)")


def release_summary(version):
    sys.path.insert(0, str(ROOT / "scripts"))
    from release_info import notes
    return notes(version)


def release_notes(version):
    """The notes build.py insists on; written first, so --bump can't leave a version without them."""
    sys.path.insert(0, str(ROOT / "scripts"))
    from release_info import entries
    return any(found == version for found, _ in entries())


def bump(version):
    if not VERSION.match(version):
        raise SystemExit(f"\"{version}\" is not a version like 1.0.4")
    current = bootstrap_revision()
    if version == current:
        raise SystemExit(f"already {version}")
    if not release_notes(version):
        raise SystemExit(
            f"scripts/release_info.py has no [## {version}] section.\n"
            f"Write the release notes first (Morphe draws them as cards), then run this again.")

    text = BOOTSTRAP.read_text(encoding="utf-8")
    BOOTSTRAP.write_text(re.sub(r'^(\s*const revision = ")[^"]+(";)', rf"\g<1>{version}\g<2>", text, count=1, flags=re.M),
                         encoding="utf-8")

    lines = PROPERTIES.read_text().splitlines()
    out = []
    for line in lines:
        if line.startswith("version ="):
            line = f"version = {version}"
        elif line.startswith("releaseTag ="):
            line = f"releaseTag = v{version}"
        elif line.startswith("releaseAsset ="):
            line = f"releaseAsset = patches-{version}.mpp"
        out.append(line)
    PROPERTIES.write_text("\n".join(out) + "\n")

    if BADGE.exists():
        # The badge is an SVG in this repository, so nothing updates it the way GitHub updates a shields.io one:
        # it is written here, or it quietly keeps saying the old version.
        badge = BADGE.read_text(encoding="utf-8")
        badge = re.sub(r"(release: )v?\d+\.\d+\.\d+", rf"\g<1>v{version}", badge)
        badge = re.sub(r"(<text[^>]*>)v?\d+\.\d+\.\d+(</text>)", rf"\g<1>v{version}\g<2>", badge)
        BADGE.write_text(badge, encoding="utf-8")

    for path in (LIST, BUNDLE):
        if not path.exists():
            continue
        data = json.loads(path.read_text())
        data["version"] = version
        if path == BUNDLE:
            # The manifest Morphe Manager fetches: bumping only "version" left the download address and the
            # notes on the previous release, so Manager showed the new number and installed the old bundle.
            data["download_url"] = f"https://github.com/JAPofc/japatch/releases/download/v{version}/patches-{version}.mpp"
            data["page_url"] = f"https://github.com/JAPofc/japatch/releases/tag/v{version}"
            if release_notes(version):
                data["description"] = release_summary(version)
        path.write_text(json.dumps(data, indent=2) + "\n")

    check()
    # The README's feature table is generated from patches-list.json, which the build rewrites. Refreshing it
    # here means a release never ships a table that describes the previous one; --check in CI keeps it honest
    # either way.
    subprocess.run([sys.executable, ROOT / "scripts" / "readme_features.py"], cwd=ROOT, check=True)
    print(f"{current} -> {version}")
    print("next: python3 scripts/build.py   (writes patches-list.json and patches-bundle.json)")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    if sys.argv[1] == "--check":
        check()
    elif sys.argv[1] == "--current":
        print(bootstrap_revision())
    else:
        bump(sys.argv[1].lstrip("v"))
