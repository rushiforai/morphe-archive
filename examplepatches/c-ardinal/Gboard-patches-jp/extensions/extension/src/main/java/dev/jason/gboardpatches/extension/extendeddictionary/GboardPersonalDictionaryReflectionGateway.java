package dev.jason.gboardpatches.extension.extendeddictionary;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Gboard 18.5.4 PersonalDictionary.db written in bulk through Gboard's own SQLiteOpenHelper
 * (qpz.b of a qqc instance), followed by Gboard's own change notification (qpz.h()).
 */
final class GboardPersonalDictionaryReflectionGateway
        implements PersonalDictionaryGateway, AutoCloseable {
    private static final String TAG = "GboardExtendedDictionary";
    private static final String DATABASE_CLASS = "qqc";
    private static final String DATABASE_BASE_CLASS = "qpz";
    private static final String LANGUAGE_TAG_CLASS = "sfc";
    private static final String ENABLED_LANGUAGES_CLASS = "peu";
    private static final String INPUT_LANGUAGE_CLASS = "pev";
    static final String ENTRY_TABLE = "entry";
    private static final List<String> ENTRY_COLUMNS =
            Arrays.asList("_id", "word", "shortcut", "locale");
    private static final List<String> POS_COLUMNS = Arrays.asList("_id", "pos_tag");

    private static final Object PREFLIGHT_LOCK = new Object();
    private static ClassLoader preflightLoader;
    private static Api preflightApi;
    private static boolean preflightDone;

    interface TagNormalizer {
        String normalize(String localeTag);
    }

    private final SQLiteOpenHelper helper;
    private final String posTable;
    private final Runnable changeNotifier;
    private final TagNormalizer tagNormalizer;
    private final Map<String, String> normalizedTags = new HashMap<>();
    private Set<String> rowKeys;

    private final GboardEnabledLanguages enabledLanguages;

    GboardPersonalDictionaryReflectionGateway(SQLiteOpenHelper helper, String posTable,
            Runnable changeNotifier, TagNormalizer tagNormalizer) {
        this(helper, posTable, changeNotifier, tagNormalizer, null);
    }

    GboardPersonalDictionaryReflectionGateway(SQLiteOpenHelper helper, String posTable,
            Runnable changeNotifier, TagNormalizer tagNormalizer,
            GboardEnabledLanguages enabledLanguages) {
        this.helper = helper;
        this.posTable = posTable;
        this.changeNotifier = changeNotifier;
        this.tagNormalizer = tagNormalizer;
        this.enabledLanguages = enabledLanguages;
    }

    static boolean isSupported(ClassLoader classLoader) {
        return preflight(classLoader) != null;
    }

    /** Returns null when this Gboard build does not expose the expected API or schema. */
    static GboardPersonalDictionaryReflectionGateway open(Context context,
            ClassLoader classLoader) {
        return open(context, preflight(classLoader), GboardEnabledLanguages.resolve(
                classLoader, ENABLED_LANGUAGES_CLASS, INPUT_LANGUAGE_CLASS, LANGUAGE_TAG_CLASS));
    }

    static GboardPersonalDictionaryReflectionGateway open(Context context, Api api) {
        return open(context, api, null);
    }

    static GboardPersonalDictionaryReflectionGateway open(Context context, Api api,
            GboardEnabledLanguages enabledLanguages) {
        if (api == null || context == null) {
            return null;
        }
        GboardPersonalDictionaryReflectionGateway gateway = null;
        try {
            Object database = api.databaseConstructor.newInstance(context);
            gateway = new GboardPersonalDictionaryReflectionGateway(
                    (SQLiteOpenHelper) api.helperField.get(database),
                    (String) api.posTableField.get(null),
                    () -> invoke(api.notifyChanged, null),
                    tag -> String.valueOf(invoke(api.fromTag, null, tag)),
                    enabledLanguages);
            if (gateway.hasExpectedSchema()) {
                return gateway;
            }
            Log.w(TAG, "Personal dictionary schema is not the expected one");
        } catch (Throwable failure) {
            Log.w(TAG, "Personal dictionary database could not be opened: "
                    + failure.getClass().getName());
        }
        if (gateway != null) {
            gateway.close();
        }
        return null;
    }

    static Api preflight(ClassLoader classLoader) {
        synchronized (PREFLIGHT_LOCK) {
            if (!preflightDone || preflightLoader != classLoader) {
                preflightApi = resolve(classLoader,
                        DATABASE_CLASS, DATABASE_BASE_CLASS, LANGUAGE_TAG_CLASS);
                preflightLoader = classLoader;
                preflightDone = true;
            }
            return preflightApi;
        }
    }

    static Api resolve(ClassLoader classLoader, String databaseClass, String baseClass,
            String languageTagClass) {
        if (classLoader == null) {
            return null;
        }
        try {
            Class<?> database = Class.forName(databaseClass, false, classLoader);
            Class<?> base = Class.forName(baseClass, false, classLoader);
            Class<?> languageTag = Class.forName(languageTagClass, false, classLoader);
            Field helper = base.getDeclaredField("b");
            Field posTable = base.getDeclaredField("a");
            Method notifyChanged = base.getDeclaredMethod("h");
            Method fromTag = languageTag.getMethod("g", String.class);
            if (!base.isAssignableFrom(database)
                    || !SQLiteOpenHelper.class.isAssignableFrom(helper.getType())
                    || Modifier.isStatic(helper.getModifiers())
                    || posTable.getType() != String.class
                    || !Modifier.isStatic(posTable.getModifiers())
                    || notifyChanged.getReturnType() != void.class
                    || !Modifier.isStatic(notifyChanged.getModifiers())
                    || fromTag.getReturnType() != languageTag
                    || !Modifier.isStatic(fromTag.getModifiers())) {
                return null;
            }
            helper.setAccessible(true);
            posTable.setAccessible(true);
            notifyChanged.setAccessible(true);
            return new Api(database.getConstructor(Context.class), helper, posTable,
                    notifyChanged, fromTag);
        } catch (Throwable failure) {
            Log.w(TAG, "Personal dictionary API is unavailable: " + failure.getClass().getName());
            return null;
        }
    }

    boolean hasExpectedSchema() {
        SQLiteDatabase db = helper.getWritableDatabase();
        return columns(db, ENTRY_TABLE).containsAll(ENTRY_COLUMNS)
                && posTable != null && !posTable.isEmpty()
                && columns(db, posTable).containsAll(POS_COLUMNS);
    }

    private static Set<String> columns(SQLiteDatabase db, String table) {
        Set<String> columns = new HashSet<>();
        try (Cursor cursor = db.rawQuery("PRAGMA table_info(" + quoted(table) + ")", null)) {
            int name = cursor.getColumnIndex("name");
            while (name >= 0 && cursor.moveToNext()) {
                columns.add(cursor.getString(name));
            }
        }
        return columns;
    }

    @Override
    public boolean contains(String word, String shortcut, String localeTag) {
        if (rowKeys == null) {
            loadRows();
        }
        return rowKeys.contains(key(word, shortcut, normalizedTag(localeTag)));
    }

    @Override
    public java.util.BitSet duplicateOrExisting(List<ManagedEntryStore.Entry> candidates,
            ExtendedDictionaryImporter.Progress progress) {
        java.util.BitSet skip = new java.util.BitSet(candidates.size());
        if (candidates.isEmpty()) {
            return skip;
        }
        SQLiteDatabase db = helper.getWritableDatabase();
        // No transaction: a transaction here would take Gboard's write lock (Android's BEGIN is
        // EXCLUSIVE or IMMEDIATE). TEMP tables only touch this connection's temp database and
        // this helper has a single connection, so they stay visible until dropped below.
        try {
            db.execSQL("CREATE TEMP TABLE ed_candidate(idx INTEGER PRIMARY KEY, word TEXT,"
                    + " shortcut TEXT, locale TEXT, original TEXT)");
            insertCandidates(db, candidates, progress);
            db.execSQL("CREATE TEMP TABLE ed_existing AS SELECT COALESCE(word, '') AS word,"
                    + " COALESCE(shortcut, '') AS shortcut, COALESCE(locale, '') AS locale"
                    + " FROM entry");
            db.execSQL("CREATE INDEX ed_existing_key ON ed_existing(word, shortcut, locale)");
            db.execSQL("CREATE INDEX ed_candidate_key ON ed_candidate(word, shortcut, locale)");
            try (Cursor cursor = db.rawQuery("SELECT idx FROM ed_candidate c WHERE EXISTS"
                    + " (SELECT 1 FROM ed_existing e WHERE e.word = c.word"
                    + " AND e.shortcut = c.shortcut AND e.locale IN (c.locale, c.original))"
                    + " OR EXISTS (SELECT 1 FROM ed_candidate d WHERE d.word = c.word"
                    + " AND d.shortcut = c.shortcut AND d.locale = c.locale AND d.idx < c.idx)",
                    null)) {
                while (cursor.moveToNext()) {
                    skip.set(cursor.getInt(0));
                }
            }
        } finally {
            try {
                db.execSQL("DROP TABLE IF EXISTS temp.ed_candidate");
                db.execSQL("DROP TABLE IF EXISTS temp.ed_existing");
            } catch (RuntimeException failure) {
                // Never mask the original failure; the temp tables die with the connection.
                Log.w(TAG, "Could not drop temp tables: " + failure.getClass().getName());
            }
        }
        return skip;
    }

    private static final int CANDIDATES_PER_STATEMENT = 150;

    /** Multi-row INSERTs keep the per-statement cost low without an enclosing transaction. */
    private void insertCandidates(SQLiteDatabase db, List<ManagedEntryStore.Entry> candidates,
            ExtendedDictionaryImporter.Progress progress) {
        for (int start = 0; start < candidates.size(); start += CANDIDATES_PER_STATEMENT) {
            int end = Math.min(candidates.size(), start + CANDIDATES_PER_STATEMENT);
            StringBuilder sql = new StringBuilder("INSERT INTO ed_candidate VALUES ");
            Object[] args = new Object[(end - start) * 5];
            for (int index = start; index < end; index++) {
                ManagedEntryStore.Entry entry = candidates.get(index);
                String tag = normalizedTag(entry.localeTag);
                int arg = (index - start) * 5;
                sql.append(index == start ? "(?, ?, ?, ?, ?)" : ", (?, ?, ?, ?, ?)");
                args[arg] = index;
                args[arg + 1] = nonNull(entry.word);
                args[arg + 2] = nonNull(entry.shortcut);
                args[arg + 3] = tag;
                args[arg + 4] = ExtendedDictionaryImporter.isExtendedTag(tag)
                        ? normalizedTag(tag.substring(0, tag.length()
                                - ExtendedDictionaryImporter.EXTENDED_TAG_SUFFIX.length()))
                        : tag;
            }
            db.execSQL(sql.toString(), args);
            progress.onProgress(end, candidates.size());
        }
    }

    @Override
    public boolean exists(long id, String word, String shortcut, String localeTag,
            String posTag) {
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                joinedRowsQuery() + " WHERE entry._id = ?", new String[] {String.valueOf(id)})) {
            return cursor.moveToNext() && rowMatches(cursor,
                    new ManagedEntryStore.Entry(id, word, shortcut, localeTag, posTag));
        }
    }

    /**
     * Streams the table once in rowid order and merges it with the entries sorted by id, so
     * checking hundreds of thousands of entries needs no in-memory copy of the dictionary.
     */
    @Override
    public Set<Long> matchingIds(List<ManagedEntryStore.Entry> entries) {
        Set<Long> matching = new HashSet<>();
        List<ManagedEntryStore.Entry> sorted = new ArrayList<>(entries);
        sorted.sort((left, right) -> Long.compare(left.id, right.id));
        merge(sorted.iterator(), (entry, matches) -> {
            if (matches) {
                matching.add(entry.id);
            }
        });
        return matching;
    }

    @Override
    public Set<Long> mismatchedIds(Iterator<ManagedEntryStore.Entry> entriesById) {
        Set<Long> mismatched = new HashSet<>();
        merge(entriesById, (entry, matches) -> {
            if (!matches) {
                mismatched.add(entry.id);
            }
        });
        return mismatched;
    }

    private interface MergeVisitor {
        void visit(ManagedEntryStore.Entry entry, boolean matches);
    }

    /** Walks entries (ascending id) against one rowid-ordered cursor over the dictionary. */
    private void merge(Iterator<ManagedEntryStore.Entry> entriesById, MergeVisitor visitor) {
        if (!entriesById.hasNext()) {
            return;
        }
        ManagedEntryStore.Entry entry = entriesById.next();
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                joinedRowsQuery() + " WHERE entry._id >= ? ORDER BY entry._id",
                new String[] {String.valueOf(entry.id)})) {
            boolean rowAvailable = cursor.moveToNext();
            while (entry != null) {
                while (rowAvailable && cursor.getLong(0) < entry.id) {
                    rowAvailable = cursor.moveToNext();
                }
                visitor.visit(entry, rowAvailable && cursor.getLong(0) == entry.id
                        && rowMatches(cursor, entry));
                entry = entriesById.hasNext() ? entriesById.next() : null;
            }
        }
    }

    /** Same LEFT JOIN as Gboard's own qqc.c() reader: _id, word, shortcut, locale, pos_tag. */
    private String joinedRowsQuery() {
        String pos = quoted(posTable);
        return "SELECT entry._id, word, shortcut, locale, " + pos + ".pos_tag FROM entry"
                + " LEFT JOIN " + pos + " ON entry._id = " + pos + "._id";
    }

    private boolean rowMatches(Cursor cursor, ManagedEntryStore.Entry entry) {
        String tag = normalizedTag(entry.localeTag);
        String expectedPos = ExtendedDictionaryImporter.isJapaneseLanguage(tag)
                ? entry.posTag : "";
        return key(entry.word, entry.shortcut, tag).equals(
                key(cursor.getString(1), cursor.getString(2), cursor.getString(3)))
                && nonNull(expectedPos).equals(nonNull(cursor.getString(4)));
    }

    @Override
    public long[] insertAll(List<ManagedEntryStore.Entry> entries,
            ExtendedDictionaryImporter.Progress progress, AtomicBoolean cancel) {
        long[] ids = new long[entries.size()];
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try {
            for (int index = 0; index < entries.size(); index++) {
                if (cancel.get()) {
                    throw new CancellationException();
                }
                ManagedEntryStore.Entry entry = entries.get(index);
                String localeTag = normalizedTag(entry.localeTag);
                ContentValues row = new ContentValues();
                row.put("word", entry.word);
                row.put("shortcut", entry.shortcut);
                row.put("locale", localeTag);
                ids[index] = db.insertOrThrow(ENTRY_TABLE, null, row);
                if (ExtendedDictionaryImporter.isJapaneseLanguage(localeTag)
                        && !entry.posTag.isEmpty()) {
                    ContentValues pos = new ContentValues();
                    pos.put("_id", ids[index]);
                    pos.put("pos_tag", entry.posTag);
                    // A stale POS row left behind under a reused rowid is overwritten, as
                    // Gboard's own writer (qqc.m) updates instead of inserting in that case.
                    if (db.insertWithOnConflict(posTable, null, pos,
                            SQLiteDatabase.CONFLICT_REPLACE) < 0) {
                        throw new IllegalStateException("POS row could not be written");
                    }
                }
                progress.onProgress(index + 1, entries.size());
            }
            if (cancel.get()) {
                throw new CancellationException();
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        if (rowKeys != null) {
            for (ManagedEntryStore.Entry entry : entries) {
                rowKeys.add(key(entry.word, entry.shortcut, normalizedTag(entry.localeTag)));
            }
        }
        notifyChanged();
        return ids;
    }

    @Override
    public void deleteAll(List<ManagedEntryStore.Entry> entries,
            ExtendedDictionaryImporter.Progress progress) {
        if (entries.isEmpty()) {
            return;
        }
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try {
            for (int index = 0; index < entries.size(); index++) {
                String[] id = {String.valueOf(entries.get(index).id)};
                db.delete(ENTRY_TABLE, "_id = ?", id);
                db.delete(posTable, "_id = ?", id);
                progress.onProgress(index + 1, entries.size());
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        // rowKeys may now over-report deleted rows, which only errs towards skipping.
        notifyChanged();
    }

    @Override
    public int[] deleteImported(Iterator<ManagedEntryStore.Entry> managedById, Set<Long> keepIds,
            Set<Long> releasedIds, boolean includeUntracked,
            ExtendedDictionaryImporter.Progress progress, int total) {
        int managed = 0;
        int untracked = 0;
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try {
            while (managedById.hasNext()) {
                ManagedEntryStore.Entry entry = managedById.next();
                if (!keepIds.contains(entry.id)) {
                    deleteRow(db, entry.id);
                    managed++;
                    progress.onProgress(managed, total);
                }
            }
            if (includeUntracked) {
                // Every managed row except keepIds is gone by now, so what remains under the
                // extended tag is untracked unless it was kept or released to the user.
                List<Long> untrackedIds = new ArrayList<>();
                try (Cursor cursor = extendedRows(db)) {
                    while (cursor.moveToNext()) {
                        long id = cursor.getLong(0);
                        if (!keepIds.contains(id) && !releasedIds.contains(id)) {
                            untrackedIds.add(id);
                        }
                    }
                }
                for (long id : untrackedIds) {
                    deleteRow(db, id);
                    untracked++;
                }
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        notifyChanged();
        return new int[] {managed, untracked};
    }

    @Override
    public List<Long> japaneseExtendedIdsWithoutPos() {
        String pos = quoted(posTable);
        List<Long> ids = new ArrayList<>();
        try (Cursor cursor = helper.getReadableDatabase().rawQuery(
                "SELECT entry._id, entry.locale FROM entry LEFT JOIN " + pos
                        + " ON entry._id = " + pos + "._id WHERE " + pos + "._id IS NULL"
                        + " AND entry.locale LIKE ?",
                new String[] {"%" + ExtendedDictionaryImporter.EXTENDED_TAG_SUFFIX})) {
            while (cursor.moveToNext()) {
                if (ExtendedDictionaryImporter.isJapaneseLanguage(cursor.getString(1))) {
                    ids.add(cursor.getLong(0));
                }
            }
        }
        return ids;
    }

    @Override
    public int restorePos(Map<Long, String> posById) {
        if (posById.isEmpty()) {
            return 0;
        }
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try {
            for (Map.Entry<Long, String> entry : posById.entrySet()) {
                ContentValues row = new ContentValues();
                row.put("_id", entry.getKey());
                row.put("pos_tag", entry.getValue());
                // IGNORE: a POS row that exists by now is never overwritten.
                db.insertWithOnConflict(posTable, null, row, SQLiteDatabase.CONFLICT_IGNORE);
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        notifyChanged();
        return posById.size();
    }

    @Override
    public int countUntracked(Iterator<ManagedEntryStore.Entry> managedById,
            Set<Long> excludedIds) {
        int untracked = 0;
        long managedId = managedById.hasNext() ? managedById.next().id : Long.MAX_VALUE;
        try (Cursor cursor = extendedRows(helper.getReadableDatabase())) {
            while (cursor.moveToNext()) {
                long id = cursor.getLong(0);
                while (managedId < id) {
                    managedId = managedById.hasNext() ? managedById.next().id : Long.MAX_VALUE;
                }
                if (managedId != id && !excludedIds.contains(id)) {
                    untracked++;
                }
            }
        }
        return untracked;
    }

    @Override
    public Set<Long> existingIds(Collection<Long> ids) {
        Set<Long> existing = new HashSet<>();
        try (Cursor cursor = helper.getReadableDatabase().query(ENTRY_TABLE,
                new String[] {"_id"}, null, null, null, null, null)) {
            while (cursor.moveToNext()) {
                long id = cursor.getLong(0);
                if (ids.contains(id)) {
                    existing.add(id);
                }
            }
        }
        return existing;
    }

    /** Ids of rows whose locale carries EXTENDED_TAG_SUFFIX, ascending. */
    private static Cursor extendedRows(SQLiteDatabase db) {
        return db.query(ENTRY_TABLE, new String[] {"_id"}, "locale LIKE ?",
                new String[] {"%" + ExtendedDictionaryImporter.EXTENDED_TAG_SUFFIX},
                null, null, "_id");
    }

    private void deleteRow(SQLiteDatabase db, long id) {
        String[] args = {String.valueOf(id)};
        db.delete(ENTRY_TABLE, "_id = ?", args);
        db.delete(posTable, "_id = ?", args);
    }

    /** Runs after commit; a failed notification must not look like a failed write. */
    private void notifyChanged() {
        try {
            changeNotifier.run();
        } catch (RuntimeException failure) {
            Log.w(TAG, "Personal dictionary change notification failed: "
                    + failure.getClass().getName());
        }
    }

    @Override
    public void close() {
        try {
            helper.close();
        } catch (Throwable failure) {
            Log.w(TAG, "Personal dictionary database could not be closed", failure);
        }
    }

    // ponytail: one key per dictionary row is kept for contains(); one gateway serves one pass.
    private void loadRows() {
        Set<String> keys = new HashSet<>();
        try (Cursor cursor = helper.getReadableDatabase().query(ENTRY_TABLE,
                new String[] {"word", "shortcut", "locale"}, null, null, null, null, null)) {
            while (cursor.moveToNext()) {
                keys.add(key(cursor.getString(0), cursor.getString(1), cursor.getString(2)));
            }
        }
        rowKeys = keys;
    }

    @Override
    public int countWithoutEnabledLanguage(List<ManagedEntryStore.Entry> entries) {
        if (enabledLanguages == null) {
            return -1;
        }
        Set<String> enabled = enabledLanguages.enabledKeys();
        if (enabled == null) {
            return -1;
        }
        try {
            int unmatched = 0;
            for (ManagedEntryStore.Entry entry : entries) {
                // Rows without a language (all languages) are routed to every engine.
                if (!entry.localeTag.isEmpty() && !enabled.contains(
                        enabledLanguages.keyOfTag(normalizedTag(entry.localeTag)))) {
                    unmatched++;
                }
            }
            return unmatched;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.w(TAG, "Enabled language check failed: " + failure.getClass().getName());
            return -1;
        }
    }

    @Override
    public String normalizedTag(String localeTag) {
        String raw = localeTag == null ? "" : localeTag;
        String cached = normalizedTags.get(raw);
        if (cached == null) {
            cached = tagNormalizer.normalize(raw);
            normalizedTags.put(raw, cached);
        }
        return cached;
    }

    private static String key(String word, String shortcut, String localeTag) {
        return nonNull(word) + '\u0000' + nonNull(shortcut) + '\u0000' + nonNull(localeTag);
    }

    /** SQL identifier quoting for the table name read from Gboard's qpz.a constant. */
    private static String quoted(String identifier) {
        return "\"" + identifier.replace("\"", "\"\"") + "\"";
    }

    private static String nonNull(String value) {
        return value == null ? "" : value;
    }

    private static Object invoke(Method method, Object target, Object... args) {
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException failure) {
            Throwable cause = failure.getCause();
            if (cause instanceof RuntimeException runtime) {
                throw runtime;
            }
            throw new IllegalStateException("Personal dictionary call failed", cause);
        } catch (IllegalAccessException failure) {
            throw new IllegalStateException("Personal dictionary call is not accessible", failure);
        }
    }

    static final class Api {
        final Constructor<?> databaseConstructor;
        final Field helperField;
        final Field posTableField;
        final Method notifyChanged;
        final Method fromTag;

        Api(Constructor<?> databaseConstructor, Field helperField, Field posTableField,
                Method notifyChanged, Method fromTag) {
            this.databaseConstructor = databaseConstructor;
            this.helperField = helperField;
            this.posTableField = posTableField;
            this.notifyChanged = notifyChanged;
            this.fromTag = fromTag;
        }
    }
}
