package app.template.extension.stayfree;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * Local replacement for StayFree's "Usage Data Backup" (Google Drive, gated behind Google
 * Sign-In and the anonymous data collection opt-in). Backs the app's own data up to a zip file
 * the user picks with the system file picker, and restores it from one.
 * <p>
 * A backup holds:
 * <ul>
 *   <li>{@code databases/}: StayFree's Room/SQLite databases (usage history, limits, ...),
 *       minus analytics and WorkManager databases ({@link #isExcludedDatabase});</li>
 *   <li>{@code shared_prefs/}: settings;</li>
 *   <li>{@code files/datastore/} and the local sync store.</li>
 * </ul>
 * A restore is not applied in place, since Room keeps the databases open: the zip is extracted
 * to {@link #PENDING_DIR}, the process is restarted, and {@link #applyPendingRestore} (called
 * from {@code Application.attachBaseContext}, before any database is opened) swaps it in.
 */
@SuppressWarnings("unused")
public final class LocalBackup {
    static final String TAG = "StayFreeLocalBackup";

    static final String MARKER = "stayfree-local-backup.properties";
    private static final String PENDING_DIR = "local_backup_pending";
    private static final String DATABASES = "databases";
    private static final String SHARED_PREFS = "shared_prefs";
    private static final String DATASTORE = "files/datastore";
    private static final String LOCAL_SYNC_STORE = "files/stayfree_local_sync.json";

    private LocalBackup() {
    }

    // ---------------------------------------------------------------------------------------
    // Settings > Storage row

    /**
     * Click handler of the Settings > Storage backup row. The patch passes every object the
     * original click lambda captured; the screen's activity is one of them.
     */
    public static void onBackupRowClicked(Object a, Object b, Object c, Object d, Object e) {
        Activity activity = null;
        for (Object o : new Object[]{a, b, c, d, e}) {
            if (o instanceof Activity) {
                activity = (Activity) o;
                break;
            }
        }
        if (activity == null) {
            Log.w(TAG, "No activity captured by the backup row click");
            return;
        }
        showMenu(activity);
    }

    private static void showMenu(Activity activity) {
        new AlertDialog.Builder(activity, dialogTheme(activity))
                .setTitle("Local Data Backup")
                .setMessage("Export your usage history, limits and settings to a backup file on "
                        + "this device, or restore them from one.\n\nNothing is uploaded and no "
                        + "Google account is needed.")
                .setPositiveButton("Export", (dialog, which) ->
                        LocalBackupActivity.start(activity, LocalBackupActivity.ACTION_EXPORT))
                .setNegativeButton("Restore", (dialog, which) -> confirmRestore(activity))
                .setNeutralButton("Close", null)
                .show();
    }

    private static void confirmRestore(Activity activity) {
        new AlertDialog.Builder(activity, dialogTheme(activity))
                .setTitle("Restore backup?")
                .setMessage("All current StayFree data on this device will be replaced by the "
                        + "backup you pick, and StayFree will restart.")
                .setPositiveButton("Choose file", (dialog, which) ->
                        LocalBackupActivity.start(activity, LocalBackupActivity.ACTION_RESTORE))
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static int dialogTheme(Context context) {
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night == Configuration.UI_MODE_NIGHT_NO
                ? android.R.style.Theme_DeviceDefault_Light_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Dialog_Alert;
    }

    // ---------------------------------------------------------------------------------------
    // Export

    static void export(Context context, OutputStream out) throws IOException {
        File dataDir = context.getDataDir();
        File databases = new File(dataDir, DATABASES);

        // Fold each WAL into its database first so the copied .db file is complete on its own.
        File[] dbFiles = databases.listFiles();
        if (dbFiles != null) {
            for (File file : dbFiles) {
                if (file.isFile() && file.getName().endsWith(".db") && !isExcludedDatabase(file.getName())) {
                    checkpoint(file);
                }
            }
        }

        try (ZipOutputStream zip = new ZipOutputStream(out)) {
            Properties marker = new Properties();
            marker.setProperty("package", context.getPackageName());
            marker.setProperty("created", Long.toString(System.currentTimeMillis()));
            try {
                marker.setProperty("versionName", String.valueOf(context.getPackageManager()
                        .getPackageInfo(context.getPackageName(), 0).versionName));
            } catch (Exception ignored) {
            }
            zip.putNextEntry(new ZipEntry(MARKER));
            marker.store(zip, "StayFree local backup");
            zip.closeEntry();

            for (String path : backupPaths(dataDir)) {
                File file = new File(dataDir, path);
                zip.putNextEntry(new ZipEntry(path));
                try (InputStream in = new FileInputStream(file)) {
                    copy(in, zip);
                }
                zip.closeEntry();
            }
        }
    }

    private static void checkpoint(File database) {
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(database.getPath(), null,
                SQLiteDatabase.OPEN_READWRITE | SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
             Cursor cursor = db.rawQuery("PRAGMA wal_checkpoint(FULL)", null)) {
            cursor.moveToFirst();
        } catch (Exception e) {
            Log.w(TAG, "WAL checkpoint failed for " + database.getName(), e);
        }
    }

    /** Data-dir-relative paths of every file that goes into a backup. */
    private static List<String> backupPaths(File dataDir) {
        List<String> paths = new ArrayList<>();
        File[] dbFiles = new File(dataDir, DATABASES).listFiles();
        if (dbFiles != null) {
            for (File file : dbFiles) {
                if (file.isFile() && !isExcludedDatabase(file.getName()) && !file.getName().endsWith(".lck")) {
                    paths.add(DATABASES + "/" + file.getName());
                }
            }
        }
        addTree(paths, dataDir, SHARED_PREFS);
        addTree(paths, dataDir, DATASTORE);
        if (new File(dataDir, LOCAL_SYNC_STORE).isFile()) paths.add(LOCAL_SYNC_STORE);
        return paths;
    }

    private static void addTree(List<String> paths, File dataDir, String relative) {
        File dir = new File(dataDir, relative);
        File[] files = dir.listFiles();
        if (files == null) return;
        for (File file : files) {
            String child = relative + "/" + file.getName();
            if (file.isDirectory()) addTree(paths, dataDir, child);
            else if (file.isFile()) paths.add(child);
        }
    }

    /**
     * Databases that are not StayFree data: analytics queues and WorkManager's job table (whose
     * stale job ids would confuse the scheduler after a restore).
     */
    private static boolean isExcludedDatabase(String name) {
        String lower = name.toLowerCase(Locale.US);
        return lower.startsWith("androidx.work.workdb")
                || lower.startsWith("google_app_measurement")
                || lower.startsWith("com.google.android.datatransport")
                || lower.startsWith("singular");
    }

    // ---------------------------------------------------------------------------------------
    // Restore

    /**
     * Extracts a backup zip into the pending-restore dir. Returns false (and leaves nothing
     * behind) when the file is not a StayFree local backup.
     */
    static boolean stageRestore(Context context, InputStream in) throws IOException {
        File dataDir = context.getDataDir();
        File pending = new File(dataDir, PENDING_DIR);
        deleteTree(pending);
        File staging = new File(dataDir, PENDING_DIR + ".tmp");
        deleteTree(staging);

        boolean hasMarker = false;
        try (ZipInputStream zip = new ZipInputStream(in)) {
            ZipEntry entry;
            while ((entry = zip.getNextEntry()) != null) {
                String name = entry.getName();
                if (entry.isDirectory()) continue;
                if (name.equals(MARKER)) {
                    Properties marker = new Properties();
                    marker.load(new java.io.InputStreamReader(zip, StandardCharsets.ISO_8859_1));
                    hasMarker = context.getPackageName().equals(marker.getProperty("package"));
                    continue;
                }
                if (!isRestorablePath(name)) {
                    Log.w(TAG, "Skipping unexpected backup entry " + name);
                    continue;
                }
                File target = new File(staging, name);
                File parent = target.getParentFile();
                if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
                    throw new IOException("Cannot create " + parent);
                }
                try (OutputStream out = new FileOutputStream(target)) {
                    copy(zip, out);
                }
            }
        } catch (IOException e) {
            deleteTree(staging);
            throw e;
        }

        if (!hasMarker) {
            deleteTree(staging);
            return false;
        }
        if (!staging.renameTo(pending)) {
            deleteTree(staging);
            throw new IOException("Cannot stage restore");
        }
        return true;
    }

    /** Only paths a backup can contain; also rules out "../" escapes. */
    private static boolean isRestorablePath(String name) {
        if (name.contains("..") || name.startsWith("/") || name.contains("\\")) return false;
        if (name.equals(LOCAL_SYNC_STORE)) return true;
        if (name.startsWith(SHARED_PREFS + "/") || name.startsWith(DATASTORE + "/")) return true;
        if (name.startsWith(DATABASES + "/")) {
            String file = name.substring(DATABASES.length() + 1);
            return !file.contains("/") && !isExcludedDatabase(file);
        }
        return false;
    }

    /**
     * Swaps a staged restore in. Called first thing in {@code Application.attachBaseContext},
     * so no database or preferences file is open yet.
     */
    public static void applyPendingRestore(Context context) {
        try {
            File dataDir = context.getDataDir();
            File pending = new File(dataDir, PENDING_DIR);
            if (!pending.isDirectory()) return;
            Log.i(TAG, "Applying staged restore");

            // Clear what a backup replaces, so nothing from the current data lingers.
            File[] dbFiles = new File(dataDir, DATABASES).listFiles();
            if (dbFiles != null) {
                for (File file : dbFiles) {
                    if (file.isFile() && !isExcludedDatabase(file.getName())) file.delete();
                }
            }
            deleteTree(new File(dataDir, SHARED_PREFS));
            deleteTree(new File(dataDir, DATASTORE));
            new File(dataDir, LOCAL_SYNC_STORE).delete();

            moveTree(pending, dataDir);
            deleteTree(pending);
        } catch (Throwable t) {
            Log.e(TAG, "Applying staged restore failed", t);
        }
    }

    private static void moveTree(File from, File to) throws IOException {
        File[] files = from.listFiles();
        if (files == null) return;
        for (File file : files) {
            File target = new File(to, file.getName());
            if (file.isDirectory()) {
                if (!target.isDirectory() && !target.mkdirs()) throw new IOException("Cannot create " + target);
                moveTree(file, target);
            } else {
                target.delete();
                if (!file.renameTo(target)) throw new IOException("Cannot move " + file);
            }
        }
    }

    /** Restarts StayFree so {@link #applyPendingRestore} runs. */
    static void restartApp(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            // Fallback in case the activity start below is dropped together with the process.
            try {
                PendingIntent pending = PendingIntent.getActivity(activity, 0x5F0B, launch,
                        PendingIntent.FLAG_CANCEL_CURRENT | PendingIntent.FLAG_IMMUTABLE);
                AlarmManager alarms = (AlarmManager) activity.getSystemService(Context.ALARM_SERVICE);
                alarms.set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime() + 500, pending);
            } catch (Exception e) {
                Log.w(TAG, "Restart alarm failed", e);
            }
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        Process.killProcess(Process.myPid());
        System.exit(0);
    }

    // ---------------------------------------------------------------------------------------

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        int read;
        while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
    }

    private static void deleteTree(File file) {
        File[] children = file.listFiles();
        if (children != null) {
            for (File child : children) deleteTree(child);
        }
        file.delete();
    }
}
