package app.revanced.extension.rif;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ShareLinksTest {

    @Test
    public void matrixMediaLinks() {
        String base = "https://matrix.redditspace.com/_matrix/media/v3/download/reddit.com/537a8301ylyh1";
        assertTrue(ShareLinks.isMatrixMedia(base));
        assertTrue(ShareLinks.isMatrixMedia(base + "/"));
        assertTrue(ShareLinks.isMatrixMedia(base + "?allow_redirect=true"));
        assertFalse(ShareLinks.isMatrixMedia(null));
        assertFalse(ShareLinks.isMatrixMedia("https://matrix.redditspace.com/_matrix/media/v3/thumbnail/reddit.com/abc"));
        assertFalse(ShareLinks.isMatrixMedia("https://matrix.redditspace.com/_matrix/media/v3/download/example.org/abc"));
        assertFalse(ShareLinks.isMatrixMedia("https://evil.example/matrix.redditspace.com/_matrix/media/v3/download/reddit.com/abc"));
        assertFalse(ShareLinks.isMatrixMedia("https://matrix.redditspace.com.evil.example/_matrix/media/v3/download/reddit.com/abc"));
    }
}
