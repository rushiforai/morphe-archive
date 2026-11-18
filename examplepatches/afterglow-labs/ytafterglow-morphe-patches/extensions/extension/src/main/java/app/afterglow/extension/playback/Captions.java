/* Caption integration originally adapted from Morphe patches (GPLv3). See NOTICE.
 * Native caption policy for the two independently controlled iOS preferences.
 */
package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.AfterglowPrefs;


@SuppressWarnings("unused")
public final class Captions {
    // One atomic, Android-private value: "0" (off) or "1:" + the native track id.
    // Its targeted notification does not refresh unrelated playback settings.
    private static final String CHOICE = "android_caption_choice";
    private Captions() {}

    private static boolean enabled(String key) {
        return InstalledTweaks.has("captions") && LiteMode.effectiveBool(key);
    }

    /** Prefer YouTube's stored viewer choice over the device/server initial state. */
    public static boolean rememberChoice(boolean nativeRecentChoice) {
        try {
            return nativeRecentChoice || enabled("rememberCaptionState");
        } catch (Throwable error) {
            Afterglow.error("Captions.rememberChoice", error);
            return nativeRecentChoice;
        }
    }

    /** Called only where the native manager writes an explicit viewer selection. */
    public static void onManualChoice(Boolean selected, String language) {
        try {
            if (selected == null || !enabled("rememberCaptionState")) return;
            AfterglowPrefs.setString(CHOICE, selected
                    ? "1:" + (language == null ? "" : language) : "0");
        } catch (Throwable error) {
            Afterglow.error("Captions.onManualChoice", error);
        }
    }

    public static boolean restoreEnabled(boolean nativeEnabled) {
        try {
            String saved = enabled("rememberCaptionState") ? AfterglowPrefs.getString(CHOICE) : null;
            if ("0".equals(saved)) return false;
            return saved != null && saved.startsWith("1:") || nativeEnabled;
        } catch (Throwable error) {
            Afterglow.error("Captions.restoreEnabled", error);
            return nativeEnabled;
        }
    }

    public static String restoreLanguage(String nativeLanguage) {
        try {
            String saved = enabled("rememberCaptionState") ? AfterglowPrefs.getString(CHOICE) : null;
            if (saved != null && saved.startsWith("1:") && saved.length() > 2) return saved.substring(2);
        } catch (Throwable error) {
            Afterglow.error("Captions.restoreLanguage", error);
        }
        return nativeLanguage;
    }

    /** Match iOS respectDeviceCaptionSetting: remembered viewer choices take precedence. */
    public static boolean respectDeviceSetting(boolean nativeEnabled) {
        try {
            return nativeEnabled && !enabled("rememberCaptionState");
        } catch (Throwable error) {
            Afterglow.error("Captions.respectDeviceSetting", error);
            return nativeEnabled;
        }
    }

    /** Drop only a server recommendation to enable captions. Viewer taps are untouched. */
    public static boolean ignoreServerState(Enum<?> nativeState) {
        try {
            return nativeState != null && enabled("disableAutoCaptions")
                    && ("ON".equals(nativeState.name()) || "ON_RECOMMENDED".equals(nativeState.name()));
        } catch (Throwable error) {
            Afterglow.error("Captions.ignoreServerState", error);
            return false;
        }
    }

    public static boolean allowMutedAutoCaptions(boolean original) {
        try {
            return original && !enabled("disableAutoCaptions");
        } catch (Throwable error) {
            Afterglow.error("Captions.allowMutedAutoCaptions", error);
            return original;
        }
    }
}
