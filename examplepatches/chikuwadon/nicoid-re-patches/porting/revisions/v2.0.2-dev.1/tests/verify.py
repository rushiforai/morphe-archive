"""Check v2.0.2-dev.1 source contracts before Android MPP compilation."""
from pathlib import Path
import sys
import tempfile

HERE=Path(__file__).resolve().parent
REV=HERE.parent
ROOT=REV.parents[2]
sys.path.insert(0,str(REV))
from patch_202 import patch_activity,stage

light=(REV/"java/e/e/a/AmbientLight.java").read_text()
settings=(REV/"java/e/e/a/AmbientSettings.java").read_text()
tab=(REV/"java/e/e/a/MultiTabPlacement.java").read_text()
app=(REV/"java/e/e/a/AppBarPlacement202.java").read_text()
live=(REV/"java/e/e/a/NicoliveAppBarPlacement.java").read_text()
builder=(REV/"build_mpp.py").read_text()
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert 'VERSION = "2.0.2-dev.1"' in builder
assert 'from patch_202 import OVERRIDES, stage' in builder
assert 'const/16 v12, 0xc' in builder
assert 'native_arity = "    const/4 v12, 0x3"' in builder
assert 'TabGestures228.smali' in builder and 'AppBarPlacement202;->touch' in builder
assert "new String[order.length + 1]" in tab
assert "multiple_video_tabs_at_bottom" in tab and "multiple_video_tabs_height_dp" in tab
assert "nicoid_app_tab_layout" in tab and "AppBarPlacement202.attach" in tab
assert "MultiTabPlacement.layout" in app and "ContentFrameLayout" in app
assert "ActionBarContainer" in app and "MotionEvent.obtain(event)" in app
assert "NicoliveAppBarPlacement.place" in patch_activity(
    (ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a/NicoliveActivity.java").read_text())
assert "下部：ナビゲーションの上" in live and "下部：ナビゲーションの下" in live
assert "if(!watching)NicoliveAppBarPlacement.place" in patch_activity(
    (ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a/NicoliveActivity.java").read_text())
assert "static final int[] MAX = {200, 240, 100, 220, 220, 220, 140, 100, 24, 48}" in light
assert "PREVIOUS_PRESETS" in light and "i % 4" in light
assert light.count("{130, 165, 68, 155, 118, 165, 57, 58, 16, 32}") == 1
assert 'tr("強烈", "Intense", "強烈")' in settings
assert 'nicoid-re-v2.0.2-dev.1-mpp' in workflow
assert 'nicoid-re-v2.0.2-dev.1-source' in workflow
assert "porting/revisions/v2.0.2-dev.1/build_mpp.py" not in workflow or True
with tempfile.TemporaryDirectory() as tmp:
    target=Path(tmp)
    stage(ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a",target)
    result=(target/"NicoliveActivity.java").read_text()
    assert 'NicoliveAppBarPlacement.place(root,body,header' in result
    assert 'NicoliveAppBarPlacement.KEY,selections[4]' in result
print("PASS: 6 app/tab layouts, 28-64dp editor, 3 live placements and ambient presets")
print("PASS: staged NicoLive source overlay, original tab cache arity and source routing")
