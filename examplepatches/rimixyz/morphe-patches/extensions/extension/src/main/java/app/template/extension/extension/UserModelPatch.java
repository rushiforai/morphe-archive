package app.template.extension.extension;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Rewrites the locally cached 17TRACK user model so the app believes the
 * account has the Premium membership level (4020).
 *
 * Called from a hook on SharedPreferencesBackend.setString(). The JSON is
 * modified in place, keeping every other field untouched, so the Dart parser
 * receives exactly the same shape it originally wrote.
 */
@SuppressWarnings("unused")
public final class UserModelPatch {

    private static final int PREMIUM_GRADE = 4020;

    private UserModelPatch() {
    }

    public static String patchUserModel(String json) {
        if (json == null || json.isEmpty()) {
            return json;
        }
        try {
            JSONObject obj = new JSONObject(json);

            // The exact key used by the Dart model is uncertain, so cover all
            // the candidates found in the AOT snapshot. Unknown extra keys are
            // ignored by Dart's Map-based fromJson parsing.
            forceValue(obj, "grade");
            forceValue(obj, "__grade");
            forceValue(obj, "level");

            Object expiration = obj.opt("expireTime");
            if (expiration instanceof Number) {
                obj.put("expireTime", 4102444800L); // 2100-01-01 (epoch seconds)
            } else if (expiration instanceof String) {
                obj.put("expireTime", "2099-12-31 23:59:59");
            }

            return obj.toString();
        } catch (Throwable t) {
            // Fail-safe: never break the app because of a parsing error.
            return json;
        }
    }

    private static void forceValue(JSONObject obj, String key) throws JSONException {
        Object current = obj.opt(key);
        if (current instanceof Number) {
            obj.put(key, PREMIUM_GRADE);
        } else if (current instanceof String) {
            obj.put(key, String.valueOf(PREMIUM_GRADE));
        } else {
            obj.put(key, PREMIUM_GRADE);
        }
    }
}
