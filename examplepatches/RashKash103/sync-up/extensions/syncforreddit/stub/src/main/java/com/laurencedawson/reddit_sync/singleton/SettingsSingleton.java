package com.laurencedawson.reddit_sync.singleton;

/**
 * Sync's own settings, read for the two that say whether the floating button is meant to be on
 * the screen at all. The class and the fields keep their names; only the getter is renamed.
 *
 * <p>Compile only.
 */
public class SettingsSingleton {
    /** The settings as they stand. */
    public static Settings x() {
        return null;
    }

    public static class Settings {
        /** {@code Show FAB}. */
        public boolean mainFab;

        /** {@code Autohide FAB}, which is the one that hides it as a feed scrolls. */
        public boolean mainFabAutohide;
    }
}
