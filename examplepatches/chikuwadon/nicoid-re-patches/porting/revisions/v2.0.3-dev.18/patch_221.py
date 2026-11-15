"""dev.18: authoritative external link Back policy for the actual intent Activity.

Prevent automatic app-switch replay from overriding Stop/Popup/Background.
Retain dev.17 settings and dev.15 controls.
"""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.17/patch_220.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev17",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"AppSwitchGuard.java"})

def replace_once(text,before,after,reason):
    count=text.count(before)
    if count!=1:raise AssertionError(f"{reason}: expected one anchor, got {count}")
    return text.replace(before,after)

def stage(base,destination):
    files=previous.stage(base,destination)
    target=Path(destination)/"RetainedPlayback137.java"
    source=target.read_text(encoding="utf-8")
    source=replace_once(source,
        'if(!"com.sauzask.nicoid.NicoidVideoActivity".equals(a.getClass().getName()))return null;',
        '''String origin=a.getClass().getName();
  if(!"com.sauzask.nicoid.NicoidVideoActivity".equals(origin)
      &&!"com.sauzask.nicoid.intent.NicoidVideoActivityIntent".equals(origin))return null;''',
        "external intent class for retained background playback")
    source=replace_once(source,
        '''  public static synchronized void cancelExternal(Activity a) {
    Session s=current;
    if(s!=null&&s.source==a&&!s.committed)finish(s,false);
  }''',
        '''  public static synchronized void cancelExternal(Activity a) {
    Session s=current;
    if(s!=null&&s.source==a&&!s.committed)finish(s,false);
  }
  /** Explicit Stop must cancel a previously captured session too. */
  public static synchronized void stopExternal(Activity a) {
    Session s=current;
    if(s==null||s.source!=a)return;
    try {s.player.getClass().getMethod("pause").invoke(s.player);}
    catch(Exception e){Log.w(TAG,"Could not pause retained player on external Stop",e);}
    finish(s,true);
  }''',
        "cancel active retention when external Stop is selected")
    target.write_text(source,encoding="utf-8")
    return files
