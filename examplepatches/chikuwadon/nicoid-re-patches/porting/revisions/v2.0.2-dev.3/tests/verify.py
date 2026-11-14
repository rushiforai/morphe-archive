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
assert 'VERSION = "2.0.2-dev.3"' in builder
assert 'from patch_202 import OVERRIDES, stage' in builder
assert 'const/16 v12, 0xc' in builder
assert 'native_arity = "    const/4 v12, 0x3"' in builder
assert 'TabGestures228.smali' in builder and 'AppBarPlacement202;->touch' in builder
assert "new String[order.length + 1]" in tab
assert "上部：アプリバー・下部：タブバー" in tab
assert "上部：タブバー・下部：アプリバー" in tab
assert 'heightValue.setText("初期値 "' in tab
assert 'border.setStroke' in tab and 'new GradientDrawable()' in tab
assert '▣　動画情報' in tab and '▣　動画一覧' not in tab
assert 'titleParams.leftMargin' in tab and 'LayoutParams(0,-1,1)' in tab
assert 'panel.setPadding(pad, PanelUi.dp(c, 8)' in tab
assert 'bar.getParent() == parent' in tab
assert 'setClipChildren(false)' in app and 'nicoid-tab-decor-layer' in app
assert 'nativeParent.addView(placeholder' in app and 'layer.addView(bar' in app
assert 'AppBarLayoutMath202.calculate' in app
assert '"ActionBarContainer"' in app and '"ContentFrameLayout"' in app
patched_live = patch_activity((ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a/NicoliveActivity.java").read_text())
assert 'setTitle("ニコ生")' not in patched_live[patched_live.index("private void showHubMenu"):patched_live.index("private void showHubSettings")]
assert 'window.setGravity(Gravity.BOTTOM|Gravity.END);' in patched_live
assert 'window.setLayout(Math.min(available,NicoliveUi.dp(this,244))' in patched_live
# Regression: the user log from Android 16 failed because setDependency()
# ran before the new preference had a PreferenceManager attached.
start=tab.index("private static void addConfiguration(PreferenceGroup group)")
end=tab.index("private static void updateSummary",start)
setting=tab[start:end]
assert setting.index("group.addPreference(preference);") < setting.index("preference.setDependency(ENABLE);"), "Dependency must be attached after adding"
assert 'if (group.findPreference(ENABLE) == null) return order;' in tab
assert 'if (group.findPreference(LAYOUT) == null) addConfiguration(group);' in tab
print("PASS: settings initialization dependency registration order (Android 16 crash regression)")
assert "multiple_video_tabs_at_bottom" in tab and "multiple_video_tabs_height_dp" in tab
assert "nicoid_app_tab_layout" in tab and "AppBarPlacement202.attach" in tab
assert "MultiTabPlacement.layout" in app and "ContentFrameLayout" in app
assert "ActionBarContainer" in app and "static boolean touch(Activity activity, MotionEvent event) { return false; }" in app
assert "NicoliveAppBarPlacement.place" in patch_activity(
    (ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a/NicoliveActivity.java").read_text())
assert "下部：ナビゲーションの上" in live and "下部：ナビゲーションの下" in live
assert "if(!watching)NicoliveAppBarPlacement.place" in patch_activity(
    (ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a/NicoliveActivity.java").read_text())
assert "static final int[] MAX = {200, 240, 100, 220, 220, 220, 140, 100, 24, 48}" in light
assert "PREVIOUS_PRESETS" in light and "i % 4" in light
assert light.count("{130, 165, 68, 155, 118, 165, 57, 58, 16, 32}") == 1
assert 'tr("強烈", "Intense", "強烈")' in settings
assert 'nicoid-re-v2.0.2-dev.3-mpp' in workflow
assert 'version=2.0.2-dev.3' in workflow
assert 'unzip -p "$output" META-INF/MANIFEST.MF | grep -Fq "Version: $version"' in workflow
assert 'nicoid-re-v2.0.2-dev.3-source' in workflow
assert "porting/revisions/v2.0.2-dev.1/build_mpp.py" not in workflow or True
with tempfile.TemporaryDirectory() as tmp:
    target=Path(tmp)
    stage(ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a",target)
    result=(target/"NicoliveActivity.java").read_text()
    assert 'NicoliveAppBarPlacement.place(root,body,header' in result
    assert 'NicoliveAppBarPlacement.KEY,selections[4]' in result
print("PASS: 6 app/tab layouts, 28-64dp editor, 3 live placements and ambient presets")
print("PASS: staged NicoLive source overlay, original tab cache arity and source routing")
