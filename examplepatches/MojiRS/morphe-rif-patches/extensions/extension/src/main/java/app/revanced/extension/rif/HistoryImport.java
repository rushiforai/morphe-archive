package app.revanced.extension.rif;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.zip.ZipInputStream;

/**
 * Makes rif's "Import settings" restore the history from a backup made with "Export settings and
 * history". rif exports browserhistory.db into the backup zip but its import only restores a fixed
 * list of other databases, so the history was silently dropped.
 * <p>
 * Called from rif's import task for every zip entry, right after the entry's name is read. For
 * the history database it merges the entry into the current history (see {@link HistoryImporter}:
 * only items whose URI is missing are added, nothing is removed). For any other entry, or on any
 * failure, it returns without touching anything, so the rest of rif's import carries on.
 * <p>
 * Runs on rif's import task thread. The backup is copied to a temporary file in the cache folder
 * first, because SQLite needs a file. Based on Arnaumes' "Import history" patch
 * (github.com/Arnaumes/revanced-rif-import-history), GPL-3.0.
 */
public final class HistoryImport {
    private static final String TAG = "RifHistoryImport";

    /** Far above any real history (about 150 bytes per item); guards against filling the storage. */
    static final long MAX_DATABASE_BYTES = 512L * 1024L * 1024L;

    private static final byte[] SQLITE_MAGIC = "SQLite format 3\0".getBytes(Charset.forName("US-ASCII"));
    private static final String TEMP_PREFIX = "rif_history_import";

    private HistoryImport() {}

    /**
     * Hook target. {@code zip} is positioned at the start of the entry called {@code name}; this
     * may read all of it (rif then skips whatever is left, like for an entry it ignores).
     */
    public static void onImportEntry(String name, ZipInputStream zip) {
        File extracted = null;
        try {
            if (!HistoryDatabase.NAME.equals(name) || zip == null) return;
            Context context = Settings.context();
            if (context == null) {
                Log.w(TAG, "No Context; history not imported");
                return;
            }

            deleteLeftovers(context.getCacheDir());
            extracted = File.createTempFile(TEMP_PREFIX, ".db", context.getCacheDir());
            copy(zip, extracted);
            if (!isSqliteDatabase(extracted)) {
                Log.w(TAG, name + " in the backup is not an SQLite database; history not imported");
                return;
            }

            SQLiteDatabase source = SQLiteDatabase.openDatabase(extracted.getPath(), null,
                    SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
            try {
                SQLiteDatabase target = HistoryDatabase.openWritable(context);
                HistoryImporter.Result result = HistoryImporter.merge(source, target,
                        new HistoryImporter.ProgressListener() {
                            @Override
                            public void onProgress(int processed, int total) {
                            }
                        });
                Log.i(TAG, "Imported " + result.imported + " history items, " + result.alreadyPresent
                        + " already present, " + result.duplicates + " duplicates in the backup");
                if (result.imported > 0) HistoryDatabase.notifyChanged(context);
            } finally {
                source.close();
                HistoryDatabase.closeFallback();
            }
        } catch (Throwable t) {
            Log.w(TAG, "History not imported", t);
        } finally {
            if (extracted != null) deleteDatabaseFiles(extracted);
        }
    }

    private static boolean isSqliteDatabase(File file) throws IOException {
        InputStream in = new FileInputStream(file);
        try {
            byte[] header = new byte[SQLITE_MAGIC.length];
            int total = 0;
            while (total < header.length) {
                int read = in.read(header, total, header.length - total);
                if (read < 0) break;
                total += read;
            }
            if (total < header.length) return false;
            for (int i = 0; i < header.length; i++) {
                if (header[i] != SQLITE_MAGIC[i]) return false;
            }
            return true;
        } finally {
            in.close();
        }
    }

    private static void copy(InputStream in, File destination) throws IOException {
        OutputStream out = new FileOutputStream(destination);
        try {
            byte[] buffer = new byte[64 * 1024];
            long total = 0;
            int read;
            while ((read = in.read(buffer)) > 0) {
                total += read;
                if (total > MAX_DATABASE_BYTES) {
                    throw new IOException("The history database is too large");
                }
                out.write(buffer, 0, read);
            }
        } finally {
            out.close();
        }
    }

    /** Temporary copies left behind by an import whose process was killed. */
    private static void deleteLeftovers(File cacheDir) {
        File[] files = cacheDir.listFiles();
        if (files == null) return;
        for (File file : files) {
            if (file.getName().startsWith(TEMP_PREFIX) && !file.delete()) Log.w(TAG, "Could not delete " + file);
        }
    }

    private static void deleteDatabaseFiles(File database) {
        for (String suffix : new String[]{"", "-journal", "-wal", "-shm"}) {
            File file = new File(database.getPath() + suffix);
            if (file.exists() && !file.delete()) Log.w(TAG, "Could not delete " + file);
        }
    }
}
