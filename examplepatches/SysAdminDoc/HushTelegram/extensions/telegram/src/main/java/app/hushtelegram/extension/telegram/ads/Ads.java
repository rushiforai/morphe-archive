/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.ads;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keeps Telegram from asking for sponsored messages.
 *
 * <p>Telegram asks its server for a channel's sponsored messages in one place, the messages
 * controller's {@code getSponsoredMessages(long)}, and the video player's ads come from their own
 * request in {@code VideoAds.load()}. Global search asks for sponsored accounts to put above its
 * results with {@code contacts.getSponsoredPeers}. Each starts by asking this class. While the
 * switch is on the request is never made: the channel answers as one with no sponsored messages,
 * the player as one with no ad to show, and search takes the path Telegram keeps for Premium users
 * who turned ads off. Nothing is fetched, so nothing is drawn, counted as seen or reported as
 * clicked.
 */
public final class Ads {
    private Ads() {}

    /**
     * Injected at the start of the controller's {@code getSponsoredMessages(long)}. True means
     * answer null, as Telegram does for a chat with none. Never throws.
     */
    public static boolean skipSponsoredMessages() {
        return skip("sponsored messages request skipped");
    }

    /**
     * Injected at the start of {@code VideoAds.load()}. True means return before the request goes
     * out. Never throws.
     */
    public static boolean skipVideoAds() {
        return skip("video ads request skipped");
    }

    /**
     * Injected in global search just before it builds {@code contacts.getSponsoredPeers}. True
     * means take Telegram's own way past the request, the one a Premium user with ads turned off
     * gets. Never throws.
     */
    public static boolean skipSearchAds() {
        return skip("search ads request skipped");
    }

    private static boolean skip(String what) {
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_ADS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_ADS, what);
        return true;
    }
}
