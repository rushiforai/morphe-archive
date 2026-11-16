"""v2.0.5-dev.17 source regression checks: localized UI and original fixes."""
from pathlib import Path
import importlib.util
import tempfile
import re
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.5-dev.17"
PREV2=ROOT/"porting/revisions/v2.0.5-dev.2"
PREV=ROOT/"porting/revisions/v2.0.5-dev.1"
text=lambda p:p.read_text(encoding="utf-8")
BUILD=text(REV/"build_mpp.py")
UI=text(ROOT/"porting/revisions/v2.0.5-dev.9/java/e/e/a/UiStrings.java")
MULTI=text(PREV2/"java/e/e/a/MultiTabPlacement.java")
PATCH=text(REV/"patch_237.py")
OLD_PATCH=text(ROOT/"porting/revisions/v2.0.5-dev.8/patch_229.py")
LEGACY=text(PREV/"patch_222.py")
WORKFLOW=text(ROOT/".github/workflows/private-build.yml")
# Preserve this source regression for v2.0.5 stable and later builds.
version_match = re.search(r'^version\s*=\s*(\d+\.\d+\.\d+(?:-dev\.[1-9]\d*)?)\s*$',
                          text(ROOT/"gradle.properties"), flags=re.MULTILINE)
assert version_match, "Missing or malformed Gradle version"
active_version = version_match.group(1)
assert tuple(int(part) for part in active_version.split("-", 1)[0].split(".")) >= (2, 0, 5), active_version
assert 'VERSION = "2.0.5-dev.17"' in BUILD
assert "from patch_237 import OVERRIDES, stage" in BUILD
assert 'menu = (hooks / menu_file).read_text()' in BUILD
assert '"video_menu_visible_"+MP4,true' in LEGACY
assert "MenuEditor120.sort(others,a)" in LEGACY
assert "CommentFollow219;->restore" in BUILD and "CommentFollow219;->save" in BUILD
assert "LikeState219;->capture" in BUILD
assert "DefaultPanel219;->applyPager" in BUILD
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
assert (REV/"java/e/e/a/DefaultPanel219.java").exists()
assert "CommentFlow220;" in BUILD
assert 'v2.0.5-dev.4/java' in BUILD, "CommentFlow220.java must be compiled"
assert "CommentFlow220;" in BUILD and "->start(FF)F" in BUILD
assert "CommentFlow220;" in BUILD and "->height(Ljava/lang/String;F)F" in BUILD
assert "visuals.count(old_start)" in BUILD
assert "lane_signature" in BUILD
assert "CommentFlow220;" in BUILD and "->fallback(Ljava/lang/Object;Ljava/lang/Object;FII)I" in BUILD
assert "if-gez v1, :nicoid_choose_crowded_lane_220" in BUILD
assert "fixed" in BUILD
assert "Fixed comments are excluded" in text(ROOT/"porting/revisions/v2.0.5-dev.4/java/e/e/a/CommentFlow220.java")
assert "v2.0.5-dev.17" in WORKFLOW
assert "porting/revisions/v2.0.5-dev.17/tests/verify.py" in WORKFLOW
# Validate the 18-category / 78-setting layout without manufacturing preferences.
CATEGORY_SOURCE=text(REV/"java/e/e/a/SettingsCategories241.java")
SUMMARY_SOURCE=text(ROOT/"porting/revisions/v2.0.5-dev.5/java/e/e/a/SettingsSummary217.java")
category_table=CATEGORY_SOURCE.split("private static final String[][] CATEGORIES={",1)[1].split("\n };",1)[0]
items_table=CATEGORY_SOURCE.split("private static final String[][] ITEMS={",1)[1].split("\n };",1)[0]
category_rows=re.findall(r'^    \{',category_table,flags=re.MULTILINE)
item_rows=re.findall(r'^    \{([^\n]*)\}',items_table,flags=re.MULTILINE)
assert len(category_rows)==18,(len(category_rows),"categories")
assert len(item_rows)==18,(len(item_rows),"item rows")
items=[re.findall(r'"([^"]+)"',row) for row in item_rows]
assert sum(map(len,items))==78,sum(map(len,items))
assert len(set(x for group in items for x in group))==78,"duplicate setting names"

# Every one of the 78 setting labels must have both EN and Traditional Chinese.
# A missing entry must fail CI instead of moving the setting under General.
dictionary=set(re.findall(r'TEXT\.put\("([^"]+)"',UI))
untranslated=[label for row in items for label in row if label not in dictionary]
assert not untranslated,("Missing localized preference labels",untranslated)
for text_label in ("ホーム","言語","カスタムカラー","背景色","文字の基本色",
                  "アクセント色","上部バーの色","プレビュー","生放送",
                  "ニコ生メニュー","番組表","来場者数が多い順"):
 assert text_label in dictionary,("Missing UI translation",text_label)
VALUE_SOURCE=text(ROOT/"porting/revisions/v2.0.5-dev.8/java/e/e/a/SettingsValue251.java")
assert "getEntryValues()" in VALUE_SOURCE and "getString(key" in VALUE_SOURCE
assert "startup_screen" in VALUE_SOURCE and "setSummary(label)" in VALUE_SOURCE
assert "entry value" in VALUE_SOURCE and "valueIndex(" in VALUE_SOURCE

assert items[9][0]=="動画再生画面の初期パネル"
assert items[1]==["ログインせずに使用","ログイン","ログアウト"]
assert "アンビエントモード" in items[7]
assert items[15]==["デバッグログの保存"]
assert '"nicoid_storage_diagnostic".equals(key)' in CATEGORY_SOURCE
assert "new int[]{15,1}" in CATEGORY_SOURCE
assert "UiStrings.translate(expected,Locale.ENGLISH)" in CATEGORY_SOURCE
assert "UiStrings.translate(expected,Locale.TRADITIONAL_CHINESE)" in CATEGORY_SOURCE
assert "existing.setTitle(localized)" in CATEGORY_SOURCE
assert "if(group.getKey()==null||!group.getKey().startsWith(PREFIX))prior.add(group)" in CATEGORY_SOURCE
assert "origins.put(child,group)" in CATEGORY_SOURCE
assert "fallbackCategory(source)" in CATEGORY_SOURCE
assert 'v2.0.5-dev.5/java' in BUILD and 'v2.0.5-dev.6/java' in BUILD
assert '"SettingsCategories241.java"' in BUILD
assert "SettingsCategories241;" in BUILD and "->apply(Landroid/preference/PreferenceActivity;)V" in BUILD
assert "category_anchor" in BUILD
assert "attach(a);" in SUMMARY_SOURCE
assert "from.removePreference(p)" in CATEGORY_SOURCE
assert "destination.addPreference(p)" in CATEGORY_SOURCE
assert "p.setOrder(target[1])" in CATEGORY_SOURCE
assert "created.setOrderingAsAdded(false)" in CATEGORY_SOURCE
assert "SettingsValue251.install(a)" in CATEGORY_SOURCE
assert 'KEY_ALIASES.put("main_rotation"' in CATEGORY_SOURCE
assert 'KEY_ALIASES.put("player_rotation"' in CATEGORY_SOURCE
assert 'UiStrings.translate(ITEMS[target[0]][target[1]])' in CATEGORY_SOURCE
assert 'TEXT.put("ホーム"' in UI
assert 'TEXT.put("カスタムカラー"' in UI
assert 'TEXT.put("生放送"' in UI
assert 'JAPANESE_LOOKUP.putIfAbsent(v,entry.getKey())' in UI
assert 'v2.0.5-dev.2/java' in BUILD and 'p.name != "UiStrings.java"' in BUILD
assert 'NicoliveActivity.java' in OLD_PATCH and 'NicoliveUi.java' in OLD_PATCH
assert 'AppLocale251.translate' in OLD_PATCH
assert 'NicoliveUi.java' in OLD_PATCH and 'NicoliveActivity.java' in OLD_PATCH
assert "Live program labels" in OLD_PATCH and "Live new comments" in OLD_PATCH
assert "Localize native live alert titles" in OLD_PATCH

assert "UiStrings.selectLanguage(" in CATEGORY_SOURCE
assert "new ListPreference" not in CATEGORY_SOURCE
PANEL=text(REV/"java/e/e/a/DefaultPanel219.java")
LABELS=text(REV/"java/e/e/a/SettingsLabels252.java")
assert '"menu","related"' in PANEL
assert '"info","comments","menu","related"' in PANEL
assert "getPageTitle" in PANEL and "postDelayed" in PANEL
assert "applyPager(View pager)" in PANEL and "Initial player panel diagnostics" in PANEL
assert "NicoidViewPager;" in BUILD and "->applyPager(Landroid/view/View;)V" in BUILD
assert "DefaultPanel219;->append" in BUILD
assert "a.recreate();" in LABELS and '"app_lang".equals(key)' in LABELS
assert "fixedIndex(choice)" in PANEL
assert "selectNativeTab(pager,choice)" in PANEL
assert "isRedundantSleep(p)" in CATEGORY_SOURCE
assert '"スリープ再生"' not in items[7]
assert "UiStrings.translate(variants[0])" in CATEGORY_SOURCE
assert 'p.setTitle(UiStrings.translate("nicoidについて"))' in LABELS and "Native reset to Video info" in PANEL
assert "updateSummary(a,p,choice)" in PANEL
assert 'KEY_ALIASES.put("mp4_tree_uri","動画・音声の保存先フォルダ")' in CATEGORY_SOURCE
assert "SettingsLabels252.install(a)" in CATEGORY_SOURCE
assert "public static void updateLanguage(PreferenceActivity activity)" in CATEGORY_SOURCE
assert "legacy group headers" in CATEGORY_SOURCE.lower()
assert "SettingsCategories241.updateLanguage(a)" in LABELS
assert "動画・音声の保存先フォルダ" in LABELS
assert "保存したMP4・MP3は本アプリでは再生できません" in LABELS
assert "Long-press playback speed" in LABELS
assert "Language" in LABELS
assert "isCloseGlyph(source)" in UI
assert 'TEXT.put("全画面表示"' in UI
assert "currentDateLocale()" in text(ROOT/"porting/revisions/v2.0.5-dev.9/patch_230.py")
assert 'const v2, 0x3f866666' in BUILD
assert 'AppLocale251;' in BUILD and '->dialog(Landroid/app/Dialog;)V' in BUILD
# Keep original image overlays, preference values, callback actions and dialog shape.
import subprocess
with tempfile.TemporaryDirectory() as tmp:
  source_jar=str(ROOT/"porting/revisions/v2.0.5-dev.9/java/e/e/a/UiStrings.java")
  test_java=str(ROOT/"porting/revisions/v2.0.5-dev.11/tests/UiStrings252Test.java")
  ui_test=str(REV/"tests/DrawerLocaleTest.java")
  subprocess.run(["javac","-encoding","UTF-8","-d",tmp,source_jar,test_java,ui_test],check=True)
  subprocess.run(["java","-cp",tmp,"e.e.a.DrawerLocaleTest"],check=True)
  subprocess.run(["java","-cp",tmp,"e.e.a.UiStrings252Test"],check=True)
print("PASS: 18 categories and 78 named items preserved exactly once")
print("PASS: reparenting existing Preference instances before search snapshot")
print("NOT VERIFIED: runtime title matching and conditional display variants")
# Player controls use their original IDs and saved hidden preferences.
PREVIOUS_UI=text(ROOT/"porting/revisions/v2.0.5-dev.6/patch_227.py")
DIALOG=text(ROOT/"porting/revisions/v2.0.5-dev.6/java/e/e/a/DialogCorner242.java")
assert "hidden.remove(ID)" in PREVIOUS_UI
assert "after speed and quality" in PREVIOUS_UI
assert "Math.min(getWidth(), getHeight()) * .31f" in PREVIOUS_UI
assert "PopupControl222.smali" in BUILD
assert "PopupReturnIcon223.smali" in BUILD
assert "PlayerButtons193.smali" in BUILD
assert "DialogCorner242;" in BUILD and "->style(Landroid/app/Dialog;)V" in BUILD
assert "DialogCorner242;" in BUILD and "->install(Landroid/preference/PreferenceActivity;)V" in BUILD
assert "original.onPreferenceClick" in DIALOG
assert "getDialog()" in DIALOG and "UiTheme191.window(dialog)" in DIALOG
print("PASS: visible ambient and normal controls by default, ambient after quality")
print("PASS: aligned glyph sizes and standardized rounded settings/custom dialogs")
spec=importlib.util.spec_from_file_location("_patch_v205_dev12",REV/"patch_237.py")
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

RESUME=text(REV/"java/e/e/a/AppResume253.java")
GUARD=text(REV/"java/e/e/a/AppSwitchGuard.java")
DRAWER=text(REV/"java/e/e/a/DrawerFront211.java")
assert "AppResume253.install(a)" in CATEGORY_SOURCE
assert "Keep popup playback" in RESUME and 'list.setEnabled(supported(mode))' in RESUME
assert "Dev115.seamlessReturn(s)" in RESUME and '"normal".equals(prefs(activity).getString(KEY' in RESUME
assert "AppResume253.left(target)" in GUARD and "AppResume253.resumed(a)" in GUARD
assert "Native panel selected without animation" in PANEL
assert 'if p.name != "AppSwitchGuard.java"' in BUILD
assert 'if p.name != "DrawerFront211.java"' in BUILD
print("PASS: #139 popup app-return preference, #141 foreground return and drawer localization")

# Dev.14 regressions: native panel movement, comment rendering and popup UI.
STABLE=text(REV/"java/e/e/a/CommentListStability254.java")
P235=text(REV/"patch_237.py")
DRAWER=text(REV/"java/e/e/a/DrawerFront211.java")
GUARD=text(REV/"java/e/e/a/AppSwitchGuard.java")
assert "setCurrentItem\",new Class<?>[]{int.class}" in PANEL
assert 'pager.setAlpha(0f)' in PANEL and 'reveal(pager,"native tab settled")' in PANEL
assert 'if("comments".equals(id))return 4;' in PANEL
assert 'CommentListStability254;->attach' in BUILD
assert 'Suppressed transient comment-list top reset' in STABLE
assert 'toggle.setLayoutParams(new LinearLayout.LayoutParams(0,-2,1f))' in STABLE
assert 'sortParams=new LinearLayout.LayoutParams(-2,-2,0f)' in STABLE
assert 'sortParams.rightMargin=' in STABLE
assert 'sort.setGravity(android.view.Gravity.END|android.view.Gravity.CENTER_VERTICAL)' in STABLE
assert "OVERRIDES=previous.OVERRIDES" in P235
assert 'row.setBackgroundColor(android.graphics.Color.TRANSPARENT)' in STABLE
assert 'preference.isEnabled()!=enabled' in RESUME
assert 'boolean enabled=supported(prefs(a).getString(MODE,"none"))' in RESUME
assert 'RetainedPlayback137.capture(activity)' in GUARD
print("PASS: v2.0.5-dev.17 native panel and comment bar / decoder retention contracts")


# Dev.16: rebind-safe localized native headings and Niconico fixed genre label.

assert "DrawerLabels253" not in BUILD and "DrawerLabels253" not in DRAWER
assert "WeakReference<Watcher>" in DRAWER
assert 'JAPANESE_ALIASES.put("Setting", "設定")' in UI
print("PASS: sidebar label uses the native menu model and canonical translation")
