#!/usr/bin/env python3
"""Check the exact reviewed release staging, its public notes and approval guards."""
from pathlib import Path
import hashlib
import re

ROOT = Path(__file__).resolve().parents[3]
def read(path):
    return (ROOT / path).read_text(encoding="utf-8")

assert re.search(r"(?m)^version\s*=\s*2\.1\.7\s*$", read("gradle.properties"))
notes = read(".github/release-notes/v2.1.7.md")
assert notes.startswith("## 2.1.7\n")
assert notes.count("* **nicoid:** ") == 6, "Unapproved release note entries"
assert "### 🐛 Bug Fixes" in notes and "### 🔧 Improvements" in notes
assert notes.index("### 🐛 Bug Fixes") < notes.index("### 🔧 Improvements")
for phrase in ("external links", "popup playback", "background playback",
               "fullscreen playback", "without requiring an app restart",
               "status bar", "status-bar inset", "repeated transitions"):
    assert phrase in notes, phrase
for line in notes.splitlines():
    if line.startswith("* **nicoid:** "):
        assert "**" not in line[len("* **nicoid:** "):]
source = ROOT / "porting/revisions/v2.1.7-dev.3/stage_candidate.py"
blob = source.read_bytes()
actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
assert actual == "037591be923b803b0ae66d87acb0a7a768a2e0ce", "Reviewed dev.3 source changed"
assert "NormalVideoInsets;->schedule(Landroid/view/View;)V" in blob.decode("utf-8")
assert "lambda$afterFullscreenRestore$" in blob.decode("utf-8")
assert "PREVIOUS_VERSION = \"2.1.7-dev.2\"" in blob.decode("utf-8")
assert "VERSION = \"2.1.7-dev.3\"" in blob.decode("utf-8")
for hidden in ("easter egg", "Easter Egg", "自転車ラン", "Bicycle Run"):
    assert hidden not in notes, "Private feature leaked into public release note"

shell = read(".github/scripts/stage-v2.1.7-mpp.sh")
assert "037591be923b803b0ae66d87acb0a7a768a2e0ce" in shell
assert "c8e1c627bb15c46ebf49345bc0a703f00ed05998783fb280326c555527bb2978" in shell
assert "2[.]1[.]7[[:space:]]*$" in shell
assert 'script.count(\'VERSION = "2.1.7-dev.3"\') != 1' in shell
assert 'script.replace(\'VERSION = "2.1.7-dev.3"\', \'VERSION = "2.1.7"\')' in shell
assert "porting/revisions/v2.1.7-dev.3/stage_candidate.py" in shell
for path in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.7-mpp.sh" in read(path), path
assert 'if version == "2.1.7":' in read(".github/scripts/verify-release-mpp.py")
assert 'project.version.toString() != "2.1.7"' in read("patches/build.gradle.kts")
print("PASS: v2.1.7 stable release inputs and approval policy")
