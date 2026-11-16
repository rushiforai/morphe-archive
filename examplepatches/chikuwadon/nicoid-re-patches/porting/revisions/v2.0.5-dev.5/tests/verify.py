"""v2.0.5-dev.5 source regression checks: localized UI and original fixes."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.5-dev.5"
PREV2=ROOT/"porting/revisions/v2.0.5-dev.2"
PREV=ROOT/"porting/revisions/v2.0.5-dev.1"
text=lambda p:p.read_text(encoding="utf-8")
BUILD=text(REV/"build_mpp.py")
UI=text(PREV2/"java/e/e/a/UiStrings.java")
MULTI=text(PREV2/"java/e/e/a/MultiTabPlacement.java")
PATCH=text(REV/"patch_226.py")
LEGACY=text(PREV/"patch_222.py")
WORKFLOW=text(ROOT/".github/workflows/private-build.yml")
assert "version = 2.0.5-dev.5" in text(ROOT/"gradle.properties")
assert 'VERSION = "2.0.5-dev.5"' in BUILD
assert "from patch_226 import OVERRIDES, stage" in BUILD
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
assert "CommentFlow220;" in BUILD and "->fallback(Ljava/lang/Object;Ljava/lang/Object;FII)I" in BUILD
assert "if-gez v1, :nicoid_choose_crowded_lane_220" in BUILD
assert "fixed" in BUILD
assert "Fixed comments are excluded" in text(ROOT/"porting/revisions/v2.0.5-dev.4/java/e/e/a/CommentFlow220.java")
assert "v2.0.5-dev.5" in WORKFLOW
assert "porting/revisions/v2.0.5-dev.5/tests/verify.py" in WORKFLOW
# Validate the 18-category / 79-setting layout without manufacturing preferences.
import re
CATEGORY_SOURCE=text(REV/"java/e/e/a/SettingsCategories241.java")
SUMMARY_SOURCE=text(REV/"java/e/e/a/SettingsSummary217.java")
category_table=CATEGORY_SOURCE.split("private static final String[][] CATEGORIES={",1)[1].split("\n };",1)[0]
items_table=CATEGORY_SOURCE.split("private static final String[][] ITEMS={",1)[1].split("\n };",1)[0]
category_rows=re.findall(r'^    \{',category_table,flags=re.MULTILINE)
item_rows=re.findall(r'^    \{([^\n]*)\}',items_table,flags=re.MULTILINE)
assert len(category_rows)==18,(len(category_rows),"categories")
assert len(item_rows)==18,(len(item_rows),"item rows")
items=[re.findall(r'"([^"]+)"',row) for row in item_rows]
assert sum(map(len,items))==79,sum(map(len,items))
assert len(set(x for group in items for x in group))==79,"duplicate setting names"
assert items[9][0]=="動画再生画面の初期パネル"
assert items[1]==["ログインせずに使用","ログイン","ログアウト"]
assert "アンビエントモード" in items[7]
assert items[15]==["デバッグログの保存"]
assert "SettingsCategories241;" in BUILD and "->apply(Landroid/preference/PreferenceActivity;)V" in BUILD
assert "category_anchor" in BUILD
assert "attach(a);" in SUMMARY_SOURCE
assert "from.removePreference(p)" in CATEGORY_SOURCE
assert "targetGroup.addPreference(p)" in CATEGORY_SOURCE
assert "p.setOrder(target[1])" in CATEGORY_SOURCE
assert "created.setOrderingAsAdded(false)" in CATEGORY_SOURCE
assert "getDefaultSharedPreferences" not in CATEGORY_SOURCE
assert "new ListPreference" not in CATEGORY_SOURCE
print("PASS: 18 categories and 79 named items preserved exactly once")
print("PASS: reparenting existing Preference instances before search snapshot")
print("NOT VERIFIED: runtime title matching and conditional display variants")
spec=importlib.util.spec_from_file_location("_patch_v205_dev5",REV/"patch_226.py")
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
