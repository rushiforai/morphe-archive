package app.afterglow.extension.navigation;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/**
 * Settings checks shared by the navigation, tab bar, startup, Shorts and privacy hooks.
 *
 * <p>A feature runs only when its tweak was patched in ({@link InstalledTweaks}) and its
 * iOS setting is on, read the way iOS reads it: Lite Mode's forced value first, then the
 * stored value ({@link LiteMode#effectiveBool}). A failure reads as "off", so YouTube keeps
 * its stock behavior.
 */
final class Gate {
    static final String NAVIGATION_BAR = "navigation-bar";
    static final String TAB_BAR = "tab-bar";
    static final String STARTUP = "startup";
    static final String SHORTS = "shorts";
    static final String PRIVACY = "privacy";

    private Gate() {}

    /** True when {@code tweak} is installed and the iOS setting {@code key} is on. */
    static boolean on(String tweak, String key) {
        try {
            return InstalledTweaks.has(tweak) && LiteMode.effectiveBool(key);
        } catch (Throwable error) {
            Afterglow.error("Afterglow " + tweak + ": could not read " + key, error);
            return false;
        }
    }

    /** True when {@code tweak} is installed. */
    static boolean installed(String tweak) {
        try {
            return InstalledTweaks.has(tweak);
        } catch (Throwable error) {
            return false;
        }
    }
}
