package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

@RunWith(RobolectricTestRunner.class)
public final class GboardPersonalDictionaryReflectionGatewayTest {
    private static final String POS_TABLE = "ja_ext";
    private static final String NOUN = ExtendedDictionaryImporter.JAPANESE_DEFAULT_POS_TAG;

    private Context context;
    private SQLiteOpenHelper helper;
    private AtomicInteger notifications;
    private GboardPersonalDictionaryReflectionGateway gateway;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        helper = new PersonalDictionaryHelper(context, true);
        notifications = new AtomicInteger();
        gateway = new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE,
                notifications::incrementAndGet, tag -> tag);
    }

    @Test
    public void insertAllWritesEntriesAndPosRowsOnlyForJapaneseAndNotifiesOnce() {
        long userId = userRow("Mine", "m", "en-US");

        long[] ids = gateway.insertAll(Arrays.asList(
                entry("構築", "こう", "ja-JP", NOUN),
                entry("On my way!", "omw", "en-US", ""),
                entry("犬", "いぬ", "ja-JP", "")), noProgress(), new AtomicBoolean());

        assertEquals(3, ids.length);
        assertEquals(4, count("entry"));
        assertEquals(1, count(POS_TABLE));
        assertEquals(NOUN, posTag(ids[0]));
        assertEquals(1, notifications.get());
        assertTrue(gateway.exists(ids[1], "On my way!", "omw", "en-US", ""));
        assertTrue(gateway.contains("Mine", "m", "en-US"));
        assertFalse(gateway.exists(userId, "On my way!", "omw", "en-US", ""));
    }

    @Test
    public void insertAllHandlesAFullSizeImportInOneTransaction() {
        long[] ids = gateway.insertAll(rows(WordListParser.MAX_ROWS_PER_IMPORT), noProgress(),
                new AtomicBoolean());

        assertEquals(WordListParser.MAX_ROWS_PER_IMPORT, ids.length);
        assertEquals(WordListParser.MAX_ROWS_PER_IMPORT, count("entry"));
        assertEquals(1, notifications.get());
    }

    @Test
    public void orphanPosRowUnderAReusedRowidIsReplacedInsteadOfFailingTheImport() {
        insertPos(1L, "人名");

        long[] ids = gateway.insertAll(rows(1), noProgress(), new AtomicBoolean());

        assertEquals(1L, ids[0]);
        assertEquals(1, count(POS_TABLE));
        assertEquals(NOUN, posTag(1L));
        assertEquals(1, notifications.get());
    }

    @Test
    public void existsComparesThePosTagSoAReusedRowidWithAnotherPosDoesNotMatch() {
        long[] ids = gateway.insertAll(rows(1), noProgress(), new AtomicBoolean());
        long englishId = userRow("Word", "w", "en-US");
        assertTrue(gateway.exists(ids[0], "w0", "s0", "ja-JP", NOUN));
        assertTrue(gateway.exists(englishId, "Word", "w", "en-US", ""));
        helper.getWritableDatabase().execSQL(
                "UPDATE " + POS_TABLE + " SET pos_tag = ? WHERE _id = ?",
                new Object[] {"人名", ids[0]});
        insertPos(englishId, NOUN);

        GboardPersonalDictionaryReflectionGateway fresh =
                new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
                }, tag -> tag);
        assertFalse(fresh.exists(ids[0], "w0", "s0", "ja-JP", NOUN));
        assertTrue(fresh.exists(ids[0], "w0", "s0", "ja-JP", "人名"));
        assertFalse(fresh.exists(englishId, "Word", "w", "en-US", ""));
    }

    @Test
    public void removeKeepsUntrackedRowsUnlessAskedAndNeverEditedOnes() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        long userJapanese = userRow("Mine", "m", "ja-JP");
        insertPos(userJapanese, NOUN);
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            ExtendedDictionaryImporter.importRows(gateway, store, Arrays.asList(
                    new WordListParser.Row("a", "A", "ja-JP", ""),
                    new WordListParser.Row("b", "B", "ja-JP", "")));
            long userAdded = userRow("Lost", "l", extended);
            insertPos(userAdded, NOUN);
            long edited = store.load().get(1).id;
            helper.getWritableDatabase().execSQL(
                    "UPDATE entry SET word = 'B edited' WHERE _id = ?", new Object[] {edited});
            assertEquals(1, ExtendedDictionaryImporter.countUntracked(freshGateway(), store));

            ExtendedDictionaryImporter.RemoveResult trackedOnly =
                    ExtendedDictionaryImporter.removeAll(freshGateway(), store);
            assertEquals(1, trackedOnly.deleted);
            assertEquals(1, trackedOnly.forgotten);
            assertEquals(0, trackedOnly.orphansDeleted);
            assertEquals(0, store.count());
            assertEquals(Collections.singleton(edited), store.releasedIds());
            assertEquals(NOUN, posTag(userAdded));

            ExtendedDictionaryImporter.RemoveResult all = ExtendedDictionaryImporter.removeAll(
                    freshGateway(), store, (done, total) -> {
                    }, true);
            assertEquals(1, all.orphansDeleted);
            assertNull(posTag(userAdded));
            assertTrue(freshGateway().exists(edited, "B edited", "b", extended, NOUN));
            assertEquals(NOUN, posTag(userJapanese));
            assertEquals(2, count("entry"));

            ExtendedDictionaryImporter.RemoveResult again = ExtendedDictionaryImporter.removeAll(
                    freshGateway(), store, (done, total) -> {
                    }, true);
            assertEquals(0, again.orphansDeleted);
            assertTrue(freshGateway().exists(edited, "B edited", "b", extended, NOUN));
        }
    }

    @Test
    public void releasedIdsArePrunedOnceTheUserDeletesTheRow() {
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            ExtendedDictionaryImporter.importRows(gateway, store, Collections.singletonList(
                    new WordListParser.Row("a", "A", "ja-JP", "")));
            long id = store.load().get(0).id;
            helper.getWritableDatabase().execSQL(
                    "UPDATE entry SET word = 'A edited' WHERE _id = ?", new Object[] {id});
            ExtendedDictionaryImporter.importRows(freshGateway(), store, Collections.emptyList());
            assertEquals(Collections.singleton(id), store.releasedIds());

            helper.getWritableDatabase().delete("entry", "_id = ?",
                    new String[] {String.valueOf(id)});
            ExtendedDictionaryImporter.importRows(freshGateway(), store, Collections.emptyList());
            assertTrue(store.releasedIds().isEmpty());
        }
    }

    private GboardPersonalDictionaryReflectionGateway freshGateway() {
        return new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
        }, tag -> tag);
    }

    @Test
    public void restoreRepairTouchesOnlyManagedRows() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        String properNoun = "\u56fa\u6709\u540d\u8a5e";
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            ExtendedDictionaryImporter.importRows(gateway, store, Arrays.asList(
                    new WordListParser.Row("a", "A", "ja-JP", properNoun),
                    new WordListParser.Row("b", "B", "ja-JP", ""),
                    new WordListParser.Row("c", "C", "ja-JP", "")));
            List<ManagedEntryStore.Entry> managed = store.load();
            long tracked = managed.get(0).id;
            long duplicated = managed.get(1).id;
            long released = managed.get(2).id;
            store.update(Collections.singletonList(released), Collections.emptyList());
            // What Gboard's Restore leaves: POS rows gone, a copy of B without POS, and a
            // restored word of ours that no store knows about.
            helper.getWritableDatabase().execSQL("DELETE FROM " + POS_TABLE);
            long copy = userRow("B", "b", extended);
            long restored = userRow("D", "d", extended);

            ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                    freshGateway(), store, Collections.emptyList());

            assertEquals(2, result.repairedPos);
            assertEquals(properNoun, posTag(tracked));
            assertEquals(NOUN, posTag(duplicated));
            assertNull(posTag(released));
            assertNull(posTag(copy));
            assertNull(posTag(restored));
            assertEquals(2, store.count());
            assertTrue(freshGateway().exists(copy, "B", "b", extended, ""));

            ExtendedDictionaryImporter.RemoveResult trackedOnly =
                    ExtendedDictionaryImporter.removeAll(freshGateway(), store);
            assertEquals(2, trackedOnly.deleted);
            assertTrue(freshGateway().exists(copy, "B", "b", extended, ""));
            assertTrue(freshGateway().exists(restored, "D", "d", extended, ""));

            ExtendedDictionaryImporter.RemoveResult all = ExtendedDictionaryImporter.removeAll(
                    freshGateway(), store, (done, total) -> {
                    }, true);
            assertEquals(2, all.orphansDeleted);
            assertFalse(freshGateway().exists(copy, "B", "b", extended, ""));
            assertTrue(freshGateway().exists(released, "C", "c", extended, ""));
        }
    }

    @Test
    public void repairNeverWritesPosForAUserRowThatReusedAManagedRowid() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            ExtendedDictionaryImporter.importRows(gateway, store, Collections.singletonList(
                    new WordListParser.Row("a", "A", "ja-JP", "")));
            long id = store.load().get(0).id;
            helper.getWritableDatabase().execSQL("DELETE FROM entry");
            helper.getWritableDatabase().execSQL("DELETE FROM " + POS_TABLE);
            long reused = userRow("Other", "o", extended);
            assertEquals(id, reused);

            ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                    freshGateway(), store, Collections.emptyList());

            assertEquals(0, result.repairedPos);
            assertNull(posTag(reused));
            assertEquals(1, result.forgotten);
            assertEquals(0, store.count());
        }
    }

    @Test
    public void duplicateOrExistingIsDecidedBySqliteAndLeavesNoTempTables() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        userRow("犬", "いぬ", "ja-JP");
        userRow("A", "a", "en-US-x-extdict");
        helper.getWritableDatabase().execSQL(
                "INSERT INTO entry(word, shortcut, locale) VALUES ('NoReading', NULL, 'de')");

        java.util.BitSet skip = gateway.duplicateOrExisting(Arrays.asList(
                entry("犬", "いぬ", extended, NOUN),
                entry("猫", "ねこ", extended, NOUN),
                entry("猫", "ねこ", extended, NOUN),
                entry("A", "a", "en-US-x-extdict", ""),
                entry("NoReading", "", "de-x-extdict", ""),
                entry("B", "b", "en-US-x-extdict", "")), noProgress());

        assertEquals(java.util.BitSet.valueOf(new long[] {0b011101}), skip);
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                "SELECT COUNT(*) FROM sqlite_temp_master", null)) {
            cursor.moveToFirst();
            assertEquals(0, cursor.getInt(0));
        }
    }

    @Test
    public void matchingIdsStreamsTheTableInRowidOrder() {
        long userId = userRow("Mine", "m", "en-US");
        long[] ids = gateway.insertAll(rows(3), noProgress(), new AtomicBoolean());

        java.util.Set<Long> matching = gateway.matchingIds(Arrays.asList(
                new ManagedEntryStore.Entry(ids[2], "w2", "s2", "ja-JP", NOUN),
                new ManagedEntryStore.Entry(userId, "Mine", "m", "en-US", ""),
                new ManagedEntryStore.Entry(ids[0], "w0", "s0", "ja-JP", ""),
                new ManagedEntryStore.Entry(ids[1], "changed", "s1", "ja-JP", NOUN),
                new ManagedEntryStore.Entry(9_999L, "w9", "s9", "ja-JP", NOUN)));

        assertEquals(new java.util.HashSet<>(Arrays.asList(ids[2], userId)), matching);
        assertTrue(gateway.matchingIds(Collections.emptyList()).isEmpty());
        assertEquals(new java.util.HashSet<>(Arrays.asList(ids[1], 9_999L)),
                gateway.mismatchedIds(Arrays.asList(
                        new ManagedEntryStore.Entry(userId, "Mine", "m", "en-US", ""),
                        new ManagedEntryStore.Entry(ids[0], "w0", "s0", "ja-JP", NOUN),
                        new ManagedEntryStore.Entry(ids[1], "changed", "s1", "ja-JP", NOUN),
                        new ManagedEntryStore.Entry(9_999L, "w9", "s9", "ja-JP", NOUN))
                        .iterator()));
    }

    @Test
    public void enabledLanguageCheckIsFailSoft() {
        ClassLoader loader = getClass().getClassLoader();
        GboardEnabledLanguages languages = GboardEnabledLanguages.resolve(loader,
                FakeEnabledLanguages.class.getName(), FakeInputLanguage.class.getName(),
                FakeLanguageTag.class.getName());
        assertNotNull(languages);
        FakeEnabledLanguages.enabled = Arrays.asList(
                () -> FakeLanguageTag.g("en-US"), () -> FakeLanguageTag.g("ja-JP"));
        GboardPersonalDictionaryReflectionGateway checked =
                new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
                }, tag -> tag, languages);

        assertEquals(1, checked.countWithoutEnabledLanguage(Arrays.asList(
                entry("w", "s", "en-US-x-extdict", ""),
                entry("w", "s", "ja-JP-x-extdict", NOUN),
                entry("w", "s", "en-GB-x-extdict", ""),
                entry("w", "s", "", ""))));

        FakeEnabledLanguages.enabled = Collections.emptyList();
        assertEquals(-1, checked.countWithoutEnabledLanguage(
                Collections.singletonList(entry("w", "s", "en-GB", ""))));
        assertNull(GboardEnabledLanguages.resolve(loader, "missing.Languages",
                FakeInputLanguage.class.getName(), FakeLanguageTag.class.getName()));
        assertEquals(-1, gateway.countWithoutEnabledLanguage(
                Collections.singletonList(entry("w", "s", "en-GB", ""))));
    }

    @Test
    public void entriesRecordedUnderPlainJaJpByAnOlderBuildStayMatchedAndRemovable() {
        long legacyId = userRow("犬", "いぬ", "ja-JP");
        insertPos(legacyId, NOUN);
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.singletonList(new ManagedEntryStore.Entry(
                    legacyId, "犬", "いぬ", "ja-JP", NOUN)));

            ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                    gateway, store, Collections.singletonList(
                            new WordListParser.Row("ねこ", "猫", "ja-JP", "")));
            assertEquals(0, result.forgotten);
            assertEquals(2, store.count());

            ExtendedDictionaryImporter.RemoveResult removed = ExtendedDictionaryImporter.removeAll(
                    new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
                    }, tag -> tag), store);
            assertEquals(2, removed.deleted);
            assertEquals(0, count("entry"));
            assertEquals(0, count(POS_TABLE));
        }
    }

    @Test
    public void reimportedExtendedRowsKeepTagAndSkipOurs() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            store.save(Collections.emptyList());
            ExtendedDictionaryImporter.importRows(gateway, store, Collections.singletonList(
                    new WordListParser.Row("いぬ", "犬", "ja-JP", "")));

            ExtendedDictionaryImporter.ImportResult result = ExtendedDictionaryImporter.importRows(
                    new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
                    }, tag -> tag), store, Arrays.asList(
                            new WordListParser.Row("いぬ", "犬", extended, NOUN),
                            new WordListParser.Row("ねこ", "猫", extended, "")));

            assertFalse(result.rolledBack);
            assertEquals(1, result.inserted);
            assertEquals(1, result.skippedExisting);
            ManagedEntryStore.Entry added = store.load().get(1);
            assertEquals(extended, added.localeTag);
            assertEquals(NOUN, added.posTag);
            assertEquals(NOUN, posTag(added.id));
            assertEquals(2, count("entry"));
        }
    }

    @Test
    public void rowidReusedAfterTheUserDeletedAManagedRowDoesNotBreakTheNextImport() {
        context.deleteDatabase(ManagedEntryStore.DATABASE_NAME);
        for (int index = 1; index <= 100; index++) {
            userRow("user" + index, "u" + index, "en-US");
        }
        List<WordListParser.Row> first = new ArrayList<>();
        for (int index = 0; index < 100; index++) {
            first.add(new WordListParser.Row("s" + index, "first" + index, "en-US", ""));
        }
        try (ManagedEntryStore store = ManagedEntryStore.open(context)) {
            ExtendedDictionaryImporter.importRows(gateway, store, first);
            assertEquals(101L, store.load().get(0).id);
            assertEquals(200L, store.load().get(99).id);

            helper.getWritableDatabase().delete("entry", "_id = ?", new String[] {"200"});
            GboardPersonalDictionaryReflectionGateway next =
                    new GboardPersonalDictionaryReflectionGateway(helper, POS_TABLE, () -> {
                    }, tag -> tag);
            ExtendedDictionaryImporter.ImportResult result =
                    ExtendedDictionaryImporter.importRows(next, store, Collections.singletonList(
                            new WordListParser.Row("n", "newWord", "en-US", "")));

            assertFalse(result.rolledBack);
            assertEquals(1, result.inserted);
            assertEquals(1, result.forgotten);
            List<ManagedEntryStore.Entry> managed = store.load();
            assertEquals(100, managed.size());
            ManagedEntryStore.Entry reused = managed.get(99);
            assertEquals(200L, reused.id);
            assertEquals("newWord", reused.word);
            assertEquals(1, managed.stream().filter(entry -> entry.id == 200L).count());
        }
    }

    @Test
    public void extendedJapaneseTagGetsPosRowsAndPosAwareMatching() {
        String extended = ExtendedDictionaryImporter.EXTENDED_JA_TAG;
        long[] ids = gateway.insertAll(Collections.singletonList(
                entry("犬", "いぬ", extended, NOUN)), noProgress(), new AtomicBoolean());

        assertEquals(NOUN, posTag(ids[0]));
        assertTrue(gateway.exists(ids[0], "犬", "いぬ", extended, NOUN));
        assertFalse(gateway.exists(ids[0], "犬", "いぬ", extended, ""));
        gateway.deleteAll(Collections.singletonList(new ManagedEntryStore.Entry(
                ids[0], "犬", "いぬ", extended, NOUN)), noProgress());
        assertEquals(0, count("entry"));
        assertEquals(0, count(POS_TABLE));
    }

    @Test
    public void cancellingMidwayRollsBackEveryRowAndDoesNotNotify() {
        userRow("Mine", "m", "en-US");
        AtomicBoolean cancel = new AtomicBoolean();

        assertThrows(CancellationException.class, () -> gateway.insertAll(
                rows(10), (done, total) -> cancel.set(done == 3), cancel));

        assertEquals(1, count("entry"));
        assertEquals(0, count(POS_TABLE));
        assertEquals(0, notifications.get());
    }

    @Test
    public void failureMidwayRollsBackEveryRowAndDoesNotNotify() {
        try {
            gateway.insertAll(rows(10), (done, total) -> {
                if (done == 5) {
                    throw new IllegalStateException("simulated failure");
                }
            }, new AtomicBoolean());
            fail("Expected the batch to fail");
        } catch (IllegalStateException expected) {
            assertEquals(0, count("entry"));
            assertEquals(0, count(POS_TABLE));
            assertEquals(0, notifications.get());
        }
    }

    @Test
    public void deleteAllRemovesOnlyGivenRowsWithTheirPosRows() {
        long userId = userRow("Mine", "m", "ja-JP");
        insertPos(userId, NOUN);
        long[] ids = gateway.insertAll(rows(3), noProgress(), new AtomicBoolean());
        notifications.set(0);

        gateway.deleteAll(Collections.singletonList(
                new ManagedEntryStore.Entry(ids[1], "w1", "s1", "ja-JP", NOUN)), noProgress());

        assertEquals(3, count("entry"));
        assertEquals(3, count(POS_TABLE));
        assertNull(posTag(ids[1]));
        assertEquals(NOUN, posTag(userId));
        assertFalse(gateway.exists(ids[1], "w1", "s1", "ja-JP", NOUN));
        assertTrue(gateway.exists(ids[0], "w0", "s0", "ja-JP", NOUN));
        assertEquals(1, notifications.get());
    }

    @Test
    public void schemaCheckFailsClosedWhenThePosTableIsMissing() {
        assertTrue(gateway.hasExpectedSchema());
        GboardPersonalDictionaryReflectionGateway withoutPos =
                new GboardPersonalDictionaryReflectionGateway(
                        new PersonalDictionaryHelper(context, false), POS_TABLE, () -> {
                        }, tag -> tag);
        assertFalse(withoutPos.hasExpectedSchema());
    }

    @Test
    public void preflightFailsClosedWhenGboardClassesAreMissing() {
        ClassLoader loader = new ClassLoader(getClass().getClassLoader()) {
        };

        assertFalse(GboardPersonalDictionaryReflectionGateway.isSupported(loader));
        assertNull(GboardPersonalDictionaryReflectionGateway.open(context, loader));
        assertFalse(GboardPersonalDictionaryReflectionGateway.isSupported(null));
        assertNull(GboardPersonalDictionaryReflectionGateway.resolve(getClass().getClassLoader(),
                FakeDatabase.class.getName(), WrongBase.class.getName(),
                FakeTag.class.getName()));
    }

    @Test
    public void reflectionPathUsesTheHelperFieldPosTableNameAndNotifier() {
        GboardPersonalDictionaryReflectionGateway.Api api =
                GboardPersonalDictionaryReflectionGateway.resolve(getClass().getClassLoader(),
                        FakeDatabase.class.getName(), FakeBase.class.getName(),
                        FakeTag.class.getName());
        assertNotNull(api);
        FakeBase.notified = 0;

        GboardPersonalDictionaryReflectionGateway opened =
                GboardPersonalDictionaryReflectionGateway.open(context, api);
        assertNotNull(opened);
        long[] ids = opened.insertAll(Collections.singletonList(
                entry("犬", "いぬ", "ja-jp", NOUN)), noProgress(), new AtomicBoolean());

        assertEquals(1, FakeBase.notified);
        assertTrue(opened.exists(ids[0], "犬", "いぬ", "ja-jp", NOUN));
        opened.close();
    }

    private static ExtendedDictionaryImporter.Progress noProgress() {
        return (done, total) -> {
        };
    }

    private static ManagedEntryStore.Entry entry(String word, String shortcut, String tag,
            String pos) {
        return new ManagedEntryStore.Entry(-1L, word, shortcut, tag, pos);
    }

    private static List<ManagedEntryStore.Entry> rows(int count) {
        List<ManagedEntryStore.Entry> rows = new ArrayList<>();
        for (int index = 0; index < count; index++) {
            rows.add(entry("w" + index, "s" + index, "ja-JP", NOUN));
        }
        return rows;
    }

    private long userRow(String word, String shortcut, String tag) {
        SQLiteDatabase db = helper.getWritableDatabase();
        db.execSQL("INSERT INTO entry(word, shortcut, locale) VALUES (?, ?, ?)",
                new Object[] {word, shortcut, tag});
        try (Cursor cursor = db.rawQuery("SELECT last_insert_rowid()", null)) {
            cursor.moveToFirst();
            return cursor.getLong(0);
        }
    }

    private void insertPos(long id, String pos) {
        helper.getWritableDatabase().execSQL(
                "INSERT INTO " + POS_TABLE + "(_id, pos_tag) VALUES (?, ?)",
                new Object[] {id, pos});
    }

    private int count(String table) {
        try (Cursor cursor = helper.getReadableDatabase()
                .rawQuery("SELECT COUNT(*) FROM " + table, null)) {
            cursor.moveToFirst();
            return cursor.getInt(0);
        }
    }

    private String posTag(long id) {
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                "SELECT pos_tag FROM " + POS_TABLE + " WHERE _id = ?",
                new String[] {String.valueOf(id)})) {
            return cursor.moveToFirst() ? cursor.getString(0) : null;
        }
    }

    /** Same schema as Gboard 18.5.4 qpw (PersonalDictionary.db version 2), kept in memory. */
    static final class PersonalDictionaryHelper extends SQLiteOpenHelper {
        private final boolean withPosTable;

        PersonalDictionaryHelper(Context context, boolean withPosTable) {
            super(context, null, null, 2);
            this.withPosTable = withPosTable;
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE entry(_id INTEGER PRIMARY KEY, word TEXT, shortcut TEXT,"
                    + "locale TEXT)");
            if (withPosTable) {
                db.execSQL("CREATE TABLE IF NOT EXISTS " + POS_TABLE
                        + "(_id INTEGER PRIMARY KEY, pos_tag TEXT)");
            }
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        }
    }

    /** Stands in for Gboard's peu: a() returns the enabled input languages. */
    public static final class FakeEnabledLanguages {
        static List<FakeInputLanguage> enabled = Collections.emptyList();

        public static List<FakeInputLanguage> a() {
            return enabled;
        }
    }

    /** Stands in for Gboard's pev: i() returns the language tag used for routing. */
    public interface FakeInputLanguage {
        FakeLanguageTag i();
    }

    /** Stands in for Gboard's sfc: g = language, j = region. */
    public static final class FakeLanguageTag {
        public final String g;
        public final String j;

        private FakeLanguageTag(String language, String region) {
            this.g = language;
            this.j = region;
        }

        public static FakeLanguageTag g(String tag) {
            String[] subtags = tag.split("-");
            return new FakeLanguageTag(subtags[0], subtags.length > 1 ? subtags[1] : null);
        }
    }

    public static final class FakeTag {
        private final String tag;

        private FakeTag(String tag) {
            this.tag = tag;
        }

        public static FakeTag g(String tag) {
            return new FakeTag("ja-jp".equals(tag) ? "ja-JP" : tag);
        }

        @Override
        public String toString() {
            return tag;
        }
    }

    public abstract static class FakeBase {
        protected static final String a = POS_TABLE;
        static int notified;
        protected final SQLiteOpenHelper b;

        protected FakeBase(SQLiteOpenHelper helper) {
            this.b = helper;
        }

        static void h() {
            notified++;
        }
    }

    public static final class FakeDatabase extends FakeBase {
        public FakeDatabase(Context context) {
            super(new PersonalDictionaryHelper(context, true));
        }
    }

    public abstract static class WrongBase {
        protected static final String a = POS_TABLE;
        protected final Object b = null;

        static void f() {
        }
    }
}
