package app.morphe.extension.chmateuaspoof;

import android.content.Context;
import android.content.SharedPreferences;
import android.webkit.WebSettings;

/** Android-side state: own SharedPreferences file, startup hook and WebView hook. */
public final class UaSpoofSettings {
    /** Own file and keys; never shared with ChMate or Haiagaru preferences. */
    static final String PREFS = "chmate_ua_spoof";
    static final String KEY_ENABLED = "ua_spoof_enabled";
    static final String KEY_AGENT = "ua_spoof_agent";
    /** Haiagaru ReadingAuth storage, read-only here, to keep its paired UA in WebViews. */
    private static final String READING_AUTH_PREFS = "haiagaru_reading_auth";

    private static volatile Context appContext;

    /** Hook: first instruction of Application.attachBaseContext, before any native UA is built. */
    public static void init(Context base) {
        try {
            if (base == null) return;
            appContext = base;
            UaSpoof.apply(selected(prefs(base)));
        } catch (RuntimeException error) {
            System.err.println("ChMateUaSpoof: init skipped: " + error);
        }
    }

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Effective UA, or null when OFF / invalid. */
    static String selected(SharedPreferences prefs) {
        if (!prefs.getBoolean(KEY_ENABLED, false)) return null;
        String value = prefs.getString(KEY_AGENT, null);
        return UaSpoofRules.valid(value) ? value : null;
    }

    static void save(Context context, boolean enabled, String agent) {
        SharedPreferences.Editor editor = prefs(context).edit().putBoolean(KEY_ENABLED, enabled);
        if (agent != null) editor.putString(KEY_AGENT, agent);
        editor.commit();
        appContext = context.getApplicationContext();
        UaSpoof.apply(enabled ? agent : null);
    }

    /** Restore to original: OFF, saved text removed, http.agent back to its original value. */
    static void reset(Context context) {
        prefs(context).edit().clear().commit();
        UaSpoof.apply(null);
    }

    /** Hook: replaces native WebSettings.setUserAgentString calls (challenge dialog, in-app browser). */
    public static void setUserAgentString(WebSettings settings, String value) {
        settings.setUserAgentString(webViewAgent(value));
    }

    static String webViewAgent(String value) {
        try {
            String selected = UaSpoof.current();
            if (selected == null) {
                return UaSpoof.appliedAgents().isEmpty() ? value
                        : UaSpoofRules.restore(value, UaSpoof.appliedAgents(), UaSpoof.originalHttpAgent());
            }
            // Keep Haiagaru's paired UA so its cf_clearance stays aligned with that UA.
            Context context = appContext;
            if (context != null && value != null) {
                String paired = context.getSharedPreferences(READING_AUTH_PREFS, Context.MODE_PRIVATE)
                        .getString("agent", null);
                if (value.equals(paired)) return value;
            }
            return selected;
        } catch (RuntimeException error) {
            return value;
        }
    }

    private UaSpoofSettings() { }
}
