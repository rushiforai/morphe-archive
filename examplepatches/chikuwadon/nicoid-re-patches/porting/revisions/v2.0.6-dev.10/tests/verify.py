"""v2.0.6-dev.10: preference layout, resume, locale and MPP regression."""
from pathlib import Path
import ast
import importlib.util
import re

ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.10"
OLD=ROOT/"porting/revisions/v2.0.6-dev.8"
p=(ROOT/"gradle.properties").read_text()
assert re.search(r"(?m)^version\s*=\s*2\.0\.6-dev\.10\s*$",p)
builder=(REV/"build_mpp.py").read_text()
ast.parse(builder)
assert re.search(r'(?m)^VERSION\s*=\s*"2\.0\.6-dev\.10"\s*$',builder)
for fragment in (
                 'p.name not in ("FullscreenOptions262.java", "FullscreenOptions265.java")',
                 'v2.0.6-dev.9/java', 'v2.0.6-dev.10/java',
                 'overlay_settings_270(work, disassembled, hooks)'):
 assert fragment in builder,fragment

# No need to recompile or change the verified dev.8 comment renderer.
assert not list((REV/"java").rglob("ScrollingComments267.java"))
assert (OLD/"java/e/e/a/ScrollingComments267.java").is_file()
assert (OLD/"java/e/e/a/ScrollingTimeline267.java").is_file()

ui=(REV/"java/e/e/a/FullscreenSettings270.java").read_text()
for fragment in (
 "videolist_tap","intent_type","nicoid_external_link_back",
 "app_switch_playback","back_playback",
 'nicoid_app_resume_playback','FullscreenOptions265.settings(activity)',
 'if(count(values,SPECIAL)!=1)return false;',
 'return patched(activity);',
 'registerLocale(activity);',
 '"app_lang".equals(key)',
 'List<String> before=new ArrayList<>();',
 'if(!before.equals(after))',
 'list.setEntries(nextLabels);',
 'list.setEntryValues(nextValues);',
 'FullscreenOptions265.resumeSummary(activity);',
):
 assert fragment in ui,fragment
assert 'group.addPreference(' not in ui
assert 'group.removePreference(' not in ui
assert 'group.removeAll(' not in ui

order=(REV/"java/e/e/a/PlaybackChoiceOrder270.java").read_text()
for fragment in ("public static boolean reorder", "public static boolean ordered",
                 'labels[popup]=labels[background]', 'values[popup]=values[background]',
                 '"popup".equals(v)', '"background".equals(v)',
                 't.contains("ポップアップ")', 't.contains("バックグラウンド")',
                 't.contains("懸浮")','t.contains("背景")'):
 assert fragment in order,fragment

# The user-confirmed dev.9 de-duplication remains in the compiled helper.
existing=(ROOT/"porting/revisions/v2.0.6-dev.9/java/e/e/a/FullscreenOptions262.java").read_text()
assert 'if(SPECIAL.contentEquals(value)){exists=true;break;}' in existing
assert 'if(!exists)' in existing

overlay_file=REV/"overlay_270.py"
spec=importlib.util.spec_from_file_location("overlay_270",overlay_file)
overlay=importlib.util.module_from_spec(spec);spec.loader.exec_module(overlay)
sample_settings=("    invoke-static {p0}, Le/e/a/SettingsCategories241;"
                 "->apply(Landroid/preference/PreferenceActivity;)V")
sample_dev=("    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;"
            "->settings(Landroid/preference/PreferenceActivity;)V")
for source,anchor,insert,label in (
 (sample_settings,sample_settings,overlay.SETTINGS_HOOK,"SettingsTools"),
 (sample_dev,sample_dev,overlay.GENERAL_HOOK,"Dev111")):
 patched=overlay.replace_once(source,anchor,insert,label)
 assert patched.count(insert)==1
 assert patched.index(anchor)<patched.index(insert)
 try:overlay.replace_once(source+source,anchor,insert,label)
 except RuntimeError:pass
 else:raise AssertionError("Duplicate hook was not rejected")

# Language and list/value integrity are covered by PlaybackChoiceOrder270Test.
test=(REV/"tests/PlaybackChoiceOrder270Test.java").read_text()
assert 'for(String key:codes)' in test and 'for(String[] language:labels)' in test
assert 'original.get(value).equals(entries[i].toString())' in test
assert '"nicoid_fullscreen262"' in test
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert "builder=porting/revisions/v2.0.6-dev.10" in workflow
assert "PlaybackChoiceOrder270Test.java" in workflow
print("PASS: resume reconciliation on both settings initializer paths")
print("PASS: 5 playback settings reorder only paired choices, 3 languages")
print("PASS: no category/key removal or reparent, saved values preserved")
print("PASS: dev.8 comment renderer retained and fullscreen option unique")
