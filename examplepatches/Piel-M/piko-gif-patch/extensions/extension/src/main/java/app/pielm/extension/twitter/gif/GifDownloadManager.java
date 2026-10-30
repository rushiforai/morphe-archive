package app.pielm.extension.twitter.gif;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;

/**
 * Downloads Twitter/X GIF MP4 streams, converts them to real .gif files, publishes them in
 * {@code Pictures/<subfolder>} (MediaStore on Android 10+) and reports progress with a notification.
 */
public final class GifDownloadManager {
    private static final String TAG = "PikoGifPatch";
    private static final String CHANNEL_ID = "piko_gif_download_channel";
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36";
    private static final Pattern INVALID_FILENAME_CHAR = Pattern.compile("[\\\\/:*?\"<>|\\p{Cntrl}]");
    private static final Pattern TRAILING_DOT_OR_SPACE = Pattern.compile("[. ]+$");

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final AtomicInteger NOTIFICATION_IDS = new AtomicInteger(0x61F0000);

    private GifDownloadManager() {
    }

    public static void enqueueGifDownload(final String url, final String rawMediaName) {
        final Context context = resolveContext();
        if (context == null) {
            Log.e(TAG, "Cannot start GIF download: Context is null");
            return;
        }

        final String cleanBaseName = sanitizeFilename(stripVariantSuffix(rawMediaName));
        final String fileName = cleanBaseName.toLowerCase().endsWith(".gif") ? cleanBaseName : (cleanBaseName + ".gif");
        final String subFolder = resolveSubFolder();

        if (alreadyExists(context, subFolder, fileName)) {
            showToast(context, Strings.alreadyDownloaded(fileName));
            return;
        }

        showToast(context, Strings.downloadStarted());
        EXECUTOR.execute(() -> runDownloadAndConvert(context, url, fileName, subFolder));
    }

    private static void runDownloadAndConvert(Context context, String urlString, String fileName, String subFolder) {
        final NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        ensureChannel(nm);
        final boolean canNotify = nm != null && notificationsAllowed(nm);
        if (!canNotify) {
            Log.w(TAG, "Notifications are disabled for this app, falling back to toasts only");
        }

        final int notificationId = NOTIFICATION_IDS.incrementAndGet();
        final Notification.Builder builder = newBuilder(context)
                .setSmallIcon(android.R.drawable.stat_sys_download)
                .setContentTitle(Strings.downloading(fileName))
                .setContentText(Strings.stepDownloading())
                .setOnlyAlertOnce(true)
                .setOngoing(true)
                .setProgress(100, 0, true);
        notifySafe(nm, canNotify, notificationId, builder);

        File tempMp4 = null;
        File tempGif = null;
        try {
            File cacheDir = context.getCacheDir();
            tempMp4 = File.createTempFile("piko_gif_src_", ".mp4", cacheDir);
            tempGif = File.createTempFile("piko_gif_out_", ".gif", cacheDir);

            final long[] lastUpdate = {0L};
            downloadStreamToFile(urlString, tempMp4, (bytesRead, totalBytes) -> {
                if (totalBytes > 0) {
                    int pct = (int) Math.min(30, (bytesRead * 30L) / totalBytes);
                    builder.setProgress(100, pct, false);
                    notifySafe(nm, canNotify, notificationId, builder);
                }
            });
            Log.i(TAG, "Downloaded " + tempMp4.length() + " bytes from " + urlString);
            Mp4ToGifConverter.sanitizeMp4CttsBox(tempMp4);

            builder.setContentTitle(Strings.converting(fileName))
                    .setContentText(Strings.stepDecoding())
                    .setProgress(100, 30, false);
            notifySafe(nm, canNotify, notificationId, builder);

            Mp4ToGifConverter.convert(tempMp4, tempGif, (currentFrame, totalFrames) -> {
                long now = System.currentTimeMillis();
                if (now - lastUpdate[0] > 250 || currentFrame == totalFrames) {
                    lastUpdate[0] = now;
                    int pct = 30 + Math.min(65, (currentFrame * 65) / Math.max(1, totalFrames));
                    builder.setContentText(Strings.stepEncoding(currentFrame, totalFrames))
                            .setProgress(100, pct, false);
                    notifySafe(nm, canNotify, notificationId, builder);
                }
            });
            Log.i(TAG, "Converted GIF size: " + tempGif.length() + " bytes");

            Uri savedUri = publishGif(context, tempGif, subFolder, fileName);

            Notification.Builder done = newBuilder(context)
                    .setSmallIcon(android.R.drawable.stat_sys_download_done)
                    .setContentTitle(Strings.completed(fileName))
                    .setContentText("Pictures/" + subFolder + "/" + fileName)
                    .setAutoCancel(true);
            PendingIntent open = buildOpenIntent(context, savedUri, notificationId);
            if (open != null) done.setContentIntent(open);
            notifySafe(nm, canNotify, notificationId, done);

            showToast(context, Strings.completed(fileName));
        } catch (Throwable e) {
            Log.e(TAG, "GIF download/conversion failed for " + urlString, e);
            String reason = e.getMessage() != null ? e.getMessage() : e.getClass().getSimpleName();
            Notification.Builder failed = newBuilder(context)
                    .setSmallIcon(android.R.drawable.stat_notify_error)
                    .setContentTitle(Strings.failed(fileName))
                    .setContentText(reason)
                    .setStyle(new Notification.BigTextStyle().bigText(reason))
                    .setAutoCancel(true);
            notifySafe(nm, canNotify, notificationId, failed);
            showToast(context, Strings.failedToast(reason));
        } finally {
            if (tempMp4 != null && tempMp4.exists()) tempMp4.delete();
            if (tempGif != null && tempGif.exists()) tempGif.delete();
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Notifications
    // ---------------------------------------------------------------------------------------------

    private static void ensureChannel(NotificationManager nm) {
        if (nm == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return;
        if (nm.getNotificationChannel(CHANNEL_ID) != null) return;
        NotificationChannel channel = new NotificationChannel(
                CHANNEL_ID, Strings.channelName(), NotificationManager.IMPORTANCE_LOW);
        channel.setDescription(Strings.channelDescription());
        channel.setShowBadge(false);
        nm.createNotificationChannel(channel);
    }

    private static boolean notificationsAllowed(NotificationManager nm) {
        try {
            if (!nm.areNotificationsEnabled()) return false;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                NotificationChannel channel = nm.getNotificationChannel(CHANNEL_ID);
                return channel == null || channel.getImportance() != NotificationManager.IMPORTANCE_NONE;
            }
            return true;
        } catch (Throwable t) {
            return true;
        }
    }

    @SuppressWarnings("deprecation")
    private static Notification.Builder newBuilder(Context context) {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                ? new Notification.Builder(context, CHANNEL_ID)
                : new Notification.Builder(context);
    }

    private static void notifySafe(NotificationManager nm, boolean canNotify, int id, Notification.Builder builder) {
        if (nm == null || !canNotify) return;
        try {
            nm.notify(id, builder.build());
        } catch (Throwable t) {
            Log.w(TAG, "Unable to post notification", t);
        }
    }

    private static PendingIntent buildOpenIntent(Context context, Uri uri, int requestCode) {
        if (uri == null) return null;
        try {
            Intent view = new Intent(Intent.ACTION_VIEW)
                    .setDataAndType(uri, "image/gif")
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) flags |= PendingIntent.FLAG_IMMUTABLE;
            return PendingIntent.getActivity(context, requestCode, view, flags);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to build open intent", t);
            return null;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Storage
    // ---------------------------------------------------------------------------------------------

    private static Uri publishGif(Context context, File gif, String subFolder, String fileName) throws IOException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "image/gif");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/" + subFolder);
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);

            Uri collection = MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
            Uri item = resolver.insert(collection, values);
            if (item == null) {
                throw new IOException("MediaStore refused to create " + fileName);
            }
            try (InputStream in = new FileInputStream(gif);
                 OutputStream out = resolver.openOutputStream(item)) {
                if (out == null) throw new IOException("Cannot open MediaStore output stream");
                copy(in, out);
            } catch (IOException e) {
                resolver.delete(item, null, null);
                throw e;
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(item, values, null, null);
            return item;
        }

        File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), subFolder);
        if (!dir.exists() && !dir.mkdirs()) {
            throw new IOException("Cannot create " + dir.getAbsolutePath());
        }
        File target = new File(dir, fileName);
        try (InputStream in = new FileInputStream(gif);
             OutputStream out = new BufferedOutputStream(new FileOutputStream(target), 65536)) {
            copy(in, out);
        }
        final Uri[] scanned = {Uri.fromFile(target)};
        MediaScannerConnection.scanFile(context, new String[]{target.getAbsolutePath()},
                new String[]{"image/gif"}, null);
        return scanned[0];
    }

    private static boolean alreadyExists(Context context, String subFolder, String fileName) {
        File legacy = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),
                subFolder + "/" + fileName);
        try {
            if (legacy.exists() && legacy.length() > 0) return true;
        } catch (Throwable ignored) {
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return false;
        String relativePath = Environment.DIRECTORY_PICTURES + "/" + subFolder + "/";
        try (Cursor c = context.getContentResolver().query(
                MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY),
                new String[]{MediaStore.MediaColumns._ID},
                MediaStore.MediaColumns.DISPLAY_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + "=?",
                new String[]{fileName, relativePath},
                null)) {
            return c != null && c.moveToFirst();
        } catch (Throwable t) {
            return false;
        }
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buf = new byte[65536];
        int n;
        while ((n = in.read(buf)) != -1) {
            out.write(buf, 0, n);
        }
        out.flush();
    }

    // ---------------------------------------------------------------------------------------------
    // Network
    // ---------------------------------------------------------------------------------------------

    private interface DownloadProgress {
        void onProgress(long bytesRead, long totalBytes);
    }

    private static void downloadStreamToFile(String urlString, File destFile, DownloadProgress progress) throws IOException {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(urlString);
            conn = (HttpURLConnection) url.openConnection();
            conn.setInstanceFollowRedirects(true);
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            conn.setRequestProperty("User-Agent", USER_AGENT);
            conn.setRequestProperty("Accept", "video/mp4,video/*;q=0.9,*/*;q=0.8");
            conn.connect();

            int responseCode = conn.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                throw new IOException("HTTP " + responseCode + " while downloading GIF stream");
            }

            long contentLength = conn.getContentLength();
            long totalRead = 0;
            long lastNotify = 0;

            try (InputStream in = new BufferedInputStream(conn.getInputStream(), 32768);
                 OutputStream out = new BufferedOutputStream(new FileOutputStream(destFile), 32768)) {
                byte[] buf = new byte[16384];
                int n;
                while ((n = in.read(buf)) != -1) {
                    out.write(buf, 0, n);
                    totalRead += n;
                    long now = System.currentTimeMillis();
                    if (progress != null && now - lastNotify > 200) {
                        lastNotify = now;
                        progress.onProgress(totalRead, contentLength);
                    }
                }
                out.flush();
            }
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Misc
    // ---------------------------------------------------------------------------------------------

    private static String resolveSubFolder() {
        String subFolder = "Twitter";
        try {
            Class<?> settingsClass = Class.forName("app.morphe.extension.twitter.settings.Settings");
            Class<?> utilsClass = Class.forName("app.morphe.extension.twitter.Utils");
            Object vidSubfolderSetting = settingsClass.getField("VID_SUBFOLDER").get(null);
            Method getStringPref = utilsClass.getDeclaredMethod("getStringPref", vidSubfolderSetting.getClass());
            String configured = (String) getStringPref.invoke(null, vidSubfolderSetting);
            if (configured != null && !configured.trim().isEmpty()) {
                subFolder = configured.trim();
            }
        } catch (Throwable ignored) {
        }
        return subFolder;
    }

    static String stripVariantSuffix(String mediaName) {
        if (mediaName == null) return "twitter_gif";
        int gifIdx = mediaName.indexOf("_GIF • ");
        if (gifIdx > 0) {
            return mediaName.substring(0, gifIdx);
        }
        int mp4Idx = mediaName.indexOf("_MP4 • ");
        if (mp4Idx > 0) {
            return mediaName.substring(0, mp4Idx);
        }
        if (mediaName.endsWith("_GIF")) {
            return mediaName.substring(0, mediaName.length() - 4);
        }
        return mediaName;
    }

    private static String sanitizeFilename(String filename) {
        String cleaned = TRAILING_DOT_OR_SPACE.matcher(
                INVALID_FILENAME_CHAR.matcher(filename).replaceAll("_")
        ).replaceAll("");
        return cleaned.isEmpty() ? ("twitter_gif_" + System.currentTimeMillis()) : cleaned;
    }

    static Context resolveContext() {
        try {
            Class<?> morpheUtils = Class.forName("app.morphe.extension.shared.Utils");
            Method getContext = morpheUtils.getDeclaredMethod("getContext");
            Context ctx = (Context) getContext.invoke(null);
            if (ctx != null) return ctx;
        } catch (Throwable ignored) {
        }
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getDeclaredMethod("currentApplication");
            Application app = (Application) currentApplication.invoke(null);
            if (app != null) return app.getApplicationContext();
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void showToast(Context context, String message) {
        MAIN_HANDLER.post(() -> {
            try {
                Class<?> pikoUtils = Class.forName("app.morphe.extension.crimera.PikoUtils");
                Method toast = pikoUtils.getDeclaredMethod("toast", String.class);
                toast.invoke(null, message);
                return;
            } catch (Throwable ignored) {
            }
            if (context != null) {
                Toast.makeText(context, message, Toast.LENGTH_LONG).show();
            }
        });
    }
}
