"""Write the files semantic-release would write for a release:
CHANGELOG.md (prepended), patches-bundle.json, and the version in patches-list.json.
Also writes the release notes to a separate file for `gh release create --notes-file`.

Usage:
  release_files.py <repo_dir> <version> <previous_version|-> <notes_out> "<sha>|<text>" ...

Each "<sha>|<text>" becomes one bullet under "New Features", e.g.
  "05b05312c2a701de0f6c913a09f70224a4e9e965|**Waze:** Add \"Trip history\" patch"
Prefix a text with "fix:" to list it under "Bug Fixes" instead.
"""
import datetime
import json
import pathlib
import sys

REPO = "SledgeSune/morphe-patches"

repo_dir = pathlib.Path(sys.argv[1])
version, previous, notes_out = sys.argv[2], sys.argv[3], pathlib.Path(sys.argv[4])
entries = [arg.split("|", 1) for arg in sys.argv[5:]]
features = [(sha, text) for sha, text in entries if not text.startswith("fix:")]
fixes = [(sha, text[4:].strip()) for sha, text in entries if text.startswith("fix:")]

now = datetime.datetime.now(datetime.timezone.utc)
if previous == "-":
    header = f"## {version} ({now:%Y-%m-%d})"
else:
    header = f"## [{version}](https://github.com/{REPO}/compare/v{previous}...v{version}) ({now:%Y-%m-%d})"

lines = [header]
for title, items in (("### ✨ New Features", features), ("### 🐛 Bug Fixes", fixes)):
    if items:
        lines += ["", title, ""]
        lines += [f"* {text} ([{sha[:7]}](https://github.com/{REPO}/commit/{sha}))" for sha, text in items]
notes = "\n".join(lines) + "\n"

changelog = repo_dir / "CHANGELOG.md"
old = changelog.read_text(encoding="utf-8") if changelog.exists() else ""
changelog.write_text(notes + ("\n" + old if old.strip() else ""), encoding="utf-8", newline="\n")

bundle = {
    "created_at": now.strftime("%Y-%m-%dT%H:%M:%S"),
    "description": notes,
    "download_url": f"https://github.com/{REPO}/releases/download/v{version}/patches-{version}.mpp",
    "signature_download_url": "",
    "version": version,
}
(repo_dir / "patches-bundle.json").write_text(
    json.dumps(bundle, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")

patch_list_path = repo_dir / "patches-list.json"
patch_list = json.loads(patch_list_path.read_text(encoding="utf-8"))
patch_list["version"] = version
patch_list_path.write_text(json.dumps(patch_list, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")

notes_out.write_text(notes, encoding="utf-8")
print(f"Wrote release files for v{version} ({len(features)} features, {len(fixes)} fixes)")
