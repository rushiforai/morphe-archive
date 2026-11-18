#!/usr/bin/env python3
"""Exercise the actual Premium Controls session with replaceable native owners and windows."""
from pathlib import Path
import subprocess
import tempfile
ROOT = Path(__file__).resolve().parent.parent
root = ROOT / "extensions/extension/src/main/java"
stubs={
'android/content/Context.java': 'package android.content; public class Context {}',
'android/content/ContextWrapper.java': 'package android.content; public class ContextWrapper extends Context {private final Context base;public ContextWrapper(Context c){base=c;}public Context getBaseContext(){return base;}}',
'android/app/Activity.java': 'package android.app; public class Activity extends android.content.Context {public boolean finishing,destroyed;public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}}',
'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long now; public static long uptimeMillis(){return now;}}',
'android/view/View.java': '''package android.view; public class View { public boolean attached=true,focus=true,enabled=true,listener=true; public int clicks;private final android.content.Context context;public View(android.content.Context c){context=c;}public android.content.Context getContext(){return context;}public boolean isAttachedToWindow(){return attached;}public boolean hasWindowFocus(){return focus;}public boolean isEnabled(){return enabled;}public boolean hasOnClickListeners(){return listener;}public boolean performClick(){clicks++;return true;}}''',
'app/afterglow/extension/Afterglow.java': '''package app.afterglow.extension;public class Afterglow {public static android.app.Activity activity;public static java.util.List<Runnable> queue=new java.util.ArrayList<>();public static android.app.Activity mainActivity(){return activity;}public static void runOnMain(Runnable r){r.run();}public static void runOnMainDelayed(Runnable r,long delay){queue.add(r);}public static void flush(){java.util.List<Runnable> q=new java.util.ArrayList<>(queue);queue.clear();for(Runnable r:q)r.run();}}''',
'app/afterglow/extension/InstalledTweaks.java':'package app.afterglow.extension;public class InstalledTweaks {public static boolean overlay=true,lite=true;public static boolean has(String owner){return owner.equals("overlay-buttons")?overlay:owner.equals("lite-mode")&&lite;}}',
'app/afterglow/extension/diagnostics/DebugLog.java':'package app.afterglow.extension.diagnostics;public class DebugLog {public static String last="";public static void write(String a,String b){last=b;}}',
'app/afterglow/extension/settings/AfterglowPrefs.java':'package app.afterglow.extension.settings;public class AfterglowPrefs {public static boolean lite;public static int writes;public static void setBool(String key,boolean b){writes++;lite=b;}}',
'app/afterglow/extension/settings/LiteMode.java':'package app.afterglow.extension.settings;public class LiteMode {public static final String KEY="liteModeEnabled";public static boolean controls=true;public static boolean enabled(){return AfterglowPrefs.lite;}public static boolean effectiveBool(String key){return controls;}}',
'app/afterglow/extension/ui/PremiumControlsSheet.java':'package app.afterglow.extension.ui;public class PremiumControlsSheet {public static int opens;public static void show(android.app.Activity a,app.afterglow.extension.playback.PremiumControls.Session s){opens++;}}',
'app/afterglow/extension/video/PlayerController.java':'package app.afterglow.extension.video;public interface PlayerController {}',
'app/afterglow/extension/video/PlayerType.java':'package app.afterglow.extension.video;public enum PlayerType {NONE,WATCH_WHILE_MAXIMIZED,WATCH_WHILE_FULLSCREEN;public boolean isMaximizedOrFullscreen(){return this!=NONE;}}',
'app/afterglow/extension/video/PlaybackState.java':'package app.afterglow.extension.video;public enum PlaybackState {NEW,PLAYING,PAUSED,ENDED}',
'app/afterglow/extension/video/VideoState.java':'''package app.afterglow.extension.video;public class VideoState {public static PlayerController player;public static String id="abcdefghijk";public static boolean shorts,ad;public static PlayerType type=PlayerType.WATCH_WHILE_MAXIMIZED;public static PlaybackState state=PlaybackState.PLAYING;public static long seek=-1,relative;public static float speed=1;public static PlayerController currentController(){return player;}public static String videoId(){return id;}public static PlayerType playerType(){return type;}public static boolean isShortsPlayerInFront(){return shorts;}public static boolean isAdPlaying(){return ad;}public static PlaybackState playbackState(){return state;}public static boolean seekTo(long ms){seek=ms;return true;}public static boolean seekToRelative(long ms){relative=ms;return true;}public static float playbackSpeed(){return speed;}public static boolean setPlaybackSpeed(float value){speed=value;return true;}}''',
'app/afterglow/extension/playback/PauseOnOverlay.java':'package app.afterglow.extension.playback;public class PauseOnOverlay {public interface Controller {android.view.View afterglow_overlayRoot();boolean afterglow_overlayVisible();boolean afterglow_overlaySetPlaying(boolean playing);}}',
'app/afterglow/extension/playback/OverlayButtons.java':'''package app.afterglow.extension.playback;public class OverlayButtons {public static OverlayActionController value;public static OverlayActionController controllerForSheet(android.app.Activity a){return value!=null&&value.afterglow_overlayActivity()==a&&value.afterglow_overlayVideoId().equals(app.afterglow.extension.video.VideoState.id)?value:null;}}''',
'app/afterglow/extension/playback/Fullscreen.java':'''package app.afterglow.extension.playback;public class Fullscreen {public static boolean allowed=true,immediate=true;public static boolean enterFromControlsSheet(android.app.Activity a){if(!allowed)return false;if(immediate)app.afterglow.extension.video.VideoState.type=app.afterglow.extension.video.PlayerType.WATCH_WHILE_FULLSCREEN;return true;}}''',
}
with tempfile.TemporaryDirectory(prefix="afterglow-premium-controls-") as directory:
    s = Path(directory)
    files=[]
    for name,body in stubs.items():
     p=s/'session-stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body+'\n');files.append(p)
    files += [root/'app/afterglow/extension/playback'/name for name in ['PremiumControls.java','OverlayActionController.java','OverlayLockRequest.java']]
    files.append(ROOT/'tools/jvm/PremiumControlsSessionTest.java')
    p=subprocess.run(['/usr/lib/jvm/java-17-openjdk-amd64/bin/javac','-encoding','UTF-8','-d',str(s/'session-classes')]+list(map(str,files)),stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
    (s/'session-compile.log').write_text(p.stdout);print(p.stdout,end='');p.check_returncode()
    p=subprocess.run(['/usr/lib/jvm/java-17-openjdk-amd64/bin/java','-cp',str(s/'session-classes'),'app.afterglow.extension.playback.PremiumControlsSessionTest'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
    (s/'session-checks.log').write_text(p.stdout);print(p.stdout,end='');p.check_returncode()
