package io.github.emotionbug.patches.runtime;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.PowerManager;
import android.os.StatFs;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;
import java.net.Authenticator;
import java.net.CookieHandler;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.security.MessageDigest;
import java.util.UUID;

/** Explicit, one-shot public model download. This service runs in its own models process. */
public final class SummaryDownloadService extends Service {
    static final String DOWNLOAD = "io.github.emotionbug.patches.DOWNLOAD_SUMMARY_MODEL";
    static final String CANCEL = "io.github.emotionbug.patches.CANCEL_SUMMARY_MODEL_DOWNLOAD";
    static final String MODEL = "model_role", TOKEN = "download_token";
    private static final String ACTIVE_ROLE = "active_model_download", ACTIVE_TOKEN = "active_model_download_token";
    private static final String CHANNEL = "ebpatcher_summary_model";
    private static final int NOTIFICATION = 0x45424d44;
    private final Handler main = new Handler(Looper.getMainLooper());
    private volatile boolean cancelled;
    private volatile String cancellationReason = "Download cancelled. Use Download or Update to start again.";
    private Thread worker;
    private SummaryModel.Role activeRole;
    private String activeToken;
    private String activeHash;

    @Override public IBinder onBind(Intent intent) { return null; }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null) { if (worker == null) stopSelf(startId); return START_NOT_STICKY; }
        SummaryModel.Role selected = SummaryModel.Role.from(intent.getStringExtra(MODEL));
        if (CANCEL.equals(intent.getAction())) {
            if (worker != null && selected == activeRole && activeToken.equals(intent.getStringExtra(TOKEN))) {
                cancelled = true;
                worker.interrupt();
            } else if (worker == null) stopSelf(startId);
            return START_NOT_STICKY;
        }
        if (!DOWNLOAD.equals(intent.getAction()) || selected == null) {
            if (worker == null) stopSelf(startId);
            return START_NOT_STICKY;
        }
        if (worker != null) {
            android.widget.Toast.makeText(this, "One model at a time. Wait for " + activeRole.label
                    + " or cancel its download first.", android.widget.Toast.LENGTH_LONG).show();
            return START_NOT_STICKY;
        }
        activeRole = selected;
        activeToken = UUID.randomUUID().toString();
        activeHash = null;
        cancelled = false;
        cancellationReason = "Download cancelled. Use Download or Update to start again.";
        try {
            NotificationManager manager = getSystemService(NotificationManager.class);
            if (manager == null) throw new IllegalStateException("Android notifications are unavailable");
            manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Local summary model downloads", NotificationManager.IMPORTANCE_LOW));
            startForeground(NOTIFICATION, notification("Preparing model download", 0, 0), ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
        } catch (RuntimeException error) {
            // Persist on a background thread even if Android refuses foreground service startup.
            worker = new Thread(() -> {
                try { progress("failed", 0, "Android could not start the download: " + message(error)); }
                finally { main.post(() -> { worker = null; stopSelf(); }); }
            }, "EBPatcher-model-start-error");
            worker.start();
            return START_NOT_STICKY;
        }
        worker = new Thread(this::download, "EBPatcher-model-download");
        worker.start();
        return START_NOT_STICKY;
    }

    private Notification notification(String text, long bytes, long size) {
        PendingIntent settings = PendingIntent.getActivity(this, 0,
                new Intent(this, SummarySettingsActivity.class), PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        PendingIntent cancel = PendingIntent.getService(this, activeRole.ordinal() + 1,
                new Intent(this, SummaryDownloadService.class).setAction(CANCEL).putExtra(MODEL, activeRole.key)
                        .putExtra(TOKEN, activeToken), PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        return new Notification.Builder(this, CHANNEL).setSmallIcon(android.R.drawable.stat_sys_download)
                .setContentTitle("EBPatcher · " + activeRole.label).setContentText(text).setContentIntent(settings)
                .setOngoing(true).setOnlyAlertOnce(true).setProgress(100, size > 0 ? (int) (bytes * 100 / size) : 0, size <= 0)
                .addAction(new Notification.Action.Builder(null, "Cancel", cancel).build()).build();
    }

    private void download() {
        File part = null;
        long received = 0;
        boolean published = false;
        PowerManager.WakeLock wake = null;
        HttpURLConnection connection = null;
        DownloadLock downloadLock = null;
        try {
            downloadLock = DownloadLock.acquire(this);
            SummaryStore.get(this).setSetting(ACTIVE_ROLE, activeRole.key);
            SummaryStore.get(this).setSetting(ACTIVE_TOKEN, activeToken);
            if (!android.os.Process.is64Bit()) throw new IOException("This model requires a 64-bit application process");
            SummaryModel model = SummaryModel.get(this, activeRole);
            activeHash = model.sha256;
            if (model.ready(this)) { progress("ready", model.size, "Model is already verified and ready."); return; }
            checkCancelled();
            File directory = model.directory(this);
            if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Unable to create private model storage");
            part = model.part(this);
            if (part.exists() && !part.delete()) throw new IOException("Unable to remove the interrupted download");
            if (new StatFs(directory.getPath()).getAvailableBytes() < model.size + 64L * 1024 * 1024)
                throw new IOException("Not enough free space. Free at least " + model.size + " bytes plus 64 MiB and try again.");
            progress("downloading", 0, "Downloading public model over HTTPS. No call data is sent.");
            PowerManager power = getSystemService(PowerManager.class);
            if (power == null) throw new IOException("Android power management is unavailable");
            wake = power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, getPackageName() + ":summary-model");
            wake.acquire(6L * 60 * 60 * 1000);
            // This dedicated process must never attach ambient app cookies or authentication.
            CookieHandler.setDefault(null);
            Authenticator.setDefault(null);
            connection = connect(model.url, model.size);
            MessageDigest digest = SummaryModel.digest();
            byte[] buffer = new byte[65536];
            long lastProgress = 0;
            try (InputStream input = connection.getInputStream(); FileOutputStream output = new FileOutputStream(part)) {
                int count;
                while ((count = input.read(buffer)) != -1) {
                    checkCancelled();
                    if (count > model.size - received) throw new IOException("Model size mismatch; download rejected");
                    output.write(buffer, 0, count);
                    digest.update(buffer, 0, count);
                    received += count;
                    long now = android.os.SystemClock.elapsedRealtime();
                    if (now - lastProgress >= 1000) {
                        progress("downloading", received, "Downloading; SHA-256 verification is required before use.");
                        getSystemService(NotificationManager.class).notify(NOTIFICATION, notification("Downloading model", received, model.size));
                        lastProgress = now;
                    }
                }
                output.getFD().sync();
            }
            checkCancelled();
            progress("verifying", received, "Verifying exact size and SHA-256 before atomic installation.");
            if (received != model.size) throw new IOException("Model size mismatch; download rejected");
            String receivedHash = SummaryModel.hex(digest.digest());
            if (!model.sha256.equals(receivedHash)) throw new IOException("Model SHA-256 mismatch; download rejected");
            connection.disconnect();
            connection = null;
            progress("waiting", received, "Download verified. Waiting to install until local processing finishes; no additional download is needed.");
            getSystemService(NotificationManager.class).notify(NOTIFICATION,
                    notification("Download verified; waiting for local processing before installation", received, model.size));
            try (SummaryLock ignoredSummary = SummaryLock.acquire(this, () -> cancelled)) {
                checkCancelled();
                model.publish(this, SummaryStore.get(this), received, receivedHash);
                published = true;
                String status = "Exact size and SHA-256 verified. Model is ready for on-device use.";
                try { model.removeObsolete(this); }
                catch (IOException | RuntimeException cleanup) {
                    status += " Previous model cleanup needs attention: " + message(cleanup);
                }
                progress("ready", received, status);
            }
            try { SummaryScheduler.schedule(this); }
            catch (RuntimeException error) { progress("ready", received, "Model verified. Unable to schedule pending summaries: " + message(error)); }
        } catch (Exception error) {
            progress(published ? "ready" : cancelled ? "cancelled" : "failed", received,
                    published ? "Model verified; " + message(error) : cancelled ? cancellationReason : message(error));
        } finally {
            if (connection != null) connection.disconnect();
            if (part != null && part.exists() && !part.delete()) {
                try { progress(published ? "ready" : "failed", received, "Unable to remove incomplete model data. Use Delete model to remove extension model files."); }
                catch (RuntimeException ignored) { /* Android may be shutting down this process. */ }
            }
            if (wake != null && wake.isHeld()) wake.release();
            if (downloadLock != null) {
                try { downloadLock.close(); }
                catch (IOException error) { android.util.Log.w("EBPatcherSummary", "Unable to release model download ownership", error); }
            }
            main.post(() -> { worker = null; stopForeground(STOP_FOREGROUND_REMOVE); stopSelf(); });
        }
    }

    private HttpURLConnection connect(String location, long expectedSize) throws IOException {
        URL url = new URL(location);
        for (int redirects = 0; redirects <= 5; redirects++) {
            checkCancelled();
            if (!"https".equalsIgnoreCase(url.getProtocol()) || url.getUserInfo() != null)
                throw new IOException("Only HTTPS downloads without authentication are allowed");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(15000);
            connection.setUseCaches(false);
            connection.setRequestProperty("Accept-Encoding", "identity");
            connection.setRequestProperty("User-Agent", "EBPatcher-Local-Model-Download");
            try {
                int status = connection.getResponseCode();
                if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                    String next = connection.getHeaderField("Location");
                    if (next == null || redirects == 5) throw new IOException("Model download redirect limit or missing location");
                    url = new URL(url, next);
                    connection.disconnect();
                    continue;
                }
                if (status != HttpURLConnection.HTTP_OK) throw new IOException("Model download returned HTTP " + status + ". No automatic retry was attempted.");
                long length = connection.getContentLengthLong();
                if (length >= 0 && length != expectedSize) throw new IOException("Server model size differs from the pinned size");
                String encoding = connection.getHeaderField("Content-Encoding");
                if (encoding != null && !"identity".equalsIgnoreCase(encoding)) throw new IOException("Unexpected model content encoding");
                return connection;
            } catch (IOException | RuntimeException error) { connection.disconnect(); throw error; }
        }
        throw new IOException("Too many model download redirects");
    }

    private void checkCancelled() throws InterruptedIOException {
        if (cancelled || Thread.currentThread().isInterrupted()) throw new InterruptedIOException(cancellationReason);
    }
    private void progress(String state, long bytes, String message) {
        SummaryStore store = SummaryStore.get(this);
        if (activeHash == null) {
            try { activeHash = SummaryModel.get(this, activeRole).sha256; }
            catch (IOException unavailable) { return; }
        }
        store.setSetting(activeRole.setting(ModelDownloadProgress.KEY),
                new ModelDownloadProgress(activeHash, activeToken, state, bytes, activeRole.label + ": " + message).encode());
    }
    static String message(Throwable error) {
        return error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
    }

    static boolean active(Context context) throws IOException {
        try (DownloadLock ignored = DownloadLock.tryAcquire(context)) { return ignored == null; }
    }
    static SummaryModel.Role activeRole(Context context) {
        return SummaryModel.Role.from(SummaryStore.get(context).setting(ACTIVE_ROLE, ""));
    }
    static String activeToken(Context context) { return SummaryStore.get(context).setting(ACTIVE_TOKEN, ""); }
    static void deleteModel(Context context, SummaryModel.Role role) throws IOException {
        try (DownloadLock ignored = DownloadLock.acquire(context)) {
            SummaryScheduler.stop(context);
            try (SummaryLock ignoredSummary = SummaryLock.acquire(context)) {
                SummaryModel model = SummaryModel.get(context, role);
                SummaryStore store = SummaryStore.get(context);
                store.setSetting(role.verifiedKey, "");
                model.deleteFiles(context);
                store.setSetting(role.setting(ModelDownloadProgress.KEY),
                        new ModelDownloadProgress(model.sha256, "", "absent", 0,
                                role.label + " model deleted. Other models, local results and original ACall data were not changed.").encode());
            }
        }
        SummaryScheduler.schedule(context);
    }

    /** Separate from inference ownership; held throughout transfer and model deletion. */
    private static final class DownloadLock implements Closeable {
        private final RandomAccessFile file;
        private final FileLock lock;
        private DownloadLock(RandomAccessFile file, FileLock lock) { this.file = file; this.lock = lock; }
        static DownloadLock acquire(Context context) throws IOException {
            DownloadLock lease = tryAcquire(context);
            if (lease == null) throw new IOException("Model download is active. Cancel it and wait for it to stop before trying again.");
            return lease;
        }
        static DownloadLock tryAcquire(Context context) throws IOException {
            RandomAccessFile file = new RandomAccessFile(new File(context.getNoBackupFilesDir(), "ebpatcher-model-download.lock"), "rw");
            try {
                FileLock lock = file.getChannel().tryLock();
                if (lock != null) return new DownloadLock(file, lock);
            } catch (OverlappingFileLockException busy) {
                // An overlapping lock in this process is also an active download.
            } catch (IOException | RuntimeException error) { file.close(); throw error; }
            file.close();
            return null;
        }
        @Override public void close() throws IOException { try { lock.release(); } finally { file.close(); } }
    }

    @Override public void onTimeout(int startId, int fgsType) {
        cancellationReason = "Android stopped the download because its foreground time limit was reached. No automatic retry was attempted.";
        cancelled = true;
        if (worker != null) worker.interrupt();
        stopForeground(STOP_FOREGROUND_REMOVE);
        stopSelf();
    }
    @Override public void onDestroy() {
        cancelled = true;
        if (worker != null) worker.interrupt();
        super.onDestroy();
    }
}
