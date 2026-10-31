package app.badfella.extension.ticktick.locallists;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * SQLite-backed local organizer. TickTick's project/task tables are never
 * touched. Every row is scoped by the account+realm tag from
 * {@link AccountScope#tag()}.
 */
public final class LocalListsStore {
    public static final int SCHEMA_VERSION = 1;
    public static final int DEFAULT_CAPACITY = 299;
    public static final int LARGE_CAPACITY = 900;

    private static final String KEY_CAPACITY = "capacity";
    private static final int MAX_NAME = 200;
    private static final int MAX_SID = 200;
    private static final int MAX_PROFILE = 128;

    private final SQLiteDatabase db;
    private final SQLiteOpenHelper helper;
    private int transactionDepth;

    public LocalListsStore(SQLiteDatabase database) {
        if (database == null) throw new IllegalArgumentException("database is required");
        this.db = database;
        this.helper = null;
        createSchema(db);
    }

    public LocalListsStore(SQLiteOpenHelper openHelper) {
        if (openHelper == null) throw new IllegalArgumentException("helper is required");
        this.helper = openHelper;
        this.db = openHelper.getWritableDatabase();
        createSchema(db);
    }

    public static LocalListsStore open(File file) {
        if (file == null) throw new IllegalArgumentException("file is required");
        return new LocalListsStore(SQLiteDatabase.openOrCreateDatabase(file, null));
    }

    static void createSchema(SQLiteDatabase database) {
        int version = database.getVersion();
        if (version > SCHEMA_VERSION) {
            throw new IllegalStateException("Unsupported local organizer schema " + version);
        }
        if (!database.inTransaction()) database.setForeignKeyConstraintsEnabled(true);
        boolean ownTransaction = !database.inTransaction();
        if (ownTransaction) database.beginTransaction();
        try {
            database.execSQL("CREATE TABLE IF NOT EXISTS local_lists ("
                    + "profile TEXT NOT NULL,"
                    + "uuid TEXT NOT NULL,"
                    + "name TEXT NOT NULL,"
                    + "sort_order INTEGER NOT NULL,"
                    + "created_at INTEGER NOT NULL,"
                    + "updated_at INTEGER NOT NULL,"
                    + "PRIMARY KEY (profile, uuid))");
            database.execSQL("CREATE INDEX IF NOT EXISTS idx_local_lists_order "
                    + "ON local_lists(profile, sort_order)");
            database.execSQL("CREATE TABLE IF NOT EXISTS memberships ("
                    + "profile TEXT NOT NULL,"
                    + "task_sid TEXT NOT NULL,"
                    + "list_uuid TEXT NOT NULL,"
                    + "assigned_at INTEGER NOT NULL,"
                    + "PRIMARY KEY (profile, task_sid),"
                    + "FOREIGN KEY (profile, list_uuid) "
                    + "REFERENCES local_lists(profile, uuid) ON DELETE CASCADE)");
            database.execSQL("CREATE INDEX IF NOT EXISTS idx_memberships_list "
                    + "ON memberships(profile, list_uuid)");
            database.execSQL("CREATE TABLE IF NOT EXISTS settings ("
                    + "profile TEXT NOT NULL,"
                    + "key TEXT NOT NULL,"
                    + "value TEXT NOT NULL,"
                    + "PRIMARY KEY (profile, key))");
            if (version == 0) database.setVersion(SCHEMA_VERSION);
            if (ownTransaction) database.setTransactionSuccessful();
        } finally {
            if (ownTransaction) database.endTransaction();
        }
    }

    public SQLiteDatabase database() {
        return db;
    }

    public void close() {
        if (helper != null) helper.close();
        else db.close();
    }

    public static String validateProfile(String profile) {
        if (profile == null || profile.trim().isEmpty() || profile.length() > MAX_PROFILE) {
            throw new IllegalArgumentException("Invalid account scope");
        }
        return profile;
    }

    public static String validateTaskSid(String taskSid) {
        if (taskSid == null) throw new IllegalArgumentException("Task SID is required");
        String value = taskSid.trim();
        if (value.isEmpty() || value.length() > MAX_SID || hasControl(value)) {
            throw new IllegalArgumentException("Invalid task SID");
        }
        return value;
    }

    static String validateName(String name) throws LocalListsException {
        if (name == null) throw new LocalListsException("A list name is required");
        String value = name.trim();
        if (value.isEmpty()) throw new LocalListsException("A list name is required");
        if (value.length() > MAX_NAME) {
            throw new LocalListsException("List names must be at most " + MAX_NAME + " characters");
        }
        if (hasControl(value)) throw new LocalListsException("List names cannot contain control characters");
        return value;
    }

    static boolean hasControl(String value) {
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c < 0x20 || c == 0x7f) return true;
        }
        return false;
    }

    public int capacity(String profile) {
        validateProfile(profile);
        String value = getSetting(profile, KEY_CAPACITY);
        if (value != null) {
            try {
                int capacity = Integer.parseInt(value);
                if (isSupportedCapacity(capacity)) return capacity;
            } catch (NumberFormatException ignored) {
            }
        }
        return DEFAULT_CAPACITY;
    }

    public static boolean isSupportedCapacity(int capacity) {
        return capacity == DEFAULT_CAPACITY || capacity == LARGE_CAPACITY;
    }

    /** Capacity is a creation limit only; lowering it never deletes lists. */
    public void setCapacity(String profile, int capacity) throws LocalListsException {
        validateProfile(profile);
        if (!isSupportedCapacity(capacity)) {
            throw new LocalListsException("Capacity must be 299 or 900 local lists");
        }
        setSetting(profile, KEY_CAPACITY, Integer.toString(capacity));
    }

    public int listCount(String profile) {
        validateProfile(profile);
        Cursor cursor = db.rawQuery(
                "SELECT COUNT(*) FROM local_lists WHERE profile=?", new String[]{profile});
        try {
            return cursor.moveToFirst() ? cursor.getInt(0) : 0;
        } finally {
            cursor.close();
        }
    }

    public List<LocalList> lists(String profile) {
        validateProfile(profile);
        List<LocalList> result = new ArrayList<LocalList>();
        Cursor cursor = db.rawQuery("SELECT uuid,name,sort_order,created_at,updated_at "
                + "FROM local_lists WHERE profile=? ORDER BY sort_order ASC, name COLLATE NOCASE ASC",
                new String[]{profile});
        try {
            while (cursor.moveToNext()) {
                result.add(new LocalList(cursor.getString(0), cursor.getString(1),
                        cursor.getLong(2), cursor.getLong(3), cursor.getLong(4)));
            }
        } finally {
            cursor.close();
        }
        return result;
    }

    public LocalList getList(String profile, String uuid) {
        validateProfile(profile);
        if (uuid == null) return null;
        Cursor cursor = db.rawQuery("SELECT uuid,name,sort_order,created_at,updated_at "
                        + "FROM local_lists WHERE profile=? AND uuid=?",
                new String[]{profile, uuid});
        try {
            if (!cursor.moveToFirst()) return null;
            return new LocalList(cursor.getString(0), cursor.getString(1),
                    cursor.getLong(2), cursor.getLong(3), cursor.getLong(4));
        } finally {
            cursor.close();
        }
    }

    public LocalList createList(String profile, String name, long now)
            throws LocalListsException {
        validateProfile(profile);
        final String cleanName = validateName(name);
        return transaction(new TransactionBody<LocalList>() {
            @Override
            public LocalList run() throws Exception {
                int capacity = capacity(profile);
                int count = listCount(profile);
                if (count >= capacity) throw new CapacityException(capacity, count);
                long order = nextSortOrder(profile);
                String uuid = UUID.randomUUID().toString();
                ContentValues values = new ContentValues();
                values.put("profile", profile);
                values.put("uuid", uuid);
                values.put("name", cleanName);
                values.put("sort_order", order);
                values.put("created_at", now);
                values.put("updated_at", now);
                long row = db.insertOrThrow("local_lists", null, values);
                if (row < 0) throw new LocalListsException("Could not create the local list");
                return new LocalList(uuid, cleanName, order, now, now);
            }
        });
    }

    public void renameList(String profile, String uuid, String name, long now)
            throws LocalListsException {
        validateProfile(profile);
        final String cleanName = validateName(name);
        final String listUuid = uuid == null ? "" : uuid;
        transaction(new TransactionBody<Void>() {
            @Override
            public Void run() throws Exception {
                LocalList existing = getList(profile, listUuid);
                if (existing == null) throw new LocalListsException("That local list no longer exists");
                long updated = Math.max(now, existing.getUpdatedAt() + 1);
                ContentValues values = new ContentValues();
                values.put("name", cleanName);
                values.put("updated_at", updated);
                int rows = db.update("local_lists", values, "profile=? AND uuid=?",
                        new String[]{profile, listUuid});
                if (rows != 1) throw new LocalListsException("Could not rename the local list");
                return null;
            }
        });
    }

    public void setListOrder(String profile, String uuid, long order, long now)
            throws LocalListsException {
        validateProfile(profile);
        final String listUuid = uuid == null ? "" : uuid;
        transaction(new TransactionBody<Void>() {
            @Override
            public Void run() throws Exception {
                LocalList existing = getList(profile, listUuid);
                if (existing == null) throw new LocalListsException("That local list no longer exists");
                long updated = Math.max(now, existing.getUpdatedAt() + 1);
                ContentValues values = new ContentValues();
                values.put("sort_order", order);
                values.put("updated_at", updated);
                db.update("local_lists", values, "profile=? AND uuid=?",
                        new String[]{profile, listUuid});
                return null;
            }
        });
    }

    /** Removes local organization only. TickTick tasks and cloud projects are untouched. */
    public void clearLocalOrganization(String profile) throws LocalListsException {
        validateProfile(profile);
        transaction(new TransactionBody<Void>() {
            @Override
            public Void run() throws Exception {
                db.delete("memberships", "profile=?", new String[]{profile});
                db.delete("local_lists", "profile=?", new String[]{profile});
                return null;
            }
        });
    }

    /** Removes the list and its memberships. It never touches a TickTick task. */
    public void deleteList(String profile, String uuid) throws LocalListsException {
        validateProfile(profile);
        final String listUuid = uuid == null ? "" : uuid;
        transaction(new TransactionBody<Void>() {
            @Override
            public Void run() throws Exception {
                db.delete("memberships", "profile=? AND list_uuid=?",
                        new String[]{profile, listUuid});
                db.delete("local_lists", "profile=? AND uuid=?",
                        new String[]{profile, listUuid});
                return null;
            }
        });
    }

    private long nextSortOrder(String profile) {
        Cursor cursor = db.rawQuery(
                "SELECT COALESCE(MAX(sort_order), -1) + 1 FROM local_lists WHERE profile=?",
                new String[]{profile});
        try {
            return cursor.moveToFirst() ? cursor.getLong(0) : 0;
        } finally {
            cursor.close();
        }
    }

    /**
     * Merge one list definition from a backup. Only a strictly newer incoming
     * definition may change an existing local name/order.
     */
    public void upsertListFromBackup(String profile, LocalList list) throws LocalListsException {
        validateProfile(profile);
        if (list == null) throw new IllegalArgumentException("list is required");
        LocalList existing = getList(profile, list.getUuid());
        if (existing == null) {
            ContentValues values = new ContentValues();
            values.put("profile", profile);
            values.put("uuid", list.getUuid());
            values.put("name", list.getName());
            values.put("sort_order", list.getSortOrder());
            values.put("created_at", list.getCreatedAt());
            values.put("updated_at", list.getUpdatedAt());
            db.insertWithOnConflict("local_lists", null, values, SQLiteDatabase.CONFLICT_IGNORE);
        } else if (list.getUpdatedAt() > existing.getUpdatedAt()) {
            ContentValues values = new ContentValues();
            values.put("name", list.getName());
            values.put("sort_order", list.getSortOrder());
            values.put("updated_at", list.getUpdatedAt());
            db.update("local_lists", values, "profile=? AND uuid=?",
                    new String[]{profile, list.getUuid()});
        }
    }

    /** Insert a restored membership only when the task has no local mapping yet. */
    public void insertMembershipFromBackup(String profile, Membership membership)
            throws LocalListsException {
        validateProfile(profile);
        if (membership == null) throw new IllegalArgumentException("membership is required");
        ContentValues values = new ContentValues();
        values.put("profile", profile);
        values.put("task_sid", membership.getTaskSid());
        values.put("list_uuid", membership.getListUuid());
        values.put("assigned_at", membership.getAssignedAt());
        db.insertWithOnConflict("memberships", null, values, SQLiteDatabase.CONFLICT_IGNORE);
    }

    public Membership getMembership(String profile, String taskSid) {
        validateProfile(profile);
        Cursor cursor = db.rawQuery("SELECT task_sid,list_uuid,assigned_at FROM memberships "
                        + "WHERE profile=? AND task_sid=?",
                new String[]{profile, validateTaskSid(taskSid)});
        try {
            if (!cursor.moveToFirst()) return null;
            return new Membership(cursor.getString(0), cursor.getString(1), cursor.getLong(2));
        } finally {
            cursor.close();
        }
    }

    public List<Membership> memberships(String profile) {
        validateProfile(profile);
        List<Membership> result = new ArrayList<Membership>();
        Cursor cursor = db.rawQuery("SELECT task_sid,list_uuid,assigned_at FROM memberships "
                + "WHERE profile=? ORDER BY assigned_at ASC, task_sid ASC", new String[]{profile});
        try {
            while (cursor.moveToNext()) {
                result.add(new Membership(cursor.getString(0), cursor.getString(1),
                        cursor.getLong(2)));
            }
        } finally {
            cursor.close();
        }
        return result;
    }

    public List<Membership> membershipsForList(String profile, String listUuid, int limit) {
        validateProfile(profile);
        int safeLimit = limit <= 0 ? 100000 : Math.min(limit, 100000);
        List<Membership> result = new ArrayList<Membership>();
        Cursor cursor = db.rawQuery("SELECT task_sid,list_uuid,assigned_at FROM memberships "
                        + "WHERE profile=? AND list_uuid=? ORDER BY assigned_at ASC, task_sid ASC "
                        + "LIMIT " + safeLimit,
                new String[]{profile, listUuid});
        try {
            while (cursor.moveToNext()) {
                result.add(new Membership(cursor.getString(0), cursor.getString(1),
                        cursor.getLong(2)));
            }
        } finally {
            cursor.close();
        }
        return result;
    }

    public int membershipCount(String profile, String listUuid) {
        validateProfile(profile);
        Cursor cursor = db.rawQuery("SELECT COUNT(*) FROM memberships "
                + "WHERE profile=? AND list_uuid=?", new String[]{profile, listUuid});
        try {
            return cursor.moveToFirst() ? cursor.getInt(0) : 0;
        } finally {
            cursor.close();
        }
    }

    public int membershipCount(String profile) {
        validateProfile(profile);
        Cursor cursor = db.rawQuery(
                "SELECT COUNT(*) FROM memberships WHERE profile=?", new String[]{profile});
        try {
            return cursor.moveToFirst() ? cursor.getInt(0) : 0;
        } finally {
            cursor.close();
        }
    }

    /** Returns true when the mapping changed, false when it was already present. */
    public boolean assignTask(String profile, String taskSid, String listUuid, long now)
            throws LocalListsException {
        validateProfile(profile);
        final String sid = validateTaskSid(taskSid);
        final String target = listUuid == null ? "" : listUuid;
        return transaction(new TransactionBody<Boolean>() {
            @Override
            public Boolean run() throws Exception {
                if (getList(profile, target) == null) {
                    throw new LocalListsException("That local list no longer exists");
                }
                Membership existing = getMembership(profile, sid);
                if (existing != null && existing.getListUuid().equals(target)) return Boolean.FALSE;
                ContentValues values = new ContentValues();
                values.put("profile", profile);
                values.put("task_sid", sid);
                values.put("list_uuid", target);
                values.put("assigned_at", existing == null ? now : Math.max(now, existing.getAssignedAt()));
                db.insertWithOnConflict("memberships", null, values,
                        SQLiteDatabase.CONFLICT_REPLACE);
                return Boolean.TRUE;
            }
        }).booleanValue();
    }

    public void unassignTask(String profile, String taskSid) {
        validateProfile(profile);
        db.delete("memberships", "profile=? AND task_sid=?",
                new String[]{profile, validateTaskSid(taskSid)});
    }

    public void unassignTask(String profile, String taskSid, String expectedListUuid) {
        validateProfile(profile);
        db.delete("memberships", "profile=? AND task_sid=? AND list_uuid=?",
                new String[]{profile, validateTaskSid(taskSid), expectedListUuid});
    }

    public String getSetting(String profile, String key) {
        validateProfile(profile);
        Cursor cursor = db.rawQuery("SELECT value FROM settings WHERE profile=? AND key=?",
                new String[]{profile, key});
        try {
            return cursor.moveToFirst() ? cursor.getString(0) : null;
        } finally {
            cursor.close();
        }
    }

    public void setSetting(String profile, String key, String value) {
        validateProfile(profile);
        ContentValues values = new ContentValues();
        values.put("profile", profile);
        values.put("key", key);
        values.put("value", value);
        db.insertWithOnConflict("settings", null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }

    public <T> T transaction(TransactionBody<T> body) throws LocalListsException {
        if (body == null) throw new IllegalArgumentException("body is required");
        boolean outer = transactionDepth == 0;
        if (outer) db.beginTransaction();
        transactionDepth++;
        try {
            T result = body.run();
            if (outer) db.setTransactionSuccessful();
            return result;
        } catch (LocalListsException error) {
            throw error;
        } catch (Exception error) {
            throw new LocalListsException("Local organizer operation failed", error);
        } finally {
            transactionDepth--;
            if (outer) db.endTransaction();
        }
    }

    public interface TransactionBody<T> {
        T run() throws Exception;
    }
}
