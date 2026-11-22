#!/usr/bin/env python3
"""Guard the external-link mode bridge and real Android manifest owner list."""
from __future__ import annotations
import ast
import re
from pathlib import Path
from zipfile import ZipFile
import sys

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / "porting/tests"))
from VerifyManifest import elements

source = (HERE / "LinkIntentPolicy217.java").read_text(encoding="utf-8")
script = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
ast.parse(script)
assert 'version = 2.1.7-dev.1' in (ROOT / "gradle.properties").read_text()
assert '2.1.7-dev.1' in (ROOT / ".github/workflows/private-build.yml").read_text()
for value, index in [("0", 0), ("2", 2), ("3", 3), ("4", 3)]:
    assert ('"' + value + '".equals(value)') in source, value
assert 'return 1;' in source
for token in (
        "registerOnSharedPreferenceChangeListener",
        "setComponentEnabledSetting", "getComponentEnabledSetting",
        "PackageManager.DONT_KILL_APP",
        "COMPONENT_ENABLED_STATE_ENABLED", "COMPONENT_ENABLED_STATE_DISABLED",
        "nicoid_fullscreen_link262",
):
    if token == "nicoid_fullscreen_link262":
        continue # Virtual fullscreen stores native mode 1; it is not another Activity.
    assert token in source, token
expected = {
    "com.sauzask.nicoid.intent.NicoidIntentSelect",
    "com.sauzask.nicoid.intent.NicoidVideoActivityIntent",
    "com.sauzask.nicoid.intent.NicoidVideoInfoActivityIntent",
    "com.sauzask.nicoid.intent.NicoidPopupViewActivityIntent",
}
assert all(name.rsplit(".", 1)[-1] in source for name in expected)
with ZipFile(ROOT / "patches/src/main/resources/nicoid/resources.zip") as zip_file:
    manifest = zip_file.read("AndroidManifest.xml")
actual = {
    next((value for (_, key), value in attrs.items() if key == "name"), None)
    for tag, attrs in elements(manifest)
    if tag == "activity"
}
assert expected <= actual, "Missing external link receiver in Android manifest"
assert 'LinkIntentPolicy217;' in script
assert '->install(Landroid/content/Context;)V' in script
assert 'b"Version: 2.1.6\\r\\n"' in script
assert '2.1.6' in script and 'c8e1c627bb15c46e' in script
assert 'result.read("nicoid/method-delta.dex")' in script
assert 'result.read("nicoid/resources.zip")' in script
print("PASS: 0=selection, 1=normal/fullscreen, 2=information, 3=popup, 4=background; manifest and staging locked")
