"""v2.0.3-dev.16: issue #132 external-link Back, media controls, summaries.

Prior dev.15 queued-button behavior is intentionally preserved unchanged.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.15/patch_218.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev15",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"RetainedPlayback137.java"})

def once(s,before,after,label):
    n=s.count(before)
    if n!=1:raise AssertionError(f"{label}: expected one anchor, got {n}")
    return s.replace(before,after)

def retained_media(src):
    src=once(src,
        "public static synchronized Runnable capture(Activity a) {",
        """public static synchronized Runnable capture(Activity a) {
   return captureInternal(a,false);
  }
  // External-link Back must be independent of app_switch_playback (Issue #132).
  public static synchronized Runnable captureForExternal(Activity a) {
   return captureInternal(a,true);
  }
  private static synchronized Runnable captureInternal(Activity a,boolean explicitBack) {""",
        "explicit external Back capture")
    src=once(src,
        "a.isFinishing()||!enabled(a))return null;",
        "a.isFinishing()||(!explicitBack&&!enabled(a)))return null;",
        "guard normal app-switch preference")
    src=once(src,
        " /** Skip native PlaybackLifecycle219.retain() pause for our VideoView. */",
        """  public static synchronized void cancelExternal(Activity a) {
    Session s=current;
    if(s!=null&&s.source==a&&!s.committed)finish(s,false);
  }
 /** Skip native PlaybackLifecycle219.retain() pause for our VideoView. */""",
        "abort background capture on failed task move")
    src=once(src,
        "   s.media.setActive(true);",
        """   // System media cards can navigate back to the retained original Activity
   // even when no in-app browse Activity exists in this task.
   s.media.setSessionActivity(action(service,s,"show",4));
   s.media.setActive(true);""",
        "set session return action")
    src=once(src,
        "  if(keeper!=null){keeper.stopForeground(true);keeper.stopSelf();}",
        """  if(keeper!=null){
    keeper.stopForeground(true);
    NotificationManager nm=(NotificationManager)keeper.getSystemService(Context.NOTIFICATION_SERVICE);
    if(nm!=null)nm.cancel(NOTIFICATION);
    keeper.stopSelf();
  }""",
        "close persistent media notification on Stop")
    # dev.5 already forwards Android seekTo to the same player and advertises
    # ACTION_SEEK_TO. Keep the original decoder and its callback untouched.
    if '    @Override public void onSeekTo(long requested)' not in src:
        raise AssertionError("dev.5 retained MediaSession seeking was lost")
    if "PlaybackState.ACTION_SEEK_TO" not in src:
        raise AssertionError("dev.5 retained MediaSession seek flag was lost")
    return src

def stage(base,destination):
    output=previous.stage(base,destination)
    retained=Path(destination)/"RetainedPlayback137.java"
    retained.write_text(retained_media(retained.read_text(encoding="utf-8")),
                        encoding="utf-8")
    return output
