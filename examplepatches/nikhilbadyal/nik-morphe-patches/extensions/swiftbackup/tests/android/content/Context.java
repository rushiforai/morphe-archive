package android.content;

import java.util.HashMap;
import java.util.Map;

/** Keep opt-in bookkeeping isolated from native exported preferences in the same way as Android. */
public class Context {
    public static final int MODE_PRIVATE = 0;
    private final Map<String, SharedPreferences> preferences = new HashMap<>();
    public SharedPreferences getSharedPreferences(String name, int mode) {
        return preferences.computeIfAbsent(name, key -> new Prefs());
    }
    public String getPackageName() {
        return "org.swiftapps.swiftbackup";
    }
    public android.content.res.Resources getResources() {
        return new android.content.res.Resources();
    }
    public android.graphics.drawable.Drawable getDrawable(int id) {
        return new android.graphics.drawable.Drawable();
    }
    private static final class Prefs implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();
        public boolean getBoolean(String key, boolean fallback) { return (Boolean) values.getOrDefault(key, fallback); }
        public String getString(String key, String fallback) { return (String) values.getOrDefault(key, fallback); }
        public Editor edit() {
            return new Editor() {
                private final Map<String, Object> pending = new HashMap<>();
                public Editor putBoolean(String key, boolean value) { pending.put(key, value); return this; }
                public Editor putString(String key, String value) { pending.put(key, value); return this; }
                public boolean commit() { values.putAll(pending); return true; }
            };
        }
    }
}
