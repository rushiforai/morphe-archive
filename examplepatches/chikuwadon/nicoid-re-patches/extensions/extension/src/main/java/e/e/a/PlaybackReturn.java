package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;
import java.lang.ref.WeakReference;

/** A fresh foreground player owns the seek, rather than a shared metadata bundle. */
public final class PlaybackReturn {
    private static WeakReference<Object> active = new WeakReference<>(null);
    private static String automaticVideo;
    private static boolean opening;
    private PlaybackReturn() {}
    public static void bind(Object service) { active = new WeakReference<>(service); }
    public static void arm(String video) { automaticVideo = video; }
    public static void foreground(Activity activity) {
        String expected = automaticVideo;
        if (expected == null || opening) return;
        automaticVideo = null;
        if ("com.sauzask.nicoid.NicoidVideoActivity".equals(activity.getClass().getName())) return;
        Object service = active.get();
        try {
            if (service == null || !expected.equals(PlaybackSession.get(service,"f")) ||
                !service.getClass().getField("o0").getBoolean(null) ||
                !service.getClass().getField("p0").getBoolean(null)) return;
            open(service);
        } catch (Exception error) { log(error); }
    }
    public static void open(Object owner) {
        if (opening || !(owner instanceof Service)) return;
        Service service = (Service)owner;
        automaticVideo = null;
        try {
            String video = (String)PlaybackSession.get(owner,"f");
            if (video == null || !video.matches("(?:sm|nm|so|ss)?[0-9]+")) return;
            Object player = PlaybackSession.get(owner,"e");
            long position = ((Number)PlaybackSession.call(player,"getCurrentPosition",new Class<?>[0])).longValue();
            Intent intent = new Intent(Intent.ACTION_VIEW,Uri.parse("https://www.nicovideo.jp/watch/"+video))
                .setClassName(service,"com.sauzask.nicoid.NicoidVideoActivity")
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                .putExtra("intentselect",true)
                .putExtra("playposition",(int)Math.max(0,Math.min(Integer.MAX_VALUE,position)));
            Object playlist = PlaybackSession.get(owner,"O");
            if (playlist != null) Class.forName("e.e.a.v0").getMethod("a",Intent.class,java.util.ArrayList.class,int.class,boolean.class)
                .invoke(null,intent,playlist,((Number)PlaybackSession.get(owner,"P")).intValue(),true);
            // Clear the native reuse marker before the new fragment reads it. It must
            // acquire a fresh HLS session, including after a long popup playback.
            java.lang.reflect.Field marker = owner.getClass().getField("q0");
            Object previous = marker.get(null);
            opening = true;
            marker.set(null,"");
            try { service.startActivity(intent); }
            catch (RuntimeException error) { marker.set(null,previous); throw error; }
            service.stopSelf();
        } catch (Exception error) {
            log(error);
            String lang=android.preference.PreferenceManager.getDefaultSharedPreferences(service).getString("app_lang","0");
            if("-1".equals(lang))lang=java.util.Locale.getDefault().getLanguage();
            Toast.makeText(service,"1".equals(lang)||"en".equals(lang)?"Could not return to normal playback":
                "2".equals(lang)||"zh".equals(lang)?"無法返回一般播放":"通常再生に戻れませんでした",Toast.LENGTH_SHORT).show();
        } finally { opening = false; }
    }
    private static void log(Exception error) { android.util.Log.w("nicoid-session","Foreground playback transfer failed",error); }
}
