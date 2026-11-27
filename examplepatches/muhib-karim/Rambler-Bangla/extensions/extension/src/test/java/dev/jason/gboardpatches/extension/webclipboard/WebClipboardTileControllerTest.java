package dev.jason.gboardpatches.extension.webclipboard;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class WebClipboardTileControllerTest {
    @Test
    public void toggleEnabledFlipsStoredPreference() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        Assert.assertFalse(WebClipboardTileController.isEnabled(preferences));

        boolean enabled = WebClipboardTileController.toggle(preferences);

        Assert.assertTrue(enabled);
        Assert.assertTrue(WebClipboardTileController.isEnabled(preferences));

        boolean disabled = WebClipboardTileController.toggle(preferences);

        Assert.assertFalse(disabled);
        Assert.assertFalse(WebClipboardTileController.isEnabled(preferences));
    }

    @Test
    public void setEnabledAndReadBackUseDedicatedPreferenceKeys() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        WebClipboardTileController.setEnabled(preferences, true);

        Assert.assertTrue(preferences.getBoolean(WebClipboardPreferences.PREF_KEY_ENABLED, false));
        Assert.assertTrue(WebClipboardTileController.isEnabled(preferences));
    }

    @Test
    public void setRuntimeActiveAndReadBackUseDedicatedPreferenceKeys() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        WebClipboardTileController.setRuntimeActive(preferences, true);

        Assert.assertTrue(preferences.getBoolean(
                WebClipboardPreferences.PREF_KEY_RUNTIME_ACTIVE,
                false));
        Assert.assertTrue(WebClipboardTileController.isRuntimeActive(preferences));
    }

    @Test
    public void tileStateTrustsRuntimeActiveWhenServiceProbeIsStale() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        WebClipboardTileController.setEnabled(preferences, true);
        WebClipboardTileController.setRuntimeActive(preferences, true);

        Assert.assertTrue(WebClipboardTileController.isTileActive(preferences, false));
        Assert.assertTrue(WebClipboardTileController.shouldRestoreService(preferences, false));
    }

    @Test
    public void tileStateBecomesActiveOnlyWhenPreferenceRuntimeAndServiceAllAgree() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        WebClipboardTileController.setEnabled(preferences, true);
        WebClipboardTileController.setRuntimeActive(preferences, true);

        Assert.assertTrue(WebClipboardTileController.isTileActive(preferences, true));
        Assert.assertFalse(WebClipboardTileController.shouldRestoreService(preferences, true));
    }

    @Test
    public void defaultPortIs8080() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        Assert.assertEquals(8080, WebClipboardPreferences.getPort(preferences));
    }

    @Test
    public void statusSubtitleShowsCurrentHttpEndpoint() {
        Assert.assertEquals(
                "http://192.168.1.23:8090/",
                WebClipboardTileController.buildStatusSubtitle(
                        java.util.List.of(
                                "https://192.168.1.23:8091/",
                                "http://192.168.1.23:8090/")));
    }

    @Test
    public void pairingCodeIsRequiredByDefaultAndUsesFourDigitsWhenEnabled() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        Assert.assertTrue(WebClipboardPreferences.isPairingRequired(preferences));
        Assert.assertTrue(WebClipboardPreferences.getPairingCode(preferences).matches("\\d{4}"));

        WebClipboardPreferences.setPairingRequired(preferences, true);
        WebClipboardPreferences.setPairingCode(preferences, "42");

        Assert.assertTrue(WebClipboardPreferences.isPairingRequired(preferences));
        Assert.assertEquals("0042", WebClipboardPreferences.getPairingCode(preferences));
    }

    @Test
    public void regeneratingPairingCodeStoresFourDigitNumericCode() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        String code = WebClipboardPreferences.regeneratePairingCode(preferences);

        Assert.assertTrue(code.matches("\\d{4}"));
        Assert.assertEquals(code, WebClipboardPreferences.getPairingCode(preferences));
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<>();

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
                private boolean clearRequested;

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
                    clearRequested = true;
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
}
