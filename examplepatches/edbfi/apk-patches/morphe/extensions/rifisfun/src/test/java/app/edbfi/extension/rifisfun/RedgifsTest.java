// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.fail;

import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.Deque;
import org.junit.Test;

public class RedgifsTest {
    private static final long HOUR = 60 * 60 * 1000L;

    /** A JWT whose payload is {@code payload}; the header and signature don't matter here. */
    private static String jwt(String payload) {
        return "eyJ0eXAiOiJKV1QifQ." + base64Url(payload) + ".c2ln";
    }

    private static String base64Url(String text) {
        return java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(text.getBytes(StandardCharsets.UTF_8));
    }

    /** Issues the queued tokens in order and counts the requests. */
    private static final class FakeIssuer implements Redgifs.Issuer {
        final Deque<String> tokens = new ArrayDeque<>();
        int issued;

        @Override
        public String issue() throws Exception {
            issued++;
            String token = tokens.poll();
            if (token == null) throw new IllegalStateException("Redgifs token request returned 503");
            return token;
        }
    }

    @Test
    public void readsTheExpiryTheTokenCarries() {
        assertEquals(1794846289000L, Redgifs.expiryMs(jwt("{\"iss\":\"auth-service\",\"exp\":1794846289,\"scopes\":\"read\"}")));
    }

    @Test
    public void findsNoExpiryInATokenWithoutOne() {
        assertEquals(0, Redgifs.expiryMs(jwt("{\"iss\":\"auth-service\"}")));
        assertEquals(0, Redgifs.expiryMs(jwt("{\"exp\":\"tomorrow\"}")));
        assertEquals(0, Redgifs.expiryMs(jwt("not json")));
        assertEquals(0, Redgifs.expiryMs("opaque-token"));
        assertEquals(0, Redgifs.expiryMs("a.b*c.d"));
        assertEquals(0, Redgifs.expiryMs("a.%%%.c"));
    }

    @Test
    public void decodesBase64UrlOfEveryLength() {
        for (String text : new String[] {"", "a", "ab", "abc", "abcd", "ÿþ?>"}) {
            assertArrayEquals(text, text.getBytes(StandardCharsets.UTF_8), Redgifs.base64Url(base64Url(text)));
        }
        assertNull(Redgifs.base64Url("abcde"));
        assertNull(Redgifs.base64Url("ab+/"));
    }

    @Test
    public void keepsATokenUntilJustBeforeItExpires() throws Exception {
        long now = 1_794_759_889_000L;
        String token = jwt("{\"exp\":" + (now + 24 * HOUR) / 1000 + "}");
        FakeIssuer issuer = new FakeIssuer();
        issuer.tokens.add(token);
        issuer.tokens.add("second");
        Redgifs.Tokens tokens = new Redgifs.Tokens(issuer);

        assertSame(token, tokens.get(0, now));
        assertSame(token, tokens.get(0, now + 23 * HOUR));
        assertEquals(1, issuer.issued);
        assertEquals("second", tokens.get(0, now + 24 * HOUR - Redgifs.EXPIRY_MARGIN_MS));
        assertEquals(2, issuer.issued);
    }

    @Test
    public void renewsATokenRedgifsRejected() throws Exception {
        FakeIssuer issuer = new FakeIssuer();
        issuer.tokens.add("bound-to-the-old-address");
        issuer.tokens.add("fresh");
        Redgifs.Tokens tokens = new Redgifs.Tokens(issuer);

        assertEquals("bound-to-the-old-address", tokens.get(0, 0));
        // Without an expiry, it is kept until Redgifs rejects it.
        assertEquals("bound-to-the-old-address", tokens.get(0, Long.MAX_VALUE - 1));
        assertEquals("fresh", tokens.get(401, 1));
        assertEquals("fresh", tokens.get(0, 2));
        assertEquals(2, issuer.issued);
    }

    @Test
    public void dropsTheTokenWhenRenewalFails() throws Exception {
        FakeIssuer issuer = new FakeIssuer();
        issuer.tokens.add("only");
        Redgifs.Tokens tokens = new Redgifs.Tokens(issuer);
        tokens.get(0, 0);
        try {
            tokens.get(403, 1);
            fail("A failed renewal handed out a token");
        } catch (IllegalStateException expected) {
            // The rejected token is gone: the next lookup asks again rather than send it.
        }
        issuer.tokens.add("later");
        assertEquals("later", tokens.get(0, 2));
    }

    @Test
    public void lowercasesGifIds() {
        assertEquals("peskyshinyharvestmouse", Redgifs.gifId("PeskyShinyHarvestmouse"));
        assertEquals("peskyshinyharvestmouse", Redgifs.gifId("peskyshinyharvestmouse"));
    }

    @Test
    public void leavesAnythingElseAsItWas() {
        assertNull(Redgifs.gifId(null));
        assertEquals("", Redgifs.gifId(""));
        assertEquals("a/../B", Redgifs.gifId("a/../B"));
        assertEquals("Ab?c=D", Redgifs.gifId("Ab?c=D"));
    }

    @Test
    public void keepsEveryPinWhileOff() {
        String[] pins = {"sha256/tW414jMTEv8eiREyGosB7+NM00aeAZNfh3/S6jggn7s="};
        assertSame(pins, Redgifs.pins("api.redgifs.com", pins));
        assertSame(pins, Redgifs.pins("api.redgifs.com", pins, false));
    }

    @Test
    public void unpinsOnlyApiRedgifsCom() {
        String[] pins = {"sha256/YLh1dUR9y6Kja30RrAn7JKnbQG/uEtLMkBgFF2Fuihg="};
        assertEquals(0, Redgifs.pins("api.redgifs.com", pins, true).length);
        assertSame(pins, Redgifs.pins("api.redditisfun.com", pins, true));
        assertSame(pins, Redgifs.pins("imgur-apiv3.p.rapidapi.com", pins, true));
        assertSame(pins, Redgifs.pins("xapi.redgifs.com", pins, true));
        assertSame(pins, Redgifs.pins("*.redgifs.com", pins, true));
        assertSame(pins, Redgifs.pins(null, pins, true));
    }
}
