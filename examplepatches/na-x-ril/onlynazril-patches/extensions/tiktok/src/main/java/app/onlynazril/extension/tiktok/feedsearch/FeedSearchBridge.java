package app.onlynazril.extension.tiktok.feedsearch;

import app.onlynazril.extension.tiktok.settings.FeedSearchSettings;

/**
 * The bytecode guard for the feed search suggestion bar.
 * <p>
 * The patch puts one call at the top of each trigger's boolean gate. When the hide switch is on the
 * bridge answers `true` and the gate returns false, so the Search · <query> bar is never added;
 * when it is off the app's own answer stands.
 */
public final class FeedSearchBridge {
    private FeedSearchBridge() {}

    public static boolean hidden() {
        return FeedSearchSettings.isHidden();
    }
}
