#!/usr/bin/env python3
from pathlib import Path
from tempfile import TemporaryDirectory
import importlib.util,shutil
here=Path(__file__).resolve().parent.parent
root=here.parents[2]
spec=importlib.util.spec_from_file_location("overlay213",here/"overlay.py")
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
with TemporaryDirectory() as td:
 p=Path(td)/"e/e/a";p.mkdir(parents=True)
 for name in ("SettingsBackup.smali","SettingsBackup$Picker.smali"):
  shutil.copyfile(root/"porting/revisions/v1.10.1/helpers/e/e/a"/name,p/name)
 m.patch_backup_playlists(Path(td))
 a=(p/"SettingsBackup.smali").read_text()
 b=(p/"SettingsBackup$Picker.smali").read_text()
 assert "nicoid_local_playlists_v1" in a and "nicoid_video_title_overrides" in a
 assert "Save app settings and local playlists to a file" in a
 assert "Restore app settings and local playlists from a backup file" in a
 assert all("PlaylistBackup213;->"+x in b for x in ("snapshot","validate","restore"))
 assert "0x1000000" in b
 assert "If the backup includes local playlists" in b
assert '"version",1' in (root/"extensions/extension/src/main/java/e/e/a/SettingsBackupData.java").read_text()
print("PASS: backup wiring and old JSON format preserved")
