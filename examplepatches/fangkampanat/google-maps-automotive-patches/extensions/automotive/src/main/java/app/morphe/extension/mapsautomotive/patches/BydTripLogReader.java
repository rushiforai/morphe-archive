package app.morphe.extension.mapsautomotive.patches;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * The Android side of {@link BydTripLog}: the file's bytes, from the file itself with the storage permission (DiLink 3,
 * Android 10, where Maps' legacy storage lets it read the shared storage) or through the car's ADB ({@link CarAdb#readFile}:
 * quietly at Maps' start, with a key the car already trusts; asking only on the owner's tap); then the trips. The bytes go to a copy in Maps' cache, opened read-only and deleted after,
 * so BYD's own file and its journal are never opened by SQLite. Off the main thread.
 */
final class BydTripLogReader {
    /** Maps declares this one (with legacy storage); on Android 10 it brings the read permission with it. */
    static final String PERMISSION = Manifest.permission.WRITE_EXTERNAL_STORAGE;
    static final int PERMISSION_REQUEST = 0x4259;
    /** Where the bytes come from: the file, the car's ADB without asking, the car's ADB where Android may ask. */
    static final int FILE = 0, ADB_QUIET = 1, ADB_ASK = 2;
    static final String[] ROUTES = {"file", "adb_quiet", "adb"};
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final byte[] SQLITE_HEADER = "SQLite format 3\0".getBytes(StandardCharsets.US_ASCII);
    private static final String COPY = "morphe_byd_trip_log.db";

    private BydTripLogReader() {
    }

    /** Whether the storage permission can read the log: Android 10 or older (legacy storage). */
    static boolean storageRoute() {
        return Build.VERSION.SDK_INT <= 29;
    }

    static boolean permitted(Context context) {
        try {
            return context.checkSelfPermission(PERMISSION) == PackageManager.PERMISSION_GRANTED
                    || context.checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
        } catch (RuntimeException error) {
            return false;
        }
    }

    /** Android's own "Allow" dialog for the storage permission; the BYD battery dialog notices the answer. */
    static void requestPermission(Activity activity) {
        activity.requestPermissions(new String[]{PERMISSION}, PERMISSION_REQUEST);
    }

    /** The trips by [route]: the file (needs {@link #permitted}) or the car's ADB. */
    static List<BydTripLog.Trip> read(Context context, int route) throws Exception {
        byte[] bytes = route == FILE ? readFile(new File(BydTripLog.PATH))
                : CarAdb.readFile(BydTripLog.PATH, MAX_BYTES, route == ADB_QUIET);
        if (bytes.length < 100 || !Arrays.equals(Arrays.copyOf(bytes, SQLITE_HEADER.length), SQLITE_HEADER)) {
            throw new IOException("not an SQLite file (" + bytes.length + " bytes)");
        }
        File copy = new File(context.getCacheDir(), COPY + "." + ROUTES[route]);
        try {
            try (FileOutputStream out = new FileOutputStream(copy)) {
                out.write(bytes);
            }
            List<double[]> rows = new ArrayList<>();
            try (SQLiteDatabase db = SQLiteDatabase.openDatabase(copy.getPath(), null,
                    SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
                 Cursor cursor = db.rawQuery("SELECT start_timestamp, duration, trip, electricity, is_deleted FROM "
                         + BydTripLog.TABLE, null)) {
                while (cursor.moveToNext()) {
                    rows.add(new double[]{cursor.getDouble(0), cursor.getDouble(1), cursor.getDouble(2), cursor.getDouble(3),
                            cursor.getDouble(4)});
                }
            }
            return BydTripLog.trips(rows);
        } finally {
            //noinspection ResultOfMethodCallIgnored
            copy.delete();
            //noinspection ResultOfMethodCallIgnored
            new File(copy.getPath() + "-journal").delete();
        }
    }

    private static byte[] readFile(File file) throws IOException {
        if (file.length() > MAX_BYTES) throw new IOException("too large: " + file.length());
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16384];
            for (int n; (n = in.read(buffer)) > 0; ) {
                out.write(buffer, 0, n);
                if (out.size() > MAX_BYTES) throw new IOException("too large");
            }
            return out.toByteArray();
        }
    }
}
