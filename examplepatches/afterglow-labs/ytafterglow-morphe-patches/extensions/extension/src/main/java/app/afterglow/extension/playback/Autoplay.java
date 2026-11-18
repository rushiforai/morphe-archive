package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/**
 * iOS {@code autoplayMode} ("Autoplay": 0 Default, 1 Off, 2 Off + hidden; tweak "autoplay").
 * Off modes clear only the initial play-when-ready flag, leaving manual Play intact.
 * Option 2 also hides the native Autoplay switch without changing its saved value.
 */
@SuppressWarnings("unused")
public final class Autoplay {
    private Autoplay() {}

    private static int mode() {
        try {
            return InstalledTweaks.has("autoplay")
                    ? Math.min(Math.max(AfterglowPrefs.getInt("autoplayMode"), 0), 2) : 0;
        } catch (Throwable error) {
            Afterglow.error("Autoplay.mode", error);
            return 0;
        }
    }

    /** Called only on the private configuration copy used by native loadVideo. */
    public static int startFlags(int nativeFlags) {
        return mode() >= 1 ? nativeFlags & ~2 : nativeFlags;
    }

    public static boolean hideAutoplaySwitch() { return mode() == 2; }
}
