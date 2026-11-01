package dev.jason.gboardpatches.extension.ocr;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsTestHost;

public final class GboardOcrSettingsFeatureTest {
    @After
    public void tearDown() {
        GboardOcrSettingsFeature.resetForTests();
    }

    @Test
    public void screenShowsEveryBackendWithCurrentAndInstallationState() {
        InMemoryPreferences preferences = new InMemoryPreferences();
        CapturingHost host = new CapturingHost(preferences);
        CapturingModuleInstallRequester requester = new CapturingModuleInstallRequester();
        FakeModuleAvailabilityChecker availability = new FakeModuleAvailabilityChecker();
        GboardOcrSettingsFeature feature =
                new GboardOcrSettingsFeature(null, requester, availability);
        GboardPatchesSettingsContract.Screen checkingScreen = feature.buildScreen(host);
        List<GboardPatchesSettingsContract.NavigationRow> checkingRows = findBackendRows(
                checkingScreen.getRows());

        Assert.assertEquals(5, availability.requestCount);
        Assert.assertEquals("Checking installation status…", checkingRows.get(0).getSummary());
        Assert.assertFalse(checkingRows.get(0).isEnabled());

        availability.resolve(GboardOcrEngine.LATIN, true);
        availability.resolve(GboardOcrEngine.CHINESE, true);
        availability.resolve(GboardOcrEngine.JAPANESE, false);
        availability.resolve(GboardOcrEngine.KOREAN, false);
        availability.resolve(GboardOcrEngine.DEVANAGARI, true);
        GboardPatchesSettingsContract.Screen screen = feature.buildScreen(host);
        List<GboardPatchesSettingsContract.NavigationRow> rows = findBackendRows(
                screen.getRows());

        Assert.assertEquals(5, rows.size());
        Assert.assertEquals(
                "Official models must be downloaded through Google Play services.",
                screen.getHeaderSummary());
        Assert.assertArrayEquals(
                new String[]{"Latin", "Chinese", "Japanese", "Korean", "Devanagari"},
                rows.stream().map(row -> row.getTitle().toString()).toArray(String[]::new));
        Assert.assertEquals("Installed", rows.get(0).getSummary());
        Assert.assertEquals("Current", rows.get(0).getTrailingText());
        Assert.assertEquals("Installed", rows.get(1).getSummary());
        Assert.assertNull(rows.get(1).getTrailingText());
        Assert.assertEquals("Not installed. Tap to download.", rows.get(2).getSummary());
        Assert.assertEquals("Not installed. Tap to download.", rows.get(3).getSummary());
        Assert.assertEquals("Installed", rows.get(4).getSummary());
        Assert.assertTrue(rows.stream().noneMatch(
                GboardPatchesSettingsContract.NavigationRow::shouldShowChevron));
    }

    @Test
    public void installedBackendSwitchesImmediatelyWithoutDownload() {
        InMemoryPreferences preferences = new InMemoryPreferences();
        CapturingHost host = new CapturingHost(preferences);
        CapturingModuleInstallRequester requester = new CapturingModuleInstallRequester();
        FakeModuleAvailabilityChecker availability = new FakeModuleAvailabilityChecker();
        GboardOcrSettingsFeature feature =
                new GboardOcrSettingsFeature(null, requester, availability);
        feature.buildScreen(host);
        availability.resolve(GboardOcrEngine.LATIN, true);
        availability.resolve(GboardOcrEngine.CHINESE, true);
        availability.resolveRemaining(false);
        List<GboardPatchesSettingsContract.NavigationRow> rows = findBackendRows(
                feature.buildScreen(host).getRows());

        int refreshesBeforeSelection = host.refreshCount;

        rows.get(1).getAction().run();

        Assert.assertEquals(GboardOcrEngine.CHINESE, GboardOcrSettings.readEngine(preferences));
        Assert.assertEquals(0, requester.requestCount);
        Assert.assertEquals(refreshesBeforeSelection + 1, host.refreshCount);
    }

    @Test
    public void missingBackendShowsDownloadingThenInstalledBeforeSwitching() {
        InMemoryPreferences preferences = new InMemoryPreferences();
        CapturingHost host = new CapturingHost(preferences);
        FakeModuleAvailabilityChecker availability = new FakeModuleAvailabilityChecker();
        CapturingModuleInstallRequester requester =
                new CapturingModuleInstallRequester(availability);
        GboardOcrSettingsFeature feature =
                new GboardOcrSettingsFeature(null, requester, availability);
        feature.buildScreen(host);
        availability.resolve(GboardOcrEngine.LATIN, true);
        availability.resolveRemaining(false);
        List<GboardPatchesSettingsContract.NavigationRow> rows = findBackendRows(
                feature.buildScreen(host).getRows());
        int refreshesBeforeSelection = host.refreshCount;

        rows.get(3).getAction().run();

        Assert.assertEquals(GboardOcrEngine.KOREAN, requester.engine);
        Assert.assertEquals(GboardOcrEngine.LATIN, GboardOcrSettings.readEngine(preferences));
        Assert.assertEquals(refreshesBeforeSelection + 1, host.refreshCount);
        GboardPatchesSettingsContract.NavigationRow downloadingRow =
                findBackendRows(feature.buildScreen(host).getRows()).get(3);
        Assert.assertEquals("Downloading…", downloadingRow.getSummary());
        Assert.assertFalse(downloadingRow.isEnabled());

        requester.succeed();

        Assert.assertEquals(GboardOcrEngine.KOREAN, GboardOcrSettings.readEngine(preferences));
        Assert.assertEquals(refreshesBeforeSelection + 2, host.refreshCount);
        GboardPatchesSettingsContract.NavigationRow installedRow =
                findBackendRows(feature.buildScreen(host).getRows()).get(3);
        Assert.assertEquals("Installed", installedRow.getSummary());
        Assert.assertEquals("Current", installedRow.getTrailingText());
    }

    @Test
    public void failedBackendDownloadKeepsPreviousChoice() {
        InMemoryPreferences preferences = new InMemoryPreferences();
        CapturingHost host = new CapturingHost(preferences);
        CapturingModuleInstallRequester requester = new CapturingModuleInstallRequester();
        FakeModuleAvailabilityChecker availability = new FakeModuleAvailabilityChecker();
        GboardOcrSettingsFeature feature =
                new GboardOcrSettingsFeature(null, requester, availability);
        feature.buildScreen(host);
        availability.resolve(GboardOcrEngine.LATIN, true);
        availability.resolveRemaining(false);
        GboardPatchesSettingsContract.Screen screen = feature.buildScreen(host);
        List<GboardPatchesSettingsContract.NavigationRow> rows = findBackendRows(
                screen.getRows());
        int refreshesBeforeSelection = host.refreshCount;

        rows.get(3).getAction().run();
        requester.fail();

        Assert.assertEquals(GboardOcrEngine.KOREAN, requester.engine);
        Assert.assertEquals(GboardOcrEngine.LATIN, GboardOcrSettings.readEngine(preferences));
        Assert.assertEquals(refreshesBeforeSelection + 2, host.refreshCount);
        GboardPatchesSettingsContract.NavigationRow failedRow =
                findBackendRows(feature.buildScreen(host).getRows()).get(3);
        Assert.assertEquals("Download failed. Tap to retry.", failedRow.getSummary());
        Assert.assertTrue(failedRow.isEnabled());
    }

    @Test
    public void invalidStoredEngineIsSanitizedToLatin() {
        InMemoryPreferences preferences = new InMemoryPreferences();
        preferences.edit().putString(GboardOcrSettings.PREF_KEY_ENGINE, "invalid").commit();

        GboardOcrSettings.ensureDefaults(preferences);

        Assert.assertEquals("latin",
                preferences.getString(GboardOcrSettings.PREF_KEY_ENGINE, null));
    }

    private static List<GboardPatchesSettingsContract.NavigationRow> findBackendRows(
            List<GboardPatchesSettingsContract.Row> rows) {
        List<GboardPatchesSettingsContract.NavigationRow> result =
                new java.util.ArrayList<GboardPatchesSettingsContract.NavigationRow>();
        for (GboardPatchesSettingsContract.Row row : rows) {
            if (row instanceof GboardPatchesSettingsContract.NavigationRow navigationRow) {
                result.add(navigationRow);
            }
        }
        return result;
    }

    private static final class CapturingHost extends GboardPatchesSettingsTestHost {
        private final Context context;
        private String[] choiceValues;
        private GboardPatchesSettingsContract.StringValueConsumer choiceConsumer;
        private int refreshCount;

        CapturingHost(SharedPreferences preferences) {
            context = new ContextWrapper(null) {
                @Override
                public Context getApplicationContext() {
                    return this;
                }

                @Override
                public SharedPreferences getSharedPreferences(String name, int mode) {
                    return preferences;
                }

                @Override
                public String getPackageName() {
                    return "dev.jason.gboardpatches.test";
                }
            };
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void refresh() {
            refreshCount++;
        }

        @Override
        public void openFeature(GboardPatchesSettingsContract.Feature feature) {
        }

        @Override
        public void showChoiceDialog(String title, String[] labels, String[] values,
                String currentValue, String customValue, Runnable customAction,
                GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
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

    private static final class CapturingModuleInstallRequester
            implements GboardOcrModuleInstallRequester {
        private final FakeModuleAvailabilityChecker availability;
        private GboardOcrEngine engine;
        private GboardOcrModuleInstaller.Callback callback;
        private int requestCount;

        CapturingModuleInstallRequester() {
            this(null);
        }

        CapturingModuleInstallRequester(FakeModuleAvailabilityChecker availability) {
            this.availability = availability;
        }

        @Override
        public void request(Context context, GboardOcrEngine requestedEngine,
                GboardOcrModuleInstaller.Callback requestedCallback) {
            engine = requestedEngine;
            callback = requestedCallback;
            requestCount++;
        }

        void succeed() {
            if (availability != null) {
                availability.install(engine);
            }
            callback.onSuccess();
        }

        void fail() {
            callback.onFailure(new IllegalStateException("download failed"));
        }
    }

    private static final class FakeModuleAvailabilityChecker
            implements GboardOcrModuleAvailabilityChecker {
        private final Map<GboardOcrEngine, GboardOcrModuleInstaller.AvailabilityCallback>
                callbacks = new java.util.EnumMap<>(GboardOcrEngine.class);
        private final java.util.Set<GboardOcrEngine> installed =
                java.util.EnumSet.noneOf(GboardOcrEngine.class);
        private int requestCount;

        @Override
        public void check(Context context, GboardOcrEngine engine,
                GboardOcrModuleInstaller.AvailabilityCallback callback) {
            callbacks.put(engine, callback);
            requestCount++;
        }

        void install(GboardOcrEngine engine) {
            installed.add(engine);
        }

        void resolve(GboardOcrEngine engine, boolean isInstalled) {
            if (isInstalled) {
                installed.add(engine);
            } else {
                installed.remove(engine);
            }
            GboardOcrModuleInstaller.AvailabilityCallback callback = callbacks.remove(engine);
            if (callback != null) {
                callback.onResult(isInstalled);
            }
        }

        void resolveRemaining(boolean isInstalled) {
            for (GboardOcrEngine engine : GboardOcrEngine.values()) {
                resolve(engine, isInstalled);
            }
        }
    }

    private static final class InMemoryPreferences implements SharedPreferences {
        private final Map<String, Object> values = new HashMap<String, Object>();

        @Override
        public Map<String, ?> getAll() {
            return Collections.unmodifiableMap(values);
        }

        @Override
        public String getString(String key, String defaultValue) {
            Object value = values.get(key);
            return value instanceof String ? (String) value : defaultValue;
        }

        @Override
        @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defaultValues) {
            Object value = values.get(key);
            return value instanceof Set ? (Set<String>) value : defaultValues;
        }

        @Override
        public int getInt(String key, int defaultValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).intValue() : defaultValue;
        }

        @Override
        public long getLong(String key, long defaultValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).longValue() : defaultValue;
        }

        @Override
        public float getFloat(String key, float defaultValue) {
            Object value = values.get(key);
            return value instanceof Number ? ((Number) value).floatValue() : defaultValue;
        }

        @Override
        public boolean getBoolean(String key, boolean defaultValue) {
            Object value = values.get(key);
            return value instanceof Boolean ? (Boolean) value : defaultValue;
        }

        @Override
        public boolean contains(String key) {
            return values.containsKey(key);
        }

        @Override
        public Editor edit() {
            return new Editor() {
                private final Map<String, Object> pending = new HashMap<String, Object>();

                @Override public Editor putString(String key, String value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor putStringSet(String key, Set<String> value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor putInt(String key, int value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor putLong(String key, long value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor putFloat(String key, float value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor putBoolean(String key, boolean value) {
                    pending.put(key, value); return this;
                }
                @Override public Editor remove(String key) {
                    pending.put(key, null); return this;
                }
                @Override public Editor clear() {
                    values.clear(); pending.clear(); return this;
                }
                @Override public boolean commit() {
                    apply(); return true;
                }
                @Override public void apply() {
                    for (Map.Entry<String, Object> entry : pending.entrySet()) {
                        if (entry.getValue() == null) values.remove(entry.getKey());
                        else values.put(entry.getKey(), entry.getValue());
                    }
                }
            };
        }

        @Override public void registerOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }

        @Override public void unregisterOnSharedPreferenceChangeListener(
                OnSharedPreferenceChangeListener listener) {
        }
    }
}
