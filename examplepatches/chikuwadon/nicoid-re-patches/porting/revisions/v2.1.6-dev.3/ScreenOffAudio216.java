package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.os.PowerManager;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Screen-off audio is backed by the already proven retained-player foreground
 * keeper service; it neither starts a new decoder nor changes playback mode.
 */
public final class ScreenOffAudio216 {
    private static final String TAG = "nicoid-screen-audio";
    private ScreenOffAudio216() {}

    public static boolean enabled(Activity host) {
        if (host == null || host.isDestroyed() || host.isFinishing()) return false;
        try {
            PowerManager power = (PowerManager) host.getSystemService(Context.POWER_SERVICE);
            return power != null && !power.isInteractive()
                    && PreferenceManager.getDefaultSharedPreferences(host)
                            .getBoolean("nicoid_keep_audio_screen_off", true);
        } catch (RuntimeException e) {
            Log.w(TAG, "Cannot read screen-off policy", e);
            return false;
        }
    }

    /** Called before the native screen-off pause path.
     * The retained foreground-service helper survives Doze/network restrictions
     * without presenting a popup or finishing the original Activity.
     */
    public static void arm(Object fragment) {
        if (fragment == null) return;
        try {
            Field owner = fragment.getClass().getField("A1");
            Object context = owner.get(fragment);
            if (!(context instanceof Activity)) return;
            Activity host = (Activity) context;
            if (!enabled(host)) return;
            Field video = fragment.getClass().getField("a0");
            Object player = video.get(fragment);
            if (player == null
                    || !Boolean.TRUE.equals(player.getClass().getMethod("isPlaying").invoke(player)))
                return;
            Class<?> retained = Class.forName("e.e.a.RetainedPlayback137");
            Method capture = retained.getMethod("capture", Activity.class);
            Object action = capture.invoke(null, host);
            if (action instanceof Runnable) {
                ((Runnable) action).run();
                Log.i(TAG, "Retained foreground media service armed before screen-off pause");
            } else {
                Log.w(TAG, "Retained service was unavailable; existing playback policy preserved");
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Screen-off retained service unavailable", error);
        }
    }
}
