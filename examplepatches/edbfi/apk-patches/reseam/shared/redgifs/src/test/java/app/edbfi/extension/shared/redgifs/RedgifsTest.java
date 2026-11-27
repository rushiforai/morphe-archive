// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redgifs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class RedgifsTest {
    @Test
    public void supportedLinksOpenTheSamePublicPlayer() {
        String expected = "https://www.redgifs.com/ifr/abc123";
        for (String link : new String[] {
            "https://www.redgifs.com/watch/AbC123?ref=feed#player",
            "http://REDGIFS.COM/watch/ABC123-share-slug/",
            "https://redgifs.com/ifr/AbC123",
            "https://www.gifdeliverynetwork.com/AbC123-slug",
            "https://api.redgifs.com/v2/gifs/AbC123",
            "https://api.redgifs.com/v1/gfycats/AbC123",
            "https://media.redgifs.com/AbC123-mobile.mp4",
            "https://media.redgifs.com/AbC123-size_restricted.webm",
            "https://media.redgifs.com/AbC123.gif",
            expected
        }) {
            assertEquals(link, expected, Redgifs.embedUrl(link));
        }
    }

    @Test
    public void rifKeepsDirectMediaWithItsNativeFileHandler() {
        assertNull(Redgifs.pageEmbedUrl("https://media.redgifs.com/AbC123-mobile.mp4"));
        assertEquals("https://www.redgifs.com/ifr/abc123",
                Redgifs.pageEmbedUrl("https://redgifs.com/watch/AbC123"));
    }

    @Test
    public void otherUrlsStayWithTheApp() {
        for (String link : new String[] {
            null, "", "not a URL", "/watch/abc", "https://redgifs.com",
            "file://redgifs.com/watch/abc", "https://redgifs.com.attacker.test/watch/abc",
            "https://redgifs.com@other.test/watch/abc", "https://user@redgifs.com/watch/abc",
            "https://redgifs.com:8044/watch/abc", "https://redgifs.com/watch/abc%2fother",
            "https://redgifs.com/watch/a/b", "https://redgifs.com/users/abc",
            "https://i.redgifs.com/abc.jpg", "https://media.redgifs.com/abc.jpg",
            "https://api.redgifs.com/v2/auth/temporary", "https://gifdeliverynetwork.com/"
        }) {
            assertNull(link, Redgifs.embedUrl(link));
        }
    }
}
