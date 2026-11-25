package com.feurstagram.extension;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * The locks only freeze what {@link Config#captureBaseline()} snapshotted, so every lockable
 * key must be covered by it. Five switches (Meta AI, notifications button, comments, endless
 * scrolling, story swipe-up) once were not, which made a mis-tap under the lock permanent.
 */
public class ConfigLockTest {

    @Test
    public void everySurfaceToggleIsLockableAndSnapshotted() {
        for (String key : Config.BLOCK_KEYS) {
            assertTrue(key, Config.isLockable(key));
        }
        for (String key : new String[] {"block_meta_ai", "block_notifications", "block_comments",
                "block_endless_scroll", "block_story_swipe_up"}) {
            assertTrue(key, java.util.Arrays.asList(Config.BLOCK_KEYS).contains(key));
        }
    }

    @Test
    public void navIconsAndTheFollowingFeedCountToo() {
        for (String key : new String[] {"nav_show_home", "nav_show_search", "nav_show_reels",
                "nav_show_create", "nav_show_direct", "nav_show_profile", "limit_following_feed"}) {
            assertTrue(key, Config.isLockable(key));
        }
    }

    @Test
    public void nothingElseIsFrozen() {
        assertFalse(Config.isLockable("block_unknown"));      // not a switch the page has
        assertFalse(Config.isLockable("auto_update"));
        assertFalse(Config.isLockable("hide_toasts"));
        assertFalse(Config.isLockable("ghost_dm_seen"));
        assertFalse(Config.isLockable(null));
    }

    @Test
    public void baselineAnswersEveryLockableKeyOnTheJvmDefaults() {
        Config.captureBaseline();
        assertTrue(Config.wasHiddenAtBaseline("block_feed"));          // hidden by default
        assertFalse(Config.wasHiddenAtBaseline("block_comments"));     // shown by default
        assertFalse(Config.wasHiddenAtBaseline("nav_show_home"));
        assertTrue(Config.wasHiddenAtBaseline("nav_show_reels"));
        assertFalse(Config.wasHiddenAtBaseline("limit_following_feed"));
    }
}
