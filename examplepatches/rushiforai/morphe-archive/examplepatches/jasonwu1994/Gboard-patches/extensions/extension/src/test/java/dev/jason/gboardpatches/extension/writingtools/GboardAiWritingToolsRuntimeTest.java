package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

public final class GboardAiWritingToolsRuntimeTest {
    @After
    public void tearDown() throws Exception {
        GboardAiWritingToolsOfficialPreferences.clearForTest();
        Class.forName("oql").getMethod("reset").invoke(null);
        Field applicationContextField = GboardAiWritingToolsRuntime.class
                .getDeclaredField("applicationContext");
        applicationContextField.setAccessible(true);
        applicationContextField.set(null, null);
    }

    @Test
    public void computeOverrideValueReturnsNullWhenFeatureDisabled() {
        Object overrideValue = GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_WRITING_TOOLS,
                false,
                false,
                GboardAiWritingToolsOfficialPreferences.snapshot());

        Assert.assertNull(overrideValue);
    }

    @Test
    public void computeOverrideValueRespectsOfficialFourSwitches() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        Boolean.FALSE,
                        Boolean.FALSE,
                        Boolean.TRUE,
                        Boolean.FALSE);

        Assert.assertEquals(
                Boolean.FALSE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_CONFIG_PROOFREAD,
                        true,
                        false,
                        snapshot));
        Assert.assertEquals(
                Boolean.FALSE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_WRITING_TOOLS,
                        true,
                        false,
                        snapshot));
        Assert.assertEquals(
                Boolean.FALSE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_ALLOW_GEN_AI_SERVER,
                        true,
                        false,
                        snapshot));
    }

    @Test
    public void computeOverrideValueReturnsNullWhenRequiredOfficialSwitchIsUnknown() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        null,
                        null,
                        null,
                        null);

        Assert.assertNull(GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_CONFIG_PROOFREAD,
                true,
                false,
                snapshot));
        Assert.assertNull(GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_WRITING_TOOLS,
                true,
                false,
                snapshot));
        Assert.assertNull(GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_WRITING_HELPER,
                true,
                false,
                snapshot));
        Assert.assertNull(GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_ALLOW_GEN_AI_SERVER,
                true,
                false,
                snapshot));
    }

    @Test
    public void computeOverrideValueAllowsKnownCompositeOutcomeWithoutFullObservation() {
        GboardAiWritingToolsOfficialPreferences.Snapshot snapshot =
                new GboardAiWritingToolsOfficialPreferences.Snapshot(
                        Boolean.FALSE,
                        null,
                        Boolean.TRUE,
                        Boolean.TRUE);

        Assert.assertEquals(
                Boolean.TRUE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_WRITING_HELPER,
                        true,
                        false,
                        snapshot));
        Assert.assertEquals(
                Boolean.TRUE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_ALLOW_GEN_AI_SERVER,
                        true,
                        false,
                        snapshot));
    }

    @Test
    public void computeOverrideValueForcesAllLanguageAllowlistsOnlyWhenRequested() {
        Assert.assertEquals(
                GboardAiWritingToolsRuntime.ALL_LANGUAGES_ALLOWLIST_VALUE,
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        GboardAiWritingToolsRuntime.FLAG_WRITING_HELPER_SUPPORTED_LANGUAGE_TAGS,
                        true,
                        true,
                        GboardAiWritingToolsOfficialPreferences.snapshot()));
        Assert.assertNull(GboardAiWritingToolsRuntime.computeOverrideValue(
                GboardAiWritingToolsRuntime.FLAG_LLM_PC_SUPPORTED_LANGUAGE_TAGS,
                true,
                false,
                GboardAiWritingToolsOfficialPreferences.snapshot()));
    }

    @Test
    public void computeOverrideValueOverridesProofreadModelVersion() {
        Assert.assertEquals(
                "202408051448_prod_sd_config",
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        "writing_helper_model_version",
                        true,
                        false,
                        GboardAiWritingToolsOfficialPreferences.snapshot()));
    }

    @Test
    public void computeOverrideValueOverridesStylizationModelVersion() {
        Assert.assertEquals(
                "202504090000_writing_tools_config",
                GboardAiWritingToolsRuntime.computeOverrideValue(
                        "writing_helper_text_stylization_model_version",
                        true,
                        false,
                        GboardAiWritingToolsOfficialPreferences.snapshot()));
    }

    @Test
    public void flagOverrideLogIncludesFeatureAndAllowlistState() {
        String message = GboardAiWritingToolsRuntime.buildFlagOverrideLog(
                GboardAiWritingToolsRuntime.FLAG_WRITING_HELPER_SUPPORTED_LANGUAGE_TAGS,
                "en-US",
                "*",
                true,
                true);

        Assert.assertTrue(message.contains("flag=writing_helper_supported_language_tags"));
        Assert.assertTrue(message.contains("original=en-US"));
        Assert.assertTrue(message.contains("override=*"));
        Assert.assertTrue(message.contains("featureEnabled=true"));
        Assert.assertTrue(message.contains("allKeyboardsEnabled=true"));
    }

    @Test
    public void signalOverrideLogIncludesSignalDescriptionAndFeatureState() {
        String message = GboardAiWritingToolsRuntime.buildSignalOverrideLog(
                "gjz$a",
                true);

        Assert.assertTrue(message.contains("signal=gjz$a"));
        Assert.assertTrue(message.contains("featureEnabled=true"));
    }

    @Test
    public void forcedSignalTargetsStayScopedToWritingToolsMarker() {
        Assert.assertArrayEquals(
                new String[] { "gjz#a" },
                GboardAiWritingToolsRuntime.forcedSignalTargetSpecsForTesting());
    }

    @Test
    public void getOverriddenFlagValueSeedsUnknownOfficialPrefsFromPreferenceManager()
            throws Exception {
        Class<?> oqlClass = Class.forName("oql");
        oqlClass.getMethod("setBoolean", int.class, boolean.class).invoke(
                null,
                GboardAiWritingToolsOfficialPreferences.WRITING_TOOLS_COOPERATIVE_MODE_PREF_KEY,
                true);

        Field applicationContextField = GboardAiWritingToolsRuntime.class
                .getDeclaredField("applicationContext");
        applicationContextField.setAccessible(true);
        applicationContextField.set(null, new ContextWrapper(null) {
            private final SharedPreferences preferences = new InMemorySharedPreferences();

            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                return preferences;
            }
        });

        Object overrideValue = GboardAiWritingToolsRuntime.getOverriddenFlagValue(
                new FakeFlagReceiver(GboardAiWritingToolsRuntime.FLAG_WRITING_TOOLS));

        Assert.assertEquals(Boolean.TRUE, overrideValue);
    }

    private static final class FakeFlagReceiver {
        @SuppressWarnings("unused")
        private final String a;

        private FakeFlagReceiver(String flagName) {
            this.a = flagName;
        }
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(new HashMap<String, Object>(values));
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
