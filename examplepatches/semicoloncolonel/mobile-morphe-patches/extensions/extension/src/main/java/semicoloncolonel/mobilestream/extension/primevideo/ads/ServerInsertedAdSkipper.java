package semicoloncolonel.mobilestream.extension.primevideo.ads;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.List;

/**
 * Skips Prime Video's server-inserted ad breaks without losing the ad plan.
 *
 * In a server-inserted session the ads are part of the video stream. The app
 * still needs the ad plan there: ServerInsertedManifestTimelineManager uses
 * it to convert stream time to the title's own time, which the subtitles
 * follow. So the patch keeps the plan for these sessions and, when a break
 * starts, marks its clips as played and seeks past it. AdClipState then finds
 * no unplayed clip and returns to the title, and the break's exit schedules
 * Amazon's own seek-over, so a later pass through the break skips it too.
 *
 * Amazon's classes are reached by reflection. Their names are not obfuscated
 * in the phone app, and any failure leaves the break to play as normal.
 */
@SuppressWarnings("unused")
public final class ServerInsertedAdSkipper {
    private static final String TAG = "MSP-PV-ADS";
    private static final String SERVER_INSERTED_MANAGER =
        "com.amazon.avod.media.ads.internal.adplaybackstatemachine.ServerInsertedAdEnabledPlaybackStateMachine";
    private static final String SEEK_CAUSE = "com.amazon.avod.playback.player.actions.SeekAction$SeekCause";

    private ServerInsertedAdSkipper() {
    }

    /** Whether the session's ad manager is the server-inserted one. */
    public static boolean isServerInserted(Object adEnabledPlaybackManager) {
        try {
            for (Class<?> c = adEnabledPlaybackManager == null ? null : adEnabledPlaybackManager.getClass();
                 c != null; c = c.getSuperclass()) {
                if (c.getName().equals(SERVER_INSERTED_MANAGER)) return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "isServerInserted failed", t);
        }
        return false;
    }

    /**
     * Called first in ServerInsertedAdBreakState.enter. state is the break
     * state, trigger is its AdBreakTrigger.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void onAdBreakStart(Object state, Object trigger) {
        try {
            Object adBreak = call(trigger, "getBreak");
            if (adBreak == null) return;
            for (Object clip : (List<Object>) call(adBreak, "getClips")) {
                clip.getClass().getMethod("setPlayed", boolean.class).invoke(clip, true);
            }
            // A seek over the break (chaptering) already ends at the seek
            // target when the break exits. Otherwise jump to the break's end.
            if (call(trigger, "getSeekTarget") != null) return;

            long start = millis(call(adBreak, "getStartTime"));
            long end = start + millis(call(adBreak, "getDuration"));
            Object player = call(call(state, "getContext"), "getPrimaryPlayer");
            Class seekCause = Class.forName(SEEK_CAUSE, false, state.getClass().getClassLoader());
            Object cause = Enum.valueOf(seekCause, "AD_SEEK_OVER");
            Method seek = findMethod(player.getClass(), "seekToManifestPosition", long.class, seekCause);
            seek.invoke(player, end, cause);
            Log.i(TAG, "skipped ad break " + start + "-" + end + " ms");
        } catch (Throwable t) {
            Log.w(TAG, "ad break skip failed", t);
        }
    }

    private static long millis(Object timeSpan) throws Exception {
        return (Long) timeSpan.getClass().getMethod("getTotalMilliseconds").invoke(timeSpan);
    }

    private static Object call(Object target, String name) throws Exception {
        Method m = findMethod(target.getClass(), name);
        return m.invoke(target);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... params) throws NoSuchMethodException {
        try {
            return type.getMethod(name, params);
        } catch (NoSuchMethodException ignored) {
        }
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
            }
        }
        throw new NoSuchMethodException(type.getName() + "." + name);
    }
}
