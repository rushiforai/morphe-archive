package dev.jason.gboardpatches.extension.webclipboard;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public final class WebClipboardPreferencesBehaviorTest {
    private static final String LOOPBACK_TOKEN =
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";

    @Test
    public void runtimeWritesUseSynchronousCommitNotApply() {
        CountingSharedPreferences preferences = new CountingSharedPreferences();

        WebClipboardPreferences.setEnabled(preferences, true);
        WebClipboardPreferences.setPort(preferences, 9000);
        WebClipboardPreferences.setRuntimeActive(preferences, true);
        WebClipboardPreferences.setPairingRequired(preferences, true);
        WebClipboardPreferences.setPairingCode(preferences, "1234");
        WebClipboardPreferences.setLoopbackIngressToken(preferences, LOOPBACK_TOKEN);

        Assert.assertEquals(6, preferences.commitCount);
        Assert.assertEquals(0, preferences.applyCount);
        Assert.assertTrue(WebClipboardPreferences.readEnabled(preferences));
        Assert.assertEquals(9000, WebClipboardPreferences.readPort(preferences));
        Assert.assertTrue(WebClipboardPreferences.readRuntimeActive(preferences));
        Assert.assertEquals("1234", WebClipboardPreferences.getPairingCode(preferences));
        Assert.assertEquals(LOOPBACK_TOKEN,
                WebClipboardPreferences.getLoopbackIngressToken(preferences));
    }

    @Test
    public void remoteReadHelpersDoNotWriteDefaultsOrMintTokens() {
        CountingSharedPreferences preferences = new CountingSharedPreferences();

        Assert.assertFalse(WebClipboardPreferences.readEnabled(preferences));
        Assert.assertEquals(WebClipboardPreferences.DEFAULT_PORT,
                WebClipboardPreferences.readPort(preferences));
        Assert.assertFalse(WebClipboardPreferences.readRuntimeActive(preferences));
        Assert.assertEquals(WebClipboardPreferences.DEFAULT_LOOPBACK_INGRESS_TOKEN,
                WebClipboardPreferences.getLoopbackIngressToken(preferences));

        Assert.assertEquals(0, preferences.commitCount);
        Assert.assertEquals(0, preferences.applyCount);
        Assert.assertFalse(preferences.contains(
                WebClipboardPreferences.PREF_KEY_LOOPBACK_INGRESS_TOKEN));
    }

    @Test
    public void ensureDefaultsRequiresPairingAndSeedsFreshCodeAndLoopbackToken() {
        CountingSharedPreferences preferences = new CountingSharedPreferences();

        WebClipboardPreferences.ensureDefaults(preferences);

        Assert.assertTrue(WebClipboardPreferences.isPairingRequired(preferences));
        Assert.assertTrue(WebClipboardPreferences.getPairingCode(preferences).matches("\\d{4}"));
        Assert.assertNotEquals(
                WebClipboardPreferences.DEFAULT_PAIRING_CODE,
                WebClipboardPreferences.getPairingCode(preferences));
        Assert.assertTrue(
                WebClipboardPreferences.getLoopbackIngressToken(preferences).length() >= 32);
    }

    @Test
    public void explicitEnabledStateReadsDirectBooleanWithoutExtraFallbackPlumbing() {
        SnapshotBackedSharedPreferences preferences = new SnapshotBackedSharedPreferences();
        preferences.values.put(WebClipboardPreferences.PREF_KEY_ENABLED, Boolean.TRUE);

        Assert.assertEquals(Boolean.TRUE,
                WebClipboardPreferences.readExplicitEnabledState(preferences));
    }

    private static final class CountingSharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();
        int commitCount;
        int applyCount;

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<>(values));
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
            return value instanceof Set ? new HashSet<>((Set<String>) value) : defValues;
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
                private boolean clearRequested;

                @Override
                public Editor putString(String key, String value) {
                    pending.put(key, value);
                    return this;
                }

                @Override
                public Editor putStringSet(String key, Set<String> values) {
                    pending.put(key, values == null ? null : new HashSet<>(values));
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
                    clearRequested = true;
                    pending.clear();
                    return this;
                }

                @Override
                public boolean commit() {
                    commitCount++;
                    flush();
                    return true;
                }

                @Override
                public void apply() {
                    applyCount++;
                    flush();
                }

                private void flush() {
                    if (clearRequested) {
                        values.clear();
                    }
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

    private static final class SnapshotBackedSharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(values);
        }

        @Override
        public String getString(String key, String defValue) {
            return defValue;
        }

        @Override
        public Set<String> getStringSet(String key, Set<String> defValues) {
            return defValues;
        }

        @Override
        public int getInt(String key, int defValue) {
            return defValue;
        }

        @Override
        public long getLong(String key, long defValue) {
            return defValue;
        }

        @Override
        public float getFloat(String key, float defValue) {
            return defValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defValue) {
            return defValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            throw new UnsupportedOperationException();
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
