"""v2.0.5-dev.1: preserve existing video menu preferences, localize unified saving.

Issue #139 (popup resume) is intentionally deferred.
"""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.3-dev.18/patch_221.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev18",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{
 "DownloadActions116.java","Mp3Save214.java","UiStrings.java","PanelUi.java"
})
def once(source,before,after,label):
    count=source.count(before)
    if count!=1:raise AssertionError(f"{label}: expected 1 anchor, got {count}")
    return source.replace(before,after)
def stage(base,destination):
    previous.stage(base,destination)
    destination=Path(destination)
    file=destination/"DownloadActions116.java"
    source=file.read_text(encoding="utf-8")
    source=once(source,
      'int at=Math.min(4,others.size());others.add(at,mp4);if(cache!=null)others.add(at+1,cache);menu.clear();',
      'int at=Math.min(4,others.size());boolean showSave=android.preference.PreferenceManager.getDefaultSharedPreferences(a).getBoolean("video_menu_visible_"+MP4,true);if(showSave)others.add(at,mp4);if(cache!=null)others.add(Math.min(at+(showSave?1:0),others.size()),cache);MenuEditor120.sort(others,a);menu.clear();',
      "save-menu visibility/order after dynamically adding actions")
    file.write_text(source,encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
