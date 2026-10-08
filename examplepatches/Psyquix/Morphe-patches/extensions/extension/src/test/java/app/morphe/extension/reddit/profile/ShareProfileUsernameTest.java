package app.morphe.extension.reddit.profile;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

public class ShareProfileUsernameTest {

    @Test
    void plainProfileLink() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/user/rere"));
    }

    @Test
    void profileLinkWithQuery() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/user/rere/?utm_source=share"));
    }

    @Test
    void oldRedditLink() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("https://old.reddit.com/user/rere/"));
    }

    @Test
    void uppercaseSchemeAndHostPreservesUsernameCase() {
        assertEquals("RERE", ShareProfileUsername.shortenProfileLink("HTTPS://WWW.REDDIT.COM/user/RERE"));
    }

    @Test
    void usernameWithDashUnderscoreQueryAndFragment() {
        assertEquals("a-b_c", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/user/a-b_c?utm=x#frag"));
    }

    @Test
    void nonProfileLinkPassthrough() {
        assertEquals(
                "https://www.reddit.com/r/funny/comments/1abc/",
                ShareProfileUsername.shortenProfileLink("https://www.reddit.com/r/funny/comments/1abc/"));
    }

    @Test
    void shortHandlePassthrough() {
        assertEquals("u/rere", ShareProfileUsername.shortenProfileLink("u/rere"));
    }

    @Test
    void emptyUserSegmentPassthrough() {
        assertEquals("https://www.reddit.com/user/", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/user/"));
    }

    @Test
    void nullPassthrough() {
        assertNull(ShareProfileUsername.shortenProfileLink(null));
    }

    @Test
    void emptyPassthrough() {
        assertEquals("", ShareProfileUsername.shortenProfileLink(""));
    }

    @Test
    void httpBareDomain() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("http://reddit.com/user/rere"));
    }

    @Test
    void newShortProfileShareLink() {
        assertEquals(
                "LowMarket6464",
                ShareProfileUsername.shortenProfileLink("https://www.reddit.com/u/LowMarket6464/s/5sPZgIEqx8"));
    }

    @Test
    void shortUserPath() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/u/rere"));
    }

    @Test
    void shortUserPathTrailingSlash() {
        assertEquals("rere", ShareProfileUsername.shortenProfileLink("https://old.reddit.com/u/rere/"));
    }

    @Test
    void emptyShortUserSegmentPassthrough() {
        assertEquals("https://www.reddit.com/u/", ShareProfileUsername.shortenProfileLink("https://www.reddit.com/u/"));
    }

    @Test
    void wasShortenedTrueForProfileLink() {
        assertEquals(true, ShareProfileUsername.wasShortened(
                "https://www.reddit.com/u/LowMarket6464/s/5sPZgIEqx8", "LowMarket6464"));
    }

    @Test
    void wasShortenedFalseWhenUnchanged() {
        assertEquals(false, ShareProfileUsername.wasShortened(
                "https://www.reddit.com/r/funny/comments/1abc/",
                "https://www.reddit.com/r/funny/comments/1abc/"));
    }

    @Test
    void wasShortenedFalseForNullShortened() {
        assertEquals(false, ShareProfileUsername.wasShortened("https://www.reddit.com/u/rere", null));
    }
}
