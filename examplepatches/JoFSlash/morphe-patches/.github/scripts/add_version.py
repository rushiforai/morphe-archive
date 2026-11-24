"""Lists a version of an app as supported in its Constants.kt, as the first (newest) target.

Usage: python .github/scripts/add_version.py <app> <version>
<app> is the name of the app's file in .github/apps (without .json).
Exits 0 when the version was added, 3 when it was already listed.
"""
import re
import sys

from app_versions import App


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    app = App(sys.argv[1])
    version = sys.argv[2]
    if not app.valid(version):
        sys.exit(f"Usage: add_version.py {app.key} <version, for example {app.example}>")
    raw = app.constants.read_bytes().decode("utf8")
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
    app.constants.write_bytes(raw.encode("utf8"))
    print(f"Added {version} to {app.name}'s Constants.kt.")


if __name__ == "__main__":
    main()
