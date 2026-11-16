"""v2.0.5-dev.3 source regression checks: localized UI and original fixes."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.5-dev.3"
PREV2=ROOT/"porting/revisions/v2.0.5-dev.2"
PREV=ROOT/"porting/revisions/v2.0.5-dev.1"
text=lambda p:p.read_text(encoding="utf-8")
BUILD=text(REV/"build_mpp.py")
UI=text(PREV2/"java/e/e/a/UiStrings.java")
MULTI=text(PREV2/"java/e/e/a/MultiTabPlacement.java")
PATCH=text(REV/"patch_224.py")
LEGACY=text(PREV/"patch_222.py")
WORKFLOW=text(ROOT/".github/workflows/private-build.yml")
assert "version = 2.0.5-dev.3" in text(ROOT/"gradle.properties")
assert 'VERSION = "2.0.5-dev.3"' in BUILD
assert "from patch_224 import OVERRIDES, stage" in BUILD
assert 'menu = (hooks / menu_file).read_text()' in BUILD
assert '"video_menu_visible_"+MP4,true' in LEGACY
assert "MenuEditor120.sort(others,a)" in LEGACY
assert "CommentFollow219;->restore" in BUILD and "CommentFollow219;->save" in BUILD
assert "LikeState219;->capture" in BUILD
assert "DefaultPanel219;->apply" in BUILD
assert "CommentSettings194$Preview.smali" in BUILD
assert "CommentSettings194$Editor.smali" in BUILD
assert "TranslationExtras220;->array" in BUILD
assert "localize_sample" in BUILD
assert "UiStrings.translate(LABELS[i])" in MULTI
assert "UiStrings.translate(LABELS[mode])" in MULTI
assert 'UiStrings.translate("初期値")' in MULTI
assert 'p.name != "UiStrings.java"' in BUILD
assert '"MultiTabPlacement.java"' in BUILD
for label in ("上部：アプリバー → タブバー","下部：タブバー → アプリバー",
              "上固定コメント","下固定コメント","通常コメント","色付きコメント",
              "無効","適用","密度","ニコニ広告","MP4で保存"):
 assert "TEXT.put(\""+label+"\"" in UI,label
assert (PREV2/"java/e/e/a/TranslationExtras220.java").exists()
assert (PREV/"java/e/e/a/CommentFollow219.java").exists()
assert (PREV/"java/e/e/a/LikeState219.java").exists()
assert (PREV/"java/e/e/a/DefaultPanel219.java").exists()
assert "CommentFlow220;" in BUILD and "->start(FF)F" in BUILD
assert "CommentFlow220;" in BUILD and "->height(Ljava/lang/String;F)F" in BUILD
assert "visuals.count(old_start)" in BUILD
assert "lane_signature" in BUILD
assert "fixed" not in text(REV/"java/e/e/a/CommentFlow220.java").lower() or "fixed comments" in text(REV/"build_mpp.py").lower()
assert "v2.0.5-dev.3" in WORKFLOW
assert "porting/revisions/v2.0.5-dev.3/tests/verify.py" in WORKFLOW
spec=importlib.util.spec_from_file_location("_patch_v205_dev2",REV/"patch_224.py")
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
with tempfile.TemporaryDirectory() as tmp:
 dest=Path(tmp)/"e/e/a"
 dest.mkdir(parents=True)
 module.stage(ROOT/"porting/revisions/v2.0.0-dev.1/java/e/e/a",dest)
 actions=text(dest/"DownloadActions116.java")
 assert "if(showSave)others.add(at,mp4)" in actions
 assert "MenuEditor120.sort(others,a)" in actions
 assert "動画・音声を保存" in actions
print("PASS: preserved menu visibility, languages, comments, likes and default panel")
print("PASS: localized native comment preview/spinner and all six app/tab layouts")
print("NOT TESTED: physical Android patch application and full-screen localization")
