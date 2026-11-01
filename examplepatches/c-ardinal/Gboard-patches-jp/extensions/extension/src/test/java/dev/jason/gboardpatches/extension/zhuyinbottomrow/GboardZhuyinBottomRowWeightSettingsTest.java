package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardZhuyinBottomRowWeightSettingsTest {
    @Test
    public void ensureDefaultsSeedsSevenSlotWeightsAndDisabledToggle() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();

        GboardZhuyinBottomRowWeightSettings.ensureDefaults(preferences);

        Assert.assertFalse(GboardZhuyinBottomRowWeightSettings.readEnabled(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SWITCH_TO_SYMBOL,
                GboardZhuyinBottomRowWeightSettings.readWeightSwitchToSymbol(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A02,
                GboardZhuyinBottomRowWeightSettings.readWeightA02(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                GboardZhuyinBottomRowWeightSettings.readWeightSwitchToNextLanguage(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SPACE,
                GboardZhuyinBottomRowWeightSettings.readWeightSpace(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A06,
                GboardZhuyinBottomRowWeightSettings.readWeightA06(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A08,
                GboardZhuyinBottomRowWeightSettings.readWeightA08(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_IME_ACTION,
                GboardZhuyinBottomRowWeightSettings.readWeightImeAction(preferences));
    }

    @Test
    public void recommendedWeightsOnlyShrinkSpaceAndDeleteAliasSlot() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardZhuyinBottomRowWeightSettings.ensureDefaults(preferences);

        Assert.assertTrue(
                GboardZhuyinBottomRowWeightSettings.writeRecommendedWeights(preferences));

        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SWITCH_TO_SYMBOL,
                GboardZhuyinBottomRowWeightSettings.readWeightSwitchToSymbol(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A02,
                GboardZhuyinBottomRowWeightSettings.readWeightA02(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                GboardZhuyinBottomRowWeightSettings.readWeightSwitchToNextLanguage(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.RECOMMENDED_WEIGHT_SPACE,
                GboardZhuyinBottomRowWeightSettings.readWeightSpace(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A06,
                GboardZhuyinBottomRowWeightSettings.readWeightA06(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.RECOMMENDED_WEIGHT_A08,
                GboardZhuyinBottomRowWeightSettings.readWeightA08(preferences));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_IME_ACTION,
                GboardZhuyinBottomRowWeightSettings.readWeightImeAction(preferences));
    }

    @Test
    public void sanitizeWeightClampsToSupportedRange() {
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.MIN_WEIGHT,
                GboardZhuyinBottomRowWeightSettings.sanitizeWeight(0));
        Assert.assertEquals(
                200,
                GboardZhuyinBottomRowWeightSettings.sanitizeWeight(200));
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.MAX_WEIGHT,
                GboardZhuyinBottomRowWeightSettings.sanitizeWeight(999));
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
