package com.feurstagram.extension;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.IOException;
import java.net.URI;

/**
 * What Instagram may fetch, on the JVM defaults (which are the shipping ones): feed, explore,
 * reels, suggested and ads blocked; stories and comments not; analytics and commerce always.
 */
public class BlockTest {

    private static boolean blocked(String url) {
        try {
            Block.throwIfBlocked(URI.create(url));
            return false;
        } catch (IOException expected) {
            return "Blocked by Oxbow".equals(expected.getMessage());
        }
    }

    @Test
    public void blockedSurfacesThrow() {
        assertTrue(blocked("https://i.instagram.com/api/v1/feed/timeline/?count=4"));
        assertTrue(blocked("https://i.instagram.com/api/v1/discover/topical_explore/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/clips/home/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/discover/chaining/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/ads/video/"));
    }

    @Test
    public void alwaysBlockedEndpointsThrowEvenWhenTheirToggleIsOff() {
        assertTrue(blocked("https://i.instagram.com/api/v1/logging/clientevent/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/fbupload/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/commerce/product_detail/"));
        assertTrue(blocked("https://i.instagram.com/api/v1/media/123/seen/"));
    }

    @Test
    public void everythingInstagramMayStillFetchPasses() {
        assertFalse(blocked("https://i.instagram.com/api/v1/feed/reels_tray/"));
        assertFalse(blocked("https://i.instagram.com/api/v1/media/123/comments/"));
        assertFalse(blocked("https://i.instagram.com/api/v1/direct_v2/inbox/"));
        assertFalse(blocked("https://i.instagram.com/api/v1/media/123/info/"));
        assertFalse(blocked("https://graph.instagram.com/query"));
    }

    @Test
    public void missingPathOrNullNeverThrow() throws IOException {
        Block.throwIfBlocked(null);
        Block.throwIfBlocked(URI.create("https://i.instagram.com"));
    }

    @Test
    public void blockedMessageIsOxbows() {
        try {
            Block.throwIfBlocked(URI.create("https://i.instagram.com/api/v1/stats/"));
            fail("expected IOException");
        } catch (IOException e) {
            assertTrue("Blocked by Oxbow".equals(e.getMessage()));
        }
    }
}
