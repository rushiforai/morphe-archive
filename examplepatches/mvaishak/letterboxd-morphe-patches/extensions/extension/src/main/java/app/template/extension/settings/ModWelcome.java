package app.template.extension.settings;

import android.app.Activity;

/**
 * One-time "what's new / how to open Mod settings" dialog, shown once after a patch. Injected into
 * {@code MainActivity.onResume} (not {@code onCreate}) so it fires after the splash / login flow,
 * and it is only marked seen once the user actually dismisses it.
 */
public final class ModWelcome {

    private ModWelcome() {}

    /** Bump when {@link #BODY} changes so returning users see it once more. */
    private static final int BUILD = 2;
    private static final String KEY = "welcome_build";

    private static final String TITLE = "Letterboxd Mods";

    private static final String BODY =
            "Thanks for installing.\n\n"
          + "Open the Mods screen any time:\n"
          + "  •  long-press the Letterboxd app icon, or\n"
          + "  •  long-press the settings gear on your profile tab.\n\n"
          + "What's included\n"
          + "  •  Appearance: OLED surface, custom accent (presets or any hex), bottom-nav style\n"
          + "  •  Hide ratings until watched, with a tap-to-reveal cover\n"
          + "  •  Hide the Video Store row from the Films tab\n"
          + "  •  Brighter \"watched by\" stars";

    private static volatile boolean shown = false;
    private static volatile boolean scheduled = false;

    /** Injected at the top of {@code MainActivity.onResume} (fires repeatedly — guarded). */
    public static void maybeShow(final Activity activity) {
        try {
            if (shown || scheduled || activity == null) return;
            Prefs.load(activity);
            if (String.valueOf(BUILD).equals(Prefs.getString(KEY, ""))) {
                shown = true;
                return;
            }

            scheduled = true;
            activity.getWindow().getDecorView().postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (shown) return;
                        if (activity.isFinishing() || activity.isDestroyed()) {
                            scheduled = false; // a later onResume (real MainActivity) retries
                            return;
                        }
                        shown = true;
                        ModDialog.show(activity, TITLE, BODY, "Got it", null, null, null,
                                new Runnable() {
                                    @Override public void run() {
                                        Prefs.putString(KEY, String.valueOf(BUILD));
                                    }
                                });
                    } catch (Throwable t) {
                        scheduled = false;
                    }
                }
            }, 2200L);
        } catch (Throwable ignored) {
        }
    }
}
