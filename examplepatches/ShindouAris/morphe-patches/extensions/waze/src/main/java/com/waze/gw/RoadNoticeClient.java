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
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/** Secure local database lifecycle and low-frequency manifest polling. */
final class RoadNoticeClient {
    private static final String TAG = "WazeGW-RoadData";
    private static final String PREFS = "waze_road_notice_client";
    private static final String KEY_ETAG = "manifest_etag";
    private static final String KEY_LAST_CHECK = "last_check_ms";
    private static final String KEY_LAST_RESULT = "last_result";
    private static final String KEY_SERVER_VERSION = "server_version";
    private static final String MANIFEST_PATH = "/api/v1/road-notices/manifest";

    private static final int MAX_MANIFEST_BYTES = 64 * 1024;
    private static final int MAX_DATABASE_BYTES = 64 * 1024 * 1024;
    private static final long POLL_MS = 6L * 60L * 60L * 1000L;
    private static final int CONNECT_TIMEOUT_MS = 10_000;
    private static final int READ_TIMEOUT_MS = 30_000;

    private static final ScheduledExecutorService NETWORK =
            Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeGW-road-data");
                    thread.setDaemon(true);
                    return thread;
                }
            });

    private static final Object LOAD_LOCK = new Object();
    private static volatile boolean loaded;
    private static volatile boolean bootScheduled;
    private static volatile boolean pollingStarted;
    private static volatile RoadNoticeDatabase database;

    private RoadNoticeClient() { }

    /** Idempotent app-boot entry point; all disk, crypto and network work stays off the caller. */
    static void start(Context context) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null || bootScheduled) return;
        synchronized (RoadNoticeClient.class) {
            if (bootScheduled) return;
            bootScheduled = true;
            NETWORK.execute(new Runnable() {
                @Override public void run() {
                    loadLocalOnce(app);
                    startPollingOnce(app);
                }
            });
        }
    }

    /** Called only from RoadRulesRepository's worker, never from Waze's location callback thread. */
    static RoadNoticeDatabase get(Context context) {
        Context app = context == null ? null : context.getApplicationContext();
        if (!loaded && app != null) loadLocalOnce(app);
        if (app != null) startPollingOnce(app);
        return database;
    }

    /** User-triggered refresh: bypass both the six-hour guard and conditional ETag request. */
    static void checkNow(Context context, final Runnable finished) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null) {
            if (finished != null) finished.run();
            return;
        }
        NETWORK.execute(new Runnable() {
            @Override public void run() {
                try {
                    loadLocalOnce(app);
                    poll(app, true);
                } finally {
                    if (finished != null) finished.run();
                }
            }
        });
    }

    private static void loadLocalOnce(Context app) {
        synchronized (LOAD_LOCK) {
            if (loaded) return;
            boolean cryptoReady = RoadNoticeCrypto.available();
            RoadNoticeDatabase current = loadVerified(pair(app, "active"));
            if (current == null) {
                current = loadVerified(pair(app, "previous"));
                if (current != null) Log.w(TAG, "using previous verified road database");
            }
            database = current;
            loaded = true;
            Log.i(TAG, (cryptoReady ? "Ed25519 ready; " : "Ed25519 unavailable; ")
                    + (current == null ? "no verified local road database"
                    : "loaded dataset=" + current.datasetVersion
                    + " segments=" + current.segmentIds.length
                    + " points=" + current.pointOffsets.length));
        }
    }

    private static void startPollingOnce(final Context app) {
        if (pollingStarted) return;
        synchronized (RoadNoticeClient.class) {
            if (pollingStarted) return;
            pollingStarted = true;
            SharedPreferences preferences = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long elapsed = System.currentTimeMillis() - preferences.getLong(KEY_LAST_CHECK, 0L);
            long initialDelay = elapsed >= POLL_MS ? 0L : POLL_MS - Math.max(0L, elapsed);
            NETWORK.scheduleWithFixedDelay(new Runnable() {
                @Override public void run() { poll(app, false); }
            }, initialDelay, POLL_MS, TimeUnit.MILLISECONDS);
        }
    }

    private static void poll(Context app, boolean forceDownload) {
        SharedPreferences preferences = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        preferences.edit().putLong(KEY_LAST_CHECK, System.currentTimeMillis()).apply();
        java.util.ArrayList<String> failures = new java.util.ArrayList<String>();
        for (String base : WazeModEndpoints.defaults()) {
            try {
                pollFrom(app, preferences, base, forceDownload);
                return;
            } catch (Throwable error) {
                failures.add(WazeModEndpoints.failure(base, safeMessage(error)));
                Log.w(TAG, "endpoint failed " + base + ": " + safeMessage(error));
            }
        }
        String failure = WazeModEndpoints.joinFailures(failures);
        preferences.edit().putString(KEY_LAST_RESULT, "ERROR: " + failure).apply();
        Log.w(TAG, "update kept old database: " + failure);
    }

    private static void pollFrom(Context app, SharedPreferences preferences, String base,
                                 boolean forceDownload) throws Exception {
        HttpURLConnection connection = null;
        try {
            URL origin = new URL(base);
            URL manifestUrl = new URL(origin, MANIFEST_PATH);
            String etag = preferences.getString(KEY_ETAG, "");
            String requestEtag = !forceDownload && database != null
                    && etag != null && !etag.isEmpty() ? etag : null;
            connection = openSameOrigin(origin, manifestUrl, 3, requestEtag);
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_NOT_MODIFIED) {
                DiagnosticsLogger.networkEnd("road-manifest", connection, code, 0L, null);
                preferences.edit().putString(KEY_LAST_RESULT, "UP_TO_DATE").apply();
                Log.i(TAG, "manifest unchanged (304)");
                return;
            }
            if (code == HttpURLConnection.HTTP_NO_CONTENT) {
                DiagnosticsLogger.networkEnd("road-manifest", connection, code, 0L, null);
                preferences.edit().putString(KEY_LAST_RESULT, "NO_DATA").apply();
                Log.i(TAG, "no published road dataset (204)");
                return;
            }
            if (code != HttpURLConnection.HTTP_OK) {
                DiagnosticsLogger.networkEnd("road-manifest", connection, code, 0L, null);
                throw new Exception("manifest HTTP " + code);
            }
            byte[] manifestBytes = readBounded(connection, MAX_MANIFEST_BYTES, -1L);
            DiagnosticsLogger.networkEnd("road-manifest", connection, code,
                    manifestBytes.length, null);
            Manifest manifest = Manifest.parse(manifestBytes);
            preferences.edit()
                    .putString(KEY_SERVER_VERSION, String.valueOf(manifest.datasetVersion))
                    .putString(KEY_LAST_RESULT, "DOWNLOADING")
                    .apply();
            RoadNoticeDatabase candidate = downloadAndVerify(app, origin, manifest, manifestBytes);
            activate(app);
            database = candidate;
            String receivedEtag = connection.getHeaderField("ETag");
            SharedPreferences.Editor edit = preferences.edit();
            if (receivedEtag == null || receivedEtag.isEmpty()) edit.remove(KEY_ETAG);
            else edit.putString(KEY_ETAG, receivedEtag);
            edit.putString(KEY_LAST_RESULT, "UPDATED");
            edit.apply();
            Log.i(TAG, "activated dataset=" + candidate.datasetVersion
                    + " origin=" + origin.getHost() + " segments=" + candidate.segmentIds.length
                    + " points=" + candidate.pointOffsets.length);
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static RoadNoticeDatabase downloadAndVerify(Context app, URL origin,
                                                        Manifest manifest,
                                                        byte[] manifestBytes) throws Exception {
        FilePair temporary = pair(app, "download");
        deleteFile(temporary.data);
        deleteFile(temporary.meta);
        HttpURLConnection connection = null;
        try {
            URL download = new URL(origin, manifest.fileUrl);
            connection = openSameOrigin(origin, download, 3, null);
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                DiagnosticsLogger.networkEnd("road-database", connection, code, 0L, null);
                throw new Exception("database HTTP " + code);
            }
            long contentLength = connection.getContentLengthLong();
            if (contentLength < 0 || contentLength != manifest.downloadSize) {
                throw new Exception("Content-Length mismatch");
            }

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            InputStream input = connection.getInputStream();
            FileOutputStream output = new FileOutputStream(temporary.data);
            long total = 0L;
            try {
                byte[] buffer = new byte[32 * 1024];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    total += count;
                    if (total > manifest.downloadSize
                            || total > (long) MAX_DATABASE_BYTES + 64L * 1024L) {
                        throw new Exception("database exceeds declared size");
                    }
                    output.write(buffer, 0, count);
                    digest.update(buffer, 0, count);
                }
                output.flush();
                output.getFD().sync();
            } finally {
                try { input.close(); } catch (Throwable ignored) { }
                try { output.close(); } catch (Throwable ignored) { }
            }
            if (total != manifest.downloadSize) throw new Exception("download truncated");
            DiagnosticsLogger.networkEnd("road-database", connection, code, total, null);
            if (!hex(digest.digest()).equalsIgnoreCase(manifest.downloadSha256)) {
                throw new Exception("SHA-256 mismatch");
            }
            byte[] downloaded = readFile(temporary.data, MAX_DATABASE_BYTES + 64 * 1024);
            byte[] bytes = manifest.envelope == null
                    ? downloaded
                    : manifest.envelope.decryptAndVerify(app, downloaded, MAX_DATABASE_BYTES);
            manifest.verifyPlaintext(bytes);
            RoadNoticeDatabase parsed = RoadNoticeDatabase.parse(bytes);
            manifest.assertMatches(parsed);
            if (manifest.envelope != null) writeSynced(temporary.data, bytes);
            writeSynced(temporary.meta, manifestBytes);
            return parsed;
        } finally {
            if (connection != null) connection.disconnect();
            if (!temporary.meta.isFile()) deleteFile(temporary.data);
        }
    }

    private static RoadNoticeDatabase loadVerified(FilePair files) {
        if (!files.data.isFile() || !files.meta.isFile()) return null;
        try {
            byte[] manifestBytes = readFile(files.meta, MAX_MANIFEST_BYTES);
            Manifest manifest = Manifest.parse(manifestBytes);
            if (files.data.length() != manifest.plaintextSize) {
                throw new Exception("stored size mismatch");
            }
            byte[] bytes = readFile(files.data, MAX_DATABASE_BYTES);
            manifest.verifyPlaintext(bytes);
            RoadNoticeDatabase parsed = RoadNoticeDatabase.parse(bytes);
            manifest.assertMatches(parsed);
            return parsed;
        } catch (Throwable error) {
            Log.w(TAG, "invalid " + files.data.getName() + ": " + safeMessage(error));
            return null;
        }
    }

    private static void activate(Context app) throws Exception {
        FilePair active = pair(app, "active");
        FilePair previous = pair(app, "previous");
        FilePair temporary = pair(app, "download");
        if (!temporary.data.isFile() || !temporary.meta.isFile()) {
            throw new Exception("verified temporary pair missing");
        }
        deleteFile(previous.data);
        deleteFile(previous.meta);
        boolean hadData = active.data.exists();
        boolean hadMeta = active.meta.exists();
        boolean movedData = !hadData || active.data.renameTo(previous.data);
        boolean movedMeta = !hadMeta || active.meta.renameTo(previous.meta);
        if (!movedData || !movedMeta) {
            if (movedData && hadData && previous.data.isFile()) previous.data.renameTo(active.data);
            if (movedMeta && hadMeta && previous.meta.isFile()) previous.meta.renameTo(active.meta);
            throw new Exception("could not rotate active database");
        }
        if (!temporary.data.renameTo(active.data) || !temporary.meta.renameTo(active.meta)) {
            deleteFile(active.data);
            deleteFile(active.meta);
            if (previous.data.isFile()) previous.data.renameTo(active.data);
            if (previous.meta.isFile()) previous.meta.renameTo(active.meta);
            throw new Exception("could not activate database");
        }
    }

    private static HttpURLConnection openSameOrigin(URL origin, URL first, int redirects,
                                                    String ifNoneMatch)
            throws Exception {
        URL current = first;
        for (int i = 0; i <= redirects; i++) {
            requireSameOrigin(origin, current);
            HttpURLConnection connection = (HttpURLConnection) current.openConnection();
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept-Encoding", "identity");
            if (ifNoneMatch != null && !ifNoneMatch.isEmpty()) {
                connection.setRequestProperty("If-None-Match", ifNoneMatch);
            }
            DiagnosticsLogger.networkStart("road-data", connection);
            int code = connection.getResponseCode();
            if (code != 301 && code != 302 && code != 303 && code != 307 && code != 308) {
                return connection;
            }
            DiagnosticsLogger.networkEnd("road-redirect", connection, code, 0L, null);
            String location = connection.getHeaderField("Location");
            connection.disconnect();
            if (location == null || location.isEmpty()) throw new Exception("redirect without location");
            current = new URL(current, location);
        }
        throw new Exception("too many redirects");
    }

    private static void requireSameOrigin(URL origin, URL target) throws Exception {
        int originPort = origin.getPort() >= 0 ? origin.getPort() : origin.getDefaultPort();
        int targetPort = target.getPort() >= 0 ? target.getPort() : target.getDefaultPort();
        if (!origin.getProtocol().equalsIgnoreCase(target.getProtocol())
                || !origin.getHost().equalsIgnoreCase(target.getHost())
                || originPort != targetPort) {
            throw new Exception("cross-origin URL rejected");
        }
        String protocol = target.getProtocol().toLowerCase(Locale.ROOT);
        if (!"https".equals(protocol) && !"http".equals(protocol)) {
            throw new Exception("unsupported URL scheme");
        }
    }

    private static byte[] readBounded(HttpURLConnection connection, int limit, long expected)
            throws Exception {
        long declared = connection.getContentLengthLong();
        if (declared > limit || (expected >= 0 && declared >= 0 && declared != expected)) {
            throw new Exception("invalid Content-Length");
        }
        InputStream input = connection.getInputStream();
        try {
            return readBounded(input, limit, expected);
        } finally {
            input.close();
        }
    }

    private static byte[] readFile(File file, int limit) throws Exception {
        if (file.length() < 0 || file.length() > limit) throw new Exception("file too large");
        InputStream input = new FileInputStream(file);
        try {
            return readBounded(input, limit, file.length());
        } finally {
            input.close();
        }
    }

    private static byte[] readBounded(InputStream input, int limit, long expected) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream(
                expected > 0 && expected <= limit ? (int) expected : 4096);
        byte[] buffer = new byte[16 * 1024];
        int count;
        int total = 0;
        while ((count = input.read(buffer)) != -1) {
            if (count > limit - total) throw new Exception("response too large");
            output.write(buffer, 0, count);
            total += count;
        }
        if (expected >= 0 && total != expected) throw new Exception("response truncated");
        return output.toByteArray();
    }

    private static void writeSynced(File file, byte[] bytes) throws Exception {
        FileOutputStream output = new FileOutputStream(file);
        try {
            output.write(bytes);
            output.flush();
            output.getFD().sync();
        } finally {
            output.close();
        }
    }

    private static FilePair pair(Context app, String prefix) {
        File directory = new File(app.getFilesDir(), "road_notices");
        if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) {
            Log.w(TAG, "cannot create road database directory");
        }
        return new FilePair(new File(directory, prefix + ".pb"),
                new File(directory, prefix + ".json"));
    }

    private static void deleteFile(File file) {
        if (file.exists() && !file.delete()) Log.w(TAG, "could not delete " + file.getName());
    }

    private static String hex(byte[] bytes) {
        StringBuilder builder = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) builder.append(String.format(Locale.US, "%02x", value & 0xFF));
        return builder.toString();
    }

    private static String safeMessage(Throwable error) {
        if (error == null) return "unknown";
        String message = error.getMessage();
        return error.getClass().getSimpleName() + (message == null ? "" : ": " + message);
    }

    private static final class FilePair {
        final File data;
        final File meta;
        FilePair(File data, File meta) { this.data = data; this.meta = meta; }
    }

    private static final class Manifest {
        final int schemaVersion;
        final long datasetVersion;
        final long targetMapBuildId;
        final String fileUrl;
        final long downloadSize;
        final String downloadSha256;
        final long plaintextSize;
        final String plaintextSha256;
        final byte[] signature;
        final DatasetEnvelope envelope;

        Manifest(int schemaVersion, long datasetVersion, long targetMapBuildId, String fileUrl,
                 long downloadSize, String downloadSha256, long plaintextSize,
                 String plaintextSha256, byte[] signature, DatasetEnvelope envelope) {
            this.schemaVersion = schemaVersion;
            this.datasetVersion = datasetVersion;
            this.targetMapBuildId = targetMapBuildId;
            this.fileUrl = fileUrl;
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
                        bytes, DatasetEnvelope.ROAD, MAX_DATABASE_BYTES);
                if (encrypted.payloadSchemaVersion != RoadNoticeDatabase.SUPPORTED_SCHEMA) {
                    throw new Exception("unsupported road database schema");
                }
                String expectedUrl = "/api/v1/road-notices/files/" + encrypted.version
                        + "/road_notices.pb";
                if (!expectedUrl.equals(encrypted.artifactUrl)) {
                    throw new Exception("invalid road artifact URL");
                }
                long dataset = parsePositiveLong(encrypted.version, "datasetVersion");
                return new Manifest(
                        encrypted.payloadSchemaVersion,
                        dataset,
                        encrypted.targetMapBuildId,
                        encrypted.artifactUrl,
                        encrypted.encryptedSize,
                        encrypted.encryptedSha256,
                        encrypted.plaintextSize,
                        encrypted.plaintextSha256,
                        encrypted.signature,
                        encrypted);
            }
            int schema = root.getInt("schemaVersion");
            if (schema != RoadNoticeDatabase.SUPPORTED_SCHEMA) {
                throw new Exception("unsupported manifest schema");
            }
            long dataset = parsePositiveLong(root.getString("datasetVersion"), "datasetVersion");
            long mapBuild = parsePositiveLong(root.getString("targetWazeMapBuildId"),
                    "targetWazeMapBuildId");
            JSONObject file = root.getJSONObject("file");
            String algorithm = file.getString("signatureAlgorithm");
            if (!"Ed25519".equals(algorithm)) throw new Exception("signature algorithm mismatch");
            long size = file.getLong("size");
            if (size <= 0 || size > MAX_DATABASE_BYTES) throw new Exception("invalid database size");
            String sha256 = file.getString("sha256");
            if (!sha256.matches("(?i)[0-9a-f]{64}")) throw new Exception("invalid SHA-256");
            byte[] signature = Base64.decode(file.getString("signature"), Base64.DEFAULT);
            if (signature.length != 64) throw new Exception("invalid Ed25519 signature length");
            String url = file.getString("url");
            if (url.isEmpty()) throw new Exception("empty database URL");
            return new Manifest(schema, dataset, mapBuild, url, size, sha256,
                    size, sha256, signature, null);
        }

        void verifyPlaintext(byte[] bytes) throws Exception {
            if (bytes.length != plaintextSize
                    || !DatasetEnvelope.sha256(bytes).equalsIgnoreCase(plaintextSha256)
                    || !RoadNoticeCrypto.verify(bytes, signature)) {
                throw new SecurityException("road database authentication rejected");
            }
        }

        void assertMatches(RoadNoticeDatabase parsed) throws Exception {
            if (parsed.schemaVersion != schemaVersion
                    || parsed.datasetVersion != datasetVersion
                    || parsed.targetMapBuildId != targetMapBuildId) {
                throw new Exception("manifest/database metadata mismatch");
            }
        }

        private static long parsePositiveLong(String value, String name) throws Exception {
            try {
                long parsed = Long.parseLong(value);
                if (parsed <= 0) throw new NumberFormatException();
                return parsed;
            } catch (NumberFormatException error) {
                throw new Exception("invalid " + name);
            }
        }
    }
}
