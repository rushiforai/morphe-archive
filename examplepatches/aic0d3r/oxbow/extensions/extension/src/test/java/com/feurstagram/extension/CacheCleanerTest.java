package com.feurstagram.extension;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * The rule that decides which {@code files/} folders a settings change wipes, fed the folder
 * names Instagram 456 really uses. Names sound alike on both sides: the user's own work and
 * the caches must not be told apart by "media", "image" or "clip" alone.
 */
public class CacheCleanerTest {

    @Test
    public void draftsAndOriginalsAreTheUsersWorkAndStay() {
        assertFalse(CacheCleaner.isMediaCache("pending_media_images"));   // draft post/reel media
        assertFalse(CacheCleaner.isMediaCache("clips_draft_asset"));      // reel draft owner
        assertFalse(CacheCleaner.isMediaCache("original_images"));        // pre-edit originals
        assertFalse(CacheCleaner.isMediaCache("ig_original_images"));
        assertFalse(CacheCleaner.isMediaCache("story_drafts"));
    }

    @Test
    public void mediaCachesStillGo() {
        assertTrue(CacheCleaner.isMediaCache("ExoPlayerCacheDir"));
        assertTrue(CacheCleaner.isMediaCache("videocache"));
        assertTrue(CacheCleaner.isMediaCache("most_recent_reels_cache"));
        assertTrue(CacheCleaner.isMediaCache("thumbs"));
        assertTrue(CacheCleaner.isMediaCache("ae-media"));
        assertTrue(CacheCleaner.isMediaCache("Reels_Cache"));            // matched case-insensitively
    }

    @Test
    public void sessionDataIsNeverTouched() {
        assertFalse(CacheCleaner.isMediaCache("instagram_prefs"));
        assertFalse(CacheCleaner.isMediaCache("accounts"));
        assertFalse(CacheCleaner.isMediaCache("user_session_media_tokens"));
    }

    @Test
    public void anythingNotMediaStays() {
        assertFalse(CacheCleaner.isMediaCache("app_textures"));   // no marker
        assertFalse(CacheCleaner.isMediaCache("databases"));
    }
}
