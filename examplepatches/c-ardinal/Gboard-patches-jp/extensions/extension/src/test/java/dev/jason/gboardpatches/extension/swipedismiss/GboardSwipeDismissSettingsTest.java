package dev.jason.gboardpatches.extension.swipedismiss;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardSwipeDismissSettingsTest {
    @Test
    public void missingAndMalformedValuesDefaultToDisabled() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        Assert.assertFalse(GboardSwipeDismissSettings.readEnabled(preferences));
        Assert.assertEquals(Boolean.FALSE, GboardSwipeDismissSettings.readEnabledOrNull(preferences));

        preferences.values.put(
                GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                Integer.valueOf(1));
        Assert.assertFalse(GboardSwipeDismissSettings.readEnabled(preferences));
        Assert.assertNull(GboardSwipeDismissSettings.readEnabledOrNull(preferences));

        Assert.assertFalse(GboardSwipeDismissSettings.readEnabled((SharedPreferences) null));
        Assert.assertNull(GboardSwipeDismissSettings.readEnabledOrNull(null));
    }

    @Test
    public void readsBooleanAndRemoteStringRepresentations() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        preferences.values.put(
                GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                Boolean.TRUE);
        Assert.assertTrue(GboardSwipeDismissSettings.readEnabled(preferences));

        preferences.values.put(
                GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                "true");
        Assert.assertTrue(GboardSwipeDismissSettings.readEnabled(preferences));

        preferences.values.put(
                GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                "false");
        Assert.assertFalse(GboardSwipeDismissSettings.readEnabled(preferences));
    }

    @Test
    public void ensureDefaultWritesDisabledWhenMissingAndPreservesExisting() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        GboardSwipeDismissSettings.ensureDefault(preferences);
        Assert.assertEquals(
                Boolean.FALSE,
                preferences.values.get(GboardSwipeDismissSettings.PREF_KEY_ENABLED));

        preferences.values.put(
                GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                Boolean.TRUE);
        GboardSwipeDismissSettings.ensureDefault(preferences);
        Assert.assertEquals(
                Boolean.TRUE,
                preferences.values.get(GboardSwipeDismissSettings.PREF_KEY_ENABLED));
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        final Map<String, Object> values = new HashMap<>();

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
        public Set<String> getStringSet(String key, Set<String> defValues) {
            return defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            Object value = values.get(key);
            return value instanceof Integer ? (Integer) value : defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            Object value = values.get(key);
            return value instanceof Long ? (Long) value : defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            Object value = values.get(key);
            return value instanceof Float ? (Float) value : defValue;
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
                    pending.put(key, Integer.valueOf(value));
                    return this;
                }

                @Override
                public Editor putLong(String key, long value) {
                    pending.put(key, Long.valueOf(value));
                    return this;
                }

                @Override
                public Editor putFloat(String key, float value) {
                    pending.put(key, Float.valueOf(value));
                    return this;
                }

                @Override
                public Editor putBoolean(String key, boolean value) {
                    pending.put(key, Boolean.valueOf(value));
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
