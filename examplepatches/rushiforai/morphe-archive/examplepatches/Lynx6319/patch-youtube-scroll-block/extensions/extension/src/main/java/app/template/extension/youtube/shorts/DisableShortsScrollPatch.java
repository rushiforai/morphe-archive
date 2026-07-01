package app.template.extension.youtube.shorts;

import android.content.Context;
import android.content.SharedPreferences;

@SuppressWarnings("unused")
public class DisableShortsScrollPatch {

    // "morphe_" prefix matches the preference keys documented in the problem statement
    // and the key declared in the patch's booleanOption (morphe_disable_shorts_scroll).
    private static final String PREFS_NAME = "morphe_youtube_prefs";
    private static final String KEY_DISABLE_SCROLL = "morphe_disable_shorts_scroll";

    // Cached SharedPreferences instance — obtained once and reused on every call.
    private static volatile SharedPreferences sPrefs;

    // Cached listener reference kept alive so it is not garbage-collected.
    private static SharedPreferences.OnSharedPreferenceChangeListener sListener;

    // Cached preference value updated via a change listener to avoid disk I/O
    // on every swipe gesture.  Defaults to true, matching the patch's own default.
    private static volatile boolean sCachedScrollBlocked = true;

    /**
     * Returns {@code true} when the user has enabled the "Disable Shorts scroll"
     * preference, meaning all vertical swipe / page-advance events on the
     * Shorts {@code ReelRecyclerView} should be suppressed.
     *
     * <p>No player-type guard is needed here because the patched methods
     * ({@code ReelRecyclerView.onInterceptTouchEvent} and {@code onTouchEvent})
     * are only ever invoked inside the Shorts player.</p>
     *
     * <p>Called from the injected Smali at the top of both the fling-gesture handler
     * and the page-advance method so that the check is centralised here and easy to
     * update without touching the patch bytecode again.</p>
     */
    public static boolean isScrollBlocked() {
        try {
            ensurePrefsLoaded();
            return sCachedScrollBlocked;
        } catch (Exception ignored) {
            // Fail-open: if anything goes wrong, do not block scrolling.
            return false;
        }
    }

    /**
     * Initialises {@link #sPrefs} and registers a change listener the first time
     * this method is called.  Subsequent calls are effectively free (volatile read).
     */
    private static void ensurePrefsLoaded() {
        if (sPrefs != null) return;

        Context context = getContext();
        if (context == null) return;

        synchronized (DisableShortsScrollPatch.class) {
            if (sPrefs != null) return; // re-check inside the lock

            SharedPreferences prefs =
                context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);

            // Read and cache the current value.
            sCachedScrollBlocked = prefs.getBoolean(KEY_DISABLE_SCROLL, true);

            // Register a listener so future preference changes are picked up
            // without any additional I/O on the hot path.
            sListener = (p, key) -> {
                if (KEY_DISABLE_SCROLL.equals(key)) {
                    sCachedScrollBlocked = p.getBoolean(key, true);
                }
            };
            prefs.registerOnSharedPreferenceChangeListener(sListener);

            // Assign last so that the volatile write acts as a publication barrier.
            sPrefs = prefs;
        }
    }

    /**
     * Retrieves the application {@link Context} without requiring the caller to
     * pass one in, by reflectively reading the hidden {@code ActivityThread} field.
     */
    private static Context getContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object app = activityThread
                .getMethod("currentApplication")
                .invoke(null);
            return (Context) app;
        } catch (Exception ignored) {
            return null;
        }
    }
}
