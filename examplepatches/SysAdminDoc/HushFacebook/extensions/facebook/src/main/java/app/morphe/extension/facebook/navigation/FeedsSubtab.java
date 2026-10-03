/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * The filters a start on the Feeds tab can be told to open on (#56), each with the names
 * Facebook's own feed types keep for it.
 *
 * <p>Facebook builds the Feeds tab's filters from one of two lists in its own code, and each
 * filter is one of its feed types, known by a name it keeps. The usual list is All, Favorites
 * ("favorites") and Recent. The one for the most recent posts is All, Favorites, Friends, Groups and
 * Pages ("most_recent_favorites", "most_recent_friend" and so on). Which list a Feeds tab shows is
 * Facebook's to say, so a filter asks for each name it has there, and Facebook's own lookup answers
 * which one the tab has. A filter the tab hasn't got under any of them leaves it as it opened.
 *
 * <p>Like {@link StartTab}, this holds no Android type and reads no setting, and its
 * {@link #fileValue} is what a settings file holds. The label a person reads is the settings
 * screen's, in the phone's language.
 */
public enum FeedsSubtab {
    ALL("all"),
    FAVORITES("favorites", "most_recent_favorites", "favorites"),
    FRIENDS("friends", "most_recent_friend"),
    GROUPS("groups", "most_recent_group"),
    PAGES("pages", "most_recent_page");

    /** What a settings file holds for this filter. It never changes once written. */
    public final String fileValue;

    /**
     * The names this filter's feed types keep, in the order they're asked for: the most recent
     * posts list's first, then the usual list's. None for All, which asks for nothing.
     */
    final List<String> feedTypes;

    FeedsSubtab(String fileValue, String... feedTypes) {
        this.fileValue = fileValue;
        this.feedTypes = Collections.unmodifiableList(Arrays.asList(feedTypes));
    }

    /** The filter a settings file names, or null when it names none this build knows. */
    @Nullable
    public static FeedsSubtab fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (FeedsSubtab subtab : values()) {
            if (subtab.fileValue.equals(value)) return subtab;
        }
        return null;
    }
}
