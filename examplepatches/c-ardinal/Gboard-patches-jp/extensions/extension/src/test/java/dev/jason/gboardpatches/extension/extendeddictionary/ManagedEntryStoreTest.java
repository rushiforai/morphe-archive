package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

@RunWith(RobolectricTestRunner.class)
public final class ManagedEntryStoreTest {
    private Context context;
    private ManagedEntryStore store;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        legacyPreferences().edit().clear().commit();
        context.deleteDatabase(ManagedEntryStore.DATABASE_NAME);
        store = ManagedEntryStore.open(context);
    }

    @After
    public void tearDown() {
        store.close();
    }

    @Test
    public void startsEmptyAndRoundTripsEntries() {
        assertTrue(store.load().isEmpty());
        assertEquals(0, store.count());

        store.save(Arrays.asList(
                new ManagedEntryStore.Entry(7L, "On my way!", "omw", "en-US", ""),
                new ManagedEntryStore.Entry(9L, "構築", "こう", "ja-JP",
                        "名詞")));

        try (ManagedEntryStore reopened = ManagedEntryStore.open(context)) {
            List<ManagedEntryStore.Entry> loaded = reopened.load();
            assertEquals(2, loaded.size());
            assertEquals(2, reopened.count());
            assertEquals(7L, loaded.get(0).id);
            assertEquals("On my way!", loaded.get(0).word);
            assertEquals("omw", loaded.get(0).shortcut);
            assertEquals("en-US", loaded.get(0).localeTag);
            assertEquals("", loaded.get(0).posTag);
            assertEquals("名詞", loaded.get(1).posTag);
        }

        store.save(Collections.emptyList());
        assertTrue(store.load().isEmpty());
        assertEquals(0, store.count());
    }

    @Test
    public void saveWithDuplicateIdsKeepsTheLastEntryInsteadOfFailing() {
        store.save(Collections.singletonList(
                new ManagedEntryStore.Entry(1L, "A", "a", "en-US", "")));

        store.save(Arrays.asList(
                new ManagedEntryStore.Entry(2L, "Old", "o", "en-US", ""),
                new ManagedEntryStore.Entry(2L, "New", "n", "en-US", "")));

        assertEquals(1, store.count());
        assertEquals(2L, store.load().get(0).id);
        assertEquals("New", store.load().get(0).word);
    }

    @Test
    public void updateRemovesAndAddsInOneStepAndIterationIsOrderedById() {
        store.save(Arrays.asList(
                new ManagedEntryStore.Entry(5L, "E", "e", "en", ""),
                new ManagedEntryStore.Entry(2L, "B", "b", "en", "")));

        store.update(Collections.singletonList(5L), Arrays.asList(
                new ManagedEntryStore.Entry(9L, "I", "i", "en", ""),
                new ManagedEntryStore.Entry(5L, "E2", "e", "en", "")));

        List<Long> ids = new ArrayList<>();
        List<String> words = new ArrayList<>();
        try (ManagedEntryStore.EntryCursor cursor = store.iterateById()) {
            cursor.forEachRemaining(entry -> {
                ids.add(entry.id);
                words.add(entry.word);
            });
        }
        assertEquals(Arrays.asList(2L, 5L, 9L), ids);
        assertEquals(Arrays.asList("B", "E2", "I"), words);
    }

    @Test
    public void migratesTheLegacyJsonPreferenceOnceAndClearsIt() {
        legacyPreferences().edit().putString(ManagedEntryStore.PREF_KEY_ENTRIES,
                "[{\"id\":5,\"word\":\"W\",\"shortcut\":\"w\",\"locale\":\"ja-JP\","
                        + "\"pos\":\"名詞\"},"
                        + "{\"id\":6,\"word\":\"X\",\"shortcut\":\"\",\"locale\":\"en\","
                        + "\"pos\":\"\"}]").commit();

        try (ManagedEntryStore migrating = ManagedEntryStore.open(context)) {
            assertEquals(2, migrating.count());
            assertEquals("名詞", migrating.load().get(0).posTag);
        }

        assertFalse(legacyPreferences().contains(ManagedEntryStore.PREF_KEY_ENTRIES));
        try (ManagedEntryStore reopened = ManagedEntryStore.open(context)) {
            assertEquals(2, reopened.count());
        }
    }

    @Test
    public void corruptLegacyStateFailsInsteadOfBeingSilentlyDropped() {
        legacyPreferences().edit()
                .putString(ManagedEntryStore.PREF_KEY_ENTRIES, "{not json").commit();

        try (ManagedEntryStore corrupt = ManagedEntryStore.open(context)) {
            assertThrows(IllegalStateException.class, corrupt::load);
        }
        assertTrue(legacyPreferences().contains(ManagedEntryStore.PREF_KEY_ENTRIES));
    }

    @Test
    public void largeListRoundTrips() {
        List<ManagedEntryStore.Entry> entries = new ArrayList<>();
        for (int index = 0; index < 85_000; index++) {
            entries.add(new ManagedEntryStore.Entry(index + 1L, "word" + index,
                    "よみ" + index, "ja-JP", "名詞"));
        }

        long start = System.nanoTime();
        store.save(entries);
        long saved = System.nanoTime();
        List<ManagedEntryStore.Entry> loaded = store.load();
        long end = System.nanoTime();
        System.out.println("ManagedEntryStore 85k: save " + (saved - start) / 1_000_000
                + " ms, load " + (end - saved) / 1_000_000 + " ms");

        assertEquals(85_000, loaded.size());
        assertEquals(85_000, store.count());
        assertEquals("word84999", loaded.get(84_999).word);
    }

    @Test
    public void isNotPartOfThePatchesBackupExport() throws Exception {
        assertNotEquals(GboardPatchesSettings.PREF_FILE, ManagedEntryStore.PREF_FILE);
        String backupManager = new String(Files.readAllBytes(Path.of(
                "src/main/java/dev/jason/gboardpatches/extension/backuprestore/"
                        + "GboardPatchesBackupManager.java")), StandardCharsets.UTF_8);
        assertFalse(backupManager.contains("extendeddictionary"));
        assertFalse(backupManager.contains(ManagedEntryStore.PREF_FILE));
        assertFalse(backupManager.contains("getDatabasePath"));
        assertFalse(backupManager.contains("databaseList"));
    }

    private SharedPreferences legacyPreferences() {
        return context.getSharedPreferences(ManagedEntryStore.PREF_FILE, Context.MODE_PRIVATE);
    }
}
