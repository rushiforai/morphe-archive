package app.jimaku.extension.session;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

import app.jimaku.extension.JimakuLog;
import app.jimaku.extension.gateway.Accounts;
import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.Me;
import app.jimaku.extension.menu.MenuInput;
import app.jimaku.extension.shared.Wording;

/**
 * The account, one for the app, shared by every video: the extension's {@code getLastMe} and
 * {@code ensureMe} with the popup's account actions. The last account read is kept, so a menu
 * opens with the minutes before the gateway answers; where reading it failed, the minutes are not
 * counted on. One read runs at a time.
 *
 * <p>Signing in and buying happen in the phone's browser, on jimaku.app and Stripe's page. The app
 * can't see them: it remembers what it waits for, and when it comes back to the foreground it reads
 * the account, or confirms the payment, and says "Signed in" or "300 minutes added". Main thread only.
 */
public final class AccountState {
    /** jimaku.app's page that signs in the install a code was made for; the code rides in the fragment. */
    public static final String LINK_PAGE = "https://www.jimaku.app/link#";
    /** The amounts Account offers, in cents: €2, €5 and €10. */
    public static final int[] AMOUNTS = {200, 500, 1000};
    /** A sign-in is waited on as long as its code works. */
    static final long SIGN_IN_MILLIS = 10 * 60_000;
    /** A checkout is waited on for an hour: a viewer may look back at the app before paying. */
    static final long CHECKOUT_MILLIS = 60 * 60_000;
    /** A payment Stripe hasn't settled is asked about once more after this; then the webhook has it. */
    static final long CONFIRM_RETRY_MILLIS = 3_000;

    /** Where the last account is kept. */
    public interface Store {
        String load();

        void save(String json);
    }

    /** Opens an address in the phone's browser; false where it couldn't. */
    public interface Browser {
        boolean open(String url);
    }

    /** The message over the player. */
    public interface Messages {
        void info(String words);

        void hold(String words, VideoSession.Action action);
    }

    private interface Call<T> {
        T run(Cancellation cancellation) throws GatewayException;
    }

    private interface Answer<T> {
        void answered(T value, GatewayException failed);
    }

    private final Accounts gateway;
    private final Store store;
    private final Executor background;
    private final Executor main;
    private final VideoSession.Timer timer;
    private final Browser browser;
    private final Messages messages;
    private final List<Runnable> listeners = new ArrayList<>();
    private final List<Runnable> afterRead = new ArrayList<>();

    private Me me;
    private boolean keptRead;
    /** The last read failed: the minutes last seen stay, but nothing is worked out from them. */
    private boolean failed;
    private boolean everAsked;
    private boolean reading;
    private boolean readAgain;
    /** Counts the answers taken, so a read that started before one of them is left. */
    private int taken;
    /** A payment's confirmation is on its way, with its one retry: a return meanwhile asks nothing more. */
    private boolean confirming;
    /** The account action running, one at a time: sign-in, buy, claim or sign-out. */
    private String action;
    private long signInUntil;
    private String checkout;
    private long checkoutUntil;
    /** The account that claimed the offer, and the one told it had claimed before: Account says so where the offer was. */
    private String claimedFor;
    private String toldFor;
    /** A preview build's stand-in account shows: nothing is read. */
    private boolean pretending;

    public AccountState(Accounts gateway, Store store, Executor background, Executor main, VideoSession.Timer timer,
                        Browser browser, Messages messages) {
        this.gateway = gateway;
        this.store = store;
        this.background = background;
        this.main = main;
        this.timer = timer;
        this.browser = browser;
        this.messages = messages;
    }

    /** Told whenever the account, or what Account shows of it, changed. */
    public void addListener(Runnable listener) {
        listeners.add(listener);
    }

    /** The account last read or kept, or null when there is none yet. */
    public Me me() {
        if (me == null && !keptRead) {
            String kept = store.load();
            // Before YouTube has a context there is nothing to read yet; it is tried again next time.
            if (kept != null) {
                keptRead = true;
                me = Me.parse(kept);
            }
        }
        return me;
    }

    /** The account as the menu reads it. */
    public MenuInput.Account account() {
        Me now = me();
        return now == null ? null : new MenuInput.Account(now.balance, now.signedIn);
    }

    /** Whether the minutes can be counted on: an account is known, and the last read didn't fail. */
    public boolean minutesKnown() {
        return me() != null && !failed;
    }

    public boolean signedIn() {
        Me now = me();
        return now != null && now.signedIn;
    }

    /** An account action is running: a press starts nothing more. */
    public boolean busy() {
        return action != null;
    }

    /** The line where the offer was: its minutes were added, or this account had claimed it before; otherwise null. */
    public String offerNote() {
        Me now = me();
        String account = now != null ? now.accountId : null;
        if (account == null) return null;
        if (account.equals(claimedFor)) return Wording.t(Wording.POPUP_OFFER_CLAIMED);
        if (account.equals(toldFor)) return Wording.t(Wording.POPUP_OFFER_ALREADY);
        return null;
    }

    /** Reads the account the first time a video opens; later ones keep what the menu and the foreground read. */
    public void readOnce() {
        if (!everAsked) read();
    }

    /** Reads the account; one asked while another runs joins it. */
    public void read() {
        read(false, null);
    }

    /** Reads the account after something changed it, such as a Premium job's end; a read already running is followed by one more. */
    public void readAgain() {
        read(true, null);
    }

    /** After an action: a read already running may have left before it, so one more follows. */
    private void reread(Runnable then) {
        read(true, then);
    }

    private void read(boolean afresh, Runnable then) {
        everAsked = true;
        if (pretending) return;
        if (then != null) afterRead.add(then);
        if (reading) {
            readAgain |= afresh;
            return;
        }
        reading = true;
        readAgain = false;
        int at = taken;
        call(gateway::me, (answer, error) -> {
            reading = false;
            // A read older than an answer taken since, such as sign-out's, or than a preview's stand-in, is left.
            if (at != taken || pretending) {
                JimakuLog.info("Account read left: newer known");
            } else if (answer != null) {
                take(answer);
            } else {
                failed = true;
                JimakuLog.warn("No account read: " + error.code);
            }
            if (readAgain) {
                read(false, null);
                return;
            }
            List<Runnable> waiting = new ArrayList<>(afterRead);
            afterRead.clear();
            for (Runnable run : waiting) run.run();
            changed();
        });
    }

    /**
     * In a preview build only: {@code fake} stands in for the account, for screenshots of the
     * signed-in rows, until null ends it and the account is read again. Nothing is kept of it.
     */
    public void pretend(Me fake) {
        if (fake == null && !pretending) return;
        pretending = fake != null;
        if (fake != null) {
            me = fake;
            failed = false;
        } else {
            me = null;
            keptRead = false;
            read();
        }
        changed();
    }

    private void take(Me answer) {
        taken++;
        me = answer;
        keptRead = true;
        failed = false;
        store.save(answer.json());
        if (claimedFor != null && !claimedFor.equals(answer.accountId)) claimedFor = null;
        if (toldFor != null && !toldFor.equals(answer.accountId)) toldFor = null;
    }

    /**
     * Sign in: a code for this install, then jimaku.app's page with it in the phone's browser. A
     * second press while that page is open makes a new code; one while the code is being made, nothing.
     */
    public void signIn() {
        if (action != null) return;
        action = "sign-in";
        changed();
        call(gateway::linkCode, (code, error) -> {
            action = null;
            changed();
            if (code != null && browser.open(LINK_PAGE + code)) {
                signInUntil = timer.now() + SIGN_IN_MILLIS;
                return;
            }
            JimakuLog.warn("No sign-in page: " + (error != null ? error.code : "no browser"));
            fail("sign-in", error, this::signIn);
        });
    }

    /** Claims the launch offer for the signed-in account; Account then says its minutes were added. */
    public void claim() {
        Me now = me();
        if (action != null || now == null || !now.signedIn || !now.promotion.offered()) return;
        String account = now.accountId;
        action = "claim";
        changed();
        call(cancellation -> gateway.claim(account, cancellation), (balance, error) -> {
            action = null;
            if (balance != null) claimedFor = account;
            else if (error.code.equals("already_claimed")) toldFor = account;
            else fail("claim", error, this::claim);
            // Account's rows can be pressed again at once; the minutes follow with the read.
            changed();
            reread(null);
        });
    }

    /** Stripe's page for {@code cents} in the phone's browser; the payment is confirmed when the app comes back. */
    public void buy(int cents) {
        if (action != null || !signedIn()) return;
        action = "buy";
        changed();
        call(cancellation -> gateway.checkout(cents, cancellation), (page, error) -> {
            action = null;
            changed();
            if (page != null && browser.open(page.url)) {
                checkout = page.session;
                checkoutUntil = timer.now() + CHECKOUT_MILLIS;
                return;
            }
            JimakuLog.warn("No payment page: " + (error != null ? error.code : "no browser"));
            fail("buy", error, () -> buy(cents));
        });
    }

    /** Signs the install out: it is left with no minutes, and they stay with the account. */
    public void signOut() {
        if (action != null || !signedIn()) return;
        action = "sign-out";
        changed();
        call(gateway::unlink, (answer, error) -> {
            action = null;
            if (answer != null) take(answer);
            else fail("sign-out", error, this::signOut);
            changed();
        });
    }

    /**
     * The app came back to the foreground: a payment waited on is confirmed, and the account is read.
     * A sign-in waited on that has come through is said.
     */
    public void foreground() {
        long now = timer.now();
        String session = checkout != null && now < checkoutUntil ? checkout : null;
        if (session != null) {
            if (!confirming) confirm(session, true);
            return;
        }
        checkout = null;
        boolean waiting = now < signInUntil;
        boolean before = signedIn();
        reread(() -> {
            if (!waiting || before || !signedIn()) return;
            signInUntil = 0;
            messages.info(Wording.t(Wording.TOAST_SIGNED_IN));
            // While the offer is open, an account that had claimed it sees it go, and is told why.
            Me signed = me();
            if (signed.promotion.availability.equals("open") && signed.promotion.eligibility.equals("already-claimed")) {
                toldFor = signed.accountId;
            }
        });
    }

    private void confirm(String session, boolean retry) {
        confirming = true;
        call(cancellation -> gateway.confirm(session, cancellation), (paid, error) -> {
            boolean again = paid == null && error.code.equals("payment_pending") && retry;
            confirming = again;
            if (paid != null) {
                if (session.equals(checkout)) checkout = null;
                messages.info(Wording.t(Wording.ACCOUNT_ADDED, String.valueOf(paid.minutes)));
                reread(null);
                return;
            }
            // Not paid yet, or cancelled: one more ask, and then it waits for the next return, or the webhook.
            if (again) {
                timer.after(CONFIRM_RETRY_MILLIS, () -> confirm(session, false));
                return;
            }
            if (!error.code.equals("payment_pending") && session.equals(checkout)) checkout = null;
            reread(null);
        });
    }

    /** Says what failed, in the words of the extension's account pages ({@code lib/account-failures.ts}). */
    private void fail(String doing, GatewayException error, Runnable retry) {
        String code = error != null ? error.code : "internal";
        String text;
        boolean again = true;
        switch (code) {
            case "offline" -> text = Wording.t(Wording.POPUP_FAIL_OFFLINE);
            case "too_many_installs" -> {
                text = Wording.t(Wording.ACCOUNT_REGISTRATION_LIMIT, Wording.t(Wording.PROMO_TOMORROW));
                again = false;
            }
            case "account_busy" -> {
                text = Wording.t(Wording.ACCOUNT_ERROR_BUSY);
                again = false;
            }
            case "account_changed" -> {
                text = Wording.t(Wording.ACCOUNT_ERROR_CHANGED);
                again = false;
            }
            default -> {
                switch (doing) {
                    case "sign-in" -> text = Wording.t(Wording.POPUP_FAIL_SIGN_IN);
                    case "sign-out" -> text = Wording.t(Wording.POPUP_FAIL_SIGN_OUT);
                    case "claim" -> {
                        again = false;
                        switch (code) {
                            case "claim_rate_limit", "offer_daily_cap" -> text = Wording.t(Wording.PROMO_RETRY, Wording.t(Wording.PROMO_LATER));
                            case "offer_ended" -> text = Wording.t(Wording.PROMO_ENDED);
                            case "offer_off" -> text = Wording.t(Wording.PROMO_PAUSED);
                            case "offer_cap" -> text = Wording.t(Wording.PROMO_EXHAUSTED);
                            default -> {
                                text = Wording.t(Wording.POPUP_FAIL_CLAIM);
                                again = true;
                            }
                        }
                    }
                    default -> {
                        switch (code) {
                            case "purchase_country_unavailable" -> {
                                text = Wording.t(Wording.ACCOUNT_ERROR_PURCHASE_COUNTRY);
                                again = false;
                            }
                            case "purchase_location_unavailable" -> text = Wording.t(Wording.ACCOUNT_ERROR_PURCHASE_LOCATION);
                            case "checkout_limit" -> {
                                text = Wording.t(Wording.ACCOUNT_ERROR_LIMIT);
                                again = false;
                            }
                            default -> text = Wording.t(Wording.ACCOUNT_FAIL_CHECKOUT);
                        }
                    }
                }
            }
        }
        messages.hold(text, again ? new VideoSession.Action(Wording.t(Wording.ACTION_RETRY), retry) : null);
    }

    private void changed() {
        for (Runnable listener : new ArrayList<>(listeners)) listener.run();
    }

    private <T> void call(Call<T> call, Answer<T> answer) {
        background.execute(() -> {
            T value = null;
            GatewayException error = null;
            try {
                value = call.run(new Cancellation());
            } catch (GatewayException e) {
                error = e;
            } catch (RuntimeException e) {
                error = new GatewayException("internal", e);
            }
            T answered = value;
            GatewayException failed = error;
            main.execute(() -> answer.answered(answered, failed));
        });
    }
}
