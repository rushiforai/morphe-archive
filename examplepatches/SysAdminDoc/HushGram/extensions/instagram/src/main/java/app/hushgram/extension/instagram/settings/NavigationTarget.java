/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

/** Stable enum names carried by Instagram's tab factory, never a screen position or resource ID. */
public enum NavigationTarget {
    OFF, FEED, SEARCH, CLIPS, DIRECT, PROFILE, SHARE, CREATION, NEWS,
    PRODUCER_PROFILE_PANEL, FEED_SWITCHER, DYNAMIC_TAB;

    boolean matches(Object tab) {
        return this != OFF && tab instanceof Enum<?> && name().equals(((Enum<?>) tab).name());
    }
}
