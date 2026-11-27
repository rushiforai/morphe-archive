package app.jimaku.extension.gateway;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;

/** The gateway's account calls, as {@code gateway.ts} makes them, against the local test server. */
public class GatewayAccountsTest {
    static final String PROMOTION = "{\"availability\":\"open\",\"eligibility\":\"eligible\",\"text\":\"60 free\",\"minutes\":60,"
            + "\"endsAt\":1796083200000,\"totalUsed\":3,\"totalLimit\":415,\"totalRemaining\":412,\"dailyUsed\":1,\"dailyLimit\":50,\"retryAt\":null}";
    static final String SIGNED_OUT = "{\"balance\":0,\"signedIn\":false,\"accountId\":null,\"tryVideo\":null,\"promotion\":" + PROMOTION + "}";
    static final String SIGNED_IN = "{\"balance\":18000,\"signedIn\":true,\"accountId\":\"a1\",\"tryVideo\":null,\"promotion\":" + PROMOTION + "}";
    private static final String CODE = "c".repeat(43);

    private TestServer server;
    private MemoryInstalls installs;
    private Gateway gateway;

    @Before
    public void start() throws IOException {
        server = new TestServer();
        installs = new MemoryInstalls();
        gateway = new Gateway(server.origin(), "Jimaku-Android/1.2.3", 5_000, installs);
        server.answer("/installs", 201, "{\"install\":\"i1\",\"secret\":\"s1\"}");
    }

    @After
    public void stop() throws IOException {
        server.close();
    }

    @Test
    public void readsTheAccountWithoutMakingAnInstall() throws Exception {
        server.answer("/me", 200, SIGNED_OUT);
        Me me = gateway.me(new Cancellation());
        assertFalse(me.signedIn);
        assertNull(me.accountId);
        assertEquals(0, me.balance, 0);
        assertTrue(me.promotion.offered());
        assertNull(server.requestsTo("/me").get(0).header("authorization"));
        assertTrue(server.requestsTo("/installs").isEmpty());

        installs.save(new Install("i1", "s1"));
        server.answer("/me", 200, SIGNED_IN);
        me = gateway.me(new Cancellation());
        assertTrue(me.signedIn);
        assertEquals("a1", me.accountId);
        assertEquals(18000, me.balance, 0);
        assertEquals("Bearer s1", server.requestsTo("/me").get(1).header("authorization"));
    }

    @Test
    public void refusesAnAccountThatDoesNotAddUp() {
        for (String answer : new String[] {
                "{\"balance\":0,\"signedIn\":true,\"accountId\":null,\"promotion\":" + PROMOTION + "}",
                "{\"balance\":0,\"signedIn\":false,\"accountId\":\"a1\",\"promotion\":" + PROMOTION + "}",
                "{\"balance\":\"0\",\"signedIn\":false,\"accountId\":null,\"promotion\":" + PROMOTION + "}",
                "{\"balance\":0,\"signedIn\":false,\"accountId\":null,\"promotion\":" + PROMOTION.replace("\"minutes\":60", "\"minutes\":90") + "}",
                "{\"balance\":0,\"signedIn\":false,\"accountId\":null,\"promotion\":" + PROMOTION.replace("\"totalRemaining\":412", "\"totalRemaining\":400") + "}",
                "{\"balance\":0,\"signedIn\":false,\"accountId\":null}"}) {
            server.answer("/me", 200, answer);
            assertEquals(answer, "bad_answer", refusal(() -> gateway.me(new Cancellation())).code);
        }
    }

    @Test
    public void keepsAnAnswerToReadAgain() throws Exception {
        server.answer("/me", 200, SIGNED_IN);
        Me kept = Me.parse(gateway.me(new Cancellation()).json());
        assertEquals("a1", kept.accountId);
        assertEquals(18000, kept.balance, 0);
        assertNull(Me.parse("{\"balance\":1}"));
        assertNull(Me.parse("not json"));
        assertNull(Me.parse(null));
    }

    @Test
    public void asksForALinkCodeAsTheInstall() throws Exception {
        server.answer("/account/link-codes", 201, "{\"code\":\"" + CODE + "\",\"expiresAt\":1796083200000}");
        assertEquals(CODE, gateway.linkCode(new Cancellation()));
        TestServer.Request sent = server.requestsTo("/account/link-codes").get(0);
        assertEquals("POST", sent.method());
        assertEquals("Bearer s1", sent.header("authorization"));

        server.answer("/account/link-codes", 201, "{\"code\":\"short\"}");
        assertEquals("bad_answer", refusal(() -> gateway.linkCode(new Cancellation())).code);
    }

    @Test
    public void claimsForTheAccountItWasAskedFor() throws Exception {
        installs.save(new Install("i1", "s1"));
        server.answer("/claim", 200, "{\"balance\":3600,\"accountId\":\"a1\",\"granted\":true}");
        assertEquals(3600, gateway.claim("a1", new Cancellation()), 0);
        TestServer.Request sent = server.requestsTo("/claim").get(0);
        assertEquals("{\"accountId\":\"a1\"}", sent.body);
        assertEquals("application/json", sent.header("content-type"));

        assertEquals("account_changed", refusal(() -> gateway.claim("a2", new Cancellation())).code);
        server.answer("/claim", 409, "{\"error\":\"already_claimed\"}");
        assertEquals("already_claimed", refusal(() -> gateway.claim("a1", new Cancellation())).code);
    }

    @Test
    public void opensOnlyStripesPageForAnAmountItSells() throws Exception {
        installs.save(new Install("i1", "s1"));
        server.answer("/checkout", 200, "{\"url\":\"https://checkout.stripe.com/c/pay/cs_test_a1\",\"session\":\"cs_test_a1\"}");
        Accounts.Checkout checkout = gateway.checkout(500, new Cancellation());
        assertEquals("https://checkout.stripe.com/c/pay/cs_test_a1", checkout.url);
        assertEquals("cs_test_a1", checkout.session);
        assertEquals("{\"cents\":500,\"from\":\"app\"}", server.requestsTo("/checkout").get(0).body);

        for (String url : new String[] {"https://evil.example/c/pay", "http://checkout.stripe.com/c", "https://u:p@checkout.stripe.com/c",
                "https://checkout.stripe.com:8443/c"}) {
            server.answer("/checkout", 200, "{\"url\":\"" + url + "\",\"session\":\"cs_test_a1\"}");
            assertEquals(url, "bad_answer", refusal(() -> gateway.checkout(500, new Cancellation())).code);
        }
        server.answer("/checkout", 200, "{\"url\":\"https://checkout.stripe.com/c\",\"session\":\"pi_1\"}");
        assertEquals("bad_answer", refusal(() -> gateway.checkout(500, new Cancellation())).code);
        int asked = server.requestsTo("/checkout").size();
        assertEquals("invalid_amount", refusal(() -> gateway.checkout(250, new Cancellation())).code);
        assertEquals(asked, server.requestsTo("/checkout").size());
    }

    @Test
    public void confirmsAPurchaseOrSaysItIsPending() throws Exception {
        installs.save(new Install("i1", "s1"));
        server.answer("/purchases/cs_live_b2/confirm", 200,
                "{\"balance\":36000,\"minutes\":300,\"paymentIntent\":\"pi_3X\",\"paidAt\":1796083200000}");
        Accounts.Purchase paid = gateway.confirm("cs_live_b2", new Cancellation());
        assertEquals(300, paid.minutes);
        assertEquals(36000, paid.balance, 0);
        assertEquals("POST", server.requestsTo("/purchases/cs_live_b2/confirm").get(0).method());

        server.answer("/purchases/cs_live_b2/confirm", 409, "{\"error\":\"payment_pending\"}");
        assertEquals("payment_pending", refusal(() -> gateway.confirm("cs_live_b2", new Cancellation())).code);
        assertEquals("invalid_session", refusal(() -> gateway.confirm("../me", new Cancellation())).code);
    }

    @Test
    public void signsOutToAnAccountWithoutMinutes() throws Exception {
        installs.save(new Install("i1", "s1"));
        server.answer("/account/unlink", 200, SIGNED_OUT);
        Me me = gateway.unlink(new Cancellation());
        assertFalse(me.signedIn);
        assertEquals("POST", server.requestsTo("/account/unlink").get(0).method());
    }

    private interface Call {
        void run() throws GatewayException;
    }

    private static GatewayException refusal(Call call) {
        try {
            call.run();
        } catch (GatewayException e) {
            return e;
        }
        fail("expected a refusal");
        return null;
    }
}
