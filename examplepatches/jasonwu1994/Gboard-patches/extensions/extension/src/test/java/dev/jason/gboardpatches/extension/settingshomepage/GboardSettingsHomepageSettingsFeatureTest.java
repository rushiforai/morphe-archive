package dev.jason.gboardpatches.extension.settingshomepage;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.Resources;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public final class GboardSettingsHomepageSettingsFeatureTest {
    @Test
    public void forceNewModeUsesMorpheSectionsAndStatusBlocks() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        preferences.edit()
                .putString(
                        GboardSettingsHomepageSettings.PREF_KEY_MODE,
                        GboardSettingsHomepageSettings.MODE_FORCE_NEW)
                .apply();
        CapturingHost host = new CapturingHost(preferences);

        GboardPatchesSettingsContract.Screen screen =
                new GboardSettingsHomepageSettingsFeature().buildScreen(host);

        Assert.assertEquals(
                Arrays.asList("Style", "Current state"),
                sectionTitles(screen.getSections()));
        Assert.assertEquals("SelectorRow",
                screen.getSections().get(0).getItems().get(0).getClass().getSimpleName());
        Assert.assertEquals("DetailRow",
                screen.getSections().get(1).getItems().get(0).getClass().getSimpleName());
        Assert.assertEquals(1, screen.getStatusBlocks().size());
        Assert.assertEquals(
                "Compatibility safeguard",
                screen.getStatusBlocks().get(0).getTitle());
    }

    @Test
    public void screenPreservesAutoNewLegacyLabelsPreviewsAndPersistentSelection() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        CapturingHost host = new CapturingHost(preferences);

        GboardPatchesSettingsContract.Screen screen =
                new GboardSettingsHomepageSettingsFeature().buildScreen(host);
        GboardPatchesSettingsContract.SelectorRow selector =
                (GboardPatchesSettingsContract.SelectorRow)
                        screen.getSections().get(0).getItems().get(0);

        Assert.assertEquals("Auto", selector.getCurrentValue());
        Assert.assertEquals(GboardPatchesSettingsContract.PreviewLayout.STACKED,
                selector.getPreviewSpec().getLayout());
        Assert.assertEquals(2, selector.getPreviewSpec().getMediaItems().size());
        Assert.assertEquals(
                "settings-previews/settingshomepage/settings_style_new.jpg",
                ((GboardPatchesSettingsContract.PreviewImage)
                        selector.getPreviewSpec().getMediaItems().get(0)).getAssetPath());
        Assert.assertEquals("New style",
                selector.getPreviewSpec().getMediaItems().get(0).getCaption());
        Assert.assertEquals(
                "settings-previews/settingshomepage/settings_style_legacy.jpg",
                ((GboardPatchesSettingsContract.PreviewImage)
                        selector.getPreviewSpec().getMediaItems().get(1)).getAssetPath());
        Assert.assertEquals("Legacy style",
                selector.getPreviewSpec().getMediaItems().get(1).getCaption());

        selector.getAction().run();
        Assert.assertArrayEquals(new String[] { "Auto", "New", "Legacy" }, host.choiceLabels);
        Assert.assertArrayEquals(new String[] {
                GboardSettingsHomepageSettings.MODE_AUTO,
                GboardSettingsHomepageSettings.MODE_FORCE_NEW,
                GboardSettingsHomepageSettings.MODE_FORCE_LEGACY
        }, host.choiceValues);
        host.choiceConsumer.accept(GboardSettingsHomepageSettings.MODE_FORCE_LEGACY);

        Assert.assertEquals(
                GboardSettingsHomepageSettings.MODE_FORCE_LEGACY,
                preferences.getString(GboardSettingsHomepageSettings.PREF_KEY_MODE, null));
        GboardPatchesSettingsContract.Screen rebuilt =
                new GboardSettingsHomepageSettingsFeature().buildScreen(host);
        GboardPatchesSettingsContract.SelectorRow rebuiltSelector =
                (GboardPatchesSettingsContract.SelectorRow)
                        rebuilt.getSections().get(0).getItems().get(0);
        Assert.assertEquals("Legacy", rebuiltSelector.getCurrentValue());
    }

    @Test
    public void newSelectionArmsTheExistingTenSecondWindowAndPersistsItsMode() {
        InMemorySharedPreferences preferences = new InMemorySharedPreferences();
        CapturingHost host = new CapturingHost(preferences);
        GboardPatchesSettingsContract.Screen screen =
                new GboardSettingsHomepageSettingsFeature().buildScreen(host);
        GboardPatchesSettingsContract.SelectorRow selector =
                (GboardPatchesSettingsContract.SelectorRow)
                        screen.getSections().get(0).getItems().get(0);
        long before = System.currentTimeMillis();

        selector.getAction().run();
        host.choiceConsumer.accept(GboardSettingsHomepageSettings.MODE_FORCE_NEW);

        long expiresAt = preferences.getLong(
                GboardSettingsHomepageSettings.PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT,
                0L);
        Assert.assertEquals(
                GboardSettingsHomepageSettings.MODE_FORCE_NEW,
                preferences.getString(GboardSettingsHomepageSettings.PREF_KEY_MODE, null));
        Assert.assertTrue(preferences.getBoolean(
                GboardSettingsHomepageSettings.PREF_KEY_FORCE_NEW_TRIAL_ARMED,
                false));
        Assert.assertFalse(preferences.getBoolean(
                GboardSettingsHomepageSettings.PREF_KEY_FORCE_NEW_TRIAL_EXPIRED,
                true));
        Assert.assertTrue(expiresAt >= before + 9_900L);
        Assert.assertTrue(expiresAt <= System.currentTimeMillis() + 10_000L);
        Assert.assertFalse(preferences.getBoolean(
                GboardSettingsHomepageSettings.PREF_KEY_FORCE_NEW_GUARD_PENDING,
                true));
    }

    private static List<String> sectionTitles(List<GboardPatchesSettingsContract.Section> sections) {
        List<String> titles = new ArrayList<>();
        for (GboardPatchesSettingsContract.Section section : sections) {
            titles.add(section.getTitle());
        }
        return titles;
    }

    private static final class CapturingHost extends dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsTestHost {
        private final SharedPreferences preferences;
        private final Context context;
        private String[] choiceLabels;
        private String[] choiceValues;
        private GboardPatchesSettingsContract.StringValueConsumer choiceConsumer;

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
                public Resources getResources() {
                    return Resources.getSystem();
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
            choiceLabels = labels;
            choiceValues = values;
            choiceConsumer = valueConsumer;
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
