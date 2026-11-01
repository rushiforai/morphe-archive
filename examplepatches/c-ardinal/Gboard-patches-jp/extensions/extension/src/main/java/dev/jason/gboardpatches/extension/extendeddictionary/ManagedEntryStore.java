package dev.jason.gboardpatches.extension.extendeddictionary;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

/**
 * Personal dictionary rows created by this feature, in an extension-owned database that the
 * Patches Backup &amp; Restore export never reads (it only reads its registered preference files).
 */
final class ManagedEntryStore implements AutoCloseable {
    static final String DATABASE_NAME = "gboard_patches_extended_dictionary.db";
    private static final int DATABASE_VERSION = 2;
    private static final String TABLE = "managed_entry";
    /**
     * Gboard rowids this feature once created but handed over to the user because they were
     * changed in Gboard; such rows carry the extended tag yet must never count as untracked.
     */
    private static final String RELEASED_TABLE = "released";
    private static final String CREATE_RELEASED =
            "CREATE TABLE IF NOT EXISTS " + RELEASED_TABLE + "(id INTEGER PRIMARY KEY)";
    /** Legacy (pre-database) storage: one JSON array in this preference file. */
    static final String PREF_FILE = "gboard_patches_extended_dictionary";
    static final String PREF_KEY_ENTRIES = "managed_entries";

    private final SQLiteOpenHelper helper;
    private final SharedPreferences legacyPreferences;
    private boolean legacyMigrated;

    ManagedEntryStore(SQLiteOpenHelper helper, SharedPreferences legacyPreferences) {
        this.helper = helper;
        this.legacyPreferences = legacyPreferences;
    }

    static ManagedEntryStore open(Context context) {
        Context appContext = context.getApplicationContext();
        Context storageContext = appContext != null ? appContext : context;
        return new ManagedEntryStore(new Helper(storageContext),
                storageContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE));
    }

    static final class Entry {
        final long id;
        final String word;
        final String shortcut;
        final String localeTag;
        final String posTag;

        Entry(long id, String word, String shortcut, String localeTag, String posTag) {
            this.id = id;
            this.word = word;
            this.shortcut = shortcut;
            this.localeTag = localeTag;
            this.posTag = posTag;
        }
    }

    List<Entry> load() {
        migrateLegacy();
        List<Entry> entries = new ArrayList<>();
        try (Cursor cursor = helper.getReadableDatabase().query(TABLE,
                new String[] {"id", "word", "shortcut", "locale", "pos_tag"},
                null, null, null, null, "id")) {
            while (cursor.moveToNext()) {
                entries.add(new Entry(cursor.getLong(0), cursor.getString(1),
                        cursor.getString(2), cursor.getString(3), cursor.getString(4)));
            }
        }
        return Collections.unmodifiableList(entries);
    }

    /** Streams the entries in id order; close it to release the cursor. */
    EntryCursor iterateById() {
        migrateLegacy();
        return new EntryCursor(helper.getReadableDatabase().query(TABLE,
                new String[] {"id", "word", "shortcut", "locale", "pos_tag"},
                null, null, null, null, "id"));
    }

    int count() {
        migrateLegacy();
        return (int) DatabaseUtils.queryNumEntries(helper.getReadableDatabase(), TABLE);
    }

    /** Removes the given ids and records the added entries in one transaction. */
    void update(Collection<Long> removedIds, List<Entry> added) {
        update(removedIds, added, Collections.emptyList());
    }

    /**
     * One transaction: removedIds stop being managed and become released, added entries become
     * managed (a reused rowid is no longer released), and goneIds leave the released set.
     */
    void update(Collection<Long> removedIds, List<Entry> added, Collection<Long> goneIds) {
        update(removedIds, added, goneIds, (done, total) -> {
        });
    }

    void update(Collection<Long> removedIds, List<Entry> added, Collection<Long> goneIds,
            ExtendedDictionaryImporter.Progress progress) {
        migrateLegacy();
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try (SQLiteStatement delete = db.compileStatement(
                "DELETE FROM " + TABLE + " WHERE id = ?");
                SQLiteStatement release = db.compileStatement(
                        "INSERT OR IGNORE INTO " + RELEASED_TABLE + "(id) VALUES (?)");
                SQLiteStatement unrelease = db.compileStatement(
                        "DELETE FROM " + RELEASED_TABLE + " WHERE id = ?")) {
            for (long id : removedIds) {
                delete.bindLong(1, id);
                delete.executeUpdateDelete();
                release.bindLong(1, id);
                release.executeInsert();
            }
            for (Entry entry : added) {
                unrelease.bindLong(1, entry.id);
                unrelease.executeUpdateDelete();
            }
            for (long id : goneIds) {
                unrelease.bindLong(1, id);
                unrelease.executeUpdateDelete();
            }
            insert(db, added, progress);
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    /** Ends tracking: drops every managed entry and releases keptIds, in one transaction. */
    void clearAndRelease(Collection<Long> keptIds) {
        migrateLegacy();
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try (SQLiteStatement release = db.compileStatement(
                "INSERT OR IGNORE INTO " + RELEASED_TABLE + "(id) VALUES (?)")) {
            db.delete(TABLE, null, null);
            for (long id : keptIds) {
                release.bindLong(1, id);
                release.executeInsert();
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    /** The managed entries among ids (others are left out), read in a few queries. */
    java.util.Map<Long, Entry> entriesOf(List<Long> ids,
            ExtendedDictionaryImporter.Progress progress) {
        migrateLegacy();
        java.util.Map<Long, Entry> entries = new java.util.HashMap<>();
        int chunk = 500;
        for (int start = 0; start < ids.size(); start += chunk) {
            List<Long> part = ids.subList(start, Math.min(ids.size(), start + chunk));
            StringBuilder where = new StringBuilder("id IN (");
            String[] args = new String[part.size()];
            for (int index = 0; index < part.size(); index++) {
                where.append(index == 0 ? "?" : ", ?");
                args[index] = String.valueOf(part.get(index));
            }
            try (Cursor cursor = helper.getReadableDatabase().query(TABLE,
                    new String[] {"id", "word", "shortcut", "locale", "pos_tag"},
                    where.append(')').toString(), args, null, null, null)) {
                while (cursor.moveToNext()) {
                    entries.put(cursor.getLong(0), new Entry(cursor.getLong(0),
                            cursor.getString(1), cursor.getString(2), cursor.getString(3),
                            cursor.getString(4)));
                }
            }
            progress.onProgress(start + part.size(), ids.size());
        }
        return entries;
    }

    Set<Long> releasedIds() {
        migrateLegacy();
        Set<Long> ids = new HashSet<>();
        try (Cursor cursor = helper.getReadableDatabase().query(RELEASED_TABLE,
                new String[] {"id"}, null, null, null, null, null)) {
            while (cursor.moveToNext()) {
                ids.add(cursor.getLong(0));
            }
        }
        return ids;
    }

    static final class EntryCursor implements Iterator<Entry>, AutoCloseable {
        private final Cursor cursor;
        private Boolean hasNext;

        private EntryCursor(Cursor cursor) {
            this.cursor = cursor;
        }

        @Override
        public boolean hasNext() {
            if (hasNext == null) {
                hasNext = cursor.moveToNext();
            }
            return hasNext;
        }

        @Override
        public Entry next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            hasNext = null;
            return new Entry(cursor.getLong(0), cursor.getString(1), cursor.getString(2),
                    cursor.getString(3), cursor.getString(4));
        }

        @Override
        public void close() {
            cursor.close();
        }
    }

    /** Replaces the whole list atomically. */
    void save(List<Entry> entries) {
        migrateLegacy();
        SQLiteDatabase db = helper.getWritableDatabase();
        db.beginTransaction();
        try {
            db.delete(TABLE, null, null);
            insert(db, entries, null);
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    @Override
    public void close() {
        helper.close();
    }

    /** Moves the legacy JSON list into the database once; corrupt JSON fails closed. */
    private void migrateLegacy() {
        if (legacyMigrated) {
            return;
        }
        String raw = legacyPreferences.getString(PREF_KEY_ENTRIES, null);
        if (raw != null) {
            List<Entry> legacy = parseLegacy(raw);
            SQLiteDatabase db = helper.getWritableDatabase();
            db.beginTransaction();
            try {
                insert(db, legacy, null);
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
            if (!legacyPreferences.edit().remove(PREF_KEY_ENTRIES).commit()) {
                throw new IllegalStateException("Legacy dictionary entries could not be cleared");
            }
        }
        legacyMigrated = true;
    }

    private static List<Entry> parseLegacy(String raw) {
        try {
            JSONArray array = new JSONArray(raw);
            List<Entry> entries = new ArrayList<>(array.length());
            for (int index = 0; index < array.length(); index++) {
                JSONObject item = array.getJSONObject(index);
                entries.add(new Entry(item.getLong("id"), item.getString("word"),
                        item.getString("shortcut"), item.getString("locale"),
                        item.getString("pos")));
            }
            return entries;
        } catch (JSONException failure) {
            throw new IllegalStateException("Managed dictionary entries are unreadable", failure);
        }
    }

    /** INSERT OR REPLACE: a duplicate id keeps the last entry and can never abort a save. */
    private static void insert(SQLiteDatabase db, List<Entry> entries,
            ExtendedDictionaryImporter.Progress progress) {
        int written = 0;
        try (SQLiteStatement statement = db.compileStatement("INSERT OR REPLACE"
                + " INTO " + TABLE + "(id, word, shortcut, locale, pos_tag) VALUES (?, ?, ?, ?, ?)")) {
            for (Entry entry : entries) {
                statement.clearBindings();
                statement.bindLong(1, entry.id);
                statement.bindString(2, entry.word);
                statement.bindString(3, entry.shortcut);
                statement.bindString(4, entry.localeTag);
                statement.bindString(5, entry.posTag);
                statement.executeInsert();
                if (progress != null) {
                    progress.onProgress(++written, entries.size());
                }
            }
        }
    }

    private static final class Helper extends SQLiteOpenHelper {
        Helper(Context context) {
            super(context, DATABASE_NAME, null, DATABASE_VERSION);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE " + TABLE + "(id INTEGER PRIMARY KEY, word TEXT NOT NULL,"
                    + " shortcut TEXT NOT NULL, locale TEXT NOT NULL, pos_tag TEXT NOT NULL)");
            db.execSQL(CREATE_RELEASED);
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            db.execSQL(CREATE_RELEASED);
        }
    }
}
