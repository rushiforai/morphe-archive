package app.hushmessenger.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Map;

/** The App tab's Copy setup text: the build, each control's state and what failed, for a problem report. */
final class SetupSummary {
    private SetupSummary() {}

    static String build(Context context, SettingsText text) throws PackageManager.NameNotFoundException {
        PackageInfo host = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        boolean paused = Settings.preferences.getBoolean("paused", false);
        boolean safeMode = CrashGuard.isSafeMode();
        StringBuilder summary = new StringBuilder("HushMessenger v").append(BuildConfig.VERSION_NAME)
            .append("\nHost package: ").append(context.getPackageName())
            .append("\nSettings provider: ").append(HostScreens.settingsProviderFound(context) ? "found" : "missing")
            .append("\nHost version: ").append(host.versionName == null ? "unknown" : host.versionName)
            .append("\nHost version code: ").append(host.getLongVersionCode())
            .append("\nPatched from: ").append(ProblemReport.patchedFrom(HostScreens.originalBuild(), Settings.preview))
            .append("\nAndroid API: ").append(Build.VERSION.SDK_INT)
            .append("\nPaused: ").append(paused)
            .append("\nSafe mode: ").append(safeMode).append('\n');
        if (Settings.preview) summary.append("Mode: UI preview. Does not change Messenger.\n");
        summary.append(text.get("setup_activity_help")).append("\nControls:\n");
        for (String[] spec : SettingsActivity.CONTROLS) {
            String key = spec[0];
            boolean installed = Settings.installed.contains(key);
            boolean selected = Settings.preferences.getBoolean(key, false);
            long lastActive = Settings.lastActive(key);
            Boolean held = Settings.heldUntilRestart(key);
            summary.append(key).append(": installed=").append(installed)
                .append(", selected=").append(selected)
                .append(", active=").append(!Settings.preview && installed && selected && !paused && !safeMode && Settings.available(key))
                .append(", last_active=").append(lastActive == 0 ? "none" : ((System.currentTimeMillis() - lastActive) / 1000) + "s ago")
                .append(held == null ? "" : ", until_restart=" + held)
                .append(", scope=").append(text.control(spec, 2))
                .append('\n');
        }
        String lateStart = HostScreens.lateStart;
        summary.append("Late start: ").append(lateStart == null ? "not needed" : lateStart).append('\n');
        String dataDir = context.getApplicationInfo().dataDir;
        summary.append("Analytics stores: ").append(dataDir == null ? "unreadable" : analyticsStores(new java.io.File(dataDir))).append('\n');
        summary.append("Facebook caller checks: ").append(MessengerSignature.callerSummary()).append('\n');
        // Only controls that failed get a line: the exception's class, where it hit HushMessenger's code and when.
        Map<String, String> errors = Settings.lastHookErrors();
        if (!errors.isEmpty()) summary.append("Hook errors:\n");
        for (Map.Entry<String, String> error : errors.entrySet()) {
            String record = error.getValue();
            int split = record.lastIndexOf('|');
            summary.append(error.getKey()).append(": ").append(split < 0 ? record : record.substring(0, split)).append(", ")
                .append(java.time.Instant.ofEpochMilli(Settings.hookErrorTime(record)).truncatedTo(java.time.temporal.ChronoUnit.SECONDS))
                .append('\n');
        }
        return summary.toString();
    }

    /**
     * Folders one or two levels under the data dir whose names mention analytics, with how many files they hold and their
     * total size. Shell can't read the data dir, so this is how to see whether Messenger's analytics pile up while Stop
     * analytics uploads is on. Names and sizes only, never what's in the files, and links aren't followed.
     */
    static String analyticsStores(java.io.File dataDir) {
        return analyticsStores(dataDir, 20_000, 2_000);
    }

    /**
     * One budget covers the whole report, so a huge cache, many stores or a folder loop can't hold up the tap: at most
     * {@code entries} directory entries looked at and {@code folders} folders opened. A count cut short ends in "+".
     */
    static String analyticsStores(java.io.File dataDir, int entries, int folders) {
        java.nio.file.Path root = dataDir.toPath();
        int[] budget = {entries, folders};
        java.util.List<java.nio.file.Path> top = folders(root, budget, false);
        if (top == null) return "unreadable";
        java.util.TreeMap<String, java.nio.file.Path> found = new java.util.TreeMap<>();
        for (java.nio.file.Path first : top) {
            if (namesAnalytics(first)) {
                found.put(first.getFileName().toString(), first);
                continue;
            }
            java.util.List<java.nio.file.Path> inner = folders(first, budget, true);
            if (inner != null) for (java.nio.file.Path second : inner) found.put(first.getFileName() + "/" + second.getFileName(), second);
        }
        java.util.List<String> stores = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, java.nio.file.Path> store : found.entrySet())
            stores.add(storeSize(store.getKey(), store.getValue(), budget));
        return stores.isEmpty() ? "none" : String.join(", ", stores);
    }

    private static boolean namesAnalytics(java.nio.file.Path path) {
        return path.getFileName().toString().toLowerCase(java.util.Locale.ROOT).contains("analytics");
    }

    /** The folders directly in dir, or only those named for analytics, checking a name before touching the entry. Null if dir can't be read. */
    private static java.util.List<java.nio.file.Path> folders(java.nio.file.Path dir, int[] budget, boolean analyticsOnly) {
        java.util.List<java.nio.file.Path> folders = new java.util.ArrayList<>();
        if (budget[1]-- <= 0) return folders;
        try (java.nio.file.DirectoryStream<java.nio.file.Path> entries = java.nio.file.Files.newDirectoryStream(dir)) {
            for (java.nio.file.Path entry : entries) {
                if (budget[0]-- <= 0) break;
                if (analyticsOnly && !namesAnalytics(entry)) continue;
                if (java.nio.file.Files.isDirectory(entry, java.nio.file.LinkOption.NOFOLLOW_LINKS)) folders.add(entry);
            }
        } catch (java.io.IOException | java.nio.file.DirectoryIteratorException | SecurityException e) {
            return null;
        }
        return folders;
    }

    private static String storeSize(String name, java.nio.file.Path dir, int[] budget) {
        long files = 0, bytes = 0;
        boolean cut = false;
        java.util.ArrayDeque<java.nio.file.Path> pending = new java.util.ArrayDeque<>();
        pending.add(dir);
        walk:
        while (!pending.isEmpty()) {
            if (budget[1]-- <= 0) {
                cut = true;
                break;
            }
            try (java.nio.file.DirectoryStream<java.nio.file.Path> entries = java.nio.file.Files.newDirectoryStream(pending.poll())) {
                for (java.nio.file.Path entry : entries) {
                    if (budget[0]-- <= 0) {
                        cut = true;
                        break walk;
                    }
                    java.nio.file.attribute.BasicFileAttributes attributes = java.nio.file.Files.readAttributes(entry,
                        java.nio.file.attribute.BasicFileAttributes.class, java.nio.file.LinkOption.NOFOLLOW_LINKS);
                    if (attributes.isDirectory()) pending.add(entry);
                    else if (attributes.isRegularFile()) {
                        files++;
                        bytes += attributes.size();
                    }
                }
            } catch (java.io.IOException | java.nio.file.DirectoryIteratorException | SecurityException e) {
                // A folder that went away or can't be read just isn't counted.
            }
        }
        String more = cut ? "+" : "";
        return name + " " + files + more + " files " + bytes + more + " bytes";
    }
}
