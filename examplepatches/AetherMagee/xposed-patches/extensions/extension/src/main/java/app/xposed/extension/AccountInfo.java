package app.xposed.extension;

import org.json.JSONException;
import org.json.JSONObject;

/** What X reports about an account, as cached by X-Posed. */
final class AccountInfo {
    static final String ORIGIN_CLOUD = "cloud";
    static final String ORIGIN_X = "x";

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

    AccountInfo(String location, String source, Boolean locationAccurate, String affiliation, long observedAt, String origin, long userId) {
        this.location = emptyToNull(location);
        this.source = emptyToNull(source);
        this.locationAccurate = locationAccurate;
        this.affiliation = emptyToNull(affiliation);
        this.observedAt = observedAt;
        this.origin = origin;
        this.userId = userId;
    }

    /** A lookup that found nothing; cached briefly so it isn't retried on every bind. */
    static AccountInfo empty(long now) {
        return new AccountInfo(null, null, null, null, now, ORIGIN_X, 0);
    }

    boolean isEmpty() {
        return location == null && source == null;
    }

    boolean hasLocationWarning() {
        return location != null && Boolean.FALSE.equals(locationAccurate);
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
                    o.optLong("id", 0)
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
