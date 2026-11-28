package semicoloncolonel.mobilestream.extension.netflix.misc;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * "Auto-skip" for the Netflix phone app (Compose player).
 *
 * The player's Skip button is a Jetpack Compose button. When the stream
 * enters a skippable part, the button is composed with an onClick lambda (a
 * Function0) that, when pressed, dispatches the skip to the player. The patch
 * calls {@link #onSkipCta} at the point the button is composed, handing over
 * that live onClick lambda and the state object it carries. When the state is
 * an intro or a recap the user chose to skip, the lambda is invoked for them,
 * on the main thread, which is exactly what a tap would do.
 *
 * The intro and recap states are stateless singletons shared across episodes,
 * so we cannot tell two intros apart by identity. Instead a short cooldown
 * stops a single window from firing more than once: the button is composed
 * repeatedly while it is on screen, we press once, and the press makes the
 * button go away. If the press is lost the cooldown lets it retry.
 *
 * The obfuscated names (the state classes and the lambda's state field) change
 * per Netflix build, so the patch resolves them and feeds them in here.
 */
@SuppressWarnings("unused")
public final class NetflixAutoSkipper {
    private static final String TAG = "MSP-NFX-SKIP";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    // A tiny defer so the press lands after the current composition frame,
    // never inside it.
    private static final long POST_DELAY_MS = 120;
    // One window must not fire twice; long enough for the seek to take and the
    // button to disappear, short enough that a genuinely separate window later
    // is not suppressed.
    private static final long COOLDOWN_MS = 3000;

    private static volatile long lastFire = 0L;

    private NetflixAutoSkipper() {
    }

    // The patch overwrites these four.
    public static boolean skipIntros() {
        return false;
    }

    public static boolean skipRecaps() {
        return false;
    }

    // Runtime class names (dotted) of the intro and recap state singletons.
    public static String introClass() {
        return "";
    }

    public static String recapClass() {
        return "";
    }

    // Name of the onClick lambda's field that holds the state object.
    public static String stateField() {
        return "";
    }

    /**
     * Called when the Skip button is composed, with its onClick lambda. Reads
     * the state the lambda carries; if it is an intro or recap the user chose
     * to skip, presses the button for them.
     */
    public static void onSkipCta(Object onClick) {
        if (onClick == null) {
            return;
        }
        try {
            Object state = readState(onClick);
            if (state == null) {
                return;
            }
            String cls = state.getClass().getName();
            Log.i(TAG, "onSkipCta state=" + cls + " introClass=" + introClass()
                    + "(" + skipIntros() + ") recapClass=" + recapClass() + "(" + skipRecaps() + ")");
            boolean wanted =
                    (skipIntros() && cls.equals(introClass())) ||
                    (skipRecaps() && cls.equals(recapClass()));
            if (!wanted) {
                return;
            }
            long now = SystemClock.uptimeMillis();
            if (now - lastFire < COOLDOWN_MS) {
                return;
            }
            lastFire = now;
            final Object click = onClick;
            MAIN.postDelayed(() -> invoke(click), POST_DELAY_MS);
        } catch (Throwable t) {
            Log.w(TAG, "onSkipCta failed", t);
        }
    }

    private static Object readState(Object onClick) {
        try {
            Field field = onClick.getClass().getDeclaredField(stateField());
            field.setAccessible(true);
            return field.get(onClick);
        } catch (Throwable t) {
            Log.w(TAG, "could not read skip state", t);
            return null;
        }
    }

    private static void invoke(Object onClick) {
        try {
            Method invoke = null;
            for (Method method : onClick.getClass().getDeclaredMethods()) {
                if (method.getName().equals("invoke") && method.getParameterTypes().length == 0) {
                    invoke = method;
                    break;
                }
            }
            if (invoke == null) {
                Log.w(TAG, "invoke() not found on " + onClick.getClass());
                return;
            }
            invoke.setAccessible(true);
            invoke.invoke(onClick);
            Log.i(TAG, "auto-skip fired");
        } catch (Throwable t) {
            Log.w(TAG, "auto-skip invoke failed", t);
        }
    }
}
