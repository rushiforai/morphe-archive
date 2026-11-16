"""Regression guards for menu, languages and player issues in v2.0.5-dev.1."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.5-dev.1"
BUILDER=(REV/"build_mpp.py").read_text()
PATCH=(REV/"patch_222.py").read_text()
MERGE=(REV/"MergeLiveDex.java").read_text()
UI=(REV/"java/e/e/a/UiStrings.java").read_text()
PANEL=(REV/"java/e/e/a/PanelUi.java").read_text()
MP3=(REV/"java/e/e/a/Mp3Save214.java").read_text()
LIKE=(REV/"java/e/e/a/LikeState219.java").read_text()
FOLLOW=(REV/"java/e/e/a/CommentFollow219.java").read_text()
START=(REV/"java/e/e/a/DefaultPanel219.java").read_text()
WORKFLOW=(ROOT/".github/workflows/private-build.yml").read_text()
GRADLE=(ROOT/"gradle.properties").read_text()
assert "version = 2.0.5-dev.1" in GRADLE
assert 'VERSION = "2.0.5-dev.1"' in BUILDER
assert "from patch_222 import OVERRIDES, stage" in BUILDER
assert 'menu = (hooks / menu_file).read_text()' in BUILDER
assert '"video_menu_visible_"+MP4,true' in PATCH
assert "MenuEditor120.sort(others,a)" in PATCH
assert "Mp3Save214.java" in PATCH and 'p.name != "Mp3Save214.java"' in BUILDER
assert "CommentListExtras.smali" in BUILDER and "CommentFollow219;->restore" in BUILDER
assert "CommentFollow219;->save" in BUILDER
assert "nicoid_comment_auto_follow_v1" in FOLLOW
assert "VideoExtras.smali" in BUILDER and "LikeState219;->capture" in BUILDER
assert '"video"' in LIKE and '"viewer"' in LIKE and '"isLiked"' in LIKE
assert "NicoidVideoFragment;->B1" in BUILDER and "DefaultPanel219;->apply" in BUILDER
assert '"comments".equals(mode)' in START and "if(((Number)pagerClass.getMethod" in START
assert '"player"' in START and "nicoid_initial_player_panel" in START
assert "type.equals(\"Le/e/a/UiStrings;\")" in MERGE
assert "type.equals(\"Le/e/a/PanelUi;\")" in MERGE
assert "UiStrings.translate(s)" in PANEL
assert 'TEXT.put("動画・音声を保存"' in UI
assert 'TEXT.put("動画メニューの表示項目"' in UI
assert "PanelUi.tr(context" in MP3 and '.setTitle(PanelUi.tr(context' in MP3
assert "v2.0.5-dev.1" in WORKFLOW and "porting/revisions/v2.0.5-dev.1/tests/verify.py" in WORKFLOW
spec=importlib.util.spec_from_file_location("_dev5",REV/"patch_222.py")
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
with tempfile.TemporaryDirectory() as temp:
 dest=Path(temp)/"e/e/a";dest.mkdir(parents=True)
 mod.stage(ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a",dest)
 code=(dest/"DownloadActions116.java").read_text()
 assert '"video_menu_visible_"+MP4,true' in code
 assert "if(showSave)others.add(at,mp4)" in code
 assert "動画・音声を保存" in code
 assert not (dest/"Mp3Save214.java").exists()
print("PASS: save-action display/visibility, archived action order and EN/ZH source")
print("PASS: player Issues #135, #137 and #138 source/runtime wiring")
print("NOT TESTED: actual Android 16 UI, server response variants or translator screenshot coverage")
