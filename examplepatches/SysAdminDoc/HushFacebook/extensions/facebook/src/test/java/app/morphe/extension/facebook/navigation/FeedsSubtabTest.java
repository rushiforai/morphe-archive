/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * The Feeds filters a start can be told to open on: what a settings file holds for each, never
 * changing once written, and the feed types each asks for, one name on each of Facebook's lists.
 */
public class FeedsSubtabTest {
    @Test
    public void aFileHoldsEachFilterByAValueThatNeverChanges() {
        List<String> values = Arrays.asList("all", "favorites", "friends", "groups", "pages");
        assertEquals(values.size(), FeedsSubtab.values().length);
        for (int i = 0; i < values.size(); i++) {
            assertEquals(values.get(i), FeedsSubtab.values()[i].fileValue);
            assertSame(FeedsSubtab.values()[i], FeedsSubtab.fromFile(values.get(i)));
        }
        assertNull(FeedsSubtab.fromFile("FAVORITES"));
        assertNull(FeedsSubtab.fromFile("recent"));
        assertNull(FeedsSubtab.fromFile(1));
        assertNull(FeedsSubtab.fromFile(null));
    }

    @Test
    public void eachFilterAsksForItsFeedTypesMostRecentListFirst() {
        // The most recent posts tab's names first, then the usual tab's: All, Favorites, Recent.
        assertEquals(Arrays.asList("most_recent_favorites", "favorites"), FeedsSubtab.FAVORITES.feedTypes);
        // Friends, Groups and Pages are only on the most recent posts tab.
        assertEquals(Collections.singletonList("most_recent_friend"), FeedsSubtab.FRIENDS.feedTypes);
        assertEquals(Collections.singletonList("most_recent_group"), FeedsSubtab.GROUPS.feedTypes);
        assertEquals(Collections.singletonList("most_recent_page"), FeedsSubtab.PAGES.feedTypes);
        // All is what Facebook opens on, so it asks for nothing.
        assertTrue(FeedsSubtab.ALL.feedTypes.isEmpty());
        assertThrows(UnsupportedOperationException.class, () -> FeedsSubtab.FAVORITES.feedTypes.add("top_stories"));
    }
}