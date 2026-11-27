// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.oauth;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class OAuthRedirectTest {
    private static final String REDIRECT = "edbfi.fixture://oauth/callback";

    @Test
    public void matchesBrowserNormalizedHttpEndpoints() {
        assertTrue(OAuthRedirect.matchesEndpoint("https://callback.example/?state=s&code=c",
            "HTTPS://Callback.Example:443"));
        assertTrue(OAuthRedirect.matchesEndpoint("http://callback.example/?state=s&code=c",
            "http://Callback.Example:80/"));
        assertTrue(OAuthRedirect.matchesEndpoint("http://callback.example:8080/path?state=s&code=c",
            "http://Callback.Example:8080/path"));
    }

    @Test
    public void comparesIpv6LiteralsWithoutChangingTheirAddressSpace() {
        String expanded = "http://[0000:0000:0000:0000:0000:0000:0000:0001]:80/";
        assertTrue(OAuthRedirect.matchesEndpoint("http://[::1]/", expanded));
        assertFalse(OAuthRedirect.matchesEndpoint("http://[::2]/", expanded));
        assertFalse(OAuthRedirect.matchesEndpoint("http://[::1]:81/", expanded));
        assertFalse(OAuthRedirect.matchesEndpoint("http://localhost/", expanded));
        assertTrue(OAuthRedirect.matchesEndpoint("https://[::ffff:c000:201]/", "https://[::FFFF:192.0.2.1]"));
        assertFalse(OAuthRedirect.matchesEndpoint("https://192.0.2.1/", "https://[::ffff:192.0.2.1]"));
        assertTrue(OAuthRedirect.matchesEndpoint("https://[2001:db8:0:1::a:b]/",
            "https://[2001:0DB8:0:1:0:0:A:B]/"));
    }

    @Test
    public void removesBrowserDotSegmentsWhilePreservingOtherPathBytes() {
        String host = "https://callback.example";
        String registered = host + "/keep//drop/.%2e/%2E/next%2Fleaf/.";
        assertTrue(OAuthRedirect.matchesEndpoint(host + "/keep//next%2Fleaf/", registered));
        assertFalse(OAuthRedirect.matchesEndpoint(host + "/keep/next%2Fleaf/", registered));
        assertFalse(OAuthRedirect.matchesEndpoint(host + "/keep//next/leaf/", registered));
        assertFalse(OAuthRedirect.matchesEndpoint(host + "/keep//next%2Fleaf", registered));
        assertTrue(OAuthRedirect.matchesEndpoint(host + "/a/end", host + "/../a//%2e%2E/end"));
        assertTrue(OAuthRedirect.matchesEndpoint(host + "/end", host + "/../end"));
        assertTrue(OAuthRedirect.matchesEndpoint(host + "/a/", host + "/a/drop/%2e."));
        assertTrue(OAuthRedirect.matchesEndpoint(host + "/x%2e", host + "/x%2e"));
        assertFalse(OAuthRedirect.matchesEndpoint(host + "/x.", host + "/x%2e"));
    }

    @Test
    public void recognizesApostrophesEncodedByHttpNavigationInTheFixedQuery() {
        String registered = "HTTP://[0:0:0:0:0:0:0:1]:80/one/%2e%2E/return?q=it's%26ok&channel=a+b";
        String endpoint = "http://[::1]/return";
        String fields = "&state=s&code=c";
        String actual = endpoint + "?q=it%27s%26ok&channel=a+b" + fields;
        assertTrue(OAuthRedirect.matchesEndpoint(actual, registered));
        assertTrue(OAuthRedirect.validResponse(actual, registered));
        assertFalse(OAuthRedirect.validResponse(actual.replace("a+b", "a%20b"), registered));
        assertFalse(OAuthRedirect.validResponse(actual.replace("q=it%27s%26ok&channel=a+b", "channel=a+b&q=it%27s%26ok"),
            registered));
        assertFalse(OAuthRedirect.validResponse(actual + "&state=duplicate", registered));
        assertFalse(OAuthRedirect.validResponse(REDIRECT + "?q=it%27s" + fields, REDIRECT + "?q=it's"));
    }

    @Test
    public void rejectsOtherEndpoints() {
        String http = "https://callback.example/path";
        for (String other : new String[] {
            "http://callback.example/path", "https://callback.example:444/path",
            "https://callback.example.evil/path", "https://callback.example@evil.example/path",
            "https://evil.example@callback.example/path", "https://callback.example/path/",
            "https://callback.example/Path", "https://callback.example/%70ath",
            "https://callback.example/folder/../path"
        }) {
            assertFalse(other, OAuthRedirect.matchesEndpoint(other + "?state=s&code=c", http));
        }
        assertFalse(OAuthRedirect.matchesEndpoint(null, REDIRECT));
        assertFalse(OAuthRedirect.matchesEndpoint(REDIRECT + "/other?state=s&code=c", REDIRECT));
        assertFalse(OAuthRedirect.matchesEndpoint("edbfi.fixture://oauth.example/callback?state=s&code=c", REDIRECT));
    }

    @Test
    public void recognizesAuthorizationAndDenialResponsesOnSupportedSchemes() {
        for (String redirect : new String[] { REDIRECT, "edbfi.fixture:/callback", "https://callback.example/" }) {
            String success = redirect + "?state=sample&code=code%2B%26%20%3D";
            String denial = redirect + "?error=access_denied&state=sample";
            assertTrue(OAuthRedirect.matchesEndpoint(success, redirect));
            assertTrue(OAuthRedirect.validResponse(success, redirect));
            assertTrue(OAuthRedirect.validResponse(denial, redirect));
        }
    }

    @Test
    public void matchesEndpointEvenWhenRegisteredQueryIsMissingOrChanged() {
        String registered = REDIRECT + "?channel=one%20two";
        String response = REDIRECT + "?state=sample&code=sample";
        assertTrue(OAuthRedirect.validResponse(registered + "&state=sample&code=sample", registered));
        assertTrue(OAuthRedirect.matchesEndpoint(response, registered));
        assertFalse(OAuthRedirect.validResponse(response, registered));
        assertFalse(OAuthRedirect.validResponse(REDIRECT + "?channel=other&state=s&code=c", registered));
    }

    @Test
    public void distinguishesMalformedResponsesFromOtherEndpoints() {
        String registered = "https://Callback.Example:443";
        String endpoint = "https://callback.example/";
        for (String suffix : new String[] {
            "", "?code=c", "?state=&code=c", "?state=s&code", "?state=s&code=", "?state=s",
            "?state=s&state=t&code=c", "?state=s&code=c&code=d", "?state=s&error=x&error=y",
            "?state=s&code=c&error=access_denied", "?state=s&%73tate=t&code=c",
            "?state=s&code=c#fragment", "?state=s&code=c%", "?state=s&&code=c"
        }) {
            String callback = endpoint + suffix;
            assertTrue(suffix, OAuthRedirect.matchesEndpoint(callback, registered));
            assertFalse(suffix, OAuthRedirect.validResponse(callback, registered));
        }
    }
}
