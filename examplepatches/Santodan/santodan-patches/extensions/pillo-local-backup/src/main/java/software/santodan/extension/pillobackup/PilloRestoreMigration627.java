package software.santodan.extension.pillobackup;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Upgrade a staged 0.6.20 snapshot with 0.6.27's own Room migrations and validator. */
public final class PilloRestoreMigration627 {
    private static final String DATABASE = "xyz.rtrvr.pillo.data.persistence.database.AppDatabase";
    private static final String OLD_IDENTITY = "acdc24b1947a76c496bdc3ac20b3d60e";
    private static final String IDENTITY = "0b0400f334f4d39ec5f093b3c677e070";
    private PilloRestoreMigration627() {}

    public static void prepare(Context context, File stagedDatabase, String sourceVersion) throws Exception {
        stagedDatabase = canonicalStagedDatabase(stagedDatabase);
        if ("0.6.27".equals(sourceVersion)) {
            validate(stagedDatabase, 53, IDENTITY);
            return;
        }
        if (!"0.6.20".equals(sourceVersion))
            throw new IOException("Cannot upgrade a local backup from Pillo " + sourceVersion + ".");
        validate(stagedDatabase, 51, OLD_IDENTITY);

        // A fresh builder names only the staged file. It never uses the live database
        // manager/singleton, diagnostic callbacks, or destructive-migration fallbacks.
        Class<?> databaseType = Class.forName(DATABASE);
        Object builder = Class.forName("androidx.room.Room").getMethod("databaseBuilder",
            Context.class, Class.class, String.class).invoke(null, context, databaseType, stagedDatabase.getAbsolutePath());
        Object companion = databaseType.getField("Companion").get(null);
        Class<?> migrationType = Class.forName("androidx.room.migration.Migration");
        Object migrations = Array.newInstance(migrationType, 2);
        Array.set(migrations, 0, companion.getClass().getMethod("getMIGRATION_51_52").invoke(companion));
        Array.set(migrations, 1, companion.getClass().getMethod("getMIGRATION_52_53").invoke(companion));
        Class<?> builderType = Class.forName("androidx.room.RoomDatabase$Builder");
        builderType.getMethod("addMigrations", migrations.getClass()).invoke(builder, migrations);
        Object room = builderType.getMethod("build").invoke(builder);
        Class<?> roomType = Class.forName("androidx.room.RoomDatabase");
        try {
            Object helper = roomType.getMethod("getOpenHelper").invoke(room);
            Object database = Class.forName("lb.f").getMethod("getWritableDatabase").invoke(helper);
            // getWritableDatabase performs the migration transaction and Room's generated
            // schema validation. Flush WAL before the restore transaction copies one file.
            try (Cursor cursor = (Cursor) Class.forName("lb.a").getMethod("query", String.class)
                    .invoke(database, "PRAGMA wal_checkpoint(TRUNCATE)")) {
                if (!cursor.moveToFirst() || cursor.getInt(0) != 0)
                    throw new IOException("Cannot finish the staged database upgrade; the database is busy.");
            }
        } catch (InvocationTargetException error) {
            throw new IOException("Pillo could not upgrade the staged backup database.", error.getCause());
        } finally {
            roomType.getMethod("close").invoke(room);
        }
        File wal = new File(stagedDatabase.getPath() + "-wal");
        if (wal.exists() && wal.length() != 0) throw new IOException("Staged database changes were not fully saved.");
        validate(stagedDatabase, 53, IDENTITY);
    }

    static File canonicalStagedDatabase(File database) throws IOException {
        if (!database.isFile()) throw new IOException("Staged backup database is missing.");
        File absolute = database.getAbsoluteFile();
        File canonical = database.getCanonicalFile();
        // Android may expose app storage through an aliased parent path. Resolve that
        // parent first, while still rejecting a database-file symlink or redirected leaf.
        File expected = new File(absolute.getParentFile().getCanonicalFile(), absolute.getName());
        if (!canonical.equals(expected)) throw new IOException("Staged backup database is an unsafe link.");
        return canonical;
    }

    static void validate(File file, int version, String identity) throws IOException {
        try (SQLiteDatabase database = SQLiteDatabase.openDatabase(file.getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS)) {
            if (database.getVersion() != version) throw new IOException("Backup database version does not match its Pillo version.");
            try (Cursor cursor = database.rawQuery("PRAGMA quick_check", null)) {
                if (!cursor.moveToFirst() || !"ok".equals(cursor.getString(0)) || cursor.moveToNext())
                    throw new IOException("Backup database is damaged.");
            }
            try (Cursor cursor = database.rawQuery("SELECT identity_hash FROM room_master_table WHERE id=42", null)) {
                if (!cursor.moveToFirst() || !identity.equals(cursor.getString(0)))
                    throw new IOException("Backup database schema does not match its Pillo version.");
            }
        }
    }
}
