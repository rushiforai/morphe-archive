package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardEnglishUppercaseToggleRuntimeBehaviorTest {
    @After
    public void tearDown() throws Exception {
        setApplicationContext(null);
    }

    @Test
    public void isEnabledReadsInjectedApplicationPreferences() throws Exception {
        ThrowingSharedPreferences preferences = new ThrowingSharedPreferences();
        GboardEnglishUppercaseToggleSettings.ensureDefaults(preferences);
        Assert.assertTrue(GboardEnglishUppercaseToggleSettings.writeEnabled(preferences, false));
        setApplicationContext(new SharedPreferencesContext(preferences));

        Assert.assertFalse(GboardEnglishUppercaseToggleRuntime.isEnabled());
    }

    @Test
    public void isEnabledFallsBackToDefaultWhenStoredTypeIsInvalid() throws Exception {
        ThrowingSharedPreferences preferences = new ThrowingSharedPreferences();
        preferences.values.put(
                GboardEnglishUppercaseToggleSettings.PREF_KEY_ENABLED,
                "false");
        setApplicationContext(new SharedPreferencesContext(preferences));

        Assert.assertTrue(GboardEnglishUppercaseToggleRuntime.isEnabled());
    }

    private static void setApplicationContext(Context context) throws Exception {
        Field field = GboardEnglishUppercaseToggleRuntime.class
                .getDeclaredField("applicationContext");
        field.setAccessible(true);
        field.set(null, context);
    }

    private static final class SharedPreferencesContext extends ContextWrapper {
        private final SharedPreferences preferences;

        private SharedPreferencesContext(SharedPreferences preferences) {
            super(null);
            this.preferences = preferences;
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public SharedPreferences getSharedPreferences(String name, int mode) {
            return preferences;
        }
    }

    private static final class ThrowingSharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<String, Object>(values));
        }

        @Override
        public String getString(String key, String defValue) {
            Object value = values.get(key);
            if (value == null) {
                return defValue;
            }
            if (!(value instanceof String)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return (String) value;
        }

        @Override
        @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defValues) {
            Object value = values.get(key);
            if (value == null) {
                return defValues;
            }
            if (!(value instanceof Set)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return (Set<String>) value;
        }

        @Override
        public int getInt(String key, int defValue) {
            Object value = values.get(key);
            if (value == null) {
                return defValue;
            }
            if (!(value instanceof Number)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return ((Number) value).intValue();
        }

        @Override
        public long getLong(String key, long defValue) {
            Object value = values.get(key);
            if (value == null) {
                return defValue;
            }
            if (!(value instanceof Number)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return ((Number) value).longValue();
        }

        @Override
        public float getFloat(String key, float defValue) {
            Object value = values.get(key);
            if (value == null) {
                return defValue;
            }
            if (!(value instanceof Number)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return ((Number) value).floatValue();
        }

        @Override
        public boolean getBoolean(String key, boolean defValue) {
            Object value = values.get(key);
            if (value == null) {
                return defValue;
            }
            if (!(value instanceof Boolean)) {
                throw new ClassCastException(value.getClass().getName());
            }
            return ((Boolean) value).booleanValue();
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new Editor() {
                private final Map<String, Object> pending = new HashMap<String, Object>();

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
