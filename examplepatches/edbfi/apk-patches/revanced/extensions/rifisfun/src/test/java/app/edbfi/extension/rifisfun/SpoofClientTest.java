// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SpoofClientTest {
    @Test
    public void givesTheAppTokenToRedditApiRequests() {
        assertTrue(SpoofClient.usesAppToken("https", "www.reddit.com", "/r/android/hot.json"));
        assertTrue(SpoofClient.usesAppToken("https", "www.reddit.com", "/.json"));
        assertTrue(SpoofClient.usesAppToken("http", "reddit.com", "/comments/abc.json"));
        assertTrue(SpoofClient.usesAppToken("https", "old.reddit.com", "/api/info.json"));
        assertTrue(SpoofClient.usesAppToken("https", "OAUTH.Reddit.com", "/api/v1/me"));
        assertTrue(SpoofClient.usesAppToken("https", "oauth.reddit.com", null));
    }

    @Test
    public void neverToTheTokenRequest() {
        assertFalse(SpoofClient.usesAppToken("https", "www.reddit.com", "/api/v1/access_token"));
        assertFalse(SpoofClient.usesAppToken("https", "oauth.reddit.com", "/api/v1/access_token"));
    }

    @Test
    public void norToOtherHosts() {
        assertFalse(SpoofClient.usesAppToken("https", "redd.it", "/abc"));
        assertFalse(SpoofClient.usesAppToken("https", "i.redd.it", "/abc.jpg"));
        assertFalse(SpoofClient.usesAppToken("https", "notreddit.com", "/r/x.json"));
        assertFalse(SpoofClient.usesAppToken("https", "reddit.com.example.org", "/r/x.json"));
        assertFalse(SpoofClient.usesAppToken("https", "thumbs.reddit.com", "/a.png"));
        assertFalse(SpoofClient.usesAppToken("https", null, "/r/x.json"));
        assertFalse(SpoofClient.usesAppToken("redditisfun", "www.reddit.com", "/r/x"));
        assertFalse(SpoofClient.usesAppToken(null, "www.reddit.com", "/r/x"));
    }

    @Test
    public void keepsTheTokenWithoutPreferences() {
        // Before the app started there is nowhere to read which client a token belongs to: keep it.
        assertEquals(1234L, SpoofClient.appTokenExpiry("token", 1234L));
        assertEquals(1234L, SpoofClient.appTokenExpiry("", 1234L));
    }

    @Test
    public void dropsATokenIssuedElsewhere() {
        String issued = SpoofClient.issuedHere("token");
        assertEquals(1234L, SpoofClient.expiryFor(issued, "token", 1234L));
        // Another client's token, a token this client didn't hand out, or one from before the patch: get a new one.
        assertEquals(0L, SpoofClient.expiryFor("otherClient:" + SpoofClient.sha256("token"), "token", 1234L));
        assertEquals(0L, SpoofClient.expiryFor(issued, "other-token", 1234L));
        assertEquals(0L, SpoofClient.expiryFor(null, "token", 1234L));
    }

    @Test
    public void tellsTokensApartWithoutStoringThem() {
        String issued = SpoofClient.issuedHere("secret-token");
        assertFalse(issued.contains("secret-token"));
        assertEquals(issued, SpoofClient.issuedHere("secret-token"));
        assertNotEquals(issued, SpoofClient.issuedHere("other-token"));
        assertEquals("2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b", SpoofClient.sha256("secret"));
    }
}
