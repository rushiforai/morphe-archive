package com.nmnvan.extension.thescore.patches;

import com.nmnvan.extension.thescore.settings.Settings;

@SuppressWarnings("unused")
public final class GameScreenPatch {

    /**
     * Replaced by the patch to return true when the patch is applied.
     */
    public static boolean isPatchIncluded() {
        return false;
    }

    /**
     * Injection point: result of the remote flag "com.thescore.new_matchup_page".
     *
     * @return the value to use for the flag.
     */
    public static boolean useNewGameScreen(boolean remoteValue) {
        return remoteValue && !Settings.KEEP_CLASSIC_GAME_SCREEN.get();
    }
}
