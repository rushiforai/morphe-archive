/*
 * Rambler Bangla in-app GitHub Release auto-updater (SHA-256 verified, PackageInstaller 1-tap update).
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors
 * Licensed under the GNU General Public License v3.0. See LICENSE and ATTRIBUTION.md.
 */
package dev.abotmaker.ramblerenhancements;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.provider.Settings;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Checks {@code muhib-karim/Rambler-Bangla} GitHub Releases for newer maintainer-signed APKs,
 * verifies the downloaded APK's SHA-256 digest against {@code SHA256SUMS.txt}, and launches
 * Android's native 1-tap {@link PackageInstaller} update confirmation sheet.
 *
 * <p>Fail-closed security:
 * <ul>
 *   <li>Only contacts {@code https://api.github.com/repos/muhib-karim/Rambler-Bangla/releases/latest}
 *       and downloads strictly from {@code https://github.com/muhib-karim/Rambler-Bangla/releases/download/}.</li>
 *   <li>Never sends any typed text, dictation, device identifiers, or telemetry.</li>
 *   <li>Verifies SHA-256 against the release's {@code SHA256SUMS.txt} before invoking {@link PackageInstaller};
 *       Android additionally enforces the persistent maintainer signing certificate.</li>
 * </ul>
 */
public final class RamblerAutoUpdater {
    private static final String TAG = "RamblerUpdater";
    public static final String CURRENT_VERSION = "32.4.0";
    public static final String REPO_SLUG = "muhib-karim/Rambler-Bangla";
    public static final String RELEASE_API_URL =
            "https://api.github.com/repos/" + REPO_SLUG + "/releases/latest";
    public static final String ALLOWED_DOWNLOAD_PREFIX =
            "https://github.com/" + REPO_SLUG + "/releases/download/";
    public static final String ACTION_INSTALL_RESULT =
            "dev.abotmaker.ramblerenhancements.ACTION_UPDATE_INSTALL_RESULT";
    public static final long AUTO_CHECK_INTERVAL_MS = 12L * 60L * 60L * 1000L; // 12 hours
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final int INSTALL_REQUEST_CODE = 0x5242;

    public static final class ReleaseInfo {
        public final String tagName;
        public final String version;
        public final String htmlUrl;
        public final String apkName;
        public final String apkDownloadUrl;
        public final long apkSizeBytes;
        public final String sha256SumsUrl;
        public final String notesPreview;

        public ReleaseInfo(
                String tagName,
                String version,
                String htmlUrl,
                String apkName,
                String apkDownloadUrl,
                long apkSizeBytes,
                String sha256SumsUrl,
                String notesPreview) {
            this.tagName = tagName == null ? "" : tagName;
            this.version = version == null ? "" : version;
            this.htmlUrl = htmlUrl == null ? "" : htmlUrl;
            this.apkName = apkName == null ? "" : apkName;
            this.apkDownloadUrl = apkDownloadUrl == null ? "" : apkDownloadUrl;
            this.apkSizeBytes = apkSizeBytes;
            this.sha256SumsUrl = sha256SumsUrl == null ? "" : sha256SumsUrl;
            this.notesPreview = notesPreview == null ? "" : notesPreview;
        }

        public boolean hasDirectApk() {
            return isAllowedDownloadUrl(apkDownloadUrl) && apkName.toLowerCase(Locale.US).endsWith(".apk");
        }
    }

    public interface CheckCallback {
        void onResult(ReleaseInfo latest, boolean updateAvailable, String errorMessage);
    }

    public interface DownloadCallback {
        void onProgress(int percent, long downloadedBytes, long totalBytes);
        void onReadyToInstall(File verifiedApk, String sha256Hex);
        void onError(String message);
    }

    public interface InstallStageCallback {
        void onStageProgress(int percent);
        void onCommitted(int sessionId);
        void onStageError(String message);
    }

    private RamblerAutoUpdater() {
    }

    public static String normalizeVersion(String raw) {
        if (raw == null) {
            return "";
        }
        String s = raw.trim();
        if (s.startsWith("v") || s.startsWith("V")) {
            s = s.substring(1).trim();
        }
        int dash = s.indexOf('-');
        if (dash > 0) {
            s = s.substring(0, dash);
        }
        return s;
    }

    /**
     * Compares dotted numeric semantic versions (e.g. "v31.5.0" vs "31.4.1").
     * Returns &gt; 0 if {@code candidate} is newer than {@code current}.
     */
    public static int compareVersions(String candidate, String current) {
        String a = normalizeVersion(candidate);
        String b = normalizeVersion(current);
        if (a.equals(b)) {
            return 0;
        }
        String[] pa = a.isEmpty() ? new String[0] : a.split("\\.");
        String[] pb = b.isEmpty() ? new String[0] : b.split("\\.");
        int len = Math.max(pa.length, pb.length);
        for (int i = 0; i < len; i++) {
            int va = i < pa.length ? parseIntSafe(pa[i]) : 0;
            int vb = i < pb.length ? parseIntSafe(pb[i]) : 0;
            if (va != vb) {
                return Integer.compare(va, vb);
            }
        }
        return 0;
    }

    public static boolean isNewerVersion(String latestTag, String currentVersion) {
        return compareVersions(latestTag, currentVersion) > 0;
    }

    public static boolean isAllowedDownloadUrl(String url) {
        if (url == null) {
            return false;
        }
        String trimmed = url.trim();
        return trimmed.startsWith(ALLOWED_DOWNLOAD_PREFIX)
                && trimmed.indexOf('\n') < 0
                && trimmed.indexOf('\r') < 0
                && !trimmed.contains("..");
    }

    private static int parseIntSafe(String part) {
        if (part == null || part.isEmpty()) {
            return 0;
        }
        int val = 0;
        for (int i = 0; i < part.length(); i++) {
            char c = part.charAt(i);
            if (c < '0' || c > '9') {
                break;
            }
            val = val * 10 + (c - '0');
        }
        return val;
    }

    /**
     * Parses the GitHub Releases API JSON payload using pure Java (no Android org.json dependency)
     * so unit tests verify the exact runtime parser on JVM.
     */
    public static ReleaseInfo parseLatestReleaseJson(String json) {
        if (json == null || json.trim().isEmpty()) {
            return null;
        }
        String tag = extractTopLevelJsonString(json, "tag_name");
        if (tag == null || tag.trim().isEmpty()) {
            return null;
        }
        String htmlUrl = extractTopLevelJsonString(json, "html_url");
        String body = extractTopLevelJsonString(json, "body");

        String apkName = "";
        String apkUrl = "";
        long apkSize = 0L;
        String sumsUrl = "";

        int assetsIdx = json.indexOf("\"assets\"");
        if (assetsIdx >= 0) {
            int arrStart = json.indexOf('[', assetsIdx);
            if (arrStart >= 0) {
                int pos = arrStart + 1;
                int len = json.length();
                while (pos < len) {
                    int objStart = json.indexOf('{', pos);
                    if (objStart < 0) {
                        break;
                    }
                    int objEnd = findMatchingBrace(json, objStart);
                    if (objEnd < 0) {
                        break;
                    }
                    String obj = json.substring(objStart, objEnd + 1);
                    String name = extractTopLevelJsonString(obj, "name");
                    String dl = extractTopLevelJsonString(obj, "browser_download_url");
                    long size = extractTopLevelJsonLong(obj, "size");
                    if (name != null && dl != null) {
                        String lower = name.toLowerCase(Locale.US);
                        if (lower.endsWith(".apk") && isAllowedDownloadUrl(dl)) {
                            apkName = name;
                            apkUrl = dl;
                            apkSize = size;
                        } else if ("sha256sums.txt".equals(lower) && isAllowedDownloadUrl(dl)) {
                            sumsUrl = dl;
                        }
                    }
                    pos = objEnd + 1;
                }
            }
        }

        String preview = summarizeNotes(body);
        return new ReleaseInfo(
                tag.trim(),
                normalizeVersion(tag),
                htmlUrl == null ? "" : htmlUrl,
                apkName,
                apkUrl,
                apkSize,
                sumsUrl,
                preview);
    }

    /** Extracts the 64-hex SHA-256 digest for {@code targetFileName} from {@code SHA256SUMS.txt}. */
    public static String parseExpectedSha256(String sumsText, String targetFileName) {
        if (sumsText == null || targetFileName == null || targetFileName.trim().isEmpty()) {
            return null;
        }
        String wanted = targetFileName.trim();
        for (String rawLine : sumsText.split("\\r?\\n")) {
            String line = rawLine.trim();
            if (line.isEmpty() || line.startsWith("#")) {
                continue;
            }
            String[] parts = line.split("\\s+", 2);
            if (parts.length == 2) {
                String digest = parts[0].trim().toLowerCase(Locale.US);
                String name = parts[1].trim();
                if (name.startsWith("*")) {
                    name = name.substring(1).trim();
                }
                if (wanted.equals(name) && digest.matches("[0-9a-f]{64}")) {
                    return digest;
                }
            }
        }
        return null;
    }

    public static void checkForUpdateAsync(Context context, boolean force, CheckCallback callback) {
        if (callback == null) {
            return;
        }
        final Context appCtx = context == null ? null : context.getApplicationContext();
        if (!force && appCtx != null) {
            if (!RamblerEnhancementsSettings.readAutoCheckUpdates(appCtx)) {
                return;
            }
            long lastMs = RamblerEnhancementsSettings.readLastUpdateCheckMs(appCtx);
            if (lastMs > 0L && (System.currentTimeMillis() - lastMs) < AUTO_CHECK_INTERVAL_MS) {
                return;
            }
        }
        Handler main = new Handler(Looper.getMainLooper());
        Thread worker = new Thread(() -> {
            try {
                String json = httpGetText(RELEASE_API_URL, "application/vnd.github+json");
                ReleaseInfo info = parseLatestReleaseJson(json);
                if (info == null) {
                    main.post(() -> callback.onResult(null, false, "Could not parse GitHub release metadata."));
                    return;
                }
                if (appCtx != null) {
                    RamblerEnhancementsSettings.writeLastUpdateCheck(appCtx, System.currentTimeMillis(), info.tagName);
                }
                boolean newer = isNewerVersion(info.tagName, CURRENT_VERSION);
                main.post(() -> callback.onResult(info, newer, null));
            } catch (Throwable err) {
                Log.w(TAG, "Update check failed", err);
                String msg = err.getMessage() == null ? err.getClass().getSimpleName() : err.getMessage();
                main.post(() -> callback.onResult(null, false, msg));
            }
        }, "rambler-update-check");
        worker.setDaemon(true);
        worker.start();
    }

    public static void downloadAndVerifyAsync(
            Context context,
            ReleaseInfo info,
            DownloadCallback callback) {
        if (context == null || info == null || callback == null) {
            return;
        }
        if (!info.hasDirectApk()) {
            callback.onError("No verified direct APK found on release " + info.tagName + ".");
            return;
        }
        final Context appCtx = context.getApplicationContext();
        Handler main = new Handler(Looper.getMainLooper());
        Thread worker = new Thread(() -> {
            File target = new File(appCtx.getCacheDir(), "rambler-bangla-update.apk");
            File temp = new File(appCtx.getCacheDir(), "rambler-bangla-update.apk.part");
            try {
                String expectedSha = null;
                if (isAllowedDownloadUrl(info.sha256SumsUrl)) {
                    String sums = httpGetText(info.sha256SumsUrl, "text/plain");
                    expectedSha = parseExpectedSha256(sums, info.apkName);
                }
                if (expectedSha == null) {
                    main.post(() -> callback.onError("Release SHA256SUMS.txt missing or invalid; aborting for safety."));
                    return;
                }

                HttpURLConnection conn = openSafeConnection(info.apkDownloadUrl, "application/octet-stream");
                try {
                    int code = conn.getResponseCode();
                    if (code != HttpURLConnection.HTTP_OK) {
                        main.post(() -> callback.onError("Download failed (HTTP " + code + ")."));
                        return;
                    }
                    long total = conn.getContentLengthLong();
                    if (total <= 0L) {
                        total = info.apkSizeBytes;
                    }
                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    long downloaded = 0L;
                    int lastPct = -1;
                    try (InputStream in = new BufferedInputStream(conn.getInputStream());
                         FileOutputStream out = new FileOutputStream(temp)) {
                        byte[] buf = new byte[32 * 1024];
                        int n;
                        while ((n = in.read(buf)) != -1) {
                            out.write(buf, 0, n);
                            md.update(buf, 0, n);
                            downloaded += n;
                            if (total > 0L) {
                                int pct = (int) Math.min(100L, (downloaded * 100L) / total);
                                if (pct != lastPct) {
                                    lastPct = pct;
                                    final int fPct = pct;
                                    final long fDl = downloaded;
                                    final long fTot = total;
                                    main.post(() -> callback.onProgress(fPct, fDl, fTot));
                                }
                            }
                        }
                    }
                    String actualSha = toHex(md.digest());
                    if (!expectedSha.equalsIgnoreCase(actualSha)) {
                        // Fail closed: delete unverified file immediately
                        //noinspection ResultOfMethodCallIgnored
                        temp.delete();
                        main.post(() -> callback.onError("SHA-256 mismatch! Download aborted for safety."));
                        return;
                    }
                    if (target.exists()) {
                        //noinspection ResultOfMethodCallIgnored
                        target.delete();
                    }
                    if (!temp.renameTo(target)) {
                        //noinspection ResultOfMethodCallIgnored
                        temp.delete();
                        main.post(() -> callback.onError("Could not stage verified APK in cache."));
                        return;
                    }
                    main.post(() -> callback.onReadyToInstall(target, actualSha));
                } finally {
                    conn.disconnect();
                }
            } catch (Throwable err) {
                //noinspection ResultOfMethodCallIgnored
                temp.delete();
                Log.w(TAG, "Update download failed", err);
                String msg = err.getMessage() == null ? err.getClass().getSimpleName() : err.getMessage();
                main.post(() -> callback.onError(msg));
            }
        }, "rambler-update-download");
        worker.setDaemon(true);
        worker.start();
    }

    public static boolean canRequestPackageInstalls(Context context) {
        if (context == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return true;
        }
        try {
            return context.getPackageManager().canRequestPackageInstalls();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void openUnknownAppSourcesSettings(Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return;
        }
        Intent intent = new Intent(
                Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                Uri.parse("package:" + activity.getPackageName()));
        activity.startActivity(intent);
    }

    /**
     * Streams a SHA-256-verified APK into Android's {@link PackageInstaller} on a background
     * thread (never blocking the UI thread) and commits it to an explicit package-scoped
     * {@link PendingIntent#getBroadcast} receiver so Android 14–16 foreground activities receive
     * {@link PackageInstaller#STATUS_PENDING_USER_ACTION} cleanly without Background Activity
     * Launch (BAL) suppression.
     */
    public static void launchPackageInstallerAsync(
            Context context,
            File verifiedApk,
            InstallStageCallback callback) {
        if (context == null || verifiedApk == null || !verifiedApk.isFile()) {
            if (callback != null) {
                callback.onStageError("Verified APK file missing.");
            }
            return;
        }
        final Context appCtx = context.getApplicationContext();
        final Handler main = new Handler(Looper.getMainLooper());
        Thread worker = new Thread(() -> {
            PackageInstaller installer = appCtx.getPackageManager().getPackageInstaller();
            PackageInstaller.Session session = null;
            try {
                // Clean up any abandoned older sessions created by our own app
                try {
                    for (PackageInstaller.SessionInfo si : installer.getMySessions()) {
                        if (si != null && !si.isActive()) {
                            installer.abandonSession(si.getSessionId());
                        }
                    }
                } catch (Throwable ignored) {
                }

                long totalBytes = verifiedApk.length();
                PackageInstaller.SessionParams params =
                        new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
                params.setAppPackageName(appCtx.getPackageName());
                params.setSize(totalBytes);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    params.setRequireUserAction(PackageInstaller.SessionParams.USER_ACTION_REQUIRED);
                    params.setInstallScenario(PackageManager.INSTALL_SCENARIO_FAST);
                }
                int sessionId = installer.createSession(params);
                session = installer.openSession(sessionId);
                try (InputStream in = new BufferedInputStream(new FileInputStream(verifiedApk), 256 * 1024);
                     OutputStream out = session.openWrite("base.apk", 0L, totalBytes)) {
                    byte[] buf = new byte[256 * 1024];
                    long written = 0L;
                    int lastPct = -1;
                    int n;
                    while ((n = in.read(buf)) != -1) {
                        out.write(buf, 0, n);
                        written += n;
                        if (callback != null && totalBytes > 0L) {
                            int pct = (int) Math.min(100L, (written * 100L) / totalBytes);
                            if (pct != lastPct && (pct == 100 || pct - lastPct >= 5)) {
                                lastPct = pct;
                                final int fPct = pct;
                                main.post(() -> callback.onStageProgress(fPct));
                            }
                        }
                    }
                    session.fsync(out);
                }

                Intent callbackIntent = new Intent(ACTION_INSTALL_RESULT);
                callbackIntent.setPackage(appCtx.getPackageName());
                int flags = PendingIntent.FLAG_UPDATE_CURRENT;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    flags |= PendingIntent.FLAG_MUTABLE;
                }
                PendingIntent pi = PendingIntent.getBroadcast(
                        appCtx, sessionId, callbackIntent, flags);
                session.commit(pi.getIntentSender());
                final int committedId = sessionId;
                if (callback != null) {
                    main.post(() -> callback.onCommitted(committedId));
                }
            } catch (Throwable err) {
                if (session != null) {
                    try {
                        session.abandon();
                    } catch (Throwable ignored) {
                    }
                }
                Log.w(TAG, "PackageInstaller commit failed", err);
                String msg = err.getMessage() == null ? err.getClass().getSimpleName() : err.getMessage();
                if (callback != null) {
                    main.post(() -> callback.onStageError(msg));
                }
            } finally {
                if (session != null) {
                    try {
                        session.close();
                    } catch (Throwable ignored) {
                    }
                }
            }
        }, "rambler-update-install");
        worker.setDaemon(true);
        worker.start();
    }

    /** Copies the SHA-256-verified APK into the device Downloads folder as a manual fallback. */
    public static String saveApkToDownloads(Context context, File verifiedApk, String displayName) throws IOException {
        if (context == null || verifiedApk == null || !verifiedApk.isFile()) {
            throw new IOException("Verified APK file missing.");
        }
        String fileName = (displayName == null || displayName.trim().isEmpty())
                ? "RamblerBangla-update.apk"
                : displayName.trim();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentValues cv = new ContentValues();
            cv.put(MediaStore.Downloads.DISPLAY_NAME, fileName);
            cv.put(MediaStore.Downloads.MIME_TYPE, "application/vnd.android.package-archive");
            cv.put(MediaStore.Downloads.RELATIVE_PATH, "Download/");
            ContentResolver cr = context.getContentResolver();
            Uri uri = cr.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, cv);
            if (uri == null) {
                throw new IOException("Could not create file in Downloads.");
            }
            try (InputStream in = new BufferedInputStream(new FileInputStream(verifiedApk));
                 OutputStream out = cr.openOutputStream(uri)) {
                if (out == null) {
                    throw new IOException("Could not open Downloads output stream.");
                }
                byte[] buf = new byte[64 * 1024];
                int n;
                while ((n = in.read(buf)) != -1) {
                    out.write(buf, 0, n);
                }
            }
            return "Download/" + fileName;
        }
        File ext = context.getExternalFilesDir(null);
        if (ext == null) {
            throw new IOException("Storage unavailable.");
        }
        File dst = new File(ext, fileName);
        try (InputStream in = new BufferedInputStream(new FileInputStream(verifiedApk));
             OutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[64 * 1024];
            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
            }
        }
        return dst.getAbsolutePath();
    }

    private static HttpURLConnection openSafeConnection(String rawUrl, String accept) throws IOException {
        URL url = new URL(rawUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setInstanceFollowRedirects(true);
        conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
        conn.setReadTimeout(READ_TIMEOUT_MS);
        conn.setRequestProperty("User-Agent", "Rambler-Bangla/" + CURRENT_VERSION);
        if (accept != null) {
            conn.setRequestProperty("Accept", accept);
        }
        return conn;
    }

    private static String httpGetText(String rawUrl, String accept) throws IOException {
        HttpURLConnection conn = openSafeConnection(rawUrl, accept);
        try {
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                throw new IOException("HTTP " + code);
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = new BufferedInputStream(conn.getInputStream())) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) != -1) {
                    out.write(buf, 0, n);
                    if (out.size() > 512 * 1024) {
                        throw new IOException("Response too large");
                    }
                }
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } finally {
            conn.disconnect();
        }
    }

    private static String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            int v = b & 0xFF;
            if (v < 16) sb.append('0');
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    private static int findMatchingBrace(String s, int openIdx) {
        int depth = 0;
        boolean inStr = false;
        boolean esc = false;
        for (int i = openIdx; i < s.length(); i++) {
            char c = s.charAt(i);
            if (inStr) {
                if (esc) {
                    esc = false;
                } else if (c == '\\') {
                    esc = true;
                } else if (c == '"') {
                    inStr = false;
                }
            } else {
                if (c == '"') {
                    inStr = true;
                } else if (c == '{') {
                    depth++;
                } else if (c == '}') {
                    depth--;
                    if (depth == 0) {
                        return i;
                    }
                }
            }
        }
        return -1;
    }

    private static String extractTopLevelJsonString(String json, String key) {
        String needle = "\"" + key + "\"";
        int idx = 0;
        while ((idx = json.indexOf(needle, idx)) >= 0) {
            int colon = json.indexOf(':', idx + needle.length());
            if (colon < 0) return null;
            int q = skipWs(json, colon + 1);
            if (q < json.length() && json.charAt(q) == '"') {
                return readJsonString(json, q);
            }
            idx += needle.length();
        }
        return null;
    }

    private static long extractTopLevelJsonLong(String json, String key) {
        Matcher m = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*(\\d+)").matcher(json);
        if (m.find()) {
            try {
                return Long.parseLong(m.group(1));
            } catch (NumberFormatException ignored) {
            }
        }
        return 0L;
    }

    private static int skipWs(String s, int i) {
        while (i < s.length() && Character.isWhitespace(s.charAt(i))) {
            i++;
        }
        return i;
    }

    private static String readJsonString(String s, int openQuote) {
        StringBuilder sb = new StringBuilder();
        int i = openQuote + 1;
        while (i < s.length()) {
            char c = s.charAt(i++);
            if (c == '"') {
                return sb.toString();
            }
            if (c == '\\' && i < s.length()) {
                char e = s.charAt(i++);
                switch (e) {
                    case 'n': sb.append('\n'); break;
                    case 'r': sb.append('\r'); break;
                    case 't': sb.append('\t'); break;
                    case '"': sb.append('"'); break;
                    case '\\': sb.append('\\'); break;
                    case '/': sb.append('/'); break;
                    case 'u':
                        if (i + 4 <= s.length()) {
                            try {
                                sb.append((char) Integer.parseInt(s.substring(i, i + 4), 16));
                                i += 4;
                            } catch (NumberFormatException ignored) {
                            }
                        }
                        break;
                    default:
                        sb.append(e);
                        break;
                }
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    private static String summarizeNotes(String body) {
        if (body == null || body.trim().isEmpty()) {
            return "New Rambler Bangla release is available on GitHub.";
        }
        StringBuilder out = new StringBuilder();
        int lines = 0;
        for (String raw : body.split("\\r?\\n")) {
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith("```") || line.startsWith("|")) {
                continue;
            }
            line = line.replaceAll("^#{1,4}\\s*", "").replace("**", "");
            if (out.length() > 0) {
                out.append('\n');
            }
            out.append(line);
            lines++;
            if (lines >= 6 || out.length() >= 360) {
                break;
            }
        }
        return out.length() == 0 ? "New Rambler Bangla release is available on GitHub." : out.toString();
    }
}
