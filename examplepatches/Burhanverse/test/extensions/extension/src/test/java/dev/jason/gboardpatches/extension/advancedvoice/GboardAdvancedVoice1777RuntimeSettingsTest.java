package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardAdvancedVoice1777RuntimeSettingsTest {
    private static final String ENABLED_KEY = "pref_advanced_voice_typing_enabled";
    private static final String BACKEND_KEY = "pref_advanced_voice_backend";
    private static final String ZH_TW_PUNCTUATION_KEY =
            "pref_advanced_voice_zh_tw_punctuation_enabled";

    @Test
    public void nullAndEmptyPreferencesFailClosed() {
        GboardAdvancedVoice1777RuntimeSettings.Snapshot nullSnapshot =
                GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(null);
        Assert.assertFalse(nullSnapshot.enabled);
        Assert.assertEquals(GboardVoiceInputMode.STANDARD, nullSnapshot.effectiveMode);
        Assert.assertFalse(nullSnapshot.zhTwPunctuationEnabled);
        Assert.assertFalse(nullSnapshot.isZhTwPunctuationInterventionEnabled());

        GboardAdvancedVoice1777RuntimeSettings.Snapshot emptySnapshot =
                GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(
                        new TestSharedPreferences());
        Assert.assertFalse(emptySnapshot.enabled);
        Assert.assertEquals(GboardVoiceInputMode.STANDARD, emptySnapshot.effectiveMode);
        Assert.assertFalse(emptySnapshot.zhTwPunctuationEnabled);
        Assert.assertFalse(emptySnapshot.isZhTwPunctuationInterventionEnabled());
    }

    @Test
    public void booleanAndLegacyStringTrueEnableTheRuntimeGate() {
        TestSharedPreferences booleanPreferences = new TestSharedPreferences();
        booleanPreferences.values.put(ENABLED_KEY, Boolean.TRUE);
        Assert.assertTrue(GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(
                booleanPreferences).enabled);

        TestSharedPreferences stringPreferences = new TestSharedPreferences();
        stringPreferences.values.put(ENABLED_KEY, "true");
        Assert.assertTrue(GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(
                stringPreferences).enabled);
    }

    @Test
    public void zhTwPunctuationInterventionRequiresBothSettings() {
        Assert.assertFalse(snapshot(false, false).isZhTwPunctuationInterventionEnabled());
        Assert.assertFalse(snapshot(false, true).isZhTwPunctuationInterventionEnabled());
        Assert.assertFalse(snapshot(true, false).isZhTwPunctuationInterventionEnabled());
        Assert.assertTrue(snapshot(true, true).isZhTwPunctuationInterventionEnabled());
    }

    @Test
    public void backendSelectionProducesOneExclusiveEffectiveMode() {
        Assert.assertEquals(GboardVoiceInputMode.STANDARD,
                snapshot(false, true, GboardAdvancedVoiceSettings.BACKEND_RAMBLER)
                        .effectiveMode);
        Assert.assertEquals(GboardVoiceInputMode.ADVANCED,
                snapshot(true, true, GboardAdvancedVoiceSettings.BACKEND_ADVANCED)
                        .effectiveMode);
        GboardAdvancedVoice1777RuntimeSettings.Snapshot rambler = snapshot(
                true,
                true,
                GboardAdvancedVoiceSettings.BACKEND_RAMBLER);
        Assert.assertEquals(GboardVoiceInputMode.RAMBLER, rambler.effectiveMode);
        Assert.assertFalse(rambler.isZhTwPunctuationInterventionEnabled());
    }

    @Test
    public void backendStoreSeedsAdvancedAndSanitizesUnknownValues() {
        TestSharedPreferences preferences = new TestSharedPreferences();
        GboardAdvancedVoiceSettings.ensureDefaults(preferences);
        Assert.assertEquals(GboardAdvancedVoiceSettings.BACKEND_ADVANCED,
                GboardAdvancedVoiceSettings.readBackend(preferences));

        Assert.assertTrue(GboardAdvancedVoiceSettings.writeBackend(
                preferences,
                GboardAdvancedVoiceSettings.BACKEND_RAMBLER));
        Assert.assertEquals(GboardAdvancedVoiceSettings.BACKEND_RAMBLER,
                GboardAdvancedVoiceSettings.readBackend(preferences));

        Assert.assertTrue(GboardAdvancedVoiceSettings.writeBackend(preferences, "invalid"));
        Assert.assertEquals(GboardAdvancedVoiceSettings.BACKEND_ADVANCED,
                GboardAdvancedVoiceSettings.readBackend(preferences));
    }

    @Test
    public void zhTwPunctuationInvalidValueFailsClosed() {
        TestSharedPreferences preferences = new TestSharedPreferences();
        preferences.values.put(ENABLED_KEY, Boolean.TRUE);
        preferences.values.put(ZH_TW_PUNCTUATION_KEY, "not-a-boolean");

        GboardAdvancedVoice1777RuntimeSettings.Snapshot snapshot =
                GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(preferences);
        Assert.assertTrue(snapshot.enabled);
        Assert.assertFalse(snapshot.zhTwPunctuationEnabled);
        Assert.assertFalse(snapshot.isZhTwPunctuationInterventionEnabled());
    }

    @Test
    public void publicAccessorHonorsTestOverride() {
        GboardAdvancedVoice1777RuntimeSettings.clearEnabledOverrideForTest();
        try {
            GboardAdvancedVoice1777RuntimeSettings.setEnabledOverrideForTest(false);
            Assert.assertFalse(GboardAdvancedVoice1777RuntimeSettings.isEnabled());

            GboardAdvancedVoice1777RuntimeSettings.setEnabledOverrideForTest(true);
            Assert.assertTrue(GboardAdvancedVoice1777RuntimeSettings.isEnabled());

            GboardAdvancedVoice1777RuntimeSettings.setBackendOverrideForTest(
                    GboardAdvancedVoiceSettings.BACKEND_RAMBLER);
            Assert.assertFalse(GboardAdvancedVoice1777RuntimeSettings.isEnabled());
            Assert.assertTrue(GboardAdvancedVoice1777RuntimeSettings.isRamblerEnabled());

            GboardAdvancedVoice1777RuntimeSettings
                    .setZhTwPunctuationEnabledOverrideForTest(false);
            Assert.assertFalse(GboardAdvancedVoice1777RuntimeSettings
                    .isZhTwPunctuationInterventionEnabled());

            GboardAdvancedVoice1777RuntimeSettings
                    .setZhTwPunctuationEnabledOverrideForTest(true);
            Assert.assertFalse(GboardAdvancedVoice1777RuntimeSettings
                    .isZhTwPunctuationInterventionEnabled());

            GboardAdvancedVoice1777RuntimeSettings.setBackendOverrideForTest(
                    GboardAdvancedVoiceSettings.BACKEND_ADVANCED);
            Assert.assertTrue(GboardAdvancedVoice1777RuntimeSettings
                    .isZhTwPunctuationInterventionEnabled());

            GboardAdvancedVoice1777RuntimeSettings.setEnabledOverrideForTest(false);
            Assert.assertFalse(GboardAdvancedVoice1777RuntimeSettings
                    .isZhTwPunctuationInterventionEnabled());
        } finally {
            GboardAdvancedVoice1777RuntimeSettings.clearEnabledOverrideForTest();
        }
    }

    private static GboardAdvancedVoice1777RuntimeSettings.Snapshot snapshot(
            boolean enabled,
            boolean zhTwPunctuationEnabled) {
        return snapshot(
                enabled,
                zhTwPunctuationEnabled,
                GboardAdvancedVoiceSettings.BACKEND_ADVANCED);
    }

    private static GboardAdvancedVoice1777RuntimeSettings.Snapshot snapshot(
            boolean enabled,
            boolean zhTwPunctuationEnabled,
            String backend) {
        TestSharedPreferences preferences = new TestSharedPreferences();
        preferences.values.put(ENABLED_KEY, Boolean.valueOf(enabled));
        preferences.values.put(BACKEND_KEY, backend);
        preferences.values.put(
                ZH_TW_PUNCTUATION_KEY,
                Boolean.valueOf(zhTwPunctuationEnabled));
        return GboardAdvancedVoice1777RuntimeSettings.snapshotFromPreferences(preferences);
    }

    private static final class TestSharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

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
            return value instanceof Boolean ? ((Boolean) value).booleanValue() : defValue;
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
                public Editor putStringSet(String key, Set<String> value) {
                    pending.put(key, value);
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

