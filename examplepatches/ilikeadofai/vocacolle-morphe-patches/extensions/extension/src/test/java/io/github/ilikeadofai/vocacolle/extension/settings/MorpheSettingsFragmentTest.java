package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import org.junit.Test;

public class MorpheSettingsFragmentTest {
    @Test
    public void validLanguageChangePersistsAppliesAndRecreatesHost() {
        TestBackend backend = new TestBackend();
        SettingsStore store = new SettingsStore(backend);
        RecordingActions actions = new RecordingActions();

        assertTrue(MorpheSettingsFragment.handleDisplayLanguageChange("en", store, actions));
        assertEquals(DisplayLanguage.ENGLISH, store.getDisplayLanguage());
        assertEquals(DisplayLanguage.ENGLISH, actions.appliedLanguage);
        assertTrue(actions.recreated);
    }

    @Test
    public void nonStringLanguageChangeIsRejectedWithoutRecreate() {
        RecordingActions actions = new RecordingActions();

        assertFalse(MorpheSettingsFragment.handleDisplayLanguageChange(
                Boolean.TRUE,
                new SettingsStore(new TestBackend()),
                actions
        ));
        assertFalse(actions.recreated);
    }

    @Test
    public void failedLanguageApplyDoesNotPersistOrRecreate() {
        SettingsStore store = new SettingsStore(new TestBackend());
        store.setDisplayLanguage(DisplayLanguage.JAPANESE);
        RecordingActions actions = new RecordingActions(true);

        assertFalse(MorpheSettingsFragment.handleDisplayLanguageChange("en", store, actions));
        assertEquals(DisplayLanguage.JAPANESE, store.getDisplayLanguage());
        assertFalse(actions.recreated);
    }

    @Test
    public void formatsCacheSizesForCompactSettingsSummaries() {
        assertEquals("0 B", MorpheSettingsFragment.formatCacheSize(0));
        assertEquals("1.0 KiB", MorpheSettingsFragment.formatCacheSize(1024));
        assertEquals("1.5 MiB", MorpheSettingsFragment.formatCacheSize(1572864));
    }

    @Test
    public void cacheClearReportsSuccessAndFailureWithoutThrowing() {
        RecordingCacheActions success = new RecordingCacheActions(false);
        RecordingCacheActions failure = new RecordingCacheActions(true);

        assertTrue(MorpheSettingsFragment.handleClearCache(success));
        assertTrue(success.cleared);
        assertFalse(MorpheSettingsFragment.handleClearCache(failure));
    }

    @Test
    public void cacheSizeRunsOffThreadAndPostsResultToUiExecutor() {
        QueuedExecutor background = new QueuedExecutor();
        QueuedExecutor ui = new QueuedExecutor();
        RecordingCacheIoActions cache = new RecordingCacheIoActions(42L, false);
        RecordingCacheResult result = new RecordingCacheResult();

        MorpheSettingsFragment.loadCacheSizeAsync(background, ui, cache, result);

        assertFalse(cache.sizeRead);
        assertFalse(result.completed);
        background.runNext();
        assertTrue(cache.sizeRead);
        assertFalse(result.completed);
        ui.runNext();
        assertTrue(result.completed);
        assertTrue(result.success);
        assertEquals(42L, result.sizeBytes);
    }

    @Test
    public void cacheClearFailureIsReportedOnlyOnUiExecutor() {
        QueuedExecutor background = new QueuedExecutor();
        QueuedExecutor ui = new QueuedExecutor();
        RecordingCacheIoActions cache = new RecordingCacheIoActions(21L, true);
        RecordingCacheResult result = new RecordingCacheResult();

        MorpheSettingsFragment.clearCacheAsync(background, ui, cache, result);

        assertFalse(cache.cleared);
        background.runNext();
        assertTrue(cache.cleared);
        assertTrue(cache.sizeRead);
        assertFalse(result.completed);
        ui.runNext();
        assertTrue(result.completed);
        assertFalse(result.success);
        assertEquals(21L, result.sizeBytes);
    }

    @Test
    public void cacheExecutorUsesAFiniteQueue() {
        ThreadPoolExecutor executor = MorpheSettingsFragment.createCacheExecutor();
        try {
            assertTrue(executor.getQueue().remainingCapacity() < Integer.MAX_VALUE);
        } finally {
            executor.shutdownNow();
        }
    }

    @Test
    public void rejectedCacheWorkPostsFailureToUiExecutor() {
        Executor rejecting = task -> {
            throw new RejectedExecutionException("full");
        };
        QueuedExecutor ui = new QueuedExecutor();
        RecordingCacheResult result = new RecordingCacheResult();

        MorpheSettingsFragment.loadCacheSizeAsync(
                rejecting,
                ui,
                new RecordingCacheIoActions(42L, false),
                result
        );

        assertFalse(result.completed);
        ui.runNext();
        assertTrue(result.completed);
        assertFalse(result.success);
        assertEquals(0L, result.sizeBytes);
    }

    private static final class RecordingActions
            implements MorpheSettingsFragment.LanguageChangeActions {
        private DisplayLanguage appliedLanguage;
        private boolean recreated;
        private final boolean failApply;

        private RecordingActions() {
            this(false);
        }

        private RecordingActions(boolean failApply) {
            this.failApply = failApply;
        }

        @Override
        public void apply(DisplayLanguage language) {
            if (failApply) {
                throw new IllegalStateException("expected");
            }
            appliedLanguage = language;
        }

        @Override
        public void recreateHost() {
            recreated = true;
        }
    }

    private static final class TestBackend implements SettingsStore.Backend {
        private final Map<String, Boolean> booleans = new HashMap<>();
        private final Map<String, String> strings = new HashMap<>();

        @Override
        public boolean getBoolean(String key, boolean defaultValue) {
            return booleans.getOrDefault(key, defaultValue);
        }

        @Override
        public void putBoolean(String key, boolean value) {
            booleans.put(key, value);
        }

        @Override
        public String getString(String key, String defaultValue) {
            return strings.getOrDefault(key, defaultValue);
        }

        @Override
        public void putString(String key, String value) {
            strings.put(key, value);
        }
    }

    private static final class RecordingCacheActions
            implements MorpheSettingsFragment.CacheActions {
        private final boolean fail;
        private boolean cleared;

        private RecordingCacheActions(boolean fail) {
            this.fail = fail;
        }

        @Override
        public void clear() throws IOException {
            if (fail) {
                throw new IOException("expected");
            }
            cleared = true;
        }
    }

    private static final class QueuedExecutor implements Executor {
        private final ArrayDeque<Runnable> tasks = new ArrayDeque<>();

        @Override
        public void execute(Runnable task) {
            tasks.add(task);
        }

        private void runNext() {
            tasks.remove().run();
        }
    }

    private static final class RecordingCacheIoActions
            implements MorpheSettingsFragment.CacheIoActions {
        private final long sizeBytes;
        private final boolean failClear;
        private boolean sizeRead;
        private boolean cleared;

        private RecordingCacheIoActions(long sizeBytes, boolean failClear) {
            this.sizeBytes = sizeBytes;
            this.failClear = failClear;
        }

        @Override
        public long sizeBytes() {
            sizeRead = true;
            return sizeBytes;
        }

        @Override
        public void clear() throws IOException {
            cleared = true;
            if (failClear) throw new IOException("expected");
        }
    }

    private static final class RecordingCacheResult
            implements MorpheSettingsFragment.CacheResultActions {
        private boolean completed;
        private boolean success;
        private long sizeBytes;

        @Override
        public void complete(boolean success, long sizeBytes) {
            completed = true;
            this.success = success;
            this.sizeBytes = sizeBytes;
        }
    }
}