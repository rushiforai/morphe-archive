package app.morphe.extension.applemusic;

import android.view.WindowInsetsController;

/**
 * Null-safe shim for the API 30 {@link WindowInsetsController} calls that Apple Music 7.0.0
 * performs without an SDK_INT guard (androidx's WindowInsetsControllerCompat had its
 * "&lt; 30" fallback stripped by R8, so on API 29 the controller field is null).
 *
 * <p>The controller parameter is declared as {@link Object} on purpose: this class has to be
 * loadable on API 29, where {@code android.view.WindowInsetsController} does not exist. Only the
 * method bodies reference the missing type, and they only run when the controller is non-null,
 * i.e. on API 30+ where the call behaves exactly like the original bytecode.
 */
public final class WindowInsetsControllerCompat {

    private WindowInsetsControllerCompat() {
    }

    /**
     * SDK_INT check for call sites that have no free register left to hold both the SDK value and
     * the literal 30: the patched bytecode does {@code sget} + {@code invoke-static} +
     * {@code move-result} + {@code if-eqz} on a single register. No platform type is involved, so
     * this method is safe to load and run on API 29.
     */
    public static boolean isAtLeast30(int sdk) {
        return sdk >= 30;
    }

    public static void setSystemBarsAppearance(Object controller, int appearance, int mask) {
        if (controller != null) {
            ((WindowInsetsController) controller).setSystemBarsAppearance(appearance, mask);
        }
    }

    public static int getSystemBarsAppearance(Object controller) {
        return controller == null
                ? 0
                : ((WindowInsetsController) controller).getSystemBarsAppearance();
    }

    public static void setSystemBarsBehavior(Object controller, int behavior) {
        if (controller != null) {
            ((WindowInsetsController) controller).setSystemBarsBehavior(behavior);
        }
    }
}
