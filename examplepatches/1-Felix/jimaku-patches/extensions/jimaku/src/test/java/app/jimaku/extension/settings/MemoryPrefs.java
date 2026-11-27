package app.jimaku.extension.settings;

import android.content.SharedPreferences;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/** Preferences in memory, applied at once. */
final class MemoryPrefs implements SharedPreferences {
    final Map<String, Object> values = new HashMap<>();

    @Override
    public Map<String, ?> getAll() {
        return new HashMap<>(values);
    }

    @Override
    public String getString(String key, String fallback) {
        Object value = values.get(key);
        return value instanceof String text ? text : fallback;
    }

    @Override
    public Set<String> getStringSet(String key, Set<String> fallback) {
        return fallback;
    }

    @Override
    public int getInt(String key, int fallback) {
        Object value = values.get(key);
        return value instanceof Integer number ? number : fallback;
    }

    @Override
    public long getLong(String key, long fallback) {
        Object value = values.get(key);
        return value instanceof Long number ? number : fallback;
    }

    @Override
    public float getFloat(String key, float fallback) {
        Object value = values.get(key);
        return value instanceof Float number ? number : fallback;
    }

    @Override
    public boolean getBoolean(String key, boolean fallback) {
        Object value = values.get(key);
        return value instanceof Boolean flag ? flag : fallback;
    }

    @Override
    public boolean contains(String key) {
        return values.containsKey(key);
    }

    @Override
    public Editor edit() {
        return new Editor() {
            @Override
            public Editor putString(String key, String value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor putStringSet(String key, Set<String> value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor putInt(String key, int value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor putLong(String key, long value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor putFloat(String key, float value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor putBoolean(String key, boolean value) {
                values.put(key, value);
                return this;
            }

            @Override
            public Editor remove(String key) {
                values.remove(key);
                return this;
            }

            @Override
            public Editor clear() {
                values.clear();
                return this;
            }

            @Override
            public boolean commit() {
                return true;
            }

            @Override
            public void apply() {
            }
        };
    }

    @Override
    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }

    @Override
    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }
}
