package app.morphe.extension.chmate;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import java.io.File;
import java.io.IOException;

/** Only for closed native restore databases during the startup install boundary. */
final class NativeRestoreDatabase {
    private NativeRestoreDatabase() { }

    static SQLiteDatabase open(File file, int flags) {
        // The platform's default corruption handler may delete a database. Never
        // permit that while inspecting either the restored copy or the old DB.
        return SQLiteDatabase.openDatabase(file.getPath(), null, flags, database -> {
            throw new SQLiteException("データベースが破損しています。復元用ファイルは削除していません");
        });
    }

    static void prepare(File file, String role) throws IOException {
        if (!file.exists()) return;
        if (!file.isFile()) throw new IOException(role + "データベースが通常のファイルではありません");
        boolean sidecars = false;
        for (String suffix : new String[]{"-wal", "-shm", "-journal"})
            sidecars |= new File(file.getPath() + suffix).length() > 0;
        if (!sidecars) return;
        try (SQLiteDatabase db = open(file, SQLiteDatabase.OPEN_READWRITE)) {
            // SQLite must replay a hot journal or checkpoint a committed WAL.
            // A non-empty PERSIST journal is not evidence of an unfinished write.
            try (Cursor checkpoint = db.rawQuery("PRAGMA wal_checkpoint(TRUNCATE)", null)) {
                if (!checkpoint.moveToFirst() || checkpoint.getInt(0) != 0)
                    throw new IOException(role + "データベースが使用中のため確定できません");
            }
            db.disableWriteAheadLogging();
            try (Cursor mode = db.rawQuery("PRAGMA journal_mode=DELETE", null)) {
                if (!mode.moveToFirst() || !"delete".equalsIgnoreCase(mode.getString(0)))
                    throw new IOException(role + "データベースのジャーナルを確定できません");
            }
            // Check under an exclusive write lock, then close every handle before
            // the file installer checks sidecars and switches the validated DB.
            db.beginTransaction();
            try {
                try (Cursor result = db.rawQuery("PRAGMA quick_check(1)", null)) {
                    if (!result.moveToFirst() || !"ok".equalsIgnoreCase(result.getString(0)))
                        throw new IOException(role + "データベースの整合性検査に失敗しました");
                }
                db.setTransactionSuccessful();
            } finally { db.endTransaction(); }
        } catch (RuntimeException error) {
            throw new IOException(role + "データベースの補助ファイルを安全に確定できません", error);
        }
    }
}
