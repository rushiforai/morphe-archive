package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class GboardZhuyinBottomRowWeightRuntimeTest {
    @Test
    public void normalFooterGuardRequiresDeleteSlotShapeAndZhuyinLabels() {
        Assert.assertTrue(GboardZhuyinBottomRowWeightRuntime.isNormalZhuyinFooter(
                new String[] {
                        "key_pos_switch_to_symbol",
                        "A02",
                        "key_pos_switch_to_next_language",
                        "key_pos_space",
                        "A06",
                        "key_pos_del",
                        "key_pos_ime_action"
                },
                "，",
                "注音",
                "ㄦ"));

        Assert.assertFalse(GboardZhuyinBottomRowWeightRuntime.isNormalZhuyinFooter(
                new String[] {
                        "key_pos_switch_to_symbol",
                        "A02",
                        "key_pos_switch_to_next_language",
                        "key_pos_space",
                        "A06",
                        "A08",
                        "key_pos_ime_action"
                },
                "，",
                "注音",
                "ㄦ"));
    }

    @Test
    public void settingsSnapshotReadsRecommendedDeleteAliasFromA08Key() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardZhuyinBottomRowWeightSettings.ensureDefaults(preferences);
        GboardZhuyinBottomRowWeightSettings.writeRecommendedWeights(preferences);

        GboardZhuyinBottomRowWeightRuntime.SettingsSnapshot snapshot =
                GboardZhuyinBottomRowWeightRuntime.settingsSnapshotFromPreferences(preferences, 123L);

        Assert.assertEquals(123L, snapshot.loadedAtElapsedMs);
        Assert.assertFalse(snapshot.enabled);
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.RECOMMENDED_WEIGHT_SPACE,
                snapshot.spaceWeight);
        Assert.assertEquals(
                GboardZhuyinBottomRowWeightSettings.RECOMMENDED_WEIGHT_A08,
                snapshot.a08Weight);
    }

    @Test
    public void metadataInteropUsesOriginalTopRowMetadataWhenAvailable() throws Exception {
        Object patchedMetadata = new Object();
        Object originalMetadata = new Object();

        Field field = Class.forName(
                "dev.jason.gboardpatches.extension.toprowswipe.GboardTopRowSwipeRuntime")
                .getDeclaredField("ORIGINAL_KEY_METADATA_BY_PATCHED");
        field.setAccessible(true);
        @SuppressWarnings("unchecked")
        Map<Object, Object> originalByPatched = (Map<Object, Object>) field.get(null);
        originalByPatched.put(patchedMetadata, originalMetadata);
        try {
            Assert.assertSame(
                    originalMetadata,
                    GboardZhuyinBottomRowWeightRuntime.resolveKeyMetadataForInterop(
                            patchedMetadata));
        } finally {
            originalByPatched.remove(patchedMetadata);
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
