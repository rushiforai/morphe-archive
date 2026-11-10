package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class AnonymousBrowsingPatch {

    // -1 keeps Reddit's value; 0 = classic Anonymous Browsing, 1 = Incognito.
    public static int revampOverride() {
        String choice = BinocularsMods.getChoice("account_switcher_private_mode");
        if ("anonymous".equals(choice)) {
            return 0;
        }
        if ("incognito".equals(choice)) {
            return 1;
        }
        return -1;
    }
}
