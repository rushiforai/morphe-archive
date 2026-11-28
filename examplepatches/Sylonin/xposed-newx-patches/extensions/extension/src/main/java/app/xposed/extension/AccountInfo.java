package app.xposed.extension;

import org.json.JSONException;
import org.json.JSONObject;

/** What X reports about an account, as cached by X-Posed. */
final class AccountInfo {
    static final String ORIGIN_CLOUD = "cloud";
    static final String ORIGIN_X = "x";

    /** What X's "About this account" adds beyond the location, for the account sheet. */
    static final class Details {
        static final Details UNKNOWN = new Details(0, -1, 0, 0, null);

        /** When the account was created, in epoch millis; 0 when unknown. */
        final long createdAt;
        /** How often the handle changed, or -1 when unknown. */
        final int handleChanges;
        /** When X verified the account, in epoch millis; 0 when unknown or not verified. */
        final long verifiedSince;
        /** The year X shows instead of a verification date, or 0. */
        final int verifiedYear;
        /** Whether the account verified its identity; null until "About this account" said, which the community cache doesn't carry. */
        final Boolean identityVerified;

        Details(long createdAt, int handleChanges, long verifiedSince, int verifiedYear, Boolean identityVerified) {
            this.createdAt = Math.max(0, createdAt);
            this.handleChanges = Math.max(-1, handleChanges);
            this.verifiedSince = Math.max(0, verifiedSince);
            this.verifiedYear = Math.max(0, verifiedYear);
            this.identityVerified = identityVerified;
        }

        /** True when X's "About this account" supplied these, so the sheet needn't ask again. */
        boolean fromAbout() {
            return identityVerified != null;
        }

        boolean isUnknown() {
            return createdAt == 0 && handleChanges < 0 && verifiedSince == 0 && verifiedYear == 0 && identityVerified == null;
        }
    }

    final String location;
    final String source;
    /** Null when unknown. False means X flags the location as possibly inaccurate. */
    final Boolean locationAccurate;
    final String affiliation;
    /** When this data was observed on X, in epoch millis. */
    final long observedAt;
    final String origin;
    /** X's numeric user id, 0 when unknown. */
    final long userId;
    final Details details;

    AccountInfo(String location, String source, Boolean locationAccurate, String affiliation, long observedAt, String origin, long userId) {
        this(location, source, locationAccurate, affiliation, observedAt, origin, userId, Details.UNKNOWN);
    }

    AccountInfo(String location, String source, Boolean locationAccurate, String affiliation, long observedAt, String origin,
                long userId, Details details) {
        this.location = emptyToNull(location);
        this.source = emptyToNull(source);
        this.locationAccurate = locationAccurate;
        this.affiliation = emptyToNull(affiliation);
        this.observedAt = observedAt;
        this.origin = origin;
        this.userId = userId;
        this.details = details;
    }

    /** A lookup that found nothing; cached briefly so it isn't retried on every bind. */
    static AccountInfo empty(long now) {
        return new AccountInfo(null, null, null, null, now, ORIGIN_X, 0);
    }

    /**
     * This observation with what a later one that found no location adds: its user id and
     * details. Details the later one doesn't know are kept; About's verification answers replace ours.
     */
    AccountInfo withDetailsOf(AccountInfo later) {
        Details d = later.details;
        Details merged = new Details(
                d.createdAt != 0 ? d.createdAt : details.createdAt,
                d.handleChanges >= 0 ? d.handleChanges : details.handleChanges,
                d.fromAbout() ? d.verifiedSince : details.verifiedSince,
                d.fromAbout() ? d.verifiedYear : details.verifiedYear,
                d.fromAbout() ? d.identityVerified : details.identityVerified);
        return new AccountInfo(location, source, locationAccurate, affiliation, observedAt, origin,
                later.userId != 0 ? later.userId : userId, merged);
    }

    boolean isEmpty() {
        return location == null && source == null;
    }

    boolean hasLocationWarning() {
        return location != null && Boolean.FALSE.equals(locationAccurate);
    }

    /**
     * The country flags and location filters use: with [device], the country of the
     * connection source ("Switzerland App Store") when it names one, else the account
     * location, as X-Posed's effectiveCountry.
     */
    String country(boolean device) {
        if (device) {
            String key = Countries.sourceCountry(source);
            if (key != null) return Countries.displayName(key);
        }
        return location;
    }

    String toJson() {
        try {
            JSONObject o = new JSONObject();
            o.putOpt("l", location);
            o.putOpt("d", source);
            o.putOpt("a", locationAccurate);
            o.putOpt("af", affiliation);
            o.put("t", observedAt);
            o.put("o", origin);
            if (userId != 0) o.put("id", userId);
            if (details.createdAt != 0) o.put("c", details.createdAt);
            if (details.handleChanges >= 0) o.put("uc", details.handleChanges);
            if (details.verifiedSince != 0) o.put("vs", details.verifiedSince);
            if (details.verifiedYear != 0) o.put("vy", details.verifiedYear);
            o.putOpt("iv", details.identityVerified);
            return o.toString();
        } catch (JSONException e) {
            return null;
        }
    }

    static AccountInfo fromJson(String json) {
        try {
            JSONObject o = new JSONObject(json);
            return new AccountInfo(
                    optString(o, "l"),
                    optString(o, "d"),
                    o.has("a") ? o.getBoolean("a") : null,
                    optString(o, "af"),
                    o.getLong("t"),
                    o.optString("o", ORIGIN_X),
                    o.optLong("id", 0),
                    new Details(o.optLong("c", 0), o.optInt("uc", -1), o.optLong("vs", 0), o.optInt("vy", 0),
                            o.has("iv") ? o.getBoolean("iv") : null)
            );
        } catch (JSONException | RuntimeException e) {
            return null;
        }
    }

    /** Android's optString(key, null) returns "null" for JSON null values. */
    static String optString(JSONObject o, String key) {
        return o.isNull(key) ? null : o.optString(key, null);
    }

    private static String emptyToNull(String s) {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }
}
