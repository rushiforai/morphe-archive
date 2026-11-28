package com.waze.gw;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.net.TrafficStats;
import android.net.Uri;
import android.os.Build;
import android.os.FileObserver;
import android.os.Process;
import android.os.SystemClock;
import android.provider.DocumentsContract;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * Bounded, privacy-conscious diagnostics for field builds.
 *
 * The logger records this process' logcat, Java crashes, file-system metadata and request metadata
 * produced by the MOD. It deliberately never records HTTP bodies, query strings, cookies or auth
 * headers. Every entry point is fail-open: diagnostics must never prevent Waze from starting.
 */
public final class DiagnosticsLogger {
    public static final int EXPORT_ERRORS = 1;
    public static final int EXPORT_LOGCAT = 2;
    public static final int EXPORT_NETWORK = 3;
    public static final int EXPORT_ALL = 4;

    private static final String DIR_NAME = "wazemod_diagnostics";
    private static final String TAG = "WazeGW-Diagnostics";
    private static final long MAX_LOGCAT_BYTES = 2L * 1024L * 1024L;
    private static final long MAX_EVENT_BYTES = 1024L * 1024L;
    private static final int KEEP_LOGCAT_FILES = 3;
    private static final int KEEP_CRASH_FILES = 8;
    private static final int MAX_INVENTORY_ENTRIES = 2500;
    private static final Object IO_LOCK = new Object();
    private static final AtomicBoolean INSTALLED = new AtomicBoolean(false);
    private static final Map<HttpURLConnection, Long> REQUEST_STARTS =
            Collections.synchronizedMap(new WeakHashMap<HttpURLConnection, Long>());
    private static final List<FileObserver> FILE_OBSERVERS = new ArrayList<FileObserver>();
    private static final ScheduledExecutorService TRAFFIC_SAMPLER =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeMod-NetworkSampler");
                    thread.setDaemon(true);
                    return thread;
                }
            });
    private static final Pattern SECRET_PATTERN = Pattern.compile(
            "(?i)(authorization|cookie|set-cookie|token|access[_-]?token|refresh[_-]?token|password|passwd|secret|api[_-]?key)(\\s*[:=]\\s*)([^\\s,;]+)");
    private static final Pattern BEARER_PATTERN = Pattern.compile(
            "(?i)\\b(bearer|basic)\\s+[a-z0-9._~+/=-]{8,}");
    private static final Pattern COORD_PATTERN = Pattern.compile(
            "(?<![\\d.])-?\\d{1,3}\\.\\d{5,}(?![\\d.])");

    private static Context app;
    private static java.lang.Process logcatProcess;
    private static ConnectivityManager.NetworkCallback networkCallback;
    private static long lastUidRx = -1L;
    private static long lastUidTx = -1L;

    private DiagnosticsLogger() { }

    public static void install(Context context) {
        if (context == null) return;
        final Context application = context.getApplicationContext() == null
                ? context : context.getApplicationContext();
        app = application;
        if (!INSTALLED.compareAndSet(false, true)) return;
        try {
            File root = root(application);
            if (!root.exists()) root.mkdirs();
            trimOldFiles(new File(root, "logcat"), KEEP_LOGCAT_FILES);
            trimOldFiles(new File(root, "errors"), KEEP_CRASH_FILES);
            installCrashHandler(application);
            startLogcatCapture(application);
            startConnectivityCapture(application);
            startTrafficSampler();
            startFileObservers(application);
            appendEvent("lifecycle.log", "BOOT", "diagnostics installed; pid=" + Process.myPid());
        } catch (Throwable ignored) {
            // Diagnostics must never become a boot dependency.
        }
    }

    public static void networkStart(String component, HttpURLConnection connection) {
        if (connection == null) return;
        try {
            REQUEST_STARTS.put(connection, Long.valueOf(SystemClock.elapsedRealtime()));
            appendEvent("network.log", "REQUEST",
                    field(component) + "\t" + method(connection) + "\t"
                            + safeEndpoint(connection.getURL()));
        } catch (Throwable ignored) { }
    }

    public static void networkEnd(String component, HttpURLConnection connection,
                                  int status, long bytes, Throwable error) {
        if (connection == null) return;
        try {
            Long started = REQUEST_STARTS.remove(connection);
            long elapsed = started == null ? -1L
                    : Math.max(0L, SystemClock.elapsedRealtime() - started.longValue());
            String detail = field(component) + "\t" + method(connection) + "\t"
                    + safeEndpoint(connection.getURL()) + "\tstatus=" + status
                    + "\tbytes=" + bytes + "\tms=" + elapsed;
            if (error != null) detail += "\terror=" + field(error.getClass().getSimpleName())
                    + ":" + redact(error.getMessage());
            appendEvent("network.log", error == null ? "RESPONSE" : "FAIL", detail);
        } catch (Throwable ignored) { }
    }

    public static String summary(Context context) {
        try {
            File base = root(context);
            long bytes = directorySize(base, 0);
            int crashes = listFiles(new File(base, "errors")).size();
            return I18n.f("core.logger_0_saved_size_1_java", (INSTALLED.get() ? I18n.tr("core.running") : I18n.tr("core.not_initialized")), humanBytes(bytes), crashes);
        } catch (Throwable error) {
            return I18n.tr("core.couldnt_read_logger_status");
        }
    }

    public static boolean export(Context context, Uri destination, int type) {
        if (context == null || destination == null) return false;
        install(context);
        File stagingDirectory = new File(context.getCacheDir(), "wazemod_exports");
        File staged = new File(stagingDirectory,
                "WazeMod_" + exportLabel(type) + "_" + fileStamp() + ".zip");
        OutputStream raw = null;
        BufferedOutputStream destinationOutput = null;
        BufferedInputStream stagedInput = null;
        boolean destinationOpened = false;
        try {
            if (!stagingDirectory.exists() && !stagingDirectory.mkdirs()) {
                throw new IllegalStateException("Cannot create export staging directory");
            }
            writeArchive(context, staged, type);
            validateArchive(staged);

            raw = context.getContentResolver().openOutputStream(destination, "w");
            destinationOpened = true;
            if (raw == null) throw new IllegalStateException("Destination output stream is null");
            destinationOutput = new BufferedOutputStream(raw, 64 * 1024);
            stagedInput = new BufferedInputStream(new FileInputStream(staged), 64 * 1024);
            byte[] buffer = new byte[64 * 1024];
            int count;
            long copied = 0L;
            while ((count = stagedInput.read(buffer)) != -1) {
                destinationOutput.write(buffer, 0, count);
                copied += count;
            }
            destinationOutput.flush();
            destinationOutput.close();
            destinationOutput = null;
            raw = null;
            stagedInput.close();
            stagedInput = null;
            if (copied != staged.length()) {
                throw new IllegalStateException("Short destination copy " + copied
                        + "/" + staged.length());
            }
            appendEvent("lifecycle.log", "EXPORT_OK",
                    exportLabel(type) + "\tbytes=" + copied + "\tdestination="
                            + field(destination.getScheme()));
            return true;
        } catch (Throwable error) {
            String detail = exportLabel(type) + "\t" + error.getClass().getSimpleName()
                    + ":" + redact(error.getMessage());
            Log.e(TAG, "Diagnostics export failed: " + detail, error);
            try { appendEvent("lifecycle.log", "EXPORT_FAIL", detail); }
            catch (Throwable ignoredLog) { }
            try { if (stagedInput != null) stagedInput.close(); }
            catch (Throwable ignoredClose) { }
            try { if (destinationOutput != null) destinationOutput.close(); }
            catch (Throwable ignoredClose) { }
            try { if (raw != null) raw.close(); } catch (Throwable ignoredClose) { }
            if (destinationOpened && Build.VERSION.SDK_INT >= 19) {
                try {
                    DocumentsContract.deleteDocument(context.getContentResolver(), destination);
                } catch (Throwable ignoredDelete) { }
            }
            return false;
        } finally {
            try { if (staged.exists()) staged.delete(); } catch (Throwable ignoredDelete) { }
        }
    }

    private static void writeArchive(Context context, File target, int type) throws Exception {
        OutputStream fileOutput = null;
        BufferedOutputStream bufferedOutput = null;
        ZipOutputStream zip = null;
        try {
            fileOutput = new FileOutputStream(target);
            bufferedOutput = new BufferedOutputStream(fileOutput, 64 * 1024);
            zip = new ZipOutputStream(bufferedOutput);
            addText(zip, "README.txt", reportReadme(type));
            addText(zip, "device_report.txt", deviceReport(context, type));
            File base = root(context);
            if (type == EXPORT_ERRORS || type == EXPORT_ALL) {
                addDirectory(zip, new File(base, "errors"), "errors/");
                addText(zip, "errors/logcat_error_extract.txt", extractErrors(base));
            }
            if (type == EXPORT_LOGCAT || type == EXPORT_ALL) {
                addDirectory(zip, new File(base, "logcat"), "logcat/");
            }
            if (type == EXPORT_NETWORK || type == EXPORT_ALL) {
                addFile(zip, new File(base, "network.log"), "network/network.log");
                addText(zip, "network/connectivity.txt", currentConnectivity(context));
            }
            if (type == EXPORT_ALL) {
                addFile(zip, new File(base, "files.log"), "files/files.log");
                addFile(zip, new File(base, "lifecycle.log"), "lifecycle.log");
                addText(zip, "files/inventory.txt", buildInventory(context));
            }
            zip.finish();
            zip.close();
            zip = null;
            bufferedOutput = null;
            fileOutput = null;
        } finally {
            try { if (zip != null) zip.close(); } catch (Throwable ignoredClose) { }
            try { if (bufferedOutput != null) bufferedOutput.close(); }
            catch (Throwable ignoredClose) { }
            try { if (fileOutput != null) fileOutput.close(); }
            catch (Throwable ignoredClose) { }
        }
    }

    private static void validateArchive(File archive) throws Exception {
        if (archive == null || !archive.isFile() || archive.length() <= 0L) {
            throw new IllegalStateException("Staged archive is empty");
        }
        ZipFile zip = null;
        try {
            zip = new ZipFile(archive);
            if (zip.getEntry("README.txt") == null || zip.getEntry("device_report.txt") == null) {
                throw new IllegalStateException("Staged archive misses required entries");
            }
        } finally {
            try { if (zip != null) zip.close(); } catch (Throwable ignoredClose) { }
        }
    }

    private static void installCrashHandler(final Context context) {
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
            @Override public void uncaughtException(Thread thread, Throwable error) {
                try { writeCrash(context, thread, error); } catch (Throwable ignored) { }
                if (previous != null) previous.uncaughtException(thread, error);
            }
        });
    }

    private static void writeCrash(Context context, Thread thread, Throwable error) throws Exception {
        File dir = new File(root(context), "errors");
        if (!dir.exists()) dir.mkdirs();
        File target = new File(dir, "crash_" + fileStamp() + ".txt");
        StringWriter stack = new StringWriter();
        PrintWriter writer = new PrintWriter(stack);
        error.printStackTrace(writer);
        writer.flush();
        String body = "time=" + isoNow() + "\nthread="
                + (thread == null ? "unknown" : field(thread.getName()))
                + "\n" + redact(stack.toString());
        writeText(target, body);
        trimOldFiles(dir, KEEP_CRASH_FILES);
    }

    private static void startLogcatCapture(final Context context) {
        Thread worker = new Thread(new Runnable() {
            @Override public void run() {
                BufferedReader reader = null;
                BufferedWriter writer = null;
                try {
                    File dir = new File(root(context), "logcat");
                    if (!dir.exists()) dir.mkdirs();
                    File current = new File(dir, "logcat_" + fileStamp() + ".txt");
                    String pidArg = "--pid=" + Process.myPid();
                    try {
                        logcatProcess = new ProcessBuilder("logcat", pidArg, "-v", "threadtime")
                                .redirectErrorStream(true).start();
                    } catch (Throwable first) {
                        logcatProcess = new ProcessBuilder("logcat", "-v", "threadtime")
                                .redirectErrorStream(true).start();
                    }
                    reader = new BufferedReader(new InputStreamReader(
                            logcatProcess.getInputStream(), StandardCharsets.UTF_8));
                    writer = new BufferedWriter(new OutputStreamWriter(
                            new FileOutputStream(current, true), StandardCharsets.UTF_8));
                    String line;
                    int pending = 0;
                    while ((line = reader.readLine()) != null) {
                        synchronized (IO_LOCK) {
                            writer.write(redact(line));
                            writer.newLine();
                            if (++pending >= 16) { writer.flush(); pending = 0; }
                            if (current.length() >= MAX_LOGCAT_BYTES) {
                                writer.flush();
                                writer.close();
                                current = new File(dir, "logcat_" + fileStamp() + ".txt");
                                writer = new BufferedWriter(new OutputStreamWriter(
                                        new FileOutputStream(current, true),
                                        StandardCharsets.UTF_8));
                                trimOldFiles(dir, KEEP_LOGCAT_FILES);
                            }
                        }
                    }
                } catch (Throwable error) {
                    appendEvent("lifecycle.log", "LOGCAT_FAIL",
                            error.getClass().getSimpleName() + ":" + redact(error.getMessage()));
                } finally {
                    try { if (writer != null) writer.close(); } catch (Throwable ignored) { }
                    try { if (reader != null) reader.close(); } catch (Throwable ignored) { }
                }
            }
        }, "WazeMod-Logcat");
        worker.setDaemon(true);
        worker.start();
    }

    private static void startConnectivityCapture(Context context) {
        try {
            final ConnectivityManager manager = (ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return;
            networkCallback = new ConnectivityManager.NetworkCallback() {
                @Override public void onAvailable(Network network) {
                    appendEvent("network.log", "LINK_UP", "network=" + networkId(network));
                }
                @Override public void onLost(Network network) {
                    appendEvent("network.log", "LINK_DOWN", "network=" + networkId(network));
                }
                @Override public void onCapabilitiesChanged(Network network,
                                                              NetworkCapabilities caps) {
                    appendEvent("network.log", "LINK_CAPS",
                            "network=" + networkId(network) + "\t" + capabilities(caps));
                }
            };
            if (Build.VERSION.SDK_INT >= 24) manager.registerDefaultNetworkCallback(networkCallback);
            else manager.registerNetworkCallback(new NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET).build(),
                    networkCallback);
            appendEvent("network.log", "LINK_STATE", currentConnectivity(context));
        } catch (Throwable error) {
            appendEvent("network.log", "LINK_MONITOR_FAIL", error.getClass().getSimpleName());
        }
    }

    /** Covers Waze's Java and native sockets without intercepting or inspecting packet contents. */
    private static void startTrafficSampler() {
        try {
            TRAFFIC_SAMPLER.scheduleAtFixedRate(new Runnable() {
                @Override public void run() {
                    try {
                        long rx = TrafficStats.getUidRxBytes(Process.myUid());
                        long tx = TrafficStats.getUidTxBytes(Process.myUid());
                        if (rx < 0L || tx < 0L) return;
                        long rxDelta = lastUidRx < 0L ? 0L : Math.max(0L, rx - lastUidRx);
                        long txDelta = lastUidTx < 0L ? 0L : Math.max(0L, tx - lastUidTx);
                        lastUidRx = rx;
                        lastUidTx = tx;
                        if (rxDelta != 0L || txDelta != 0L) {
                            appendEvent("network.log", "UID_TRAFFIC",
                                    "rxDelta=" + rxDelta + "\ttxDelta=" + txDelta
                                            + "\trxTotal=" + rx + "\ttxTotal=" + tx);
                        }
                    } catch (Throwable ignored) { }
                }
            }, 0L, 30L, TimeUnit.SECONDS);
        } catch (Throwable ignored) { }
    }

    private static void startFileObservers(Context context) {
        watchDirectory(context.getFilesDir(), "files");
        watchDirectory(context.getCacheDir(), "cache");
        if (Build.VERSION.SDK_INT >= 21) watchDirectory(context.getNoBackupFilesDir(), "no_backup");
        try { watchDirectory(context.getExternalFilesDir(null), "external_files"); }
        catch (Throwable ignored) { }
    }

    private static void watchDirectory(final File directory, final String label) {
        if (directory == null) return;
        try {
            final String diagnosticPath = app == null ? "" : root(app).getAbsolutePath();
            FileObserver observer = new FileObserver(directory.getAbsolutePath(),
                    FileObserver.CREATE | FileObserver.DELETE | FileObserver.MOVED_FROM
                            | FileObserver.MOVED_TO | FileObserver.CLOSE_WRITE) {
                @Override public void onEvent(int event, String path) {
                    if (path == null || path.contains(DIR_NAME)) return;
                    File changed = new File(directory, path);
                    if (!diagnosticPath.isEmpty()
                            && changed.getAbsolutePath().startsWith(diagnosticPath)) return;
                    appendEvent("files.log", fileEvent(event), label + "/" + safePath(path)
                            + "\tsize=" + (changed.isFile() ? changed.length() : -1L));
                }
            };
            observer.startWatching();
            synchronized (FILE_OBSERVERS) { FILE_OBSERVERS.add(observer); }
        } catch (Throwable ignored) { }
    }

    private static String fileEvent(int event) {
        int value = event & FileObserver.ALL_EVENTS;
        if ((value & FileObserver.CREATE) != 0) return "FILE_CREATE";
        if ((value & FileObserver.DELETE) != 0) return "FILE_DELETE";
        if ((value & FileObserver.MOVED_FROM) != 0) return "FILE_MOVE_FROM";
        if ((value & FileObserver.MOVED_TO) != 0) return "FILE_MOVE_TO";
        if ((value & FileObserver.CLOSE_WRITE) != 0) return "FILE_WRITE";
        return "FILE_EVENT_" + value;
    }

    private static void appendEvent(String name, String event, String detail) {
        Context context = app;
        if (context == null) return;
        synchronized (IO_LOCK) {
            try {
                File target = new File(root(context), name);
                File parent = target.getParentFile();
                if (parent != null && !parent.exists()) parent.mkdirs();
                if (target.length() >= MAX_EVENT_BYTES) rotateEvent(target);
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                        new FileOutputStream(target, true), StandardCharsets.UTF_8));
                writer.write(isoNow());
                writer.write('\t');
                writer.write(field(event));
                writer.write('\t');
                writer.write(redact(detail));
                writer.newLine();
                writer.close();
            } catch (Throwable ignored) { }
        }
    }

    private static void rotateEvent(File target) {
        File old = new File(target.getParentFile(), target.getName() + ".1");
        if (old.exists()) old.delete();
        target.renameTo(old);
    }

    private static String reportReadme(int type) {
        return "Waze Mod diagnostic report\n"
                + "Selection: " + exportLabel(type) + "\n"
                + "Created: " + isoNow() + "\n\n"
                + "Privacy: network entries contain method, host/path, status, byte count and "
                + "duration only. Query strings, request/response bodies, cookies and auth headers "
                + "are never collected. File inventory contains metadata only, not file contents.\n";
    }

    private static String deviceReport(Context context, int type) {
        String versionName = "?";
        long versionCode = -1L;
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            versionName = info.versionName;
            versionCode = Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
        } catch (Throwable ignored) { }
        return "time=" + isoNow() + "\nselection=" + exportLabel(type)
                + "\npackage=" + context.getPackageName() + "\nversionName=" + field(versionName)
                + "\nversionCode=" + versionCode + "\nandroid=" + Build.VERSION.RELEASE
                + " (SDK " + Build.VERSION.SDK_INT + ")\nmanufacturer=" + field(Build.MANUFACTURER)
                + "\nmodel=" + field(Build.MODEL) + "\ndevice=" + field(Build.DEVICE)
                + "\nprocessUptimeMs=" + SystemClock.elapsedRealtime()
                + "\nconnectivity=" + currentConnectivity(context) + "\n";
    }

    private static String buildInventory(Context context) {
        StringBuilder out = new StringBuilder();
        out.append("Metadata only; contents and SharedPreferences values are excluded.\n");
        int[] count = {0};
        appendInventory(out, context.getFilesDir(), "files", 0, count);
        appendInventory(out, context.getCacheDir(), "cache", 0, count);
        if (Build.VERSION.SDK_INT >= 21)
            appendInventory(out, context.getNoBackupFilesDir(), "no_backup", 0, count);
        try { appendInventory(out, context.getExternalFilesDir(null), "external_files", 0, count); }
        catch (Throwable ignored) { }
        return out.toString();
    }

    private static void appendInventory(StringBuilder out, File file, String path,
                                        int depth, int[] count) {
        if (file == null || count[0] >= MAX_INVENTORY_ENTRIES || depth > 6) return;
        if (file.getAbsolutePath().contains(DIR_NAME)) return;
        count[0]++;
        out.append(file.isDirectory() ? "D" : "F").append('\t').append(safePath(path))
                .append('\t').append(file.isFile() ? file.length() : -1L)
                .append('\t').append(file.lastModified()).append('\n');
        if (!file.isDirectory()) return;
        File[] children = file.listFiles();
        if (children == null) return;
        java.util.Arrays.sort(children, new Comparator<File>() {
            @Override public int compare(File a, File b) { return a.getName().compareTo(b.getName()); }
        });
        for (File child : children) {
            appendInventory(out, child, path + "/" + child.getName(), depth + 1, count);
            if (count[0] >= MAX_INVENTORY_ENTRIES) break;
        }
    }

    private static String extractErrors(File base) {
        StringBuilder out = new StringBuilder();
        File logcat = new File(base, "logcat");
        for (File file : listFiles(logcat)) {
            BufferedReader reader = null;
            try {
                reader = new BufferedReader(new InputStreamReader(
                        new FileInputStream(file), StandardCharsets.UTF_8));
                String line;
                while ((line = reader.readLine()) != null) {
                    String lower = line.toLowerCase(Locale.US);
                    if (lower.contains("fatal exception") || lower.contains("fatal signal")
                            || lower.contains("sigabrt") || lower.contains("anr in ")
                            || lower.contains("androidruntime") || lower.contains("noclassdeffounderror")) {
                        out.append(redact(line)).append('\n');
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                try { if (reader != null) reader.close(); } catch (Throwable ignored) { }
            }
        }
        if (out.length() == 0) out.append("No matching fatal/ANR lines in retained logcat.\n");
        return out.toString();
    }

    private static void addDirectory(ZipOutputStream zip, File directory, String prefix)
            throws Exception {
        for (File file : listFiles(directory)) addFile(zip, file, prefix + file.getName());
    }

    private static void addFile(ZipOutputStream zip, File file, String name) throws Exception {
        if (file == null || !file.isFile()) return;
        zip.putNextEntry(new ZipEntry(name));
        InputStream input = new FileInputStream(file);
        byte[] buffer = new byte[16 * 1024];
        int count;
        while ((count = input.read(buffer)) != -1) zip.write(buffer, 0, count);
        input.close();
        zip.closeEntry();
    }

    private static void addText(ZipOutputStream zip, String name, String text) throws Exception {
        zip.putNextEntry(new ZipEntry(name));
        zip.write(text.getBytes(StandardCharsets.UTF_8));
        zip.closeEntry();
    }

    private static List<File> listFiles(File directory) {
        List<File> out = new ArrayList<File>();
        if (directory == null) return out;
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) if (file.isFile()) out.add(file);
        }
        Collections.sort(out, new Comparator<File>() {
            @Override public int compare(File a, File b) {
                return Long.compare(a.lastModified(), b.lastModified());
            }
        });
        return out;
    }

    private static void trimOldFiles(File directory, int keep) {
        List<File> files = listFiles(directory);
        while (files.size() > keep) files.remove(0).delete();
    }

    private static File root(Context context) {
        return new File(context.getFilesDir(), DIR_NAME);
    }

    private static long directorySize(File file, int depth) {
        if (file == null || !file.exists() || depth > 8) return 0L;
        if (file.isFile()) return file.length();
        long total = 0L;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) total += directorySize(child, depth + 1);
        return total;
    }

    private static String currentConnectivity(Context context) {
        try {
            ConnectivityManager manager = (ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return "unavailable";
            if (Build.VERSION.SDK_INT >= 23) {
                Network active = manager.getActiveNetwork();
                NetworkCapabilities caps = active == null ? null : manager.getNetworkCapabilities(active);
                return active == null ? "offline" : capabilities(caps);
            }
            android.net.NetworkInfo info = manager.getActiveNetworkInfo();
            return info == null ? "offline" : field(info.getTypeName()) + ",connected=" + info.isConnected();
        } catch (Throwable error) {
            return "unknown:" + error.getClass().getSimpleName();
        }
    }

    private static String capabilities(NetworkCapabilities caps) {
        if (caps == null) return "unknown";
        StringBuilder out = new StringBuilder();
        if (caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) out.append("wifi");
        else if (caps.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) out.append("cellular");
        else if (caps.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)) out.append("ethernet");
        else if (caps.hasTransport(NetworkCapabilities.TRANSPORT_VPN)) out.append("vpn");
        else out.append("other");
        out.append(",internet=").append(caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET));
        out.append(",validated=").append(caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED));
        out.append(",metered=").append(!caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED));
        return out.toString();
    }

    private static String networkId(Network network) {
        return network == null ? "?" : Integer.toHexString(network.hashCode());
    }

    private static String method(HttpURLConnection connection) {
        try { return field(connection.getRequestMethod()); }
        catch (Throwable ignored) { return "?"; }
    }

    private static String safeEndpoint(URL url) {
        if (url == null) return "?";
        String path = url.getPath();
        if (path == null || path.isEmpty()) path = "/";
        String endpoint = url.getProtocol() + "://" + url.getHost()
                + (url.getPort() >= 0 ? ":" + url.getPort() : "") + path;
        return field(endpoint.length() > 320 ? endpoint.substring(0, 320) : endpoint);
    }

    private static String redact(String value) {
        if (value == null) return "";
        String clean = SECRET_PATTERN.matcher(value).replaceAll("$1$2<redacted>");
        clean = BEARER_PATTERN.matcher(clean).replaceAll("$1 <redacted>");
        clean = COORD_PATTERN.matcher(clean).replaceAll("<coord>");
        return clean.length() > 4096 ? clean.substring(0, 4096) + "…" : clean;
    }

    private static String field(String value) {
        if (value == null) return "";
        return value.replace('\t', ' ').replace('\r', ' ').replace('\n', ' ');
    }

    private static String safePath(String value) {
        return field(value).replace("..", "_");
    }

    private static String exportLabel(int type) {
        if (type == EXPORT_ERRORS) return "errors";
        if (type == EXPORT_LOGCAT) return "logcat";
        if (type == EXPORT_NETWORK) return "network";
        return "all";
    }

    private static String isoNow() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX", Locale.US);
        return format.format(new Date());
    }

    private static String fileStamp() {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS", Locale.US);
        format.setTimeZone(TimeZone.getDefault());
        return format.format(new Date());
    }

    private static void writeText(File file, String text) throws Exception {
        File parent = file.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();
        OutputStream output = new FileOutputStream(file);
        output.write(text.getBytes(StandardCharsets.UTF_8));
        output.flush();
        output.close();
    }

    private static String humanBytes(long bytes) {
        if (bytes < 1024L) return bytes + " B";
        if (bytes < 1024L * 1024L)
            return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }
}
