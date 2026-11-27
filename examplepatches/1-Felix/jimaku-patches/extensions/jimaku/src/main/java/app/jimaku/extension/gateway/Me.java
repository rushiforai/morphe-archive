package app.jimaku.extension.gateway;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * The install's account as {@code GET /me} answers it, with the extension's checks
 * ({@code readMe} in {@code lib/gateway.ts}): the minutes left, whether it is signed in, and the
 * launch offer. Of the offer, the app reads whether it is open and whether this account may claim it.
 */
public final class Me {
    /** The launch offer, as {@code readPromotion} checks it. */
    public static final class Promotion {
        public static final int MINUTES = 60, TOTAL_LIMIT = 415;
        private static final long LAST_INSTANT = 253402300799999L;

        /** open, paused, ended, exhausted, daily-limited or configuration-unavailable. */
        public final String availability;
        /** sign-in-required, eligible, already-claimed or unknown. */
        public final String eligibility;
        public final int minutes;

        private Promotion(String availability, String eligibility, int minutes) {
            this.availability = availability;
            this.eligibility = eligibility;
            this.minutes = minutes;
        }

        /** Open, and not yet claimed by this account: the Account sheet offers it. */
        public boolean offered() {
            return availability.equals("open") && !eligibility.equals("already-claimed");
        }

        static Promotion read(Object data) throws GatewayException {
            JSONObject p = data instanceof JSONObject ? (JSONObject) data : new JSONObject();
            Object availability = p.opt("availability"), eligibility = p.opt("eligibility");
            if (!oneOf(availability, "open", "paused", "ended", "exhausted", "daily-limited", "configuration-unavailable")
                    || !oneOf(eligibility, "sign-in-required", "eligible", "already-claimed", "unknown")) {
                throw new GatewayException("bad_answer");
            }
            Object endsAt = p.opt("endsAt"), totalUsed = p.opt("totalUsed"), totalRemaining = p.opt("totalRemaining");
            Object dailyUsed = p.opt("dailyUsed"), dailyLimit = p.opt("dailyLimit"), retryAt = p.opt("retryAt");
            boolean configured = !availability.equals("configuration-unavailable");
            if (!(p.opt("text") instanceof String) || !isInteger(p.opt("minutes"), MINUTES) || !isInteger(p.opt("totalLimit"), TOTAL_LIMIT)
                    || !nullableInstant(endsAt) || !nullableCount(totalUsed) || !nullableCount(totalRemaining)
                    || !nullableCount(dailyUsed) || !nullableCount(dailyLimit) || !nullableInstant(retryAt)
                    || (isCount(dailyUsed) && count(dailyUsed) > TOTAL_LIMIT)
                    || (isCount(totalUsed) && (count(totalUsed) > TOTAL_LIMIT || !isCount(totalRemaining)
                        || count(totalRemaining) != TOTAL_LIMIT - count(totalUsed)))
                    || (!isCount(totalUsed) && isCount(totalRemaining))
                    || (isCount(dailyLimit) && (count(dailyLimit) < 1 || count(dailyLimit) > TOTAL_LIMIT))
                    || (configured && (!isCount(endsAt) || !isCount(totalUsed) || !isCount(dailyUsed) || !isCount(dailyLimit)))
                    || (availability.equals("daily-limited") && !isCount(retryAt))) {
                throw new GatewayException("bad_answer");
            }
            return new Promotion((String) availability, (String) eligibility, MINUTES);
        }

        private static boolean oneOf(Object value, String... allowed) {
            for (String each : allowed) if (each.equals(value)) return true;
            return false;
        }

        private static boolean isInteger(Object value, long expected) {
            return isCount(value) && count(value) == expected;
        }

        /** A whole number of at least 0 that JavaScript holds exactly, as Number.isSafeInteger. */
        private static boolean isCount(Object value) {
            if (!(value instanceof Number)) return false;
            double number = ((Number) value).doubleValue();
            return number >= 0 && number <= 9007199254740991.0 && number == Math.rint(number);
        }

        private static long count(Object value) {
            return ((Number) value).longValue();
        }

        private static boolean nullableCount(Object value) {
            return value == JSONObject.NULL || isCount(value);
        }

        private static boolean nullableInstant(Object value) {
            return value == JSONObject.NULL || (isCount(value) && count(value) > 0 && count(value) <= LAST_INSTANT);
        }
    }

    /** The minutes left, in seconds; below zero when overspent. */
    public final double balance;
    public final boolean signedIn;
    /** The Google account while signed in, otherwise null. */
    public final String accountId;
    public final Promotion promotion;
    /** The answer as it came, to keep for the next start. */
    final String json;

    private Me(double balance, boolean signedIn, String accountId, Promotion promotion, String json) {
        this.balance = balance;
        this.signedIn = signedIn;
        this.accountId = accountId;
        this.promotion = promotion;
        this.json = json;
    }

    /** The answer as it came, which {@link #parse} reads again. */
    public String json() {
        return json;
    }

    static Me read(JSONObject answer) throws GatewayException {
        Object balance = answer.opt("balance"), signedIn = answer.opt("signedIn"), accountId = answer.opt("accountId");
        boolean finite = balance instanceof Number && Double.isFinite(((Number) balance).doubleValue());
        if (!finite || !(signedIn instanceof Boolean)) throw new GatewayException("bad_answer");
        boolean in = (Boolean) signedIn;
        boolean idOk = in ? accountId instanceof String && !((String) accountId).isEmpty() : accountId == JSONObject.NULL;
        if (!idOk) throw new GatewayException("bad_answer");
        return new Me(((Number) balance).doubleValue(), in, in ? (String) accountId : null, Promotion.read(answer.opt("promotion")),
                answer.toString());
    }

    /** An answer kept from before, or null where it no longer reads. */
    public static Me parse(String json) {
        if (json == null) return null;
        try {
            return read(new JSONObject(json));
        } catch (JSONException | GatewayException e) {
            return null;
        }
    }
}
