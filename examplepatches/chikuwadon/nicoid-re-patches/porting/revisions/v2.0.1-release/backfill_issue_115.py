"""Backfill an issue link in the already-published v2.0.0 release BODY only.

Only the manually approved v2.0.1 release job calls this after publication.
Never modify tags, release assets, or the v2.0.0 source snapshot.
"""
from pathlib import Path
import os
import subprocess
import tempfile

OLD = "* **nicoid:** Add an option to recognize horizontal-only gestures independently of vertical-only gesture recognition."
NEW = "* **nicoid:** Add an option to recognize horizontal-only gestures independently of vertical-only gesture recognition ([#115](https://github.com/chikuwadon/nicoid-re-patches/issues/115))"

def main():
    if os.getenv("GITHUB_ACTIONS") != "true" or os.getenv("GITHUB_REF") != "refs/heads/main":
        raise SystemExit("The previous release body may only be updated by main Actions")
    if not os.getenv("GH_TOKEN"):
        raise SystemExit("Missing approved GitHub release token")
    original = subprocess.check_output(
        ["gh","release","view","v2.0.0","--json","body","--jq",".body"],text=True)
    if NEW in original:
        print("PASS: #115 is already linked in published v2.0.0")
        return
    if original.count(OLD) != 1:
        raise SystemExit("Existing v2.0.0 release prose unexpectedly changed")
    corrected = original.replace(OLD,NEW)
    with tempfile.TemporaryDirectory(prefix="nicoid-200-link-") as folder:
        output=Path(folder)/"release-notes.md"
        output.write_text(corrected,encoding="utf-8")
        subprocess.run(["gh","release","edit","v2.0.0","--notes-file",str(output)],check=True)
    print("PASS: linked Issue #115 without changing v2.0.0 tag or release assets")

if __name__ == "__main__":
    main()
