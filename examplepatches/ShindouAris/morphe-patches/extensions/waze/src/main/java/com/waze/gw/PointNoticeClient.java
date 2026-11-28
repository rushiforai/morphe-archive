package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/** Verified one-file lifecycle for direction-aware WME point notices. */
final class PointNoticeClient {
    private static final String TAG = "WazeGW-PointData";
    private static final String PREFS = "waze_point_notice_client";
    private static final String KEY_ETAG = "manifest_etag";
    private static final String KEY_LAST_CHECK = "last_check_ms";
    private static final String KEY_LAST_RESULT = "last_result";
    private static final String KEY_SERVER_VERSION = "server_version";
    private static final String MANIFEST_PATH = "/api/client/comments/manifest";

    private static final int MAX_MANIFEST_BYTES = 64 * 1024;
    private static final int MAX_DATABASE_BYTES = 16 * 1024 * 1024;
    private static final long POLL_MS = 6L * 60L * 60L * 1000L;

    private static final ScheduledExecutorService NETWORK =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeGW-point-data");
                    thread.setDaemon(true);
                    return thread;
                }
            });
    private static final Object LOCK = new Object();
    private static volatile boolean booted;
    private static volatile boolean loaded;
    private static volatile PointNoticeDatabase database;

    private PointNoticeClient() { }

    static void start(Context context) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null || booted) return;
        synchronized (PointNoticeClient.class) {
            if (booted) return;
            booted = true;
        }
        NETWORK.execute(new Runnable() {
            @Override public void run() {
                loadLocal(app);
                NETWORK.scheduleWithFixedDelay(new Runnable() {
                    @Override public void run() { poll(app, false); }
                }, 0L, POLL_MS, TimeUnit.MILLISECONDS);
            }
        });
    }

    static PointNoticeDatabase get(Context context) {
        Context app = context == null ? null : context.getApplicationContext();
        if (!loaded && app != null) loadLocal(app);
        return database;
    }

    /** Explicit user-triggered refresh; bypasses the six-hour automatic polling guard. */
    static void checkNow(Context context, final Runnable finished) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null) {
            if (finished != null) finished.run();
            return;
        }
        NETWORK.execute(new Runnable() {
            @Override public void run() {
                poll(app, true);
                if (finished != null) finished.run();
            }
        });
    }

    private static void loadLocal(Context app) {
        synchronized (LOCK) {
            if (loaded) return;
            PointNoticeDatabase current = loadVerified(pair(app, "active"));
            if (current == null) current = loadVerified(pair(app, "previous"));
            database = current;
            loaded = true;
            Log.i(TAG, current == null ? "no verified point database"
                    : "loaded dataset=" + current.datasetVersion);
        }
    }

    private static void poll(Context app, boolean force) {
        SharedPreferences preferences =
                app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        long now = System.currentTimeMillis();
        if (!force && now - preferences.getLong(KEY_LAST_CHECK, 0L) < POLL_MS) return;
        preferences.edit().putLong(KEY_LAST_CHECK, now).apply();
        java.util.ArrayList<String> failures = new java.util.ArrayList<String>();
        for (String base : WazeModEndpoints.defaults()) {
            try {
                pollFrom(app, preferences, base);
                return;
            } catch (Throwable error) {
                failures.add(WazeModEndpoints.failure(base, reason(error)));
                Log.w(TAG, "endpoint failed " + base + ": " + reason(error));
            }
        }
        String failure = WazeModEndpoints.joinFailures(failures);
        preferences.edit().putString(KEY_LAST_RESULT, "ERROR: " + failure).apply();
        Log.w(TAG, "point update kept old database: " + failure);
    }

    private static void pollFrom(Context app, SharedPreferences preferences, String base)
            throws Exception {
        HttpURLConnection connection = null;
        HttpURLConnection fileConnection = null;
        try {
            URL origin = new URL(base);
            connection = open(new URL(origin, MANIFEST_PATH));
            String etag = preferences.getString(KEY_ETAG, "");
            if (etag != null && etag.length() > 0) {
                connection.setRequestProperty("If-None-Match", etag);
            }
            int status = connection.getResponseCode();
            if (status == HttpURLConnection.HTTP_NOT_MODIFIED) {
                DiagnosticsLogger.networkEnd("point-manifest", connection, status, 0L, null);
                preferences.edit().putString(KEY_LAST_RESULT, "UP_TO_DATE").apply();
                return;
            }
            if (status == HttpURLConnection.HTTP_NO_CONTENT) {
                DiagnosticsLogger.networkEnd("point-manifest", connection, status, 0L, null);
                preferences.edit().putString(KEY_LAST_RESULT, "NO_DATA").apply();
                return;
            }
            if (status != HttpURLConnection.HTTP_OK) {
                DiagnosticsLogger.networkEnd("point-manifest", connection, status, 0L, null);
                throw new IllegalStateException("manifest HTTP " + status);
            }
            byte[] manifestBytes = readLimited(connection, MAX_MANIFEST_BYTES);
            DiagnosticsLogger.networkEnd("point-manifest", connection, status,
                    manifestBytes.length, null);
            String nextEtag = connection.getHeaderField("ETag");
            connection.disconnect();
            connection = null;
            Manifest manifest = Manifest.parse(manifestBytes);
            preferences.edit()
                    .putString(KEY_SERVER_VERSION, manifest.datasetVersion)
                    .putString(KEY_LAST_RESULT, "DOWNLOADING")
                    .apply();
            String artifactPath = manifest.fileUrl;
            if (manifest.envelope != null && artifactPath.indexOf('?') < 0) {
                artifactPath += "?version=" + manifest.datasetVersion;
            }
            URL fileUrl = new URL(origin, artifactPath);
            if (!origin.getProtocol().equalsIgnoreCase(fileUrl.getProtocol())
                    || !origin.getHost().equalsIgnoreCase(fileUrl.getHost())
                    || effectivePort(origin) != effectivePort(fileUrl)) {
                throw new IllegalStateException("cross-origin database URL");
            }
            fileConnection = open(fileUrl);
            int fileStatus = fileConnection.getResponseCode();
            if (fileStatus != HttpURLConnection.HTTP_OK) {
                DiagnosticsLogger.networkEnd("point-database", fileConnection,
                        fileStatus, 0L, null);
                throw new IllegalStateException("database HTTP "
                        + fileStatus);
            }
            long contentLength = fileConnection.getContentLengthLong();
            if (contentLength < 0 || contentLength > MAX_DATABASE_BYTES + 64L * 1024L
                    || contentLength != manifest.downloadSize) {
                throw new IllegalStateException("invalid Content-Length");
            }
            byte[] downloaded = readLimited(fileConnection, MAX_DATABASE_BYTES + 64 * 1024);
            DiagnosticsLogger.networkEnd("point-database", fileConnection,
                    fileStatus, downloaded.length, null);
            fileConnection.disconnect();
            fileConnection = null;
            if (downloaded.length != manifest.downloadSize) {
                throw new IllegalStateException("size mismatch");
            }
            if (!sha256(downloaded).equalsIgnoreCase(manifest.downloadSha256)) {
                throw new IllegalStateException("SHA-256 mismatch");
            }
            byte[] bytes = manifest.envelope == null
                    ? downloaded
                    : manifest.envelope.decryptAndVerify(app, downloaded, MAX_DATABASE_BYTES);
            manifest.verifyPlaintext(bytes);
            PointNoticeDatabase parsed = PointNoticeDatabase.parse(bytes);
            if (!manifest.datasetVersion.equals(parsed.datasetVersion)
                    || (manifest.generatedAtMs > 0
                    && manifest.generatedAtMs != parsed.generatedAtMs)
                    || manifest.spatialZoom != parsed.spatialZoom) {
                throw new IllegalStateException("manifest/database metadata mismatch");
            }
            install(app, bytes, manifestBytes);
            database = parsed;
            SharedPreferences.Editor success = preferences.edit()
                    .putString(KEY_LAST_RESULT, "UPDATED");
            if (nextEtag != null) success.putString(KEY_ETAG, nextEtag);
            success.apply();
            Log.i(TAG, "installed dataset=" + parsed.datasetVersion
                    + " origin=" + origin.getHost());
        } finally {
            if (connection != null) connection.disconnect();
            if (fileConnection != null) fileConnection.disconnect();
        }
    }

    private static String reason(Throwable error) {
        if (error == null) return "unknown";
        String message = error.getMessage();
        return error.getClass().getSimpleName() + (message == null ? "" : ": " + message);
    }

    private static void install(Context app, byte[] bytes, byte[] manifestBytes) throws Exception {
        synchronized (LOCK) {
            FilePair active = pair(app, "active");
            FilePair previous = pair(app, "previous");
            if (active.data.isFile() && active.manifest.isFile()) {
                copy(active.data, previous.data);
                copy(active.manifest, previous.manifest);
            }
            File dataTmp = new File(app.getFilesDir(), "wme_point_active.pb.tmp");
            File manifestTmp = new File(app.getFilesDir(), "wme_point_active.json.tmp");
            write(dataTmp, bytes);
            write(manifestTmp, manifestBytes);
            replace(dataTmp, active.data);
            replace(manifestTmp, active.manifest);
        }
    }

    private static PointNoticeDatabase loadVerified(FilePair files) {
        try {
            if (!files.data.isFile() || !files.manifest.isFile()) return null;
            byte[] manifestBytes = read(files.manifest, MAX_MANIFEST_BYTES);
            byte[] bytes = read(files.data, MAX_DATABASE_BYTES);
            return verify(bytes, manifestBytes);
        } catch (Throwable error) {
            Log.w(TAG, "invalid local point database: " + error.getClass().getSimpleName());
            return null;
        }
    }

    private static PointNoticeDatabase verify(byte[] bytes, byte[] manifestBytes)
            throws Exception {
        Manifest manifest = Manifest.parse(manifestBytes);
        manifest.verifyPlaintext(bytes);
        PointNoticeDatabase parsed = PointNoticeDatabase.parse(bytes);
        return manifest.datasetVersion.equals(parsed.datasetVersion)
                && (manifest.generatedAtMs <= 0
                || manifest.generatedAtMs == parsed.generatedAtMs)
                && manifest.spatialZoom == parsed.spatialZoom ? parsed : null;
    }

    private static HttpURLConnection open(URL url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(30000);
        connection.setRequestProperty("Accept", "application/json, application/x-protobuf");
        connection.setInstanceFollowRedirects(false);
        DiagnosticsLogger.networkStart("point-data", connection);
        return connection;
    }

    private static int effectivePort(URL url) {
        if (url.getPort() >= 0) return url.getPort();
        return "https".equalsIgnoreCase(url.getProtocol()) ? 443 : 80;
    }

    private static byte[] readLimited(HttpURLConnection connection, int limit) throws Exception {
        InputStream input = connection.getInputStream();
        try { return read(input, limit); }
        finally { input.close(); }
    }

    private static byte[] read(File file, int limit) throws Exception {
        FileInputStream input = new FileInputStream(file);
        try { return read(input, limit); }
        finally { input.close(); }
    }

    private static byte[] read(InputStream input, int limit) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int total = 0;
        for (;;) {
            int count = input.read(buffer);
            if (count < 0) break;
            total += count;
            if (total > limit) throw new IllegalStateException("file too large");
            output.write(buffer, 0, count);
        }
        return output.toByteArray();
    }

    private static void write(File file, byte[] bytes) throws Exception {
        FileOutputStream output = new FileOutputStream(file);
        try {
            output.write(bytes);
            output.getFD().sync();
        } finally {
            output.close();
        }
    }

    private static void copy(File source, File target) throws Exception {
        write(target, read(source, MAX_DATABASE_BYTES));
    }

    private static void replace(File source, File target) throws Exception {
        if (target.exists() && !target.delete()) throw new IllegalStateException("delete failed");
        if (!source.renameTo(target)) throw new IllegalStateException("rename failed");
    }

    private static String sha256(byte[] bytes) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder text = new StringBuilder(64);
        for (byte value : digest) text.append(String.format(Locale.US, "%02x", value & 0xff));
        return text.toString();
    }

    private static FilePair pair(Context app, String name) {
        return new FilePair(
                new File(app.getFilesDir(), "wme_point_" + name + ".pb"),
                new File(app.getFilesDir(), "wme_point_" + name + ".json"));
    }

    private static final class FilePair {
        final File data;
        final File manifest;
        FilePair(File data, File manifest) {
            this.data = data;
            this.manifest = manifest;
        }
    }

    private static final class Manifest {
        final String datasetVersion;
        final long generatedAtMs;
        final String fileUrl;
        final int spatialZoom;
        final int downloadSize;
        final String downloadSha256;
        final int plaintextSize;
        final String plaintextSha256;
        final byte[] signature;
        final DatasetEnvelope envelope;

        Manifest(String datasetVersion, long generatedAtMs, String fileUrl, int spatialZoom,
                 int downloadSize, String downloadSha256, int plaintextSize,
                 String plaintextSha256, byte[] signature, DatasetEnvelope envelope) {
            this.datasetVersion = datasetVersion;
            this.generatedAtMs = generatedAtMs;
            this.fileUrl = fileUrl;
            this.spatialZoom = spatialZoom;
            this.downloadSize = downloadSize;
            this.downloadSha256 = downloadSha256;
            this.plaintextSize = plaintextSize;
            this.plaintextSha256 = plaintextSha256;
            this.signature = signature;
            this.envelope = envelope;
        }

        static Manifest parse(byte[] bytes) throws Exception {
            JSONObject root = new JSONObject(new String(bytes, "UTF-8"));
            if (root.has("encryption")) {
                DatasetEnvelope encrypted = DatasetEnvelope.parse(
                        bytes, DatasetEnvelope.POINT, MAX_DATABASE_BYTES);
                if (encrypted.payloadSchemaVersion != 2 || encrypted.spatialZoom != 14) {
                    throw new IllegalArgumentException("invalid point payload metadata");
                }
                if (!"/api/client/comments/download".equals(encrypted.artifactUrl)) {
                    throw new IllegalArgumentException("invalid point artifact URL");
                }
                return new Manifest(
                        encrypted.version,
                        0L,
                        encrypted.artifactUrl,
                        encrypted.spatialZoom,
                        (int) encrypted.encryptedSize,
                        encrypted.encryptedSha256,
                        (int) encrypted.plaintextSize,
                        encrypted.plaintextSha256,
                        encrypted.signature,
                        encrypted);
            }
            if (root.optInt("schemaVersion", -1) != 2) {
                throw new IllegalArgumentException("unsupported manifest schema");
            }
            JSONObject file = root.getJSONObject("file");
            if (!"Ed25519".equalsIgnoreCase(file.optString("signatureAlgorithm"))) {
                throw new IllegalArgumentException("unsupported signature");
            }
            String version = root.getString("datasetVersion");
            if (!version.matches("[0-9]{1,32}")) {
                throw new IllegalArgumentException("invalid dataset version");
            }
            long generated = parseTime(root.getString("generatedAt"));
            int spatialZoom = root.optInt("spatialZoom", -1);
            if (spatialZoom != 14) {
                throw new IllegalArgumentException("invalid spatial zoom");
            }
            int size = file.getInt("size");
            if (size <= 0 || size > MAX_DATABASE_BYTES) {
                throw new IllegalArgumentException("invalid size");
            }
            String fileUrl = file.getString("url");
            String expectedUrl = "/api/v1/wme-point-notices/files/" + version
                    + "/wme_point_notices.pb";
            if (!expectedUrl.equals(fileUrl)) {
                throw new IllegalArgumentException("invalid file URL");
            }
            String digest = file.getString("sha256");
            if (!digest.matches("(?i)[a-f0-9]{64}")) {
                throw new IllegalArgumentException("invalid SHA-256");
            }
            byte[] signature = Base64.decode(file.getString("signature"), Base64.DEFAULT);
            if (signature.length != 64) {
                throw new IllegalArgumentException("invalid Ed25519 signature");
            }
            return new Manifest(
                    version,
                    generated,
                    fileUrl,
                    spatialZoom,
                    size,
                    digest,
                    size,
                    digest,
                    signature,
                    null);
        }

        void verifyPlaintext(byte[] bytes) throws Exception {
            if (bytes.length != plaintextSize
                    || !sha256(bytes).equalsIgnoreCase(plaintextSha256)
                    || !RoadNoticeCrypto.verify(bytes, signature)) {
                throw new SecurityException("point database authentication rejected");
            }
        }

        private static long parseTime(String value) throws Exception {
            SimpleDateFormat format = new SimpleDateFormat(
                    "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            Date date = format.parse(value);
            if (date == null) throw new IllegalArgumentException("invalid generatedAt");
            return date.getTime();
        }
    }
}
