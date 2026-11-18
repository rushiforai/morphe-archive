package io.github.sabopura.morphe.extension.twitch.app;

import org.json.JSONException;
import org.json.JSONObject;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

/**
 * Twitch parses the login page's result with a strict JSON reader that throws on any field it does
 * not know, on the main thread, so a field the page adds stops the sign-in. This keeps only the
 * fields Twitch reads.
 */
@SuppressWarnings("unused")
public final class LoginFix {
    private LoginFix() {
    }

    /** Replaced at patch time with Twitch's login result fields, comma separated. */
    static String knownFields() {
        return "";
    }

    /** Injection point: the login page's result, just before Twitch parses it. */
    public static String knownOnly(String result) {
        try {
            return result == null ? null : knownOnly(result, knownFields());
        } catch (JSONException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.login-fix", e);
            return result;
        }
    }

    static String knownOnly(String result, String knownFields) throws JSONException {
        JSONObject page = new JSONObject(result);
        JSONObject kept = new JSONObject();
        for (String field : knownFields.split(","))
            if (page.has(field)) kept.put(field, page.get(field));
        return kept.toString();
    }
}
