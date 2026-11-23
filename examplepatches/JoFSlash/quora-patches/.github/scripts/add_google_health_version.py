"""Lists a Google Health version as supported in Constants.kt, as the first (newest) target.

Usage: python .github/scripts/add_google_health_version.py <version>
Exits 0 when the version was added, 3 when it was already listed.
"""
import pathlib
import re
import sys

CONSTANTS = (pathlib.Path(__file__).resolve().parents[2]
             / "patches/src/main/kotlin/app/jofslash/patches/googlehealth/shared/Constants.kt")
VERSION = re.compile(r"\d+(\.\d+)+\.health-mobile-\d+-\d+")


def main():
    if len(sys.argv) != 2 or not VERSION.fullmatch(sys.argv[1]):
        sys.exit("Usage: add_google_health_version.py <version, for example 5.13.health-mobile-1104148438-1023845615>")
    version = sys.argv[1]
    raw = CONSTANTS.read_bytes().decode("utf8")
    newline = "\r\n" if "\r\n" in raw else "\n"
    if f'AppTarget(version = "{version}")' in raw:
        print(f"{version} is already listed.")
        sys.exit(3)
    match = re.search(r"( *)targets = listOf\(\r?\n", raw)
    if not match:
        sys.exit("Couldn't find the targets list in Constants.kt.")
    indent = match.group(1) + "    "
    line = f'{indent}AppTarget(version = "{version}"),{newline}'
    raw = raw[:match.end()] + line + raw[match.end():]
    CONSTANTS.write_bytes(raw.encode("utf8"))
    print(f"Added {version} to Constants.kt.")


if __name__ == "__main__":
    main()
