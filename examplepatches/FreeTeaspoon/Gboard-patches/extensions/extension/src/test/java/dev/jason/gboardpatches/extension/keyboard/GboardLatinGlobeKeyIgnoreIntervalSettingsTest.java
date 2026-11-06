package dev.jason.gboardpatches.extension.keyboard;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardLatinGlobeKeyIgnoreIntervalSettingsTest {
    @Test
    public void ensureDefaultsSeedsDedicatedPreferenceFile() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        GboardLatinGlobeKeyIgnoreIntervalSettings.ensureDefaults(preferences);

        Assert.assertEquals(
                Boolean.FALSE,
                preferences.values.get(GboardLatinGlobeKeyIgnoreIntervalSettings.PREF_KEY_ENABLED));
        Assert.assertEquals(
                Integer.valueOf(GboardLatinGlobeKeyIgnoreIntervalSettings.DEFAULT_INTERVAL_MS),
                preferences.values.get(
                        GboardLatinGlobeKeyIgnoreIntervalSettings.PREF_KEY_INTERVAL_MS));
    }

    @Test
    public void readsAndWritesIndependentLatinGlobeSettings() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        Assert.assertTrue(
                GboardLatinGlobeKeyIgnoreIntervalSettings.writeEnabled(preferences, true));
        Assert.assertTrue(
                GboardLatinGlobeKeyIgnoreIntervalSettings.writeIntervalMs(preferences, 321));

        Assert.assertTrue(GboardLatinGlobeKeyIgnoreIntervalSettings.readEnabled(preferences));
        Assert.assertEquals(
                321,
                GboardLatinGlobeKeyIgnoreIntervalSettings.readIntervalMs(preferences));
    }

    @Test
    public void writeIntervalClampsToSupportedRange() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        GboardLatinGlobeKeyIgnoreIntervalSettings.writeIntervalMs(preferences, -5);
        Assert.assertEquals(
                Integer.valueOf(GboardLatinGlobeKeyIgnoreIntervalSettings.MIN_INTERVAL_MS),
                preferences.values.get(
                        GboardLatinGlobeKeyIgnoreIntervalSettings.PREF_KEY_INTERVAL_MS));

        GboardLatinGlobeKeyIgnoreIntervalSettings.writeIntervalMs(preferences, 1505);
        Assert.assertEquals(
                Integer.valueOf(GboardLatinGlobeKeyIgnoreIntervalSettings.MAX_INTERVAL_MS),
                preferences.values.get(
                        GboardLatinGlobeKeyIgnoreIntervalSettings.PREF_KEY_INTERVAL_MS));
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(values);
        }

        @Override
        public String getString(String key, String defValue) {
            Object value = values.get(key);
            return value instanceof String ? (String) value : defValue;
        }

        @Override
        @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defValues) {
            Object value = values.get(key);
            return value instanceof Set ? (Set<String>) value : defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).intValue() : defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).longValue() : defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).floatValue() : defValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defValue) {
            Object value = values.get(key);
            return value instanceof Boolean ? (Boolean) value : defValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new Editor() {
                private final Map<String, Object> pending = new HashMap<>();

                @Override
                public Editor putString(String key, String value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putStringSet(String key, Set<String> values) {
                    pending.put(key, values);
                    return this;
                }

                @Override
                public Editor putInt(String key, int value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putLong(String key, long value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putFloat(String key, float value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putBoolean(String key, boolean value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor remove(String key) {
                    pending.put(key, null);
                    return this;
                }

                @Override
                public Editor clear() {
                    values.clear();
                    pending.clear();
                    return this;
                }

                @Override
                public boolean commit() {
                    apply();
                    return true;
                }

                @Override
                public void apply() {
                    for (Map.Entry<String, Object> entry : pending.entrySet()) {
                        if (entry.getValue() == null) {
                            values.remove(entry.getKey());
                        } else {
                            values.put(entry.getKey(), entry.getValue());
                        }
                    }
                }
            };
        }

        @Override
        public void registerOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }

        @Override
        public void unregisterOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }
    }
}
