#!/usr/bin/env python3
"""
Scrapes Google Play Store for the latest com.mygate.user version and
updates Constants.kt and README.md if a newer version is released.
"""

import os
import re
import subprocess
import sys
import urllib.request
from pathlib import Path


def parse_semver(v: str):
    parts = [int(p) for p in re.findall(r"\d+", v)]
    while len(parts) < 3:
        parts.append(0)
    return tuple(parts)


def main():
    repo_root = Path(__file__).resolve().parent.parent.parent
    constants_file = (
        repo_root
        / "patches/src/main/kotlin/app/morphe/patches/mygate/shared/Constants.kt"
    )
    readme_file = repo_root / "README.md"

    # 1. Scrape Google Play for latest MyGate version
    url = "https://play.google.com/store/apps/details?id=com.mygate.user&hl=en&gl=US"
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": (
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
                " (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
            )
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            html = resp.read().decode("utf-8")
    except Exception as e:
        print(f"Error fetching Google Play page: {e}", file=sys.stderr)
        sys.exit(1)

    matches = re.findall(r'\[\[\["([0-9]+\.[0-9]+(?:\.[0-9]+)?)"\]', html)
    if not matches:
        print(
            "Could not find any version numbers on Google Play page.",
            file=sys.stderr,
        )
        sys.exit(0)

    scraped_versions = sorted(set(matches), key=parse_semver, reverse=True)
    latest_scraped = scraped_versions[0]
    print(f"Latest version found on Google Play: {latest_scraped}")

    # 2. Parse current versions from Constants.kt
    constants_content = constants_file.read_text(encoding="utf-8")
    current_versions = re.findall(
        r'AppTarget\(version\s*=\s*"([^"]+)"', constants_content
    )
    print(f"Current versions in Constants.kt: {current_versions}")

    if not current_versions:
        print("Error: No current versions found in Constants.kt", file=sys.stderr)
        sys.exit(1)

    max_current = max(current_versions, key=parse_semver)

    if (
        parse_semver(latest_scraped) <= parse_semver(max_current)
        or latest_scraped in current_versions
    ):
        print(
            f"No newer version found. Scraped: {latest_scraped}, Current max:"
            f" {max_current}"
        )
        if "GITHUB_OUTPUT" in os.environ:
            with open(os.environ["GITHUB_OUTPUT"], "a") as f:
                f.write("new_version_found=false\n")
        return

    print(f"Newer version detected: {latest_scraped} > {max_current}")

    # 3. Update Constants.kt by reconstructing the targets list cleanly
    all_versions = sorted(
        set(current_versions + [latest_scraped]), key=parse_semver
    )
    target_lines = ["targets = listOf("]
    for v in all_versions:
        target_lines.append(f'            AppTarget(version = "{v}", minSdk = 26),')
    target_lines.append("        )")
    new_targets_block = "\n".join(target_lines)

    targets_pattern = r"targets\s*=\s*listOf\(\s*(?:AppTarget\([^)]+\),?\s*)+\)"
    if not re.search(targets_pattern, constants_content):
        print(
            "Error: Could not locate targets list in Constants.kt",
            file=sys.stderr,
        )
        sys.exit(1)

    new_constants = re.sub(targets_pattern, new_targets_block, constants_content)
    constants_file.write_text(new_constants, encoding="utf-8")
    print(f"Updated Constants.kt with targets:\n{new_targets_block}")

    # 4. Update README.md
    if readme_file.exists():
        readme_content = readme_file.read_text(encoding="utf-8")
        readme_content = re.sub(
            r"(\| `)" + re.escape(max_current) + r"(`)",
            r"\g<1>" + latest_scraped + r"`, `" + max_current + r"\g<2>",
            readme_content,
        )
        readme_content = re.sub(
            r"Supported and verified on MyGate version \*\*"
            + re.escape(max_current)
            + r"\*\*",
            f"Supported and verified on MyGate version **{latest_scraped}**",
            readme_content,
        )
        readme_content = re.sub(
            r"\(version `" + re.escape(max_current) + r"`\)",
            f"(version `{latest_scraped}`)",
            readme_content,
        )
        readme_file.write_text(readme_content, encoding="utf-8")
        print(f"Updated README.md with version {latest_scraped}")

    # 5. Validate Gradle Kotlin compilation if gradlew exists
    gradlew_path = repo_root / "gradlew"
    if gradlew_path.exists():
        print("Running ./gradlew :patches:compileKotlin to validate syntax...")
        gradle_cmd = [str(gradlew_path), ":patches:compileKotlin", "--no-daemon"]
        res = subprocess.run(
            gradle_cmd,
            cwd=repo_root,
            capture_output=True,
            text=True,
        )
        if res.returncode != 0:
            print(
                f"Error: Gradle compilation failed after version bump:\n{res.stdout}\n{res.stderr}",
                file=sys.stderr,
            )
            # Revert Constants.kt and README.md so workspace isn't left corrupted
            constants_file.write_text(constants_content, encoding="utf-8")
            sys.exit(1)
        print("Gradle compilation validation successful.")

    if "GITHUB_OUTPUT" in os.environ:
        with open(os.environ["GITHUB_OUTPUT"], "a") as f:
            f.write("new_version_found=true\n")
            f.write(f"latest_version={latest_scraped}\n")


if __name__ == "__main__":
    main()
