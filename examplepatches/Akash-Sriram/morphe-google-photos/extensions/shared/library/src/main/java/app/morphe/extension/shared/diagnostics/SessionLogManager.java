package app.morphe.extension.shared.diagnostics;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Deque;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Local-First, Session-Based Diagnostic Log and Crash Manager.
 *
 * Captures:
 * 1. Uncaught crashes & exceptions with full stack traces and system diagnostics.
 * 2. In-app logger events (Morphe, GmsCore, Maps, Phenotype flags).
 * 3. Relevant process logcat messages in a bounded circular buffer.
 *
 * Sessions are stored locally in internal storage and automatically pruned to the 5 most recent sessions.
 */
public final class SessionLogManager {

    private static final String TAG = "MorpheDiagnostics";
    private static final String LOGS_DIR_NAME = "morphe_logs";
    private static final int MAX_SESSIONS = 5;
    private static final int MAX_IN_MEMORY_LOGS = 600;

    private static final Pattern EMAIL_PATTERN = Pattern.compile("[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+");
    private static final Pattern AUTH_TOKEN_PATTERN = Pattern.compile("(?i)(auth_token|bearer|access_token|refresh_token|api_key|password)[=:\\s]+[\\w\\-\\.~+]{12,}");

    private static final ExecutorService IO_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static final AtomicBoolean sInitialized = new AtomicBoolean(false);
    private static volatile Context sContext;
    private static volatile File sCurrentSessionFile;
    private static volatile String sCurrentSessionId;
    private static volatile long sSessionStartTime = 0;
    private static volatile boolean sLastSessionCrashed = false;
    private static volatile String sLastCrashSummary = null;

    private static final Deque<String> sRecentLogBuffer = new ArrayDeque<>();
    private static final Object BUFFER_LOCK = new Object();
    private static Thread.UncaughtExceptionHandler sOriginalCrashHandler;

    public static class SessionInfo {
        public final String id;
        public final File file;
        public final Date date;
        public final boolean isCurrent;
        public final boolean isCrashed;
        public final String crashSummary;
        public final long sizeBytes;

        public SessionInfo(String id, File file, Date date, boolean isCurrent, boolean isCrashed, String crashSummary, long sizeBytes) {
            this.id = id;
            this.file = file;
            this.date = date;
            this.isCurrent = isCurrent;
            this.isCrashed = isCrashed;
            this.crashSummary = crashSummary;
            this.sizeBytes = sizeBytes;
        }

        public String getDisplayName() {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, HH:mm:ss", Locale.getDefault());
            String formattedDate = sdf.format(date);
            if (isCurrent) {
                return "● Current (" + formattedDate + ")";
            } else if (isCrashed) {
                return "🚨 Crashed (" + formattedDate + ")";
            } else {
                return "Session " + formattedDate;
            }
        }
    }

    private SessionLogManager() {}

    /**
     * Initialize SessionLogManager at app startup.
     */
    public static void initialize(Context context) {
        if (context == null || !sInitialized.compareAndSet(false, true)) {
            return;
        }

        sContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        sSessionStartTime = System.currentTimeMillis();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
        sCurrentSessionId = sdf.format(new Date(sSessionStartTime));

        IO_EXECUTOR.execute(() -> {
            try {
                File dir = getLogsDir();
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Check if last session crashed before pruning
                checkPreviousSessionStatus(dir);

                // Prune older sessions (keep only the latest MAX_SESSIONS - 1)
                pruneOldSessions(dir);

                // Create new session file
                sCurrentSessionFile = new File(dir, "session_" + sCurrentSessionId + ".log");
                writeSessionHeader(sCurrentSessionFile);

                Log.i(TAG, "Initialized session log: " + sCurrentSessionFile.getName());
            } catch (Throwable t) {
                Log.e(TAG, "Failed to initialize session log file", t);
            }
        });

        // Register uncaught crash handler
        setupCrashHandler();

        // Start bounded process logcat reader in background
        startLogcatReader();
    }

    private static File getLogsDir() {
        return new File(sContext.getFilesDir(), LOGS_DIR_NAME);
    }

    private static void setupCrashHandler() {
        sOriginalCrashHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, throwable) -> {
            try {
                handleCrash(thread, throwable);
            } catch (Throwable t) {
                Log.e(TAG, "Failed inside crash handler", t);
            } finally {
                if (sOriginalCrashHandler != null) {
                    sOriginalCrashHandler.uncaughtException(thread, throwable);
                }
            }
        });
    }

    private static void handleCrash(Thread thread, Throwable throwable) {
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            throwable.printStackTrace(pw);
            String stackTrace = sw.toString();

            StringBuilder crashDump = new StringBuilder();
            crashDump.append("\n=======================================================\n");
            crashDump.append("🚨 FATAL UNCAUGHT EXCEPTION CRASH DUMP\n");
            crashDump.append("Timestamp: ").append(new Date().toString()).append("\n");
            crashDump.append("Thread: ").append(thread.getName()).append(" (ID: ").append(thread.getId()).append(")\n");
            crashDump.append("Exception: ").append(throwable.getClass().getName()).append(": ").append(throwable.getMessage()).append("\n");

            Activity currentAct = Utils.getActivity();
            if (currentAct != null) {
                crashDump.append("Foreground Activity: ").append(currentAct.getClass().getName()).append("\n");
            }

            Runtime rt = Runtime.getRuntime();
            long freeMb = rt.freeMemory() / (1024 * 1024);
            long totalMb = rt.totalMemory() / (1024 * 1024);
            long maxMb = rt.maxMemory() / (1024 * 1024);
            crashDump.append("Memory: Free=").append(freeMb).append("MB, Total=").append(totalMb).append("MB, Max=").append(maxMb).append("MB\n");

            crashDump.append("\n--- STACK TRACE ---\n");
            crashDump.append(stackTrace);
            crashDump.append("\n--- RECENT BUFFER LOGS BEFORE CRASH ---\n");

            synchronized (BUFFER_LOCK) {
                for (String line : sRecentLogBuffer) {
                    crashDump.append(line).append("\n");
                }
            }
            crashDump.append("=======================================================\n");

            String fullCrash = crashDump.toString();

            // Write synchronously to current session file
            if (sCurrentSessionFile != null) {
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(sCurrentSessionFile, true))) {
                    writer.write(fullCrash);
                    writer.flush();
                }
                // Also rename file with _crashed suffix for instant indexing
                File crashedFile = new File(sCurrentSessionFile.getParentFile(), sCurrentSessionFile.getName().replace(".log", "_crashed.log"));
                if (sCurrentSessionFile.renameTo(crashedFile)) {
                    sCurrentSessionFile = crashedFile;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error writing crash report", t);
        }
    }

    private static void writeSessionHeader(File file) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            writer.write("=======================================================\n");
            writer.write("📱 MORPHE DIAGNOSTICS LOG SESSION\n");
            writer.write("Session ID:        " + sCurrentSessionId + "\n");
            writer.write("Start Time:        " + new Date(sSessionStartTime).toString() + "\n");
            writer.write("Device:            " + Build.MANUFACTURER + " " + Build.MODEL + " (" + Build.DEVICE + " / " + Build.PRODUCT + ")\n");
            writer.write("Android OS:        " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")\n");
            writer.write("Security Patch:    " + (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M ? Build.VERSION.SECURITY_PATCH : "N/A") + "\n");
            writer.write("Photos App Ver:    " + Utils.getAppVersionName() + "\n");
            writer.write("Morphe Patches:    " + Utils.getPatchesReleaseVersion() + "\n");
            writer.write("Package:           " + (sContext != null ? sContext.getPackageName() : "unknown") + "\n");

            // MicroG / GmsCore Detection
            String gmsStatus = checkGmsCoreStatus();
            writer.write("GmsCore Status:    " + gmsStatus + "\n");
            writer.write("=======================================================\n\n");
            writer.flush();
        } catch (Throwable t) {
            Log.e(TAG, "Error writing session header", t);
        }
    }

    private static String checkGmsCoreStatus() {
        if (sContext == null) return "Context not available";
        PackageManager pm = sContext.getPackageManager();
        String[] packages = {"app.revanced.android.gms", "com.google.android.gms", "org.microg.gms.core"};
        for (String pkg : packages) {
            try {
                PackageInfo pi = pm.getPackageInfo(pkg, 0);
                boolean locGranted = pm.checkPermission(android.Manifest.permission.ACCESS_FINE_LOCATION, pkg) == PackageManager.PERMISSION_GRANTED;
                return pkg + " (v" + pi.versionName + ", LocGranted: " + (locGranted ? "YES" : "NO") + ")";
            } catch (Throwable ignored) {}
        }
        return "None detected";
    }

    private static void checkPreviousSessionStatus(File dir) {
        try {
            File[] files = dir.listFiles((d, name) -> name.startsWith("session_") && name.endsWith(".log"));
            if (files != null && files.length > 0) {
                Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));
                File latest = files[0];
                if (latest.getName().contains("_crashed")) {
                    sLastSessionCrashed = true;
                    sLastCrashSummary = readCrashSummary(latest);
                } else {
                    // Check if file content contains crash marker
                    try (BufferedReader br = new BufferedReader(new FileReader(latest))) {
                        String line;
                        while ((line = br.readLine()) != null) {
                            if (line.contains("🚨 FATAL UNCAUGHT EXCEPTION")) {
                                sLastSessionCrashed = true;
                                sLastCrashSummary = readCrashSummary(latest);
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed checking previous session", t);
        }
    }

    private static String readCrashSummary(File file) {
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            StringBuilder sb = new StringBuilder();
            int linesRead = 0;
            while ((line = br.readLine()) != null && linesRead < 5) {
                if (line.contains("Exception:")) {
                    sb.append(line.trim());
                    linesRead++;
                } else if (line.contains("Foreground Activity:")) {
                    sb.append(" (").append(line.trim()).append(")");
                    linesRead++;
                }
            }
            return sb.length() > 0 ? sb.toString() : "App crashed unexpectedly";
        } catch (Throwable ignored) {
            return "App crashed in previous session";
        }
    }

    private static void pruneOldSessions(File dir) {
        try {
            File[] files = dir.listFiles((d, name) -> name.startsWith("session_") && name.endsWith(".log"));
            if (files != null && files.length >= MAX_SESSIONS) {
                Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));
                for (int i = MAX_SESSIONS - 1; i < files.length; i++) {
                    files[i].delete();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error pruning old sessions", t);
        }
    }

    /**
     * Appends an in-app log entry from Morphe Logger.
     */
    public static void appendLog(String tag, String level, String message, Throwable ex) {
        if (message == null) return;

        SimpleDateFormat timeFmt = new SimpleDateFormat("HH:mm:ss.SSS", Locale.US);
        String timestamp = timeFmt.format(new Date());

        String sanitizedMsg = sanitize(message);
        StringBuilder entry = new StringBuilder();
        entry.append(timestamp).append(" [").append(level).append("] ").append(tag).append(": ").append(sanitizedMsg);

        if (ex != null) {
            entry.append("\n  Exception: ").append(ex.getClass().getName()).append(": ").append(ex.getMessage());
            StringWriter sw = new StringWriter();
            ex.printStackTrace(new PrintWriter(sw));
            String stack = sw.toString();
            // Cap stacktrace in log lines to 6 frames
            String[] lines = stack.split("\n");
            for (int i = 0; i < Math.min(lines.length, 7); i++) {
                entry.append("\n  ").append(lines[i].trim());
            }
        }

        String logLine = entry.toString();

        synchronized (BUFFER_LOCK) {
            if (sRecentLogBuffer.size() >= MAX_IN_MEMORY_LOGS) {
                sRecentLogBuffer.pollFirst();
            }
            sRecentLogBuffer.addLast(logLine);
        }

        // Asynchronously persist to current session file
        final File targetFile = sCurrentSessionFile;
        if (targetFile != null) {
            IO_EXECUTOR.execute(() -> {
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(targetFile, true))) {
                    writer.write(logLine);
                    writer.newLine();
                } catch (Throwable ignored) {}
            });
        }
    }

    private static void startLogcatReader() {
        Thread logcatThread = new Thread(() -> {
            Process process = null;
            BufferedReader reader = null;
            try {
                int myPid = android.os.Process.myPid();
                // Filter for current process PID and relevant Morphe / Maps / Gms tags
                List<String> cmd = new ArrayList<>();
                cmd.add("logcat");
                cmd.add("-v");
                cmd.add("time");
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    cmd.add("--pid=" + myPid);
                }

                process = new ProcessBuilder(cmd).redirectErrorStream(true).start();
                reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

                String line;
                int count = 0;
                while (!Thread.currentThread().isInterrupted() && (line = reader.readLine()) != null) {
                    // Filter relevant lines to prevent overwhelming logcat noise
                    if (isRelevantLogcatLine(line)) {
                        String sanitized = sanitize(line);
                        synchronized (BUFFER_LOCK) {
                            if (sRecentLogBuffer.size() >= MAX_IN_MEMORY_LOGS) {
                                sRecentLogBuffer.pollFirst();
                            }
                            sRecentLogBuffer.addLast(sanitized);
                        }

                        if (++count % 5 == 0 && sCurrentSessionFile != null) {
                            final File f = sCurrentSessionFile;
                            final String l = sanitized;
                            IO_EXECUTOR.execute(() -> {
                                try (BufferedWriter writer = new BufferedWriter(new FileWriter(f, true))) {
                                    writer.write(l);
                                    writer.newLine();
                                } catch (Throwable ignored) {}
                            });
                        }
                    }
                }
            } catch (Throwable t) {
                Log.d(TAG, "Logcat capture completed or unavailable: " + t.getMessage());
            } finally {
                if (reader != null) try { reader.close(); } catch (Throwable ignored) {}
                if (process != null) process.destroy();
            }
        }, "Morphe-LogcatReader");
        logcatThread.setDaemon(true);
        logcatThread.setPriority(Thread.MIN_PRIORITY);
        logcatThread.start();
    }

    private static boolean isRelevantLogcatLine(String line) {
        if (line == null) return false;
        return line.contains("Morphe") ||
               line.contains("morphe:") ||
               line.contains("GmsMap") ||
               line.contains("GmsCore") ||
               line.contains("Mapbox") ||
               line.contains("Phenotype") ||
               line.contains("AndroidRuntime") ||
               line.contains("FATAL") ||
               line.contains("CameraUpdate") ||
               line.contains("app.morphe");
    }

    public static String sanitize(String input) {
        if (input == null) return null;
        String res = EMAIL_PATTERN.matcher(input).replaceAll("[REDACTED_EMAIL]");
        res = AUTH_TOKEN_PATTERN.matcher(res).replaceAll("$1=[REDACTED_TOKEN]");
        return res;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Querying & Management API
    // ─────────────────────────────────────────────────────────────────────────

    public static boolean didLastSessionCrash() {
        return sLastSessionCrashed;
    }

    public static String getLastCrashSummary() {
        return sLastCrashSummary;
    }

    public static List<SessionInfo> getAllSessions() {
        List<SessionInfo> list = new ArrayList<>();
        if (sContext == null) return list;

        File dir = getLogsDir();
        if (!dir.exists()) return list;

        File[] files = dir.listFiles((d, name) -> name.startsWith("session_") && name.endsWith(".log"));
        if (files == null || files.length == 0) return list;

        Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));

        for (File f : files) {
            String name = f.getName();
            boolean isCurrent = sCurrentSessionFile != null && f.getAbsolutePath().equals(sCurrentSessionFile.getAbsolutePath());
            boolean isCrashed = name.contains("_crashed");
            String crashSummary = null;

            if (isCrashed) {
                crashSummary = readCrashSummary(f);
            }

            Date date = new Date(f.lastModified());
            list.add(new SessionInfo(name, f, date, isCurrent, isCrashed, crashSummary, f.length()));
        }

        return list;
    }

    public static String readSessionContent(SessionInfo session, String filterQuery, String levelFilter) {
        if (session == null || session.file == null || !session.file.exists()) {
            return "Log file not found.";
        }

        StringBuilder sb = new StringBuilder();
        String q = filterQuery != null ? filterQuery.toLowerCase().trim() : "";
        String lvl = levelFilter != null ? levelFilter.toUpperCase() : "ALL";

        try (BufferedReader br = new BufferedReader(new FileReader(session.file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.startsWith("==") || line.startsWith("📱") || line.startsWith("Session") ||
                    line.startsWith("Device:") || line.startsWith("Android:") || line.startsWith("Photos") ||
                    line.startsWith("Morphe") || line.startsWith("GmsCore") || line.startsWith("Start Time:")) {
                    // Always include header lines
                    sb.append(line).append("\n");
                    continue;
                }

                if (!lvl.equals("ALL")) {
                    if (lvl.equals("ERROR") && !line.contains("[ERROR]") && !line.contains("FATAL") && !line.contains("Exception") && !line.contains("🚨")) {
                        continue;
                    } else if (lvl.equals("MAPS") && !line.contains("Map") && !line.contains("Location") && !line.contains("GmsMap")) {
                        continue;
                    } else if (lvl.equals("FLAGS") && !line.contains("Flag") && !line.contains("Phenotype")) {
                        continue;
                    }
                }

                if (!q.isEmpty() && !line.toLowerCase().contains(q)) {
                    continue;
                }

                sb.append(line).append("\n");
            }
        } catch (Throwable t) {
            sb.append("\nFailed to read log file: ").append(t.getMessage());
        }

        return sb.toString();
    }

    public static void shareSession(Activity activity, SessionInfo session) {
        if (activity == null || session == null) return;

        IO_EXECUTOR.execute(() -> {
            String content = readSessionContent(session, null, "ALL");
            MAIN_HANDLER.post(() -> {
                try {
                    Intent sendIntent = new Intent(Intent.ACTION_SEND);
                    sendIntent.setType("text/plain");
                    sendIntent.putExtra(Intent.EXTRA_SUBJECT, "Morphe Photos Diagnostics (" + session.id + ")");
                    sendIntent.putExtra(Intent.EXTRA_TEXT, content);

                    activity.startActivity(Intent.createChooser(sendIntent, "Share Diagnostics Log"));
                } catch (Throwable t) {
                    Toast.makeText(activity, "Failed to share: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            });
        });
    }

    public static void copyToClipboard(Context context, SessionInfo session) {
        if (context == null || session == null) return;

        IO_EXECUTOR.execute(() -> {
            String content = readSessionContent(session, null, "ALL");
            MAIN_HANDLER.post(() -> {
                try {
                    ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (cm != null) {
                        ClipData clip = ClipData.newPlainText("Morphe Diagnostics", content);
                        cm.setPrimaryClip(clip);
                        Toast.makeText(context, "✓ Diagnostics copied to clipboard", Toast.LENGTH_SHORT).show();
                    }
                } catch (Throwable t) {
                    Toast.makeText(context, "Failed to copy: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            });
        });
    }

    public static void clearAllSessions(Runnable onComplete) {
        IO_EXECUTOR.execute(() -> {
            try {
                File dir = getLogsDir();
                if (dir.exists()) {
                    File[] files = dir.listFiles((d, name) -> name.startsWith("session_") && name.endsWith(".log"));
                    if (files != null) {
                        for (File f : files) {
                            if (sCurrentSessionFile == null || !f.getAbsolutePath().equals(sCurrentSessionFile.getAbsolutePath())) {
                                f.delete();
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {}

            if (onComplete != null) {
                MAIN_HANDLER.post(onComplete);
            }
        });
    }
}
