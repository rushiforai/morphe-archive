package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.Utils;

/**
 * Sends queued problem reports and deletes sent ones, in the main process while the app runs (no
 * background service). One request at a time on one thread. A report is tried right after Send, at
 * app start, when a network becomes available, and on a backoff timer: 1, 5 and 15 minutes, then
 * every hour; a report queued for 7 days is dropped. The server's answers follow its API, version 1.
 */
final class ReportUploader {
    private static final int CONNECT_TIMEOUT_MS = 10000, READ_TIMEOUT_MS = 20000, MAX_RESPONSE_BYTES = 64 * 1024;
    private static final long[] BACKOFF_S = {60, 300, 900, 3600};
    private static final long MIN_RATE_LIMIT_S = 60, MIN_STORAGE_FULL_S = 3600;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static ScheduledExecutorService worker;
    private static ScheduledFuture<?> timer;
    private static Context context;
    private static Runnable listener;

    private ReportUploader() {
    }

    /** At app start in the main process, with the application context. */
    static synchronized void start(Context appContext) {
        if (context != null || !ReportPatch.configured()) return;
        context = appContext;
        worker = Executors.newSingleThreadScheduledExecutor(runnable -> {
            Thread thread = new Thread(runnable, ReportPatch.TAG);
            thread.setDaemon(true);
            return thread;
        });
        try {
            ConnectivityManager connectivity = (ConnectivityManager) appContext.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (connectivity != null) {
                connectivity.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback() {
                    @Override
                    public void onAvailable(Network network) {
                        kick();
                    }
                });
            }
        } catch (RuntimeException error) {
            ReportLog.w(ReportPatch.TAG, "no network callback, reports are tried on the timer", error);
        }
        worker.schedule(ReportUploader::attempt, 5, TimeUnit.SECONDS);
    }

    /** The open report screen's refresh, run on the main thread after each change; null to stop. */
    static synchronized void setListener(Runnable refresh) {
        listener = refresh;
    }

    /** Tries the queued reports now. */
    static synchronized void kick() {
        if (worker != null) worker.execute(ReportUploader::attempt);
    }

    interface DeleteResult {
        /** On the main thread: true when the report is gone from the server and the list. */
        void done(boolean deleted, String error);
    }

    /** Deletes a sent report on the server, or a queued, failed or expired one from the list. */
    static synchronized void delete(Context appContext, ReportStore.Entry entry, DeleteResult result) {
        if (!ReportStore.SENT.equals(entry.state) || worker == null) {
            ReportStore.remove(appContext, entry.key);
            main.post(() -> result.done(true, null));
            notifyListener();
            return;
        }
        worker.execute(() -> {
            String error = deleteSent(entry);
            if (error == null) ReportStore.remove(context, entry.key);
            main.post(() -> result.done(error == null, error));
            notifyListener();
        });
    }

    // Worker thread only.
    private static void attempt() {
        try {
            long now = System.currentTimeMillis(), wake = Long.MAX_VALUE;
            List<ReportStore.Entry> entries = ReportStore.entries(context);
            for (ReportStore.Entry entry : entries) {
                if (!ReportStore.QUEUED.equals(entry.state)) continue;
                if (now - entry.created > ReportStore.QUEUE_MAX_AGE_MS) {
                    entry.state = ReportStore.EXPIRED;
                    ReportStore.update(context, entry);
                    ReportLog.i(ReportPatch.TAG, "queued report expired unsent");
                    continue;
                }
                if (entry.next <= now) {
                    send(entry);
                    ReportStore.update(context, entry);
                    notifyListener();
                }
                if (ReportStore.QUEUED.equals(entry.state)) wake = Math.min(wake, entry.next);
            }
            schedule(wake);
        } catch (Throwable error) {
            ReportLog.w(ReportPatch.TAG, "report upload failed", error);
            schedule(System.currentTimeMillis() + BACKOFF_S[BACKOFF_S.length - 1] * 1000);
        }
        notifyListener();
    }

    private static synchronized void schedule(long at) {
        if (timer != null) timer.cancel(false);
        timer = null;
        if (at == Long.MAX_VALUE) return;
        long delay = Math.max(1000, at - System.currentTimeMillis());
        timer = worker.schedule(ReportUploader::attempt, delay, TimeUnit.MILLISECONDS);
    }

    // One POST; the entry's new state is set here and stored by the caller.
    private static void send(ReportStore.Entry entry) {
        byte[] body = ReportStore.body(context, entry.key);
        if (body == null) {
            fail(entry, "missing_body");
            return;
        }
        entry.attempts++;
        HttpURLConnection connection = null;
        try {
            connection = open(ReportPatch.URL + "/v1/reports", "POST");
            connection.setRequestProperty("Idempotency-Key", entry.key);
            connection.setDoOutput(true);
            connection.setFixedLengthStreamingMode(body.length);
            try (OutputStream out = connection.getOutputStream()) {
                out.write(body);
            }
            int status = connection.getResponseCode();
            JSONObject answer = json(connection, status);
            String error = answer.optString("error", "http_" + status);
            if (status == 201 || status == 200) {
                entry.state = ReportStore.SENT;
                entry.id = answer.optString("id", null);
                entry.deleteToken = answer.optString("delete_token", null);
                entry.receivedAt = answer.optString("received_at", null);
                entry.expiresAt = answer.optString("expires_at", null);
                entry.error = null;
                ReportLog.i(ReportPatch.TAG, "report sent: " + entry.id + " (" + body.length + " bytes, attempt " + entry.attempts + ")");
            } else if (status == 413) {
                int limit = answer.optInt("max_bytes", 0);
                ReportStore.setMaxBytes(context, limit);
                byte[] smaller = entry.shrunk || limit <= 0 ? null : ReportBuilder.shrink(body, limit);
                if (smaller == null || !ReportStore.replaceBody(context, entry, smaller)) {
                    fail(entry, "too_large");
                } else {
                    // Only log lines or older crashes were dropped, so the user's consent still covers it.
                    entry.shrunk = true;
                    entry.next = System.currentTimeMillis();
                    entry.error = "too_large";
                    ReportLog.i(ReportPatch.TAG, "report cut to " + smaller.length + " of " + limit + " bytes, retrying");
                }
            } else if (status == 429 || status == 503 && "storage_full".equals(error)) {
                long minimum = status == 429 ? MIN_RATE_LIMIT_S : MIN_STORAGE_FULL_S;
                long seconds = Math.max(minimum, retryAfter(connection, answer));
                retry(entry, error, seconds);
            } else if (status == 400 || status == 401 || status == 403 || status == 410 || status == 411 || status == 415) {
                // A bug or a key or schema this server no longer accepts: sending again cannot help.
                fail(entry, status == 403 ? "forbidden" : error);
            } else {
                retry(entry, error, backoff(entry));
            }
        } catch (IOException | RuntimeException error) {
            retry(entry, "network", backoff(entry));
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static void fail(ReportStore.Entry entry, String error) {
        entry.state = ReportStore.FAILED;
        entry.error = error;
        ReportLog.w(ReportPatch.TAG, "report not sent: " + error);
    }

    private static void retry(ReportStore.Entry entry, String error, long seconds) {
        entry.error = error;
        entry.next = System.currentTimeMillis() + seconds * 1000;
        ReportLog.i(ReportPatch.TAG, "report queued (" + error + "), next try in " + seconds + " s");
    }

    private static long backoff(ReportStore.Entry entry) {
        return BACKOFF_S[Math.min(Math.max(entry.attempts, 1), BACKOFF_S.length) - 1];
    }

    // Null when the report is gone, else the error.
    private static String deleteSent(ReportStore.Entry entry) {
        if (entry.id == null || entry.deleteToken == null) return null;
        HttpURLConnection connection = null;
        try {
            connection = open(ReportPatch.URL + "/v1/reports/" + entry.id, "DELETE");
            connection.setRequestProperty("X-MapsCar-Delete-Token", entry.deleteToken);
            int status = connection.getResponseCode();
            // 404: unknown, already expired or deleted, or a wrong token; the server gives the same answer.
            if (status == 204 || status == 404) {
                ReportLog.i(ReportPatch.TAG, "report " + entry.id + " deleted (" + status + ")");
                return null;
            }
            String error = json(connection, status).optString("error", "http_" + status);
            ReportLog.w(ReportPatch.TAG, "report " + entry.id + " not deleted: " + error);
            return error;
        } catch (IOException | RuntimeException error) {
            ReportLog.w(ReportPatch.TAG, "report " + entry.id + " not deleted", error);
            return "network";
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static HttpURLConnection open(String url, String method) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod(method);
        connection.setInstanceFollowRedirects(false);
        connection.setUseCaches(false);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        // The server's framework refuses a POST or DELETE without a JSON content type, even without a body.
        connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("X-MapsCar-Key", ReportPatch.KEY);
        connection.setRequestProperty("User-Agent", "MapsCar/" + Utils.getPatchesReleaseVersion()
                + " (Android " + Build.VERSION.RELEASE + "; SDK " + Build.VERSION.SDK_INT + ")");
        return connection;
    }

    private static JSONObject json(HttpURLConnection connection, int status) {
        try (InputStream in = status >= 400 ? connection.getErrorStream() : connection.getInputStream()) {
            if (in == null) return new JSONObject();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) > 0 && out.size() < MAX_RESPONSE_BYTES) out.write(buffer, 0, read);
            return new JSONObject(new String(out.toByteArray(), StandardCharsets.UTF_8));
        } catch (IOException | JSONException | RuntimeException error) {
            return new JSONObject();
        }
    }

    private static long retryAfter(HttpURLConnection connection, JSONObject answer) {
        try {
            String header = connection.getHeaderField("Retry-After");
            if (header != null) return Long.parseLong(header.trim());
        } catch (NumberFormatException ignored) {
            // The body's value.
        }
        return answer.optLong("retry_after", 0);
    }

    private static void notifyListener() {
        Runnable refresh;
        synchronized (ReportUploader.class) {
            refresh = listener;
        }
        if (refresh != null) main.post(refresh);
    }
}
