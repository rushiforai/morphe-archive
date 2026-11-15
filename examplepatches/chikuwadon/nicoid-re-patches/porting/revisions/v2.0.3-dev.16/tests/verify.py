"""dev.16 regression: external Back only, value-description summaries, media retention."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev16",ROOT/"patch_219.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as temp:
    dest=Path(temp)/"e/e/a"
    dest.mkdir(parents=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    media=(dest/"RetainedPlayback137.java").read_text()
    assert "return captureInternal(a,false);" in media
    assert "return captureInternal(a,true);" in media
    assert "(!explicitBack&&!enabled(a))" in media
    assert "public static synchronized void cancelExternal(Activity a)" in media
    assert 's.media.setSessionActivity(action(service,s,"show",4));' in media
    assert 'NotificationManager nm=(NotificationManager)keeper.getSystemService' in media
    assert 'nm.cancel(NOTIFICATION)' in media
    assert "onSeekTo(long requested)" in media
    assert "PlaybackState.ACTION_SEEK_TO" in media
    assert '"Stop",action(service,s,"stop",3)' in media
    assert 'if(stop&&!s.source.isFinishing()&&!s.source.isDestroyed())s.source.finish();' in media
    assert "PlayerStart215.install(root)" in (dest/"PlayerIcons.java").read_text()
    assert "normalEdgeLimits[3]=symmetric;" in (dest/"AmbientLight.java").read_text()
    assert "Mp3Save214.chooseFormat(a,id,title)" in (dest/"DownloadUi115.java").read_text()
    assert "void cornerResizePopup(" in (dest/"NicoliveService.java").read_text()

ext=(ROOT/"java/e/e/a/ExternalBack216.java").read_text()
for value in ("inherit","stop","background","popup","nicoid"):
    assert '"'+value+'".equals(action)' in ext or '"'+value+'"' in ext,value
assert 'i.getBooleanExtra("nicoid_return_to_browse_114",false)' in ext
assert 'i.getBooleanExtra("intentselect",false)' in ext
assert 'a.isTaskRoot()&&PlaybackNavigation114.destination(a)==null' in ext
assert 'RetainedPlayback137.captureForExternal(a)' in ext
assert 'RetainedPlayback137.cancelExternal(a)' in ext
assert 'a.moveTaskToBack(true)' in ext
assert 'PlaybackTransfer221.popup(f,false)' in ext
assert 'PlaybackNavigation114.showBrowse(a,true)' in ext
assert 'a.finish()' in ext
assert 'if("inherit".equals(action))return false;' in ext

settings=(ROOT/"java/e/e/a/SettingsSummary216.java").read_text()
for key in ('videolist_tap','intent_type','nicoid_external_link_back',
            'app_switch_playback','nicoid_app_resume_playback','back_playback'):
    if key=="nicoid_external_link_back":
        assert 'ExternalBack216.KEY' in settings
    else:assert '"'+key+'"' in settings
assert "link.getOrder()+1" in settings
assert 'option.setDefaultValue("inherit")' in settings
assert 'value+"："+description' in settings
assert "p.registerOnSharedPreferenceChangeListener(listener)" in settings
assert "MAIN.post(" in settings
assert "a.getListView().post(()->attach(a))" in settings

builder=(ROOT/"build_mpp.py").read_text()
for value in (
    'VERSION = "2.0.3-dev.16"',
    'from patch_219 import OVERRIDES, stage',
    'Le/e/a/ExternalBack216;',
    '->back(Landroid/app/Activity;)Z',
    'SettingsSummary216;',
    'native_back=activity_file.read_text()',
    'old_count=int(registers.group(1))',
    'fresh=f"v{old_count-1}"',
    'f"    .registers {old_count+1}"',
    'Le/e/a/ExternalBack216;',
    'build_pinned_java_lame(work)',
):
    assert value in builder,value
assert "PlayerStart215.java" in str(list((ROOT.parent/"v2.0.3-dev.15/java").rglob("*.java")))
assert (ROOT/"MergeLiveDex.java").read_text()==(ROOT.parent/"v2.0.3-dev.15/MergeLiveDex.java").read_text()
print("PASS: external-link-specific Back actions preserve existing in-app navigation")
print("PASS: new preference follows link action; six dynamic value:description summaries")
print("PASS: retained background MediaSession routes Stop, seek, play/pause and return")
print("PASS: dev.15 first-frame controls and dev.14 MP3, ambient, live UI retained")
print("NOT VERIFIED: real Android external-link task switching and SystemUI compositor")
