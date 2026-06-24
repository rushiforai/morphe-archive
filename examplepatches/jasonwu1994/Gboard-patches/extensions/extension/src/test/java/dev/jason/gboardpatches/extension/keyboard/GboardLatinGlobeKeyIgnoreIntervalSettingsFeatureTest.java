package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

public final class GboardLatinGlobeKeyIgnoreIntervalSettingsFeatureTest {
    @Test
    public void intervalPreviewUsesPatchedAssetVideos() throws Exception {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardLatinGlobeKeyIgnoreIntervalSettings.ensureDefaults(preferences);
        CapturingHost host = new CapturingHost(preferences);

        GboardPatchesSettingsContract.Screen screen =
                new GboardLatinGlobeKeyIgnoreIntervalSettingsFeature(null).buildScreen(host);

        GboardPatchesSettingsContract.SelectorRow intervalRow = null;
        for (GboardPatchesSettingsContract.Row row : screen.getRows()) {
            if (row instanceof GboardPatchesSettingsContract.SelectorRow selectorRow
                    && "Ignore delay".contentEquals(selectorRow.getTitle())) {
                intervalRow = selectorRow;
                break;
            }
        }
        Assert.assertNotNull("Missing ignore delay row", intervalRow);

        GboardPatchesSettingsContract.PreviewSpec previewSpec = intervalRow.getPreviewSpec();
        Assert.assertNotNull("Missing interval preview", previewSpec);

        List<GboardPatchesSettingsContract.PreviewMedia> mediaItems = previewSpec.getMediaItems();
        Assert.assertEquals(2, mediaItems.size());
        Assert.assertEquals(
                "settings-previews/keyboard/gboard_latin_globe_key_ignore_interval_default.mp4",
                assetPath(mediaItems.get(0)));
        Assert.assertEquals(
                "settings-previews/keyboard/gboard_latin_globe_key_ignore_interval_patched.mp4",
                assetPath(mediaItems.get(1)));
    }

    private static String assetPath(GboardPatchesSettingsContract.PreviewMedia previewMedia)
            throws Exception {
        Method method = previewMedia.getClass().getMethod("getAssetPath");
        Object value = method.invoke(previewMedia);
        return value == null ? null : value.toString();
    }

    private static final class CapturingHost implements GboardPatchesSettingsContract.Host {
        private final SharedPreferences preferences;
        private final Context context;

        private CapturingHost(SharedPreferences preferences) {
            this.preferences = preferences;
            this.context = new ContextWrapper(null) {
                @Override
                public Context getApplicationContext() {
                    return this;
                }

                @Override
                public SharedPreferences getSharedPreferences(String name, int mode) {
                    return CapturingHost.this.preferences;
                }

                @Override
                public String getPackageName() {
                    return "dev.jason.gboardpatches.test";
                }

                @Override
                public ClassLoader getClassLoader() {
                    return CapturingHost.class.getClassLoader();
                }
            };
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void refresh() {
        }

        @Override
        public void openFeature(GboardPatchesSettingsContract.Feature feature) {
        }

        @Override
        public void showChoiceDialog(String title, String[] labels, String[] values,
                String currentValue, String customValue, Runnable customAction,
                GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
        }

        @Override
        public void showPositiveIntegerDialog(String title, String hint, int initialValue,
                GboardPatchesSettingsContract.PositiveIntegerConsumer consumer) {
        }

        @Override
        public void showTextInputDialog(String title, String hint, String initialValue,
                GboardPatchesSettingsContract.TextValueConsumer consumer) {
        }

        @Override
        public void showPreviewDialog(GboardPatchesSettingsContract.PreviewSpec previewSpec) {
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
