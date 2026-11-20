#!/usr/bin/env python3
"""Check settings/playlist/export backup Smali hooks and format compatibility."""
from pathlib import Path
from tempfile import TemporaryDirectory
import importlib.util,shutil
here=Path(__file__).resolve().parent.parent
root=here.parents[2]
spec=importlib.util.spec_from_file_location('backup_214',here/'overlay.py')
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
with TemporaryDirectory() as temp:
    target=Path(temp)/'e/e/a';target.mkdir(parents=True)
    for name in ('SettingsBackup.smali','SettingsBackup$Picker.smali','SettingsBackupData.smali'):
        shutil.copyfile(root/'porting/revisions/v1.10.1/helpers/e/e/a'/name,target/name)
    mod.patch_backup_playlists(Path(temp))
    main=(target/'SettingsBackup.smali').read_text()
    picker=(target/'SettingsBackup$Picker.smali').read_text()
    data=(target/'SettingsBackupData.smali').read_text()
    assert 'nicoid_local_playlists_v1' in main and 'nicoid_video_title_overrides' in main
    assert 'Save app settings and local playlists to a file' in main
    assert 'Restore app settings and local playlists from a backup file' in main
    assert main.count('const-string v0, "save_playback_position"')==1
    assert data.count('const-string v0, "save_playback_position"')==1
    for call in ('snapshot','prepareImport','validate','restore'):
        assert 'PlaylistBackup213;->'+call in picker
    assert '->snapshot(Landroid/content/Context;Landroid/content/SharedPreferences;)' in picker
    assert '->restore(Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/util/Map;)' in picker
    assert '0x1000000' in picker
java=(here/'PlaylistBackup213.java').read_text()
for term in ('getSharedPreferences(TITLES,Context.MODE_PRIVATE)','currentTitles(c)',
             'prepareImport(JSONObject document)','nicoid_local_playlist_sort_',
             'save_playback_position','ranking_presets_v190','rollback(titlePrefs,before)',
             'ordinary.remove(TITLES)','if(!values.containsKey(TITLES))'):
    assert term in java,term
assert '"version",1' in (root/'extensions/extension/src/main/java/e/e/a/SettingsBackupData.java').read_text()
print('PASS: private title mapping, sorting, safe settings and legacy backup format')
