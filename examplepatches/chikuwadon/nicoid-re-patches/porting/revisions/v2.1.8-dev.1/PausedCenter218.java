package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Re-check the central play affordance after a fullscreen/normal video handoff.
 * PlayerStart215's first-frame reveal can race a native layout pass while paused.
 * Never change the Media3 player, playback intent, queue, or position.
 */
public final class PausedCenter218 {
    private static final String TAG = "nicoid-paused-center";
    private static final int[] DELAYS = {96, 280, 680, 1450};
    private PausedCenter218() {}

    public static void afterFrame(View root) {
        if (root == null) return;
        for (int delay : DELAYS) root.postDelayed(new Check(root, delay), delay);
    }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static Activity activity(Context c) {
        for (int i = 0; i < 12 && c instanceof ContextWrapper; i++) {
            if (c instanceof Activity) return (Activity)c;
            Context next = ((ContextWrapper)c).getBaseContext();
            if (next == null || next == c) break;
            c = next;
        }
        return c instanceof Activity ? (Activity)c : null;
    }

    private static Object field(Object source, String name) {
        if (source == null) return null;
        for (Class<?> type = source.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field f = type.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(source);
            } catch (ReflectiveOperationException | SecurityException ignored) {}
        }
        return null;
    }

    /** null = unknown. Do not make UI changes without positive paused evidence. */
    private static Boolean paused(View root) {
        Activity a = activity(root.getContext());
        if (a == null || a.isFinishing() || a.isDestroyed()) return null;
        Object fragment = field(a, "v");
        Object player = field(fragment, "a0");
        if (player == null) return null;
        try {
            Method duration = player.getClass().getMethod("getDuration");
            Object value = duration.invoke(player);
            if (!(value instanceof Number) || ((Number)value).longValue() <= 0) return null;
            Method playing = player.getClass().getMethod("isPlaying");
            if (Boolean.TRUE.equals(playing.invoke(player))) return Boolean.FALSE;
            try {
                Method desired = player.getClass().getMethod("getPlayWhenReady");
                if (Boolean.TRUE.equals(desired.invoke(player))) return Boolean.FALSE;
            } catch (ReflectiveOperationException unsupported) {
                // Older player wrappers may lack this method. isPlaying is still checked.
            }
            return Boolean.TRUE;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.d(TAG, "Cannot inspect playback state", error);
            return null;
        }
    }

    private static void debug(String text) {
        Log.i(TAG, text);
        try {
            Class<?> logger = Class.forName("e.e.a.ModernDebug");
            logger.getMethod("record", String.class).invoke(null, "player-center pause-handoff " + text);
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    private static final class Check implements Runnable {
        private final WeakReference<View> reference;
        private final int delay;
        Check(View root, int delay) { reference = new WeakReference<>(root); this.delay = delay; }
        @Override public void run() {
            View root = reference.get();
            if (root == null || !root.isAttachedToWindow()) return;
            View play = find(root, "viewbutton");
            View host = find(root, "viewctrllay");
            View video = find(root, "videoLayout");
            if (play == null || host == null || video == null) return;
            Boolean stopped = paused(root);
            int state = play.getVisibility();
            debug("delay=" + delay + " paused=" + stopped
                + " playVisibility=" + state + " alpha=" + play.getAlpha()
                + " hostVisibility=" + host.getVisibility()
                + " hostShown=" + host.isShown() + " videoShown=" + video.isShown()
                + " size=" + play.getWidth() + "x" + play.getHeight());
            // Respect intentional native control hiding and changes to playback intent:
            // recover only an orphaned center button under a visible controller.
            if (!Boolean.TRUE.equals(stopped)
                    || host.getVisibility() != View.VISIBLE || !host.isShown()
                    || !video.isShown())
                return;
            if (state == View.INVISIBLE || state == View.GONE) {
                play.setVisibility(View.VISIBLE);
                debug("restored paused center play visibility after handoff");
            }
        }
    }
}
