package app.ytmusicproxy.extension;

import android.content.Context;
import android.content.SharedPreferences;

public final class ProxySettingsStore {
    public static final String PREFERENCES_FILE = "youtube";

    public static final String KEY_ENABLED = "emorphe_proxy_enabled";
    public static final String KEY_HOST = "emorphe_proxy_host";
    public static final String KEY_PORT = "emorphe_proxy_port";
    public static final String KEY_USERNAME = "emorphe_proxy_username";
    public static final String KEY_PASSWORD = "emorphe_proxy_password";

    private ProxySettingsStore() {
    }

    public static ProxyConfig read(Context context) {
        SharedPreferences preferences = preferences(context);
        return ProxyConfig.create(
                preferences.getBoolean(KEY_ENABLED, ProxyConfig.DEFAULT_ENABLED),
                preferences.getString(KEY_HOST, ProxyConfig.DEFAULT_HOST),
                preferences.getString(KEY_PORT, ProxyConfig.DEFAULT_PORT),
                preferences.getString(KEY_USERNAME, ProxyConfig.DEFAULT_USERNAME),
                preferences.getString(KEY_PASSWORD, ProxyConfig.DEFAULT_PASSWORD)
        );
    }

    public static void ensureDefaults(Context context) {
        SharedPreferences preferences = preferences(context);
        SharedPreferences.Editor editor = preferences.edit();
        boolean changed = false;

        if (!preferences.contains(KEY_ENABLED)) {
            editor.putBoolean(KEY_ENABLED, ProxyConfig.DEFAULT_ENABLED);
            changed = true;
        }
        if (!preferences.contains(KEY_HOST)) {
            editor.putString(KEY_HOST, ProxyConfig.DEFAULT_HOST);
            changed = true;
        }
        if (!preferences.contains(KEY_PORT)) {
            editor.putString(KEY_PORT, ProxyConfig.DEFAULT_PORT);
            changed = true;
        }
        if (!preferences.contains(KEY_USERNAME)) {
            editor.putString(KEY_USERNAME, ProxyConfig.DEFAULT_USERNAME);
            changed = true;
        }
        if (!preferences.contains(KEY_PASSWORD)) {
            editor.putString(KEY_PASSWORD, ProxyConfig.DEFAULT_PASSWORD);
            changed = true;
        }

        if (changed) {
            editor.apply();
        }
    }

    public static boolean isProxyKey(String key) {
        return KEY_ENABLED.equals(key)
                || KEY_HOST.equals(key)
                || KEY_PORT.equals(key)
                || KEY_USERNAME.equals(key)
                || KEY_PASSWORD.equals(key);
    }

    public static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES_FILE, Context.MODE_PRIVATE);
    }
}
