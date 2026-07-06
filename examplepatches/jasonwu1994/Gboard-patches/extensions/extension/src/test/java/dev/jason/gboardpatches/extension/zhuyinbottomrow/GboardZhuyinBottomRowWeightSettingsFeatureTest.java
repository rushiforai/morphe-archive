package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

public final class GboardZhuyinBottomRowWeightSettingsFeatureTest {
    @Test
    public void disabledToggleKeepsWeightEditorsAndDangerRowsInactive() throws Exception {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        GboardZhuyinBottomRowWeightSettings.ensureDefaults(preferences);
        CapturingHost host = new CapturingHost(preferences);

        GboardPatchesSettingsContract.Screen screen =
                new GboardZhuyinBottomRowWeightSettingsFeature(host.getContext())
                        .buildScreen(host);

        GboardPatchesSettingsContract.ToggleRow enabledRow =
                findToggleRow(screen.getRows(), "Enabled");
        Assert.assertNotNull(enabledRow);
        Assert.assertFalse(enabledRow.isChecked());
        Assert.assertTrue(enabledRow.isEnabled());
        Assert.assertEquals(
                "settings-previews/zhuyinbottomrow/enabled.png",
                assetPath(enabledRow.getPreviewSpec().getMediaItems().get(0)));

        for (GboardPatchesSettingsContract.Row row : screen.getRows()) {
            if (row == enabledRow) {
                continue;
            }
            Assert.assertFalse("Expected disabled row: " + row.getTitle(), row.isEnabled());
        }
    }

    @Test
    public void traditionalChineseCopyMatchesValidatedLsposedWording() {
        Locale originalLocale = Locale.getDefault();
        Locale.setDefault(Locale.forLanguageTag("zh-Hant-TW"));
        try {
            InMemorySharedPreferences preferences = new InMemorySharedPreferences();
            GboardZhuyinBottomRowWeightSettings.ensureDefaults(preferences);
            CapturingHost host = new CapturingHost(preferences);

            GboardZhuyinBottomRowWeightSettingsFeature feature =
                    new GboardZhuyinBottomRowWeightSettingsFeature(host.getContext());
            GboardPatchesSettingsContract.Screen screen = feature.buildScreen(host);

            Assert.assertEquals("注音底排按鍵大小", feature.getEntryTitle());
            Assert.assertEquals("調整注音鍵盤底排 7 個按鍵 slot 的權重。", feature.getEntrySummary());
            Assert.assertEquals(
                    listOf("行為", "權重", "進階"),
                    sectionTitles(screen.getSections()));
            GboardPatchesSettingsContract.ToggleRow enabledRow =
                    findToggleRow(screen.getRows(), "啟用");
            Assert.assertNotNull(enabledRow);
            Assert.assertEquals("啟用自訂權重覆寫", enabledRow.getSummary());

            GboardPatchesSettingsContract.DangerRow applyRecommendedRow =
                    findDangerRow(screen.getRows(), "套用推薦值");
            Assert.assertNotNull(applyRecommendedRow);
            Assert.assertEquals(
                    "推薦：把空白鍵改成 200、刪除鍵改成 200，其餘保持預設。",
                    applyRecommendedRow.getSummary());
            Assert.assertEquals(
                    "要把空白鍵設成 200、刪除鍵設成 200，並把其他注音底排 slot 還原成預設值嗎？",
                    applyRecommendedRow.getConfirmMessage());

            GboardPatchesSettingsContract.DangerRow resetRow =
                    findDangerRow(screen.getRows(), "重設為預設值");
            Assert.assertNotNull(resetRow);
            Assert.assertEquals("把 7 個底排 slot 權重還原成原廠配置。", resetRow.getSummary());

            GboardPatchesSettingsContract.SelectorRow switchToSymbolRow =
                    findSelectorRow(screen.getRows(), "?123");
            Assert.assertNotNull(switchToSymbolRow);
            Assert.assertEquals("範圍：1-500。官方預設：150", switchToSymbolRow.getSummary());
        } finally {
            Locale.setDefault(originalLocale);
        }
    }

    @Test
    public void previewAssetExistsInPatchResources() {
        Assert.assertTrue(Files.exists(Path.of(
                "..", "..", "patches", "src", "main", "resources",
                "settings-previews", "zhuyinbottomrow", "enabled.png")));
    }

    private static String assetPath(GboardPatchesSettingsContract.PreviewMedia previewMedia)
            throws Exception {
        Method method = previewMedia.getClass().getMethod("getAssetPath");
        Object value = method.invoke(previewMedia);
        return value == null ? null : value.toString();
    }

    private static List<String> sectionTitles(List<GboardPatchesSettingsContract.Section> sections) {
        List<String> titles = new ArrayList<String>();
        for (GboardPatchesSettingsContract.Section section : sections) {
            titles.add(section.getTitle());
        }
        return titles;
    }

    private static List<String> listOf(String... values) {
        List<String> result = new ArrayList<String>();
        Collections.addAll(result, values);
        return result;
    }

    private static GboardPatchesSettingsContract.ToggleRow findToggleRow(
            List<GboardPatchesSettingsContract.Row> rows,
            String title) {
        for (GboardPatchesSettingsContract.Row row : rows) {
            if (row instanceof GboardPatchesSettingsContract.ToggleRow toggleRow
                    && title.contentEquals(toggleRow.getTitle())) {
                return toggleRow;
            }
        }
        return null;
    }

    private static GboardPatchesSettingsContract.DangerRow findDangerRow(
            List<GboardPatchesSettingsContract.Row> rows,
            String title) {
        for (GboardPatchesSettingsContract.Row row : rows) {
            if (row instanceof GboardPatchesSettingsContract.DangerRow dangerRow
                    && title.contentEquals(dangerRow.getTitle())) {
                return dangerRow;
            }
        }
        return null;
    }

    private static GboardPatchesSettingsContract.SelectorRow findSelectorRow(
            List<GboardPatchesSettingsContract.Row> rows,
            String title) {
        for (GboardPatchesSettingsContract.Row row : rows) {
            if (row instanceof GboardPatchesSettingsContract.SelectorRow selectorRow
                    && title.contentEquals(selectorRow.getTitle())) {
                return selectorRow;
            }
        }
        return null;
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

        @Override
        public void createTextDocument(String fileName, String mimeType, String text,
                Runnable completionAction) {
        }

        @Override
        public void openTextDocument(String[] mimeTypes,
                GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
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
