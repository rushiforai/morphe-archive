package app.jimaku.extension.session;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

import app.jimaku.extension.gateway.Accounts;
import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.Me;

/** The app's one account: kept, read one at a time, and the browser's sign-in and checkout taken up on return. */
public class AccountStateTest {
    private static final String PROMOTION = "{\"availability\":\"open\",\"eligibility\":\"%s\",\"text\":\"60 free\",\"minutes\":60,"
            + "\"endsAt\":1796083200000,\"totalUsed\":3,\"totalLimit\":415,\"totalRemaining\":412,\"dailyUsed\":1,\"dailyLimit\":50,\"retryAt\":null}";
    private static final String CODE = "c".repeat(43);

    private static Me account(boolean signedIn, double balance, String eligibility) {
        return Me.parse("{\"balance\":" + balance + ",\"signedIn\":" + signedIn + ",\"accountId\":" + (signedIn ? "\"a1\"" : "null")
                + ",\"promotion\":" + String.format(PROMOTION, eligibility) + "}");
    }

    private interface Answer<T> {
        T get() throws GatewayException;
    }

    private static final class FakeAccounts implements Accounts {
        final List<String> calls = new ArrayList<>();
        Answer<Me> me = () -> account(false, 0, "sign-in-required");
        Answer<String> code = () -> CODE;
        Answer<Double> claim = () -> 3600.0;
        Answer<Checkout> checkout;
        Answer<Purchase> confirm;
        Answer<Me> unlink = () -> account(false, 0, "sign-in-required");

        @Override
        public Me me(Cancellation cancellation) throws GatewayException {
            calls.add("me");
            return me.get();
        }

        @Override
        public String linkCode(Cancellation cancellation) throws GatewayException {
            calls.add("link code");
            return code.get();
        }

        @Override
        public double claim(String accountId, Cancellation cancellation) throws GatewayException {
            calls.add("claim " + accountId);
            return claim.get();
        }

        @Override
        public Checkout checkout(int cents, Cancellation cancellation) throws GatewayException {
            calls.add("checkout " + cents);
            return checkout.get();
        }

        @Override
        public Purchase confirm(String session, Cancellation cancellation) throws GatewayException {
            calls.add("confirm " + session);
            return confirm.get();
        }

        @Override
        public Me unlink(Cancellation cancellation) throws GatewayException {
            calls.add("unlink");
            return unlink.get();
        }
    }

    private static final class Queue implements Executor {
        final ArrayDeque<Runnable> queue = new ArrayDeque<>();
        boolean held;

        @Override
        public void execute(Runnable command) {
            if (held) queue.add(command);
            else command.run();
        }

        void drain() {
            held = false;
            while (!queue.isEmpty()) queue.poll().run();
        }
    }

    private static final class Clock implements VideoSession.Timer {
        long now = 1_000_000;
        final List<long[]> due = new ArrayList<>();
        final List<Runnable> runs = new ArrayList<>();

        @Override
        public long now() {
            return now;
        }

        @Override
        public Runnable after(long millis, Runnable run) {
            due.add(new long[] {now + millis});
            runs.add(run);
            return () -> {
            };
        }

        void advance(long millis) {
            now += millis;
            for (int i = 0; i < due.size(); i++) {
                if (due.get(i)[0] <= now && runs.get(i) != null) {
                    Runnable run = runs.get(i);
                    runs.set(i, null);
                    run.run();
                }
            }
        }
    }

    private final FakeAccounts gateway = new FakeAccounts();
    private final List<String> kept = new ArrayList<>();
    private String stored = "";
    private final Queue background = new Queue();
    private final Clock clock = new Clock();
    private final List<String> opened = new ArrayList<>();
    private boolean browserOpens = true;
    private final List<String> said = new ArrayList<>();
    private VideoSession.Action retry;
    private int changes;

    private final AccountState state = new AccountState(gateway, new AccountState.Store() {
        @Override
        public String load() {
            return stored;
        }

        @Override
        public void save(String json) {
            stored = json;
            kept.add(json);
        }
    }, background, Runnable::run, clock, url -> {
        opened.add(url);
        return browserOpens;
    }, new AccountState.Messages() {
        @Override
        public void info(String words) {
            said.add(words);
        }

        @Override
        public void hold(String words, VideoSession.Action action) {
            said.add(words + (action != null ? " [" + action.label + "]" : ""));
            retry = action;
        }
    });

    {
        state.addListener(() -> changes++);
    }

    private void signedIn(double balance, String eligibility) {
        Me me = account(true, balance, eligibility);
        gateway.me = () -> me;
        state.read();
    }

    @Test
    public void opensWithTheAccountKeptAndStopsCountingOnItWhereAReadFails() {
        stored = account(true, 18000, "eligible").json();
        assertTrue(state.signedIn());
        assertEquals(18000, state.account().balance, 0);
        assertTrue(state.minutesKnown());

        gateway.me = () -> {
            throw new GatewayException("offline");
        };
        state.read();
        assertTrue(state.signedIn());
        assertFalse(state.minutesKnown());
        assertTrue(said.isEmpty());

        gateway.me = () -> account(true, 12000, "eligible");
        state.read();
        assertTrue(state.minutesKnown());
        assertEquals(12000, state.account().balance, 0);
        assertEquals(12000, Me.parse(stored).balance, 0);
    }

    @Test
    public void nothingKeptIsNoAccount() {
        assertNull(state.me());
        assertNull(state.account());
        assertFalse(state.minutesKnown());
    }

    @Test
    public void aReadAskedWhileOneRunsJoinsIt() {
        background.held = true;
        state.read();
        state.read();
        state.readOnce();
        background.drain();
        assertEquals(List.of("me"), gateway.calls);
        state.readOnce();
        assertEquals(List.of("me"), gateway.calls);
    }

    @Test
    public void signingInOpensTheLinkPageAndSaysSoOnceItCameThrough() {
        state.read();
        background.held = true;
        state.signIn();
        state.signIn();
        background.drain();
        assertEquals(List.of("me", "link code"), gateway.calls);
        assertEquals(List.of("https://www.jimaku.app/link#" + CODE), opened);

        // Back without signing in: nothing said.
        state.foreground();
        assertTrue(said.isEmpty());
        // Back again after signing in on the page.
        gateway.me = () -> account(true, 0, "eligible");
        state.foreground();
        assertEquals(List.of("Signed in"), said);
        assertTrue(state.signedIn());
        state.foreground();
        assertEquals(List.of("Signed in"), said);
    }

    @Test
    public void aSignInLeftOverTenMinutesIsNotSaid() {
        state.read();
        state.signIn();
        clock.advance(AccountState.SIGN_IN_MILLIS);
        gateway.me = () -> account(true, 0, "eligible");
        state.foreground();
        assertTrue(state.signedIn());
        assertTrue(said.isEmpty());
    }

    @Test
    public void aSignInThatFailsSaysSoAndTriesAgain() {
        gateway.code = () -> {
            throw new GatewayException("http_404");
        };
        state.signIn();
        assertEquals(List.of("Couldn’t sign in. [Try again]"), said);
        assertTrue(opened.isEmpty());
        gateway.code = () -> CODE;
        retry.run.run();
        assertEquals(1, opened.size());

        browserOpens = false;
        state.signIn();
        assertEquals("Couldn’t sign in. [Try again]", said.get(said.size() - 1));
    }

    @Test
    public void anAccountThatClaimedBeforeIsToldSoOnSigningIn() {
        state.read();
        state.signIn();
        gateway.me = () -> account(true, 0, "already-claimed");
        state.foreground();
        assertEquals("This account has already claimed the offer.", state.offerNote());
    }

    @Test
    public void claimingAddsTheMinutesAndSaysSoWhereTheOfferWas() {
        signedIn(0, "eligible");
        gateway.me = () -> account(true, 3600, "already-claimed");
        state.claim();
        assertTrue(gateway.calls.contains("claim a1"));
        assertEquals(3600, state.account().balance, 0);
        assertEquals("60 Premium minutes added to your account.", state.offerNote());

        // Claimed before, on another install.
        AccountStateTest other = new AccountStateTest();
        other.signedIn(0, "eligible");
        other.gateway.claim = () -> {
            throw new GatewayException("already_claimed");
        };
        other.state.claim();
        assertEquals("This account has already claimed the offer.", other.state.offerNote());
        assertTrue(other.said.isEmpty());
    }

    @Test
    public void claimingNeedsAnAccountAndAnOpenOffer() {
        state.claim();
        signedIn(0, "already-claimed");
        state.claim();
        assertFalse(gateway.calls.stream().anyMatch(call -> call.startsWith("claim")));
    }

    @Test
    public void buyingOpensStripeAndConfirmsThePaymentOnReturn() {
        signedIn(0, "eligible");
        Accounts.Checkout page = new Accounts.Checkout("https://checkout.stripe.com/c/pay/cs_test_a1", "cs_test_a1");
        gateway.checkout = () -> page;

        background.held = true;
        state.buy(500);
        assertTrue(state.busy());
        state.buy(1000);
        background.drain();
        assertFalse(state.busy());
        assertEquals(List.of("https://checkout.stripe.com/c/pay/cs_test_a1"), opened);
        assertEquals(1, gateway.calls.stream().filter(call -> call.startsWith("checkout")).count());

        // Back before paying: Stripe hasn't settled it, asked once more after 3 seconds, and nothing is said.
        gateway.confirm = () -> {
            throw new GatewayException("payment_pending");
        };
        state.foreground();
        clock.advance(AccountState.CONFIRM_RETRY_MILLIS);
        assertEquals(2, gateway.calls.stream().filter(call -> call.equals("confirm cs_test_a1")).count());
        assertTrue(said.isEmpty());

        // Back after paying.
        Accounts.Purchase purchase = new Accounts.Purchase(18000, 300);
        gateway.confirm = () -> purchase;
        gateway.me = () -> account(true, 18000, "eligible");
        state.foreground();
        assertEquals(List.of("300 minutes added"), said);
        assertEquals(18000, state.account().balance, 0);
        // Confirmed once: the next return only reads the account.
        state.foreground();
        assertEquals(3, gateway.calls.stream().filter(call -> call.startsWith("confirm")).count());
    }

    @Test
    public void aPaymentPageThatDoesNotOpenSaysSo() {
        signedIn(0, "eligible");
        gateway.checkout = () -> {
            throw new GatewayException("checkout_limit");
        };
        state.buy(200);
        assertEquals(List.of("Too many payment pages opened. Try again later."), said);
        gateway.checkout = () -> {
            throw new GatewayException("offline");
        };
        state.buy(200);
        assertEquals("You’re offline. [Try again]", said.get(1));
    }

    @Test
    public void signingOutLeavesTheInstallWithoutMinutes() {
        signedIn(18000, "already-claimed");
        int before = changes;
        state.signOut();
        assertFalse(state.signedIn());
        assertEquals(0, state.account().balance, 0);
        assertTrue(changes > before);
        assertFalse(Me.parse(stored).signedIn);
    }

    @Test
    public void aReadAskedBeforeSigningOutDoesNotSignBackIn() {
        signedIn(18000, "already-claimed");
        background.held = true;
        state.read();
        state.signOut();
        // Sign-out answers first; the read, asked while still signed in, answers after it.
        Runnable read = background.queue.pollFirst();
        background.drain();
        read.run();
        assertFalse(state.signedIn());
        assertFalse(Me.parse(stored).signedIn);
    }

    @Test
    public void twoReturnsWhileAPaymentIsConfirmedSayItOnce() {
        signedIn(0, "eligible");
        gateway.checkout = () -> new Accounts.Checkout("https://checkout.stripe.com/c/pay/cs_test_a1", "cs_test_a1");
        state.buy(500);
        gateway.confirm = () -> new Accounts.Purchase(18000, 300);
        background.held = true;
        state.foreground();
        state.foreground();
        background.drain();
        assertEquals(1, gateway.calls.stream().filter(call -> call.startsWith("confirm")).count());
        assertEquals(List.of("300 minutes added"), said);
    }
}
