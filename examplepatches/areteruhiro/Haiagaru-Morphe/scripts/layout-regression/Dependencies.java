package app.morphe.extension.chmate;
import android.content.*;
class FeatureSwitches{static boolean enabled(String k,boolean d){return true;}}
class XMediaAttachments{static String sourceVideo(String p){return "https://fixture.invalid/video.mp4";}}
class VideoFrameThumbnail{static boolean retry(String s){return false;}static boolean running(String s){return false;}}
class MediaViewerNavigation{static void prepareNativeIntent(Intent i,Context c){}}
class NativeToolTabs{static android.app.Activity activity(Context c){return LayoutHarness.activity;}}
