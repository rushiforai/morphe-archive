package nl.johninnl.medium.privacy;
import org.junit.Test;
import static org.junit.Assert.*;
public class WebPrivacyRulesTest {
    @Test public void blocksObservedCollectorsAndWidgetHosts() {
        for (String url : new String[] {"https://static.cloudflareinsights.com/beacon.min.js", "https://freedium-mirror.cfd/cdn-cgi/rum", "https://platform.twitter.com/widgets.js", "https://syndication.twitter.com/i/tweet", "https://syndication.x.com/", "https://cdn.syndication.twimg.com/tweet-result.js", "https://cdn.embedly.com/widgets/media.html"}) assertTrue(url, WebPrivacyRules.blocked(url));
    }
    @Test public void leavesContentImagesAndAuthenticationAvailable() {
        for (String url : new String[] {"https://medium.com/_/graphql", "https://api.medium.com/", "https://freedium-mirror.cfd/https://medium.com/p/abc", "https://miro.medium.com/image.jpg", "https://pbs.twimg.com/media/photo.jpg", "https://accounts.google.com/", "https://identitytoolkit.googleapis.com/", "https://www.facebook.com/dialog/oauth", "https://x.com/user/status/123"}) assertFalse(url, WebPrivacyRules.blocked(url));
    }
    @Test public void matchesDnsBoundariesAndTrailingDot() {
        assertTrue(WebPrivacyRules.blocked("https://STATIC.CLOUDFLAREINSIGHTS.COM./beacon.js"));
        assertFalse(WebPrivacyRules.blocked("https://notcloudflareinsights.com/"));
        assertFalse(WebPrivacyRules.blocked("https://cloudflareinsights.com.example.org/"));
        assertFalse(WebPrivacyRules.blocked("https://example.org/cloudflareinsights.com"));
    }
    @Test public void unwrapsAnExplicitMediaLinkWithoutWidgetRequest() {
        assertEquals("https://x.com/user/status/123", WebPrivacyRules.embedTarget("https://cdn.embedly.com/widgets/media.html?url=https%3A%2F%2Fx.com%2Fuser%2Fstatus%2F123").toString());
        assertNull(WebPrivacyRules.embedTarget("https://cdn.embedly.com/widgets/media.html"));
        assertNull(WebPrivacyRules.safe("javascript:bad()"));
        assertNull(WebPrivacyRules.safe("https://account:secret@example.org/"));
    }
}
