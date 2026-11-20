package e.e.a;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Record playback commands and Media3 transitions without source URLs. */
public final class Media3Diagnostics276 {
    private static final String TAG = "nicoid-media-intent";
    private static final String PLAYER_API = "androidx.media3.common.Player";

    private Media3Diagnostics276() {}

    public static void onStart(Object owner) {
        command(owner, "Start");
    }

    public static void onPause(Object owner) {
        command(owner, "Pause");
    }

    public static void onHandoffPause(Object owner) {
        command(owner, "Handoff pause");
    }

    private static void command(Object owner, String action) {
        StringBuilder path = new StringBuilder();
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            StackTraceElement[] frames = new Throwable().getStackTrace();
            for (int i = 3; i < frames.length && i < 10; i++) {
                if (path.length() > 0) path.append(" <- ");
                path.append(frames[i].getClassName()).append('.').append(frames[i].getMethodName());
            }
        }
        Log.i(TAG, action + " " + snapshot(owner, field(owner, "player")) + (path.length() == 0 ? "" : " caller=" + path));
    }

    public static void onEvents(Object owner, Object player, Object events) {
        try {
            Method contains = events.getClass().getMethod("contains", int.class);
            // Player.EVENT_PLAYBACK_STATE_CHANGED through EVENT_IS_PLAYING_CHANGED.
            for (int event = 4; event <= 7; event++) {
                if (Boolean.TRUE.equals(contains.invoke(events, event))) {
                    Log.i(TAG, "Media3 " + snapshot(owner, player));
                    break;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Diagnostic hooks must never interfere with playback.
        }
    }

    public static void onPlayIntentChange(Object owner, boolean ready, int reason) {
        Log.i(TAG, "Play intent ready=" + ready + " reason=" + reason + " " +
                snapshot(owner, field(owner, "player")));
    }

    public static void onError(Object owner, Throwable error) {
        Object code = null;
        try {
            code = error.getClass().getField("errorCode").get(error);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        }
        Throwable cause = error.getCause();
        Log.w(TAG, "Error code=" + code + " cause=" +
                (cause == null ? error.getClass().getSimpleName() : cause.getClass().getSimpleName()) +
                " " + snapshot(owner, field(owner, "player")));
    }

    private static String snapshot(Object owner, Object player) {
        return "player=" + Integer.toHexString(System.identityHashCode(owner)) +
                " state=" + read(player, "getPlaybackState") +
                " ready=" + read(player, "getPlayWhenReady") +
                " suppression=" + read(player, "getPlaybackSuppressionReason") +
                " position=" + read(player, "getCurrentPosition") +
                " buffered=" + read(player, "getBufferedPosition") +
                " scrubbing=" + field(owner, "scrubbing") +
                " seeking=" + field(owner, "pendingSeek") +
                " retained=" + field(owner, "bindingRetainedView");
    }

    private static Object field(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static Object read(Object player, String name) {
        if (player == null) return null;
        try {
            // ExoPlayerImpl itself is package-private. Invoke the public
            // Player interface declaration to avoid IllegalAccessException.
            Class<?> api = Class.forName(PLAYER_API, false, player.getClass().getClassLoader());
            return api.getMethod(name).invoke(player);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }
}
