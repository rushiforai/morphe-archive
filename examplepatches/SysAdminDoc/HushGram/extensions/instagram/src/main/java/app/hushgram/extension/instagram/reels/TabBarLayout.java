/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * What the Tab bar layout patch asks (#356).
 *
 * <p>Instagram 452 decides in one method whether an account gets the newer tab bar, the one with
 * Messages on it and a sideways swipe between every tab. It asks a stored override first, then a
 * server config, then a second gate. The tab host, Reels, Messages and the other screens that lay
 * themselves out for one bar or the other all ask that method, so a server change can flip the bar
 * back to the older one between two launches. The patch hands every answer of that method to
 * {@link #newTabBar}, which keeps it for Instagram's choice and replaces it for the other two.
 *
 * <p>Every answer is Instagram's own while the choice is Instagram's, HushGram is paused, the
 * settings aren't ready, or anything in here throws.
 */
public final class TabBarLayout {
    /** What {@link HookStatus} counts: an answer turned to the newer bar, and one turned to the older. */
    static final String SWIPE = "answers turned to the swipe bar";
    static final String CLASSIC = "answers turned to the classic bar";

    /** The hook's name in a failure report. */
    static final String GATE = "tab bar gate";

    private static volatile boolean logged;

    private TabBarLayout() {
    }

    /**
     * Asked at each return of Instagram's new tab bar gate with the answer it was about to give, 1
     * for the newer bar and 0 for the older. Returns the answer to give instead. Never throws.
     */
    public static boolean newTabBar(int instagrams) {
        boolean stock = instagrams != 0;
        try {
            HookStatus.invoked(FamilyNames.TAB_BAR_LAYOUT);
            if (!Utils.settingsReady()) return stock;
            TabBarLayoutChoice choice = Settings.TAB_BAR_LAYOUT.get();
            if (choice == TabBarLayoutChoice.SWIPE || choice == TabBarLayoutChoice.CLASSIC) {
                boolean answer = choice == TabBarLayoutChoice.SWIPE;
                if (answer != stock) {
                    HookStatus.counted(FamilyNames.TAB_BAR_LAYOUT, answer ? SWIPE : CLASSIC);
                    if (!logged) {
                        logged = true;
                        Logger.printDebug(() -> "Tab bar layout: Instagram picked the "
                                + (stock ? "swipe" : "classic") + " bar, showing the " + (answer ? "swipe" : "classic") + " one");
                    }
                }
                return answer;
            }
            return stock;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAB_BAR_LAYOUT, GATE, failure);
            return stock;
        }
    }
}
