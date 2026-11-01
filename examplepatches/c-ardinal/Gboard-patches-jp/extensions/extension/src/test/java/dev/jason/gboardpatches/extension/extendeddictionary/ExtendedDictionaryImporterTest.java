package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

@RunWith(RobolectricTestRunner.class)
public final class ExtendedDictionaryImporterTest {
    private static final String NOUN = ExtendedDictionaryImporter.JAPANESE_DEFAULT_POS_TAG;

    private ManagedEntryStore store;
    private FakeGateway gateway;

    @Before
    public void setUp() {
        Context context = RuntimeEnvironment.getApplication();
        context.getSharedPreferences(ManagedEntryStore.PREF_FILE, Context.MODE_PRIVATE)
                .edit().clear().commit();
        context.deleteDatabase(ManagedEntryStore.DATABASE_NAME);
        store = ManagedEntryStore.open(context);
        gateway = new FakeGateway();
    }

    @Test
    public void japaneseRowsWithReadingsMozcRejectsAreSkippedAndCountedSeparately() {
        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(
                        row("こうちく", "構築", "ja-JP", ""),
                        row("コーヒー", "珈琲", "ja-JP", ""),
                        row("構築", "構築", "ja-JP", ""),
                        row("", "犬", "ja-JP", ""),
                        row("構築", "構築", "zh-TW", "")));

        assertEquals(3, result.inserted);
        assertEquals(2, result.skippedReading);
        assertEquals(0, result.skippedExisting);
        assertFalse(gateway.contains("構築", "構築", "ja-JP"));
        assertTrue(gateway.contains("構築", "構築", "zh-TW-x-extdict"));
    }

    @Test
    public void mozcReadingFilterMatchesGboardsCharacterSet() {
        assertTrue(ExtendedDictionaryImporter.isMozcReading("abc!~"));
        assertTrue(ExtendedDictionaryImporter.isMozcReading("ぁゖ゛゜"));
        assertTrue(ExtendedDictionaryImporter.isMozcReading("ァヶ・ー"));
        assertTrue(ExtendedDictionaryImporter.isMozcReading("、。「』〜"));
        assertTrue(ExtendedDictionaryImporter.isMozcReading("！～｡ﾟ"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading(""));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("a b"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("゗"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("ヷ"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("　"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("一"));
        assertFalse(ExtendedDictionaryImporter.isMozcReading("a".repeat(257)));
        assertTrue(ExtendedDictionaryImporter.isMozcReading("a".repeat(256)));
    }

    @Test
    public void importDropsStoredEntriesTheUserDeletedEvenWhenNothingIsInserted() {
        long userId = gateway.addUserRow("Mine", "m", "en-US", "");
        store.save(Collections.singletonList(
                new ManagedEntryStore.Entry(999L, "Gone", "g", "en-US", "")));

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Collections.singletonList(row("m", "Mine", "en-US", "")));

        assertEquals(0, result.inserted);
        assertEquals(1, result.forgotten);
        assertTrue(store.load().isEmpty());
        assertTrue(gateway.rows.containsKey(userId));
    }

    @Test
    public void reusedRowidWithADifferentPosIsNotDeleted() {
        ExtendedDictionaryImporter.importRows(gateway, store, Collections.singletonList(
                row("いぬ", "犬", "ja-JP", "")));
        long id = store.load().get(0).id;
        gateway.rows.put(id, new String[] {"犬", "いぬ", "ja-JP", "人名"});

        ExtendedDictionaryImporter.RemoveResult result =
                ExtendedDictionaryImporter.removeAll(gateway, store);

        assertEquals(0, result.deleted);
        assertEquals(1, result.forgotten);
        assertTrue(gateway.rows.containsKey(id));
        assertTrue(gateway.deletedIds.isEmpty());
    }

    @Test
    public void skipsExistingUserRowsAndDuplicatesAndTracksOnlyNewRows() {
        long userId = gateway.addUserRow("Alpha", "a", "en-US", "");

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(row("a", "Alpha", "en-US", ""),
                        row("b", "Beta", "en-US", ""), row("b", "Beta", "en-US", "")));

        assertFalse(result.rolledBack);
        assertEquals(1, result.inserted);
        assertEquals(2, result.skippedExisting);
        List<ManagedEntryStore.Entry> managed = store.load();
        assertEquals(1, managed.size());
        assertEquals("Beta", managed.get(0).word);
        assertFalse(managed.stream().anyMatch(entry -> entry.id == userId));
        assertTrue(gateway.rows.containsKey(userId));
        assertEquals(1, gateway.insertBatches);
    }

    @Test
    public void inFileDuplicatesCollapseOnTheNormalizedLanguageTag() {
        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(row("a", "A", "ja-jp", ""),
                        row("a", "A", "ja-JP", "")));

        assertEquals(1, result.inserted);
        assertEquals(1, result.skippedExisting);
        assertEquals(1, gateway.rows.size());
    }

    @Test
    public void removalReportsProgressUpToTheMatchingCount() {
        ExtendedDictionaryImporter.importRows(gateway, store, Arrays.asList(
                row("a", "A", "en-US", ""), row("b", "B", "en-US", "")));
        List<int[]> calls = new ArrayList<>();

        ExtendedDictionaryImporter.removeAll(gateway, store,
                (done, total) -> calls.add(new int[] {done, total}));

        assertEquals(0, calls.get(0)[0]);
        assertEquals(2, calls.get(calls.size() - 1)[0]);
        assertTrue(calls.stream().allMatch(call -> call[1] == 2));
    }

    @Test
    public void japaneseRowsDefaultToNounAndOtherLocalesNeverPassPosTags() {
        ExtendedDictionaryImporter.importRows(gateway, store, Arrays.asList(
                row("こう", "構築", "ja-JP", ""),
                row("いぬ", "犬", "ja-JP", "固有名詞"),
                row("omw", "On my way!", "en-US", "名詞"),
                row("", "Hallo", "de", "noun")));

        assertEquals(Arrays.asList(NOUN, "固有名詞", "", ""),
                gateway.insertedPosTags);
    }

    @Test
    public void japaneseDefaultPosToleratesTagCaseAndUnderscore() {
        assertEquals(NOUN, ExtendedDictionaryImporter.posTagFor(row("a", "A", "ja-jp", "")));
        assertEquals(NOUN, ExtendedDictionaryImporter.posTagFor(row("a", "A", "ja_JP", "")));
        assertEquals(NOUN, ExtendedDictionaryImporter.posTagFor(row("a", "A", "ja", "")));
        assertEquals(NOUN, ExtendedDictionaryImporter.posTagFor(
                row("a", "A", ExtendedDictionaryImporter.EXTENDED_JA_TAG, "")));
        assertEquals("", ExtendedDictionaryImporter.posTagFor(row("a", "A", "jam", "")));
        assertTrue(ExtendedDictionaryImporter.isJapaneseLanguage("ja_JP"));
        assertFalse(ExtendedDictionaryImporter.isJapaneseLanguage("en-JA"));
        assertFalse(ExtendedDictionaryImporter.isJapaneseLanguage(""));
    }

    @Test
    public void everyLanguageMovesToItsExtendedTagOnceAndSkipsUserRowsUnderTheOriginal() {
        gateway.addUserRow("Hund", "", "de", "");

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(
                        row("", "Hund", "de", ""),
                        row("omw", "On my way!", "en-US", ""),
                        row("brb", "Be right back", "en-US-x-extdict", ""),
                        row("brb", "Be right back", "en-US", ""),
                        row("", "Everywhere", "", "")));

        assertEquals(3, result.inserted);
        assertEquals(2, result.skippedExisting);
        List<String> tags = store.load().stream().map(entry -> entry.localeTag).toList();
        assertEquals(Arrays.asList("en-US-x-extdict", "en-US-x-extdict", ""), tags);
        assertTrue(ExtendedDictionaryImporter.isExtendedTag("EN-us-X-EXTDICT"));
        assertFalse(ExtendedDictionaryImporter.isExtendedTag("en-US"));
        assertFalse(ExtendedDictionaryImporter.isExtendedTag("x-extdict"));
    }

    @Test
    public void reportsInsertedRowsWithoutAnEnabledLanguageOnlyWhenKnown() {
        List<WordListParser.Row> rows = Arrays.asList(
                row("omw", "On my way!", "en-US", ""),
                row("tc", "Take care", "en-GB", ""),
                row("", "Everywhere", "", ""));

        assertEquals(0, ExtendedDictionaryImporter.importRows(gateway, store, rows)
                .unmatchedLanguage);

        gateway.rows.clear();
        store.save(Collections.emptyList());
        gateway.enabledLanguageRegions = new java.util.HashSet<>(Arrays.asList("en-US", "ja-JP"));
        ExtendedDictionaryImporter.ImportResult result =
                ExtendedDictionaryImporter.importRows(gateway, store, rows);

        assertEquals(3, result.inserted);
        assertEquals(1, result.unmatchedLanguage);
    }

    @Test
    public void japaneseRowsMoveToTheExtendedTagButNeverDuplicateAUsersJapaneseEntry() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        long userId = gateway.addUserRow("犬", "いぬ", "ja-JP", "");

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(
                        row("いぬ", "犬", "ja-JP", ""),
                        row("ねこ", "猫", "ja-jp", ""),
                        row("cat", "Cat", "en-US", "")));

        assertEquals(2, result.inserted);
        assertEquals(1, result.skippedExisting);
        List<ManagedEntryStore.Entry> managed = store.load();
        assertEquals(extended, managed.get(0).localeTag);
        assertEquals(NOUN, managed.get(0).posTag);
        assertEquals("en-US-x-extdict", managed.get(1).localeTag);
        assertTrue(gateway.contains("猫", "ねこ", extended));
        assertFalse(gateway.contains("猫", "ねこ", "ja-JP"));
        assertEquals(1, gateway.rows.values().stream()
                .filter(row -> row[0].equals("犬")).count());
        assertTrue(gateway.rows.containsKey(userId));

        assertEquals(0, ExtendedDictionaryImporter.importRows(gateway, store,
                Collections.singletonList(row("ねこ", "猫", "ja-JP", ""))).inserted);
    }

    @Test
    public void progressIsThrottledMonotonicAndEndsAtTotal() {
        gateway.addUserRow("word7", "s", "en-US", "");
        List<WordListParser.Row> rows = new ArrayList<>();
        for (int index = 0; index < 1000; index++) {
            rows.add(row("s", "word" + index, "en-US", ""));
        }
        List<int[]> calls = new ArrayList<>();

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, rows, (done, total) -> calls.add(new int[] {done, total}),
                new AtomicBoolean());

        assertEquals(999, result.inserted);
        assertEquals(1, result.skippedExisting);
        assertEquals(999, store.load().size());
        assertTrue(calls.size() >= 2);
        assertTrue(calls.size() <= 2 + 1000 / ExtendedDictionaryImporter.ProgressThrottle
                .PROGRESS_ROW_STEP + 2);
        int previous = -1;
        for (int[] call : calls) {
            assertEquals(999, call[1]);
            assertTrue(call[0] >= previous);
            previous = call[0];
        }
        assertEquals(0, calls.get(0)[0]);
        assertEquals(999, calls.get(calls.size() - 1)[0]);
    }

    @Test
    public void batchFailureLeavesDictionaryAndStoreUnchanged() {
        ManagedEntryStore.Entry previous =
                new ManagedEntryStore.Entry(gateway.addUserRow("Old", "o", "en-US", ""),
                        "Old", "o", "en-US", "");
        store.save(Collections.singletonList(previous));
        long userId = gateway.addUserRow("Mine", "m", "en-US", "");
        gateway.failure = new IllegalStateException("simulated database failure");

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Arrays.asList(row("a", "A", "en-US", ""),
                        row("b", "B", "en-US", "")));

        assertTrue(result.rolledBack);
        assertFalse(result.cancelled);
        assertEquals(0, result.inserted);
        assertEquals(0, result.rollbackLeftovers);
        assertTrue(gateway.deletedIds.isEmpty());
        assertEquals(Collections.singletonList(previous.id),
                store.load().stream().map(entry -> entry.id).toList());
        assertTrue(gateway.rows.containsKey(userId));
        assertEquals(2, gateway.rows.size());
    }

    @Test
    public void errorAfterTheStoreWriteLeavesRowsAndStoreConsistent() {
        gateway.languageCheckError = new OutOfMemoryError("simulated heap exhaustion");
        List<WordListParser.Row> rows = Arrays.asList(
                row("a", "A", "ja-JP", ""), row("b", "B", "ja-JP", ""));

        ExtendedDictionaryImporter.ImportResult result =
                ExtendedDictionaryImporter.importRows(gateway, store, rows);

        assertFalse(result.rolledBack);
        assertEquals(2, result.inserted);
        assertEquals(2, gateway.rows.size());
        assertEquals(2, store.load().size());
        assertEquals(0, gateway.matchingCalls);
        assertEquals(2, ExtendedDictionaryImporter.importRows(gateway, store, rows)
                .skippedExisting);
        assertEquals(2, store.load().size());
    }

    @Test
    public void cancellationLeavesDictionaryAndStoreUnchanged() {
        gateway.failure = new CancellationException();

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Collections.singletonList(row("a", "A", "en-US", "")));

        assertTrue(result.cancelled);
        assertFalse(result.rolledBack);
        assertEquals(0, result.inserted);
        assertTrue(store.load().isEmpty());
        assertTrue(gateway.rows.isEmpty());
    }

    @Test
    public void insertedIdsAreRecordedAsIsButRemovalStillChecksContent() {
        long userId = gateway.addUserRow("Other", "x", "en-US", "");
        gateway.forcedIds = new long[] {userId};

        ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                gateway, store, Collections.singletonList(row("a", "A", "en-US", "")));
        assertEquals(1, result.inserted);
        assertEquals(0, gateway.matchingCalls);

        ExtendedDictionaryImporter.RemoveResult removed =
                ExtendedDictionaryImporter.removeAll(gateway, store);

        assertEquals(0, removed.deleted);
        assertEquals(1, removed.forgotten);
        assertTrue(gateway.deletedIds.isEmpty());
        assertTrue(gateway.rows.containsKey(userId));
    }

    @Test
    public void removalDeletesOnlyMatchingRowsAndForgetsChangedOnes() {
        ExtendedDictionaryImporter.importRows(gateway, store, Arrays.asList(
                row("a", "A", "en-US", ""), row("b", "B", "en-US", "")));
        List<ManagedEntryStore.Entry> managed = store.load();
        long editedId = managed.get(1).id;
        gateway.rows.put(editedId, new String[] {"B edited", "b", "en-US", ""});
        long userId = gateway.addUserRow("Mine", "m", "en-US", "");

        ExtendedDictionaryImporter.RemoveResult result =
                ExtendedDictionaryImporter.removeAll(gateway, store);

        assertEquals(1, result.deleted);
        assertEquals(1, result.forgotten);
        assertEquals(0, result.failed);
        assertEquals(Collections.singletonList(managed.get(0).id), gateway.deletedIds);
        assertTrue(gateway.rows.containsKey(editedId));
        assertTrue(gateway.rows.containsKey(userId));
        assertTrue(store.load().isEmpty());
    }

    @Test
    public void removalKeepsEntriesWhoseDeleteFailedForALaterRetry() {
        ExtendedDictionaryImporter.importRows(gateway, store,
                Collections.singletonList(row("a", "A", "en-US", "")));
        gateway.failDeletes = true;

        ExtendedDictionaryImporter.RemoveResult result =
                ExtendedDictionaryImporter.removeAll(gateway, store);

        assertEquals(0, result.deleted);
        assertEquals(1, result.failed);
        assertEquals(1, store.load().size());
    }

    private static WordListParser.Row row(String shortcut, String word, String localeTag,
            String posTag) {
        return new WordListParser.Row(shortcut, word, localeTag, posTag);
    }

    /** Transactional fake: a failing batch writes nothing. */
    static final class FakeGateway implements PersonalDictionaryGateway {
        final Map<Long, String[]> rows = new LinkedHashMap<>();
        final List<String> insertedPosTags = new ArrayList<>();
        final List<Long> deletedIds = new ArrayList<>();
        RuntimeException failure;
        int matchingCalls;
        int failMatchingCall = -1;
        Error languageCheckError;
        long[] forcedIds;
        java.util.Set<String> enabledLanguageRegions;
        boolean failDeletes;
        int insertBatches;
        private long nextId = 100L;

        long addUserRow(String word, String shortcut, String localeTag, String posTag) {
            long id = nextId++;
            rows.put(id, new String[] {word, shortcut, localeTag, posTag});
            return id;
        }

        @Override
        public List<Long> japaneseExtendedIdsWithoutPos() {
            return Collections.emptyList();
        }

        @Override
        public int restorePos(Map<Long, String> posById) {
            return 0;
        }

        @Override
        public java.util.BitSet duplicateOrExisting(List<ManagedEntryStore.Entry> candidates,
                ExtendedDictionaryImporter.Progress progress) {
            java.util.BitSet skip = new java.util.BitSet();
            java.util.Set<String> seen = new java.util.HashSet<>();
            for (int index = 0; index < candidates.size(); index++) {
                ManagedEntryStore.Entry entry = candidates.get(index);
                String tag = normalizedTag(entry.localeTag);
                String original = ExtendedDictionaryImporter.isExtendedTag(tag)
                        ? normalizedTag(tag.substring(0, tag.length()
                                - ExtendedDictionaryImporter.EXTENDED_TAG_SUFFIX.length()))
                        : tag;
                if (!seen.add(entry.word + '\u0000' + entry.shortcut + '\u0000' + tag)
                        || contains(entry.word, entry.shortcut, tag)
                        || contains(entry.word, entry.shortcut, original)) {
                    skip.set(index);
                }
                progress.onProgress(index + 1, candidates.size());
            }
            return skip;
        }

        @Override
        public boolean contains(String word, String shortcut, String localeTag) {
            return rows.values().stream().anyMatch(row -> row[0].equals(word)
                    && row[1].equals(shortcut) && row[2].equals(localeTag));
        }

        @Override
        public boolean exists(long id, String word, String shortcut, String localeTag,
                String posTag) {
            String[] row = rows.get(id);
            return row != null && row[0].equals(word) && row[1].equals(shortcut)
                    && row[2].equals(localeTag) && row[3].equals(posTag);
        }

        @Override
        public long[] insertAll(List<ManagedEntryStore.Entry> entries,
                ExtendedDictionaryImporter.Progress progress, AtomicBoolean cancel) {
            insertBatches++;
            if (failure != null) {
                throw failure;
            }
            if (forcedIds != null) {
                return forcedIds;
            }
            long[] ids = new long[entries.size()];
            for (int index = 0; index < entries.size(); index++) {
                ManagedEntryStore.Entry entry = entries.get(index);
                insertedPosTags.add(entry.posTag);
                ids[index] = addUserRow(entry.word, entry.shortcut, entry.localeTag,
                        entry.posTag);
                progress.onProgress(index + 1, entries.size());
            }
            return ids;
        }

        @Override
        public void deleteAll(List<ManagedEntryStore.Entry> entries,
                ExtendedDictionaryImporter.Progress progress) {
            if (failDeletes) {
                throw new IllegalStateException("simulated delete failure");
            }
            for (int index = 0; index < entries.size(); index++) {
                deletedIds.add(entries.get(index).id);
                rows.remove(entries.get(index).id);
                progress.onProgress(index + 1, entries.size());
            }
        }

        @Override
        public java.util.Set<Long> matchingIds(List<ManagedEntryStore.Entry> entries) {
            matchingCalls++;
            if (matchingCalls == failMatchingCall) {
                throw new OutOfMemoryError("simulated heap exhaustion");
            }
            java.util.Set<Long> ids = new java.util.HashSet<>();
            for (ManagedEntryStore.Entry entry : entries) {
                if (exists(entry.id, entry.word, entry.shortcut, entry.localeTag,
                        entry.posTag)) {
                    ids.add(entry.id);
                }
            }
            return ids;
        }

        @Override
        public int[] deleteImported(java.util.Iterator<ManagedEntryStore.Entry> managedById,
                java.util.Set<Long> keepIds, java.util.Set<Long> releasedIds,
                boolean includeUntracked, ExtendedDictionaryImporter.Progress progress,
                int total) {
            if (failDeletes) {
                throw new IllegalStateException("simulated delete failure");
            }
            int managed = 0;
            while (managedById.hasNext()) {
                long id = managedById.next().id;
                if (!keepIds.contains(id)) {
                    deletedIds.add(id);
                    rows.remove(id);
                    progress.onProgress(++managed, total);
                }
            }
            List<Long> orphans = new ArrayList<>();
            rows.forEach((id, row) -> {
                if (includeUntracked && ExtendedDictionaryImporter.isExtendedTag(row[2])
                        && !keepIds.contains(id) && !releasedIds.contains(id)) {
                    orphans.add(id);
                }
            });
            orphans.forEach(rows::remove);
            return new int[] {managed, orphans.size()};
        }

        @Override
        public java.util.Set<Long> mismatchedIds(
                java.util.Iterator<ManagedEntryStore.Entry> entriesById) {
            java.util.Set<Long> ids = new java.util.HashSet<>();
            entriesById.forEachRemaining(entry -> {
                if (!exists(entry.id, entry.word, entry.shortcut, entry.localeTag,
                        entry.posTag)) {
                    ids.add(entry.id);
                }
            });
            return ids;
        }

        @Override
        public int countUntracked(java.util.Iterator<ManagedEntryStore.Entry> managedById,
                java.util.Set<Long> excludedIds) {
            java.util.Set<Long> managed = new java.util.HashSet<>();
            managedById.forEachRemaining(entry -> managed.add(entry.id));
            return (int) rows.entrySet().stream().filter(row ->
                    ExtendedDictionaryImporter.isExtendedTag(row.getValue()[2])
                            && !managed.contains(row.getKey())
                            && !excludedIds.contains(row.getKey())).count();
        }

        @Override
        public java.util.Set<Long> existingIds(java.util.Collection<Long> ids) {
            java.util.Set<Long> existing = new java.util.HashSet<>(ids);
            existing.retainAll(rows.keySet());
            return existing;
        }

        @Override
        public int countWithoutEnabledLanguage(List<ManagedEntryStore.Entry> entries) {
            if (languageCheckError != null) {
                throw languageCheckError;
            }
            if (enabledLanguageRegions == null) {
                return -1;
            }
            int unmatched = 0;
            for (ManagedEntryStore.Entry entry : entries) {
                String[] subtags = entry.localeTag.split("-");
                String key = subtags[0] + "-" + (subtags.length > 1 ? subtags[1] : "");
                if (!entry.localeTag.isEmpty() && !enabledLanguageRegions.contains(key)) {
                    unmatched++;
                }
            }
            return unmatched;
        }

        @Override
        public String normalizedTag(String localeTag) {
            return "ja-jp".equalsIgnoreCase(localeTag) ? "ja-JP" : localeTag;
        }
    }
}
