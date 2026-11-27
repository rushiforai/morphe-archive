package app.jimaku.extension.gateway;

/**
 * The gateway's account calls, as the extension's {@code lib/gateway.ts} makes them: the account
 * read, a one-time code for signing in on jimaku.app, the launch offer, buying and signing out.
 * Each blocks; run them off the main thread.
 */
public interface Accounts {
    /** Stripe's payment page for an amount, and its session. */
    final class Checkout {
        public final String url;
        public final String session;

        public Checkout(String url, String session) {
            this.url = url;
            this.session = session;
        }
    }

    /** A paid purchase: the balance after it and the minutes it added. */
    final class Purchase {
        public final double balance;
        public final long minutes;

        public Purchase(double balance, long minutes) {
            this.balance = balance;
            this.minutes = minutes;
        }
    }

    /** The account; without an install it answers for a new one, and creates none. */
    Me me(Cancellation cancellation) throws GatewayException;

    /** A one-time code that jimaku.app/link redeems for this install, valid for 10 minutes. */
    String linkCode(Cancellation cancellation) throws GatewayException;

    /** Claims the launch offer for {@code accountId}; answers the new balance in seconds. */
    double claim(String accountId, Cancellation cancellation) throws GatewayException;

    /** Stripe's payment page for {@code cents}, returning to jimaku.app's page for app buyers. */
    Checkout checkout(int cents, Cancellation cancellation) throws GatewayException;

    /** Confirms a checkout; {@code payment_pending} while Stripe hasn't settled it. */
    Purchase confirm(String session, Cancellation cancellation) throws GatewayException;

    /** Signs the install out: it keeps no minutes, which stay with the account. */
    Me unlink(Cancellation cancellation) throws GatewayException;
}
