"""Check that the phone and TV bundles split the combined bundle cleanly.

Build each flavor first, then run:

    python3 .github/scripts/check_bundle_flavors.py \
        --cli tools/latest/morphe-desktop-2.1.1-all.jar \
        --all all.mpp --phone phone.mpp --tv tv.mpp

It fails when:
  - a patch in any bundle has no compatible package, or
  - a (patch, package, version) from the combined bundle is in neither split bundle.

It prints, for review, every (package, version) that both split bundles offer.
Apps whose phone and Android TV builds share a version name (Disney+, Plex,
Pluto TV, Starz) show up here. Anything else there is a TV version leaking into
the phone bundle, or the reverse.
"""

import argparse
import subprocess
import sys
import tempfile
from pathlib import Path


COMBINED_ONLY = {"Android TV source notice"}


def list_patches(cli: str, mpp: str) -> list[dict]:
    with tempfile.TemporaryDirectory() as tmp:
        out = Path(tmp) / "list.txt"
        subprocess.run(
            ["java", "-jar", cli, "list-patches", f"--patches={mpp}", "-p", "-v", "-x",
             "-d=false", f"--out={out}"],
            check=True, capture_output=True,
        )
        text = out.read_text()

    patches, current, package, mode = [], None, None, None
    for line in text.splitlines():
        if line.startswith("Name: "):
            current = {"name": line[6:], "packages": {}}
            patches.append(current)
            package = None
        elif "Package name:" in line:
            package = line.split(":", 1)[1].strip()
            # A patch can list one package twice (phone and TV entries).
            current["packages"].setdefault(package, set())
            mode = None
        elif "Compatible versions:" in line:
            mode = "versions"
        elif "Version codes:" in line:
            mode = "codes"
        elif line.startswith("\t\t") and mode == "versions" and package:
            current["packages"][package].add(line.strip())
    return patches


def triples(patches: list[dict]) -> set[tuple[str, str, str]]:
    # The TV bundle drops " (Android TV)" from patch names (tvName in BundleFlavor.kt).
    return {
        (p["name"].removesuffix(" (Android TV)"), package, version)
        for p in patches
        for package, versions in p["packages"].items()
        for version in versions or {"(any)"}
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cli", required=True)
    parser.add_argument("--all", required=True)
    parser.add_argument("--phone", required=True)
    parser.add_argument("--tv", required=True)
    args = parser.parse_args()

    bundles = {name: list_patches(args.cli, getattr(args, name)) for name in ("all", "phone", "tv")}
    failed = False

    for name, patches in bundles.items():
        print(f"{name}: {len(patches)} patches")
        for p in patches:
            if not p["packages"]:
                print(f"  FAIL {name}: '{p['name']}' has no compatible package")
                failed = True

    # The combined bundle's notice that the Android TV patches move to the TV
    # source (TvSourceNoticePatch.kt) is meant to be in neither split bundle.
    combined = {t for t in triples(bundles["all"]) if t[0] not in COMBINED_ONLY}
    split = triples(bundles["phone"]) | triples(bundles["tv"])
    for patch, package, version in sorted(combined - split):
        print(f"  FAIL missing from both split bundles: {patch} / {package} {version}")
        failed = True
    for patch, package, version in sorted(split - combined):
        print(f"  FAIL not in the combined bundle: {patch} / {package} {version}")
        failed = True

    def versions(patches):
        return {(pkg, v) for p in patches for pkg, vs in p["packages"].items() for v in vs}

    shared = sorted(versions(bundles["phone"]) & versions(bundles["tv"]))
    print("Versions both split bundles offer (expected only for shared version names):")
    for package, version in shared:
        print(f"  {package} {version}")

    print("FAILED" if failed else "OK")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
