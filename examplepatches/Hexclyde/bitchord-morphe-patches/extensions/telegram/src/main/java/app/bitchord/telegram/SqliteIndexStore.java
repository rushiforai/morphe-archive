package app.bitchord.telegram;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import org.json.JSONObject;

import java.io.File;
import java.util.*;

/**
 * The saved index on the phone. Files are rows of a table, with their words in a full-text table
 * beside it, so a chat of a few hundred thousand files searches in milliseconds and never has to be
 * held in memory.
 */
final class SqliteIndexStore implements IndexStore {
    private final SQLiteDatabase db;

    SqliteIndexStore(File file) {
        file.getParentFile().mkdirs();
        db = SQLiteDatabase.openOrCreateDatabase(file, null);
        db.enableWriteAheadLogging();
        db.execSQL(
                "CREATE TABLE IF NOT EXISTS files (id INTEGER PRIMARY KEY, chat INTEGER NOT NULL,"
                        + " message INTEGER NOT NULL, entry INTEGER NOT NULL DEFAULT 0, generation"
                        + " INTEGER NOT NULL, row TEXT NOT NULL, UNIQUE (chat, message, entry))");
        upgrade();
        db.execSQL("CREATE VIRTUAL TABLE IF NOT EXISTS words USING fts4(text)");
        db.execSQL(
                "CREATE TABLE IF NOT EXISTS zips (chat INTEGER NOT NULL, message INTEGER NOT NULL,"
                        + " row TEXT NOT NULL, done INTEGER NOT NULL DEFAULT 0, PRIMARY KEY (chat,"
                        + " message))");
        db.execSQL(
                "CREATE TABLE IF NOT EXISTS chats (chat INTEGER PRIMARY KEY, state TEXT NOT"
                        + " NULL)");
        db.execSQL(
                "CREATE TABLE IF NOT EXISTS found (kind TEXT NOT NULL, key TEXT NOT NULL, value"
                        + " TEXT NOT NULL, PRIMARY KEY (kind, key))");
    }

    @Override
    public JSONObject found(String kind, String key) throws Exception {
        try (Cursor c =
                db.rawQuery(
                        "SELECT value FROM found WHERE kind = ? AND key = ?",
                        new String[] {kind, key})) {
            return c.moveToFirst() ? new JSONObject(c.getString(0)) : null;
        }
    }

    @Override
    public void putFound(long chat, long message, String kind, String key, JSONObject value)
            throws Exception {
        ContentValues found = new ContentValues();
        found.put("kind", kind);
        found.put("key", key);
        found.put("value", value.toString());
        db.beginTransaction();
        try {
            db.insertWithOnConflict("found", null, found, SQLiteDatabase.CONFLICT_REPLACE);
            List<long[]> ids = new ArrayList<>();
            List<JSONObject> rows = new ArrayList<>();
            try (Cursor c =
                    db.rawQuery(
                            "SELECT id, row FROM files WHERE chat = ? AND message = ?",
                            new String[] {Long.toString(chat), Long.toString(message)})) {
                while (c.moveToNext()) {
                    JSONObject row = new JSONObject(c.getString(1));
                    if (!IndexStore.belongs(row, kind, key)) continue;
                    ids.add(new long[] {c.getLong(0)});
                    rows.add(IndexStore.withFound(this, row, false));
                }
            }
            for (int i = 0; i < rows.size(); i++) {
                String id = Long.toString(ids.get(i)[0]);
                ContentValues file = new ContentValues();
                file.put("row", rows.get(i).toString());
                db.update("files", file, "id = ?", new String[] {id});
                ContentValues words = new ContentValues();
                words.put("text", IndexStore.text(rows.get(i)));
                db.update("words", words, "docid = ?", new String[] {id});
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    /**
     * 1.0.8 to 1.0.10 had one file per message. Songs in zips need an entry number, so the table is
     * copied into the new layout once, keeping each file's id so the words still point at it.
     */
    private void upgrade() {
        boolean hasEntry = false;
        try (Cursor c = db.rawQuery("PRAGMA table_info(files)", null)) {
            while (c.moveToNext()) if ("entry".equals(c.getString(1))) hasEntry = true;
        }
        if (hasEntry) return;
        db.beginTransaction();
        try {
            db.execSQL(
                    "CREATE TABLE files_new (id INTEGER PRIMARY KEY, chat INTEGER NOT NULL,"
                            + " message INTEGER NOT NULL, entry INTEGER NOT NULL DEFAULT 0,"
                            + " generation INTEGER NOT NULL, row TEXT NOT NULL, UNIQUE (chat,"
                            + " message, entry))");
            db.execSQL(
                    "INSERT INTO files_new (id, chat, message, entry, generation, row) SELECT id,"
                            + " chat, message, 0, generation, row FROM files");
            db.execSQL("DROP TABLE files");
            db.execSQL("ALTER TABLE files_new RENAME TO files");
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    @Override
    public State state(long chat) throws Exception {
        try (Cursor c =
                db.rawQuery(
                        "SELECT state FROM chats WHERE chat = ?",
                        new String[] {Long.toString(chat)})) {
            return c.moveToFirst()
                    ? State.fromJson(chat, new JSONObject(c.getString(0)))
                    : new State(chat);
        }
    }

    @Override
    public void save(State state) throws Exception {
        ContentValues values = new ContentValues();
        values.put("chat", state.chat);
        values.put("state", state.toJson().toString());
        db.insertWithOnConflict("chats", null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }

    @Override
    public void put(long chat, List<JSONObject> rows, long generation) throws Exception {
        db.beginTransaction();
        try {
            for (JSONObject row : rows) {
                IndexStore.withFound(this, row, true);
                long message = row.optLong("message");
                int entry = row.optInt("entry");
                long id = -1;
                try (Cursor c =
                        db.rawQuery(
                                "SELECT id FROM files WHERE chat = ? AND message = ? AND entry = ?",
                                new String[] {
                                    Long.toString(chat),
                                    Long.toString(message),
                                    Integer.toString(entry)
                                })) {
                    if (c.moveToFirst()) id = c.getLong(0);
                }
                ContentValues file = new ContentValues();
                file.put("generation", generation);
                file.put("row", row.toString());
                ContentValues words = new ContentValues();
                words.put("text", IndexStore.text(row));
                if (id >= 0) {
                    db.update("files", file, "id = ?", new String[] {Long.toString(id)});
                    db.update("words", words, "docid = ?", new String[] {Long.toString(id)});
                } else {
                    file.put("chat", chat);
                    file.put("message", message);
                    file.put("entry", entry);
                    id = db.insert("files", null, file);
                    words.put("docid", id);
                    db.insert("words", null, words);
                }
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    @Override
    public boolean has(long chat, long message) {
        try (Cursor c =
                db.rawQuery(
                        "SELECT 1 FROM files WHERE chat = ? AND message = ? LIMIT 1",
                        new String[] {Long.toString(chat), Long.toString(message)})) {
            return c.moveToFirst();
        }
    }

    @Override
    public int count(long chat) {
        try (Cursor c =
                db.rawQuery(
                        "SELECT count(*) FROM files WHERE chat = ?",
                        new String[] {Long.toString(chat)})) {
            return c.moveToFirst() ? c.getInt(0) : 0;
        }
    }

    @Override
    public List<JSONObject> search(Collection<Long> chats, List<String> words, int limit)
            throws Exception {
        List<JSONObject> found = new ArrayList<>();
        if (words.isEmpty() || chats.isEmpty()) return found;
        // Words are letters and digits only (see TrackNames.words), so they're safe in a MATCH.
        StringBuilder match = new StringBuilder();
        for (String word : words)
            match.append(match.length() == 0 ? "" : " ").append(word).append('*');
        List<String> args = new ArrayList<>();
        args.add(match.toString());
        StringBuilder in = new StringBuilder();
        for (long chat : chats) {
            in.append(in.length() == 0 ? "?" : ", ?");
            args.add(Long.toString(chat));
        }
        try (Cursor c =
                db.rawQuery(
                        // The full-text table is asked for its matches first. Written as a join,
                        // SQLite walks every file and checks each one against the full-text
                        // table, which took 5 to 40 seconds over 223,776 files; this takes
                        // well under a tenth of a second.
                        "SELECT row FROM files WHERE id IN (SELECT docid FROM words WHERE text"
                                + " MATCH ?) AND chat IN ("
                                + in
                                + ") ORDER BY message DESC, entry LIMIT "
                                + Math.max(0, limit),
                        args.toArray(new String[0]))) {
            while (c.moveToNext()) found.add(new JSONObject(c.getString(0)));
        }
        return found;
    }

    @Override
    public List<JSONObject> newest(long chat, int limit) throws Exception {
        List<JSONObject> found = new ArrayList<>();
        try (Cursor c =
                db.rawQuery(
                        "SELECT row FROM files WHERE chat = ? ORDER BY message DESC, entry LIMIT "
                                + Math.max(0, limit),
                        new String[] {Long.toString(chat)})) {
            while (c.moveToNext()) found.add(new JSONObject(c.getString(0)));
        }
        return found;
    }

    @Override
    public List<JSONObject> after(long chat, long message, int limit) throws Exception {
        List<JSONObject> found = new ArrayList<>();
        try (Cursor c =
                db.rawQuery(
                        "SELECT row FROM files WHERE chat = ? AND message > ? ORDER BY message,"
                                + " entry LIMIT "
                                + Math.max(0, limit),
                        new String[] {Long.toString(chat), Long.toString(message)})) {
            while (c.moveToNext()) found.add(new JSONObject(c.getString(0)));
        }
        return found;
    }

    @Override
    public int countAfter(long chat, long message) {
        try (Cursor c =
                db.rawQuery(
                        "SELECT count(*) FROM files WHERE chat = ? AND message > ?",
                        new String[] {Long.toString(chat), Long.toString(message)})) {
            return c.moveToFirst() ? c.getInt(0) : 0;
        }
    }

    @Override
    public List<JSONObject> before(long chat, long message, int limit) throws Exception {
        List<JSONObject> found = new ArrayList<>();
        try (Cursor c =
                db.rawQuery(
                        "SELECT row FROM files WHERE chat = ? AND message < ? ORDER BY message"
                                + " DESC, entry LIMIT "
                                + Math.max(0, limit),
                        new String[] {Long.toString(chat), Long.toString(message)})) {
            while (c.moveToNext()) found.add(new JSONObject(c.getString(0)));
        }
        return found;
    }

    @Override
    public int countBefore(long chat, long message) {
        try (Cursor c =
                db.rawQuery(
                        "SELECT count(*) FROM files WHERE chat = ? AND message < ?",
                        new String[] {Long.toString(chat), Long.toString(message)})) {
            return c.moveToFirst() ? c.getInt(0) : 0;
        }
    }

    @Override
    public JSONObject row(long chat, long message, int entry) throws Exception {
        try (Cursor c =
                db.rawQuery(
                        "SELECT row FROM files WHERE chat = ? AND message = ? AND entry = ?",
                        new String[] {
                            Long.toString(chat), Long.toString(message), Integer.toString(entry)
                        })) {
            return c.moveToFirst() ? new JSONObject(c.getString(0)) : null;
        }
    }

    @Override
    public void queueZips(long chat, List<JSONObject> zips, long generation) {
        db.beginTransaction();
        try {
            for (JSONObject zip : zips) {
                String[] key = {Long.toString(chat), Long.toString(zip.optLong("message"))};
                boolean known;
                try (Cursor c =
                        db.rawQuery("SELECT 1 FROM zips WHERE chat = ? AND message = ?", key)) {
                    known = c.moveToFirst();
                }
                if (!known) {
                    ContentValues values = new ContentValues();
                    values.put("chat", chat);
                    values.put("message", zip.optLong("message"));
                    values.put("row", zip.toString());
                    db.insert("zips", null, values);
                } else if (zip.optString("kind").equals("cue")) {
                    // A cue sheet's tracks are filed under its album's post: read it again.
                    ContentValues values = new ContentValues();
                    values.put("done", 0);
                    db.update("zips", values, "chat = ? AND message = ?", key);
                } else {
                    ContentValues values = new ContentValues();
                    values.put("generation", generation);
                    db.update("files", values, "chat = ? AND message = ? AND entry > 0", key);
                }
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    @Override
    public JSONObject nextZip(Collection<Long> chats) throws Exception {
        if (chats.isEmpty()) return null;
        StringBuilder in = new StringBuilder();
        List<String> args = new ArrayList<>();
        for (long chat : chats) {
            in.append(in.length() == 0 ? "?" : ", ?");
            args.add(Long.toString(chat));
        }
        try (Cursor c =
                db.rawQuery(
                        "SELECT row FROM zips WHERE done = 0 AND chat IN ("
                                + in
                                + ") ORDER BY message DESC LIMIT 1",
                        args.toArray(new String[0]))) {
            return c.moveToFirst() ? new JSONObject(c.getString(0)) : null;
        }
    }

    @Override
    public void zipDone(long chat, long message) {
        ContentValues values = new ContentValues();
        values.put("done", 1);
        db.update(
                "zips",
                values,
                "chat = ? AND message = ?",
                new String[] {Long.toString(chat), Long.toString(message)});
    }

    @Override
    public void deferZip(long chat, long message) {
        ContentValues values = new ContentValues();
        values.put("done", 2);
        db.update(
                "zips",
                values,
                "chat = ? AND message = ?",
                new String[] {Long.toString(chat), Long.toString(message)});
    }

    @Override
    public void wakeZips(long chat) {
        ContentValues values = new ContentValues();
        values.put("done", 0);
        db.update("zips", values, "chat = ? AND done = 2", new String[] {Long.toString(chat)});
    }

    @Override
    public int zipsWaiting(Collection<Long> chats) {
        int n = 0;
        for (long chat : chats)
            try (Cursor c =
                    db.rawQuery(
                            "SELECT count(*) FROM zips WHERE done = 0 AND chat = ?",
                            new String[] {Long.toString(chat)})) {
                if (c.moveToFirst()) n += c.getInt(0);
            }
        return n;
    }

    @Override
    public void prune(long chat, long generation) {
        String[] args = {Long.toString(chat), Long.toString(generation)};
        db.beginTransaction();
        try {
            db.execSQL(
                    "DELETE FROM words WHERE docid IN (SELECT id FROM files WHERE chat = ? AND"
                            + " generation < ?)",
                    args);
            db.execSQL("DELETE FROM files WHERE chat = ? AND generation < ?", args);
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    @Override
    public void clear() {
        db.beginTransaction();
        try {
            db.execSQL("DELETE FROM words");
            db.execSQL("DELETE FROM files");
            db.execSQL("DELETE FROM chats");
            db.execSQL("DELETE FROM zips");
            db.execSQL("DELETE FROM found");
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
        // Gives the space back: a large channel's index is well over 100 MB.
        db.execSQL("VACUUM");
    }
}
