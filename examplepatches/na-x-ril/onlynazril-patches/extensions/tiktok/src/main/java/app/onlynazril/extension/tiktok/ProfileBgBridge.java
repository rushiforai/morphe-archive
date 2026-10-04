package app.onlynazril.extension.tiktok;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.settings.ProfileBgSettings;

/**
 * The profile-background patch's hook.
 *
 * The app gates the whole feature (the background component, the image and
 * video pickers, the save endpoint) behind one AB decision held by an
 * obfuscated class that reads {@code profile_bg_in_allow_list}. The patch
 * answers that class's gate, so the feature runs the path it already ships
 * with; nothing here builds a UI or fetches anything.
 */
public final class ProfileBgBridge {
    private static final int LOG_CAP = 8;

    private static int logged;

    private ProfileBgBridge() {}

    /** The AB gate the profile page asks: answered while the switch says so. */
    public static boolean forceEnabled() {
        try {
            if (ProfileBgSettings.forceOn()) {
                report("profilebg: gate forced on");
                return true;
            }
            return false;
        } catch (Throwable t) {
            report("profilebg: gate lookup failed (" + t + ")");
            return false;
        }
    }

    private static void report(String message) {
        if (logged++ < LOG_CAP) Debug.print(message);
    }
}
