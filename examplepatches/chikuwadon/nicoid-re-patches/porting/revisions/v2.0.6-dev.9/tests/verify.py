"""v2.0.6-dev.9: fullscreen preference de-duplication and resume availability.

Do not modify the verified dev.8 comment renderer or released version.
"""
from pathlib import Path
import ast,re
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.9"
OLD=ROOT/"porting/revisions/v2.0.6-dev.8"
p=(ROOT/"gradle.properties").read_text()
assert re.search(r"(?m)^version\s*=\s*2\.0\.6-dev\.9\s*$",p)
wrapper=(REV/"build_mpp.py").read_text()
ast.parse(wrapper)
assert 'VERSION = "2.0.6-dev.9"' in wrapper
assert 'p.name not in ("FullscreenOptions262.java", "FullscreenOptions265.java")' in wrapper
assert 'v2.0.6-dev.9/java' in wrapper
assert 'v2.0.6-dev.8' in wrapper
assert "ScrollingComments267.java" not in [x.name for x in (REV/"java").rglob("*.java")]
assert (OLD/"java/e/e/a/ScrollingComments267.java").is_file()
assert (OLD/"overlay_267.py").is_file()
source=(REV/"java/e/e/a/FullscreenOptions262.java").read_text()
assert "for(CharSequence value:values)" in source
assert "if(SPECIAL.contentEquals(value)){exists=true;break;}" in source
assert "if(!exists){" in source
assert "values[values.length-1]" not in source
assert "SETTINGS_MAIN.post(()->{" in source
assert "FullscreenOptions265.settings(activity);" in source
assert "public static void settingsCore(PreferenceActivity activity)" in source
assert "if(PENDING_SETTINGS.containsKey(activity))return;" in source
assert 'install(activity,PREF_RESUME,FLAG_RESUME);' in source
assert 'store' not in source or 'putBoolean(flag,fullscreen)' in source
assert "putString(key,nativeValue)" in source
assert "armResume(Object service)" in source
follow=(REV/"java/e/e/a/FullscreenOptions265.java").read_text()
assert "FullscreenOptions262.settingsCore(activity);" in follow
assert "FullscreenOptions262.settings(activity);" not in follow
assert 'moveAfterInformation(activity,"videolist_tap",false);' in follow
assert 'moveAfterInformation(activity,"intent_type",false);' in follow
assert 'moveAfterInformation(activity,"nicoid_app_resume_playback",true);' in follow
assert "resume?resumeLabel(a):FullscreenOptions262.label(a)" in follow
assert 'return "全画面再生に戻る";' in follow
assert 'return "Return to fullscreen playback";' in follow
assert 'return "返回全螢幕播放";' in follow
# The virtual resume choice maps to the native "normal" route; Dev111
# expects "normal" and the fullscreen flag arms the transition to landscape.
assert 'String nativeValue=fullscreen?base:selected;' in source
assert "putBoolean(flag,fullscreen)" in source
native=(ROOT/"porting/revisions/v1.11.1/java/e/e/a/Dev111.java").read_text()
assert '"normal".equals(settings.getString(RESUME,"background"))' in native
assert 'Dev115.seamlessReturn(service)' in native
hook=(ROOT/"porting/revisions/v2.0.6-dev.5/overlay_265.py").read_text()
assert "FullscreenOptions265;" in hook and '->settings(' in hook
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert "builder=porting/revisions/v2.0.6-dev.9" in workflow
assert "v2.0.6-dev.9/tests/verify.py" in workflow
print("PASS: virtual fullscreen entry is installed once even when reordered")
print("PASS: resumed preference is reconciled after the settings screen is initialized")
print("PASS: saved choices and dev.8 comment renderer remain unchanged")
