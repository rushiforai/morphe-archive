// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ShareLinksTest {
    @Test
    public void recognisesShareLinks() {
        assertTrue(ShareLinks.isShareLink("https://www.reddit.com/r/chicago/s/UBknncuPg6"));
        assertTrue(ShareLinks.isShareLink("https://reddit.com/r/chicago/s/UBknncuPg6/"));
        assertTrue(ShareLinks.isShareLink("http://old.reddit.com/r/chicago/s/UBknncuPg6?utm_source=share"));
        assertTrue(ShareLinks.isShareLink("https://www.reddit.com/u/someone/s/AbC123xyz"));
        assertTrue(ShareLinks.isShareLink("https://WWW.Reddit.com/user/someone/s/AbC123xyz#top"));
    }

    @Test
    public void leavesOtherLinksAlone() {
        assertFalse(ShareLinks.isShareLink("https://www.reddit.com/r/chicago/comments/1xr5uql/the_bean/"));
        assertFalse(ShareLinks.isShareLink("https://www.reddit.com/r/s/s"));
        assertFalse(ShareLinks.isShareLink("https://www.reddit.com/r/chicago/s/UBknncuPg6/more"));
        assertFalse(ShareLinks.isShareLink("https://reddit.com.example.org/r/chicago/s/UBknncuPg6"));
        assertFalse(ShareLinks.isShareLink("https://notreddit.com/r/chicago/s/UBknncuPg6"));
        assertFalse(ShareLinks.isShareLink("redditisfun://www.reddit.com/r/chicago/s/UBknncuPg6"));
        assertFalse(ShareLinks.isShareLink("/r/chicago/s/UBknncuPg6"));
        assertFalse(ShareLinks.isShareLink("not a url"));
        assertFalse(ShareLinks.isShareLink(null));
    }

    @Test
    public void opensTheRedirectTargetWithoutTracking() {
        assertEquals(
                "https://www.reddit.com/r/chicago/comments/1xr5uql/the_bean_1_chicagoans_0/",
                ShareLinks.target("https://www.reddit.com/r/chicago/comments/1xr5uql/the_bean_1_chicagoans_0/"
                        + "?share_id=x7pl8fh4hokWEzbyJh6Dh&utm_medium=ios_app&utm_name=iossmf&utm_source=share&utm_term=1"));
        assertEquals(
                "https://www.reddit.com/r/x/comments/abc/t/?context=3#c",
                ShareLinks.target("https://www.reddit.com/r/x/comments/abc/t/?share_id=1&context=3&utm_source=share#c"));
    }

    @Test
    public void opensNothingThatLeavesReddit() {
        assertNull(ShareLinks.target(null));
        assertNull(ShareLinks.target("https://evil.example.com/r/x/comments/abc/"));
        assertNull(ShareLinks.target("https://reddit.com.example.org/r/x/comments/abc/"));
        assertNull(ShareLinks.target("http://www.reddit.com/r/x/comments/abc/"));
        assertNull(ShareLinks.target("intent://www.reddit.com/r/x/comments/abc/#Intent;end"));
    }

    @Test
    public void norAnotherShareLink() {
        assertNull(ShareLinks.target("https://www.reddit.com/r/chicago/s/UBknncuPg6"));
    }

    @Test
    public void keepsUrlsWithoutTracking() {
        assertEquals("https://www.reddit.com/r/x/", ShareLinks.withoutTracking("https://www.reddit.com/r/x/"));
        assertEquals("https://www.reddit.com/r/x/", ShareLinks.withoutTracking("https://www.reddit.com/r/x/?utm_source=a&"));
    }
}
