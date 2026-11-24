package app.sircoderin.extension.kvaesitso;

import android.app.Activity;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.inputmethod.InputMethodManager;

/**
 * Decides how Kvaesitso's search overlay (assistant mode) comes back:
 * - reopened with a new search request (swipe down on the home screen): clean search, keyboard open;
 * - returned to without a new request (Back from an app launched from it): keep the query.
 *
 * Kvaesitso itself decides on resume from {@code SharedLauncherActivity.pauseTime}: more than 5 s in the
 * background resets the scaffold and clears the query, less keeps everything. This sets {@code pauseTime}
 * right before that check runs (the check starts on ON_RESUME, after {@code onResume()}), so the outcome
 * depends on how the overlay was reopened instead of how long it was away.
 */
@SuppressWarnings("unused")
public final class SearchReopen {
    /**
     * A new intent this soon after a pause was delivered to the overlay while it was on screen (the system
     * pauses a resumed activity to deliver it). Kvaesitso handles that case itself, so leave it alone.
     */
    private static final long REDELIVERY_WINDOW_MS = 300;

    private static long pausedAt;
    private static boolean reopened;

    private SearchReopen() {}

    /** Called at the start of SharedLauncherActivity.onPause (injected by the patch). */
    public static void onPause(Activity activity) {
        if (!isAssistant(activity)) return;
        pausedAt = SystemClock.uptimeMillis();
    }

    /** Called from SharedLauncherActivity.onNewIntent (injected by the patch). */
    public static void onNewIntent(Activity activity) {
        if (!isAssistant(activity)) return;
        if (SystemClock.uptimeMillis() - pausedAt >= REDELIVERY_WINDOW_MS) reopened = true;
    }

    /** Called at the start of BaseActivity.onResume, before ON_RESUME is dispatched (injected by the patch). */
    public static void onResume(Activity activity) {
        if (!isAssistant(activity)) return;
        try {
            if (reopened) {
                reopened = false;
                // Far in the past: Kvaesitso's resume check takes its ">5 s away" branch and resets the search.
                setPauseTime(activity, 1L);
                showKeyboardWhenFocused(activity);
            } else if (!isNewIntent(activity)) {
                // Just now: neither the reset branch nor the "home button pressed" branch runs; the query stays.
                setPauseTime(activity, System.currentTimeMillis());
            }
        } catch (ReflectiveOperationException ignored) {
            // Unknown Kvaesitso version: keep its own behavior.
        }
    }

    private static boolean isAssistant(Activity activity) {
        return activity.getClass().getName().endsWith(".AssistantActivity");
    }

    private static void setPauseTime(Activity activity, long value) throws ReflectiveOperationException {
        activity.getClass().getMethod("setPauseTime", long.class).invoke(activity, value);
    }

    private static boolean isNewIntent(Activity activity) throws ReflectiveOperationException {
        return (Boolean) activity.getClass().getMethod("isNewIntent").invoke(activity);
    }

    /**
     * The search bar keeps its focus while another app is in front, but the keyboard was hidden when that app
     * opened, and nothing asks for it again because the focus state never changes. Ask once the window is
     * focused again (the keyboard can't be shown for an unfocused window).
     */
    private static void showKeyboardWhenFocused(Activity activity) {
        final View decor = activity.getWindow().getDecorView();
        if (decor.hasWindowFocus()) {
            decor.post(new Runnable() {
                @Override
                public void run() {
                    showKeyboard(decor);
                }
            });
            return;
        }
        final ViewTreeObserver observer = decor.getViewTreeObserver();
        observer.addOnWindowFocusChangeListener(new ViewTreeObserver.OnWindowFocusChangeListener() {
            @Override
            public void onWindowFocusChanged(boolean hasFocus) {
                if (!hasFocus) return;
                final ViewTreeObserver.OnWindowFocusChangeListener self = this;
                // Removing a listener while it is being dispatched is not allowed; do both on the next loop.
                decor.post(new Runnable() {
                    @Override
                    public void run() {
                        decor.getViewTreeObserver().removeOnWindowFocusChangeListener(self);
                        showKeyboard(decor);
                    }
                });
            }
        });
    }

    private static void showKeyboard(View decor) {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = decor.getWindowInsetsController();
            if (controller != null) {
                controller.show(WindowInsets.Type.ime());
                return;
            }
        }
        View focused = decor.findFocus();
        if (focused == null) return;
        InputMethodManager imm = decor.getContext().getSystemService(InputMethodManager.class);
        if (imm != null) imm.showSoftInput(focused, 0);
    }
}
