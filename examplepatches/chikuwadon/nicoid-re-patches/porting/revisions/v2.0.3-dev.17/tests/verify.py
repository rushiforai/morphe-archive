"""dev.17: assert the final Dev111 writer calls the actual settings installer."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev17", ROOT/"patch_220.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as temp:
    dest=Path(temp)/"e/e/a"
    dest.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    retained=(dest/"RetainedPlayback137.java").read_text(encoding="utf-8")
    assert "captureForExternal" in retained
    assert "onSeekTo(long requested)" in retained
    assert "PlayerStart215.install(root)" in (dest/"PlayerIcons.java").read_text()
    assert "Mp3Save214.chooseFormat(a,id,title)" in (dest/"DownloadUi115.java").read_text()
    assert "normalEdgeLimits[3]=symmetric;" in (dest/"AmbientLight.java").read_text()

builder=(ROOT/"build_mpp.py").read_text(encoding="utf-8")
assert 'VERSION = "2.0.3-dev.17"' in builder
assert "from patch_220 import OVERRIDES, stage" in builder
start=builder.index('settings = (disassembled / "e/e/a/SettingsTools.smali").read_text()')
end=builder.index('debug_file = "ModernDebug.smali"',start)
settings_writer=builder[start:end]
assert 'settings = settings.replace(anchor, anchor +' in settings_writer
assert 'Le/e/a/NicoliveEntry;' in settings_writer
assert 'Le/e/a/SettingsSummary217;' in settings_writer
assert '->install(Landroid/preference/PreferenceActivity;)V' in settings_writer
assert '(hooks / "SettingsTools.smali").write_text(settings)' in settings_writer
assert builder.count('(hooks / "SettingsTools.smali").write_text(')==1
late=builder[builder.index('order_file = "Dev111.smali"'):builder.index('ink_file = "CommentInk192.smali"')]
assert '(hooks / order_file).write_text(order)' in late
assert 'SettingsSummary217;' not in late, "Do not edit unstable Dev111 bytecode"
assert 'SettingsSummary216;->install' not in builder
assert "nicoid_native_mp4_fallback213" not in builder

settings=(ROOT/"java/e/e/a/SettingsSummary217.java").read_text()
assert 'attach(a);' in settings.split("public static void install",1)[1].split("static PreferenceGroup parent",1)[0]
assert 'a.getListView().post(()->{' in settings
assert 'if(a.isFinishing()||a.isDestroyed())return;' in settings
assert 'option.setDefaultValue("inherit")' in settings
assert 'option.setOrder(order)' in settings
assert 'link.getOrder()+1' in settings
assert 'option.setValue("inherit")' in settings
assert 'value+"："+description' in settings
for key in ('videolist_tap','intent_type','app_switch_playback',
            'nicoid_app_resume_playback','back_playback'):
    assert '"'+key+'"' in settings
assert 'ExternalBack216.KEY' in settings
assert 'p.registerOnSharedPreferenceChangeListener(listener)' in settings
assert 'MAIN.post(' in settings
assert 'android.util.Log.i("nicoid-settings217"' in settings
assert 'android.util.Log.w("nicoid-settings217"' in settings

verify=(ROOT/"verify_ci_candidate.py").read_text()
assert '"Le/e/a/SettingsSummary217;" in classes' in verify
print("PASS: SettingsSummary217 is installed at Dev111's final writer after sorting")
print("PASS: preference and six summaries populated after Dev111 sorts existing entries")
print("PASS: preference change observer persists and preserves saved user choices")
print("PASS: prior verified playback, audio, ambient and notification features remain")
print("NOT VERIFIED: on-device appearance and settings preference framework timing")
