/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/63
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

/*
 * Copied from morphe-patches-library v2.0.0 (eb0de0c) and modified for
 * fank-morphe-maps-automotive-patches, first built on extension library 1.4.1:
 * installed from Application.onCreate with a Context (every process, earliest hook),
 * hard coded English messages (no Utils.isContextSet in 1.4.1, no localized strings),
 * no API 33 package query (Android 10 target, avoids R8 API outlines), process name added.
 * Moved to the mapsautomotive package because extension library 2.0.0 ships its own
 * app.morphe.extension.shared.patches.CrashLogPatch (Activity based).
 * Maps Car 0.1.1: installed earlier, from the Application's attachBaseContext through SafeMode;
 * after writing the file it records the crash for safe mode, posts a notification that opens the
 * problem report, and the file names the features that were running.
 * Maps Car 0.1.1: the private copy also holds the crashing process's warning and error lines
 * from logcat (ReportLogcat); the header names the BYD model, firmware, screen and locale; native
 * crashes found later in the crash log get a file of their own (NativeCrashes).
 */

package app.morphe.extension.mapsautomotive.patches;

import android.Manifest;
import android.app.ActivityManager;
import android.app.Application;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Looper;
import android.os.Process;
import android.provider.MediaStore;
import android.view.Display;
import android.view.WindowManager;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Writes a text file to the device Documents folder when the app crashes.
 * <p>
 * Android 10+ uses MediaStore, which does not require any storage permission.
 * Android 8 and 9 write directly to the public Documents folder,
 * which requires the WRITE_EXTERNAL_STORAGE permission to be granted.
 * If the public folder cannot be written to, the app specific
 * external files folder is used instead (Android/data/[package]/files/Documents).
 */
@SuppressWarnings("unused")
public final class CrashLogPatch {

    private static final String CRASH_LOG_SUB_FOLDER = "Morphe";

    private static final String MANAGER_PACKAGE_NAME = "app.morphe.manager";
    private static final String MICROG_PACKAGE_NAME = "app.revanced.android.gms";

    /**
     * How long to keep the crashed process alive so the toast can be seen.
     */
    private static final long TOAST_DISPLAY_MILLISECONDS = 2000;

    private static volatile boolean handlerInstalled;

    /**
     * Prevents recursive crash handling if writing the crash log itself crashes.
     */
    private static volatile boolean handlingCrash;

    /**
     * Injection point. Called from Application.onCreate in every process of the app.
     */
    public static void setUncaughtExceptionHandler(Context context) {
        installHandler(context.getApplicationContext() != null ? context.getApplicationContext() : context);

        // The in-app problem report: its log file and, in the main process, its uploader.
        try {
            Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            ReportLog.start(appContext);
            ReportPatch.onAppStart(appContext);
        } catch (Throwable ex) {
            Logger.printException(() -> "problem report start failure", ex);
        }
    }

    /**
     * Installs the process-wide handler once. SafeMode calls this first, from the Application's
     * attachBaseContext with the base context, so crashes in Maps' content providers are caught too.
     */
    static void installHandler(Context appContext) {
        try {
            // The handler is process wide.
            if (handlerInstalled) {
                return;
            }
            handlerInstalled = true;

            Thread.UncaughtExceptionHandler originalHandler = Thread.getDefaultUncaughtExceptionHandler();

            Thread.setDefaultUncaughtExceptionHandler((thread, throwable) -> {
                try {
                    if (!handlingCrash) {
                        handlingCrash = true;
                        // Keeps the problem report's last lines before the crash.
                        try {
                            ReportLog.flush();
                        } catch (Throwable ignored) {
                            // The crash log comes first.
                        }
                        String toastMessage = writeCrashLog(appContext, thread, throwable);
                        // Safe mode counts the crash; the notification opens the problem report. Never for
                        // the report screen's own process, which cannot reopen itself.
                        try {
                            if (!SafeMode.isReportProcess()) {
                                boolean safeModeStarts = SafeMode.recordCrash(appContext);
                                ReportNotice.crash(appContext, safeModeStarts);
                            }
                        } catch (Throwable ignored) {
                            // The crash log is written.
                        }
                        showToastAndWait(appContext, toastMessage);
                    }
                } catch (Throwable ex) {
                    Logger.printException(() -> "uncaughtException failure", ex);
                } finally {
                    // Must always be called, otherwise the app can be left frozen instead of closing.
                    if (originalHandler != null) {
                        originalHandler.uncaughtException(thread, throwable);
                    }
                }
            });

            Logger.printDebug(() -> "Crash log handler installed");
        } catch (Exception ex) {
            Logger.printException(() -> "setUncaughtExceptionHandler failure", ex);
        }
    }

    /**
     * @return Toast message describing where the crash log was saved.
     */
    private static String writeCrashLog(Context context, Thread thread, Throwable throwable) throws IOException {
        Date now = new Date();
        String fileName = crashFileName(context, now.getTime(), "");
        String text = buildCrashLog(context, now, thread, throwable);
        byte[] contents = text.getBytes(StandardCharsets.UTF_8);

        // A private copy for the in-app problem report, which cannot read the public file back after a
        // reinstall. Only this copy holds the process's logcat lines: they are redacted and shown
        // before a report is sent, while the public file is not.
        try {
            StringBuilder copy = new StringBuilder(text);
            List<String> logcat = ReportLogcat.processTail(Process.myPid());
            if (!logcat.isEmpty()) {
                copy.append(ReportLogcat.MARKER);
                for (String line : logcat) copy.append(line).append('\n');
            }
            ReportStore.saveCrash(context, fileName, copy.toString().getBytes(StandardCharsets.UTF_8), now.getTime());
        } catch (Throwable ex) {
            Logger.printException(() -> "crash copy failure", ex);
        }

        String savedLocation = null;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            savedLocation = writeToMediaStoreDocuments(context, fileName, contents);
        } else if (context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                == PackageManager.PERMISSION_GRANTED) {
            File documents = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS);
            savedLocation = writeToFolder(new File(documents, CRASH_LOG_SUB_FOLDER), fileName, contents);
        }

        if (savedLocation != null) {
            String finalSavedLocation = savedLocation;
            Logger.printInfo(() -> "Crash log saved: " + finalSavedLocation);
            return String.format(Locale.US, "Crash log saved to user documents: %s", fileName);
        }

        // Public Documents folder is not available. Use the app specific folder that never needs permissions.
        File appDocuments = context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS);
        if (appDocuments == null) {
            throw new IOException("External storage is not available");
        }
        savedLocation = writeToFolder(appDocuments, fileName, contents);
        if (savedLocation == null) {
            throw new IOException("Could not write crash log");
        }

        String finalSavedLocation = savedLocation;
        Logger.printInfo(() -> "Crash log saved: " + finalSavedLocation);
        return String.format(Locale.US, "Crash log saved: %s", savedLocation);
    }

    /**
     * Shows a toast and blocks the calling thread so the toast is visible before the app closes.
     * <p>
     * The toast is shown on a new thread with its own looper, because this is called on the crashed thread:
     * <ul>
     * <li>If the main thread crashed, its looper is no longer running. Toasts posted to the main thread
     *     never show, and Android 10 and lower cannot show a toast directly on the main thread either.
     * <li>If a background thread crashed, it usually has no looper and creating a toast throws an exception.
     * </ul>
     */
    private static void showToastAndWait(Context context, String message) throws InterruptedException {
        Thread toastThread = new Thread(() -> {
            try {
                // A toast requires a looper on the thread that shows it.
                Looper.prepare();
                Toast.makeText(context, message, Toast.LENGTH_LONG).show();
                Looper.loop();
            } catch (Exception ex) {
                Logger.printException(() -> "showToastAndWait failure", ex);
            }
        }, "Morphe crash log toast");
        toastThread.setDaemon(true);
        toastThread.start();

        // Keep the process alive while the toast is visible, otherwise the original handler closes the app immediately.
        Thread.sleep(TOAST_DISPLAY_MILLISECONDS);
    }

    @Nullable
    @RequiresApi(Build.VERSION_CODES.Q)
    private static String writeToMediaStoreDocuments(Context context, String fileName, byte[] contents) {
        Uri uri = null;
        ContentResolver resolver = context.getContentResolver();
        String relativePath = Environment.DIRECTORY_DOCUMENTS + File.separator + CRASH_LOG_SUB_FOLDER;

        try {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, relativePath);

            uri = resolver.insert(MediaStore.Files.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), values);
            if (uri == null) {
                Logger.printDebug(() -> "MediaStore insert returned null");
                return null;
            }

            try (OutputStream stream = resolver.openOutputStream(uri)) {
                if (stream == null) {
                    throw new IOException("Could not open output stream: " + uri);
                }
                stream.write(contents);
            }

            return relativePath + File.separator + fileName;
        } catch (Exception ex) {
            Logger.printException(() -> "writeToMediaStoreDocuments failure", ex);

            if (uri != null) {
                resolver.delete(uri, null, null);
            }

            return null;
        }
    }

    @Nullable
    private static String writeToFolder(File folder, String fileName, byte[] contents) {
        try {
            if (!folder.isDirectory() && !folder.mkdirs()) {
                throw new IOException("Could not create folder: " + folder);
            }

            File file = new File(folder, fileName);
            try (OutputStream stream = new FileOutputStream(file)) {
                stream.write(contents);
            }

            return file.getAbsolutePath();
        } catch (Exception ex) {
            Logger.printException(() -> "writeToFolder failure: " + folder, ex);
            return null;
        }
    }

    /**
     * Uses UTC so the crash log and file name do not reveal the user's time zone.
     */
    private static String formatUtc(String pattern, Date date) {
        SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(date);
    }

    /** crash_[package]_[UTC time][suffix].txt; the names sort by time. */
    static String crashFileName(Context context, long time, String suffix) {
        return "crash_" + context.getPackageName() + "_" + formatUtc("yyyy-MM-dd_HH-mm-ss", new Date(time)) + suffix + ".txt";
    }

    // The lines every crash file starts with, up to the process.
    private static String header(Context context, String title, Date time) {
        return title + "\n\n"
                + "Time: " + formatUtc("yyyy-MM-dd HH:mm:ss.SSS", time) + " UTC\n"
                + "App: " + context.getPackageName() + " " + getInstalledVersion(context, context.getPackageName()) + "\n"
                + "Patches: " + Utils.getPatchesReleaseVersion() + "\n"
                + "Manager: " + getInstalledVersion(context, MANAGER_PACKAGE_NAME) + "\n"
                + "MicroG: " + getInstalledVersion(context, MICROG_PACKAGE_NAME) + "\n"
                + "Device: " + Build.MANUFACTURER + " " + Build.MODEL + " (" + Build.DEVICE + ")\n"
                + "Android: " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + "), build " + Build.DISPLAY + "\n"
                + "ABIs: " + Arrays.toString(Build.SUPPORTED_ABIS) + "\n"
                + "Car: " + BydBatteryPatch.describeCar() + "\n"
                + "Screen: " + describeScreen(context) + "\n";
    }

    private static String buildCrashLog(Context context, Date time, Thread thread, Throwable throwable) {
        StringWriter stackTrace = new StringWriter();
        throwable.printStackTrace(new PrintWriter(stackTrace));

        String crashLog = header(context, "Morphe crash log", time)
                + "Process: " + Application.getProcessName() + " (" + (Process.is64Bit() ? "64-bit" : "32-bit") + ")\n"
                + "Maps Car features: " + SafeMode.describe() + "\n"
                + "RAM: " + getRamInfo(context) + "\n"
                + "Heap: " + getHeapInfo() + "\n"
                + "Thread: " + thread.getName() + "\n"
                + "\nStack trace:\n" + stackTrace;

        String debugLogs = Logger.getFilteredLogs();
        if (!debugLogs.isEmpty()) {
            crashLog += "\nMorphe logs:\n" + debugLogs + "\n";
        }

        return crashLog;
    }

    /** A native crash read from the crash log at a later start; only a private copy is written. */
    static String buildNativeCrashLog(Context context, ReportLogcat.NativeCrash crash) {
        StringBuilder text = new StringBuilder(header(context,
                "Morphe crash log (native crash, read from the crash log afterwards)", new Date(crash.time)))
                .append("Process: ").append(crash.process != null ? crash.process : "unknown")
                .append(crash.mainProcess ? " (main)" : "").append('\n')
                .append("Maps Car features now: ").append(SafeMode.describe()).append('\n')
                .append("Thread: ").append(crash.thread != null ? crash.thread : "unknown").append('\n')
                .append("Signal: ").append(crash.signal).append('\n')
                .append("\nCrash log lines:\n");
        for (String line : crash.lines) text.append(line).append('\n');
        return text.toString();
    }

    /** "1920x1080 px, 240 dpi, landscape, smallest width 864 dp, normal mode, day; locale th-TH". */
    static String describeScreen(Context context) {
        StringBuilder text = new StringBuilder();
        try {
            WindowManager windows = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
            Display display = windows == null ? null : windows.getDefaultDisplay();
            if (display != null) {
                Point size = new Point();
                display.getRealSize(size);
                text.append(size.x).append('x').append(size.y).append(" px, ");
            }
            // The system's configuration: this app's own density is UI density's choice.
            Configuration system = Resources.getSystem().getConfiguration();
            text.append(system.densityDpi).append(" dpi, ")
                    .append(system.orientation == Configuration.ORIENTATION_PORTRAIT ? "portrait" : "landscape")
                    .append(", smallest width ").append(system.smallestScreenWidthDp).append(" dp, ")
                    .append(ReportBuilder.uiModeType(system)).append(" mode, ")
                    .append(ReportBuilder.night(system) ? "night" : "day")
                    .append("; locale ").append(context.getResources().getConfiguration().getLocales().get(0).toLanguageTag());
        } catch (RuntimeException error) {
            text.append("unreadable");
        }
        return text.toString();
    }

    private static String getRamInfo(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (activityManager == null) {
            return "Unknown";
        }

        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);

        long availMb = memoryInfo.availMem / (1024 * 1024);
        long totalMb = memoryInfo.totalMem / (1024 * 1024);

        return availMb + " MB available / " + totalMb + " MB" + (memoryInfo.lowMemory ? " (low memory)" : "");
    }

    private static String getHeapInfo() {
        Runtime runtime = Runtime.getRuntime();
        long usedMb = (runtime.totalMemory() - runtime.freeMemory()) / (1024 * 1024);
        long maxMb = runtime.maxMemory() / (1024 * 1024);

        return usedMb + " MB used / " + maxMb + " MB";
    }

    /**
     * Only APIs available on the minimum SDK are used here. Newer API calls are
     * outlined by R8 into synthetic classes named after this class.
     */
    @SuppressWarnings("deprecation")
    private static String getInstalledVersion(Context context, String packageName) {
        PackageManager packageManager = context.getPackageManager();
        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES);

            String versionName = packageInfo.versionName != null ? packageInfo.versionName : "Unknown";
            String signatureHash = getSignatureHash(packageInfo.signatures);
            String signatureInfo = signatureHash != null ? ", sig: " + signatureHash : "";

            return versionName + " (" + packageInfo.versionCode + signatureInfo + ")";
        } catch (PackageManager.NameNotFoundException ex) {
            return "Not installed";
        }
    }

    /**
     * @return The first 16 hex characters of the SHA-256 digest of the first signature.
     */
    @Nullable
    static String getSignatureHash(@Nullable Signature[] signatures) {
        if (signatures == null || signatures.length == 0 || signatures[0] == null) {
            return null;
        }
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(signatures[0].toByteArray());
            StringBuilder hex = new StringBuilder();
            for (int i = 0; i < 8; i++) {
                hex.append(String.format("%02x", hash[i]));
            }
            return hex.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.printException(() -> "getSignatureHash failure", ex);
            return null;
        }
    }
}
