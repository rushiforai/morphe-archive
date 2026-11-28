package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/** Independent V3 download, verification and local rollback lifecycle. */
final class ContextAlertClient {
    private static final String PREFS = "waze_context_alert_client";
    private static final String ETAG = "manifest_etag";
    private static final String LAST_CHECK = "last_check_ms";
    private static final String LAST_RESULT = "last_result";
    private static final String SERVER_VERSION = "server_version";
    private static final String MANIFEST_PATH = "/api/client/comments/v3/manifest";
    private static final String ARTIFACT_PATH = "/api/client/comments/v3/download";
    private static final int MAX_BYTES = 16 * 1024 * 1024;
    private static final long POLL_MS = 6L * 60L * 60L * 1000L;
    private static final ScheduledExecutorService NETWORK = Executors.newSingleThreadScheduledExecutor();
    private static final Object LOCK = new Object();
    private static volatile boolean booted;
    private static volatile boolean loaded;
    private static volatile ContextAlertDatabase database;

    private ContextAlertClient() { }

    static void start(Context context) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null || booted) return;
        synchronized (ContextAlertClient.class) { if (booted) return; booted = true; }
        NETWORK.execute(new Runnable() {
            @Override public void run() {
                loadLocal(app);
                NETWORK.scheduleWithFixedDelay(new Runnable() {
                    @Override public void run() { poll(app, false); }
                }, 0L, POLL_MS, TimeUnit.MILLISECONDS);
            }
        });
    }

    static ContextAlertDatabase get(Context context) {
        Context app = context == null ? null : context.getApplicationContext();
        if (!loaded && app != null) loadLocal(app);
        return database;
    }

    static void checkNow(Context context, final Runnable finished) {
        final Context app = context == null ? null : context.getApplicationContext();
        if (app == null) { if (finished != null) finished.run(); return; }
        NETWORK.execute(new Runnable() {
            @Override public void run() { poll(app, true); if (finished != null) finished.run(); }
        });
    }

    private static void loadLocal(Context app) {
        synchronized (LOCK) {
            if (loaded) return;
            ContextAlertDatabase current = loadVerified(pair(app, "active"));
            if (current == null) current = loadVerified(pair(app, "previous"));
            database = current;
            loaded = true;
        }
    }

    private static void poll(Context app, boolean force) {
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        long now = System.currentTimeMillis();
        if (!force && now - prefs.getLong(LAST_CHECK, 0L) < POLL_MS) return;
        prefs.edit().putLong(LAST_CHECK, now).apply();
        java.util.ArrayList<String> failures = new java.util.ArrayList<String>();
        for (String base : WazeModEndpoints.defaults()) {
            try { pollFrom(app, prefs, base); return; }
            catch (Throwable error) { failures.add(WazeModEndpoints.failure(base, reason(error))); }
        }
        prefs.edit().putString(LAST_RESULT, "ERROR: " + WazeModEndpoints.joinFailures(failures)).apply();
    }

    private static void pollFrom(Context app, SharedPreferences prefs, String base) throws Exception {
        URL origin = new URL(base);
        HttpURLConnection manifestConnection = open(new URL(origin, MANIFEST_PATH));
        try {
            String etag = prefs.getString(ETAG, "");
            if (etag.length() > 0) manifestConnection.setRequestProperty("If-None-Match", etag);
            int status = manifestConnection.getResponseCode();
            if (status == 304 || status == 204) {
                prefs.edit().putString(LAST_RESULT, status == 304 ? "UP_TO_DATE" : "NO_DATA").apply();
                return;
            }
            if (status != 200) throw new IllegalStateException("manifest HTTP " + status);
            byte[] manifestBytes = readLimited(manifestConnection, 64 * 1024);
            String nextEtag = manifestConnection.getHeaderField("ETag");
            Manifest manifest = Manifest.parse(manifestBytes);
            prefs.edit().putString(SERVER_VERSION, manifest.version)
                    .putString(LAST_RESULT, "DOWNLOADING").apply();
            String path = manifest.artifactUrl + (manifest.artifactUrl.indexOf('?') >= 0 ? "&" : "?")
                    + "version=" + manifest.version;
            URL fileUrl = new URL(origin, path);
            if (!origin.getProtocol().equalsIgnoreCase(fileUrl.getProtocol())
                    || !origin.getHost().equalsIgnoreCase(fileUrl.getHost()))
                throw new IllegalStateException("cross-origin context artifact");
            HttpURLConnection fileConnection = open(fileUrl);
            try {
                if (fileConnection.getResponseCode() != 200) throw new IllegalStateException("artifact HTTP");
                byte[] encrypted = readLimited(fileConnection, MAX_BYTES + 64 * 1024);
                byte[] plaintext = manifest.envelope.decryptAndVerify(app, encrypted, MAX_BYTES);
                ContextAlertDatabase parsed = ContextAlertDatabase.parse(plaintext);
                if (!manifest.version.equals(parsed.datasetVersion)) throw new IllegalStateException("version mismatch");
                install(app, plaintext, manifestBytes);
                database = parsed;
            } finally { fileConnection.disconnect(); }
            if (nextEtag != null) prefs.edit().putString(ETAG, nextEtag).apply();
            prefs.edit().putString(LAST_RESULT, "UPDATED").apply();
        } finally { manifestConnection.disconnect(); }
    }

    private static void install(Context app, byte[] bytes, byte[] manifest) throws Exception {
        synchronized (LOCK) {
            FilePair active = pair(app, "active"), previous = pair(app, "previous");
            if (active.data.isFile() && active.manifest.isFile()) { write(previous.data, read(active.data)); write(previous.manifest, read(active.manifest)); }
            File data = new File(app.getFilesDir(), "wme_context_v3_active.pb.tmp");
            File meta = new File(app.getFilesDir(), "wme_context_v3_active.json.tmp");
            write(data, bytes); write(meta, manifest); replace(data, active.data); replace(meta, active.manifest);
        }
    }

    private static ContextAlertDatabase loadVerified(FilePair pair) {
        try { if (!pair.data.isFile() || !pair.manifest.isFile()) return null; Manifest m = Manifest.parse(read(pair.manifest)); byte[] bytes = read(pair.data); m.envelope.verifyStoredPlaintext(bytes); return ContextAlertDatabase.parse(bytes); }
        catch (Throwable ignored) { return null; }
    }

    private static HttpURLConnection open(URL url) throws Exception { HttpURLConnection c = (HttpURLConnection) url.openConnection(); c.setConnectTimeout(10000); c.setReadTimeout(30000); c.setInstanceFollowRedirects(false); return c; }
    private static byte[] readLimited(HttpURLConnection c, int limit) throws Exception { return read(c.getInputStream(), limit); }
    private static byte[] read(File f) throws Exception { return read(new FileInputStream(f), MAX_BYTES); }
    private static byte[] read(InputStream in, int limit) throws Exception { try { ByteArrayOutputStream out = new ByteArrayOutputStream(); byte[] b = new byte[8192]; int total = 0, n; while ((n = in.read(b)) >= 0) { total += n; if (total > limit) throw new Exception("file too large"); out.write(b, 0, n); } return out.toByteArray(); } finally { in.close(); } }
    private static void write(File f, byte[] bytes) throws Exception { FileOutputStream out = new FileOutputStream(f); try { out.write(bytes); out.getFD().sync(); } finally { out.close(); } }
    private static void replace(File source, File target) throws Exception { if (target.exists() && !target.delete()) throw new Exception("delete failed"); if (!source.renameTo(target)) throw new Exception("rename failed"); }
    private static FilePair pair(Context app, String name) { return new FilePair(new File(app.getFilesDir(), "wme_context_v3_" + name + ".pb"), new File(app.getFilesDir(), "wme_context_v3_" + name + ".json")); }
    private static String reason(Throwable error) { return error == null ? "unknown" : error.getClass().getSimpleName(); }

    private static final class FilePair { final File data, manifest; FilePair(File d, File m) { data = d; manifest = m; } }
    private static final class Manifest {
        final String version, artifactUrl; final DatasetEnvelope envelope;
        Manifest(String v, String u, DatasetEnvelope e) { version = v; artifactUrl = u; envelope = e; }
        static Manifest parse(byte[] bytes) throws Exception { DatasetEnvelope e = DatasetEnvelope.parse(bytes, DatasetEnvelope.CONTEXT, MAX_BYTES); if (e.payloadSchemaVersion != 3 || e.spatialZoom != 14 || !"/api/client/comments/v3/download".equals(e.artifactUrl)) throw new Exception("invalid context manifest"); return new Manifest(e.version, e.artifactUrl, e); }
    }
}
