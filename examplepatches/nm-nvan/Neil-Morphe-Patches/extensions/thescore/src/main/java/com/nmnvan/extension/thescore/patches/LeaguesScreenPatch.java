package com.nmnvan.extension.thescore.patches;

import com.nmnvan.extension.thescore.settings.Settings;

@SuppressWarnings("unused")
public final class LeaguesScreenPatch {

    /**
     * Replaced by the patch to return true when the patch is applied.
     */
    public static boolean isPatchIncluded() {
        return false;
    }

    /**
     * Injection point: start of LeaguesMenuTransformer's recent-league chips builder.
     */
    public static boolean hideLeagueChips() {
        return Settings.HIDE_LEAGUE_CHIPS.get();
    }

    /**
     * Injection point: start of LeaguesMenuTransformer's Spotlight section builder.
     */
    public static boolean hideSpotlight() {
        return Settings.HIDE_SPOTLIGHT.get();
    }
}
