package app.pielm.extension.twitter.gif;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.media.MediaScannerConnection;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/**
 * Handles background downloading of Twitter/X GIF MP4 streams, native conversion to .gif,
 * Android notifications, and MediaScanner indexing into Pictures/Twitter.
 */
public final class GifDownloadManager {
    private static final String TAG = "PikoGifPatch";
    private static final String CHANNEL_ID = "piko_gif_download_channel";
    private static final Pattern INVALID_FILENAME_CHAR = Pattern.compile("[\\\\/:*?\"<>|\\p{Cntrl}]");
    private static final Pattern TRAILING_DOT_OR_SPACE = Pattern.compile("[. ]+$");

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private GifDownloadManager() {
    }

    public static void enqueueGifDownload(final String url, final String rawMediaName) {
        final Context context = resolveContext();
        if (context == null) {
            Log.e(TAG, "Cannot start GIF download: Context is null");
            return;
        }

        final String cleanBaseName = sanitizeFilename(stripVariantSuffix(rawMediaName));
        final String finalFileName = cleanBaseName.endsWith(".gif") ? cleanBaseName : (cleanBaseName + ".gif");

        File targetDir = resolveTargetDirectory();
        if (!targetDir.exists()) {
            targetDir.mkdirs();
        }

        final File finalFile = new File(targetDir, finalFileName);
        if (finalFile.exists() && finalFile.length() > 0) {
            showToast(context, resolveLocalizedString("exo_download_completed", "Download completed") + ": " + finalFileName);
            return;
        }

        showToast(context, resolveLocalizedString("download_started", "Downloading GIF..."));

        EXECUTOR.execute(() -> runDownloadAndConvert(context, url, finalFileName, finalFile));
    }

    private static void runDownloadAndConvert(Context context, String urlString, String fileName, File finalFile) {
        NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (nm != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID,
                    "GIF Downloads",
                    NotificationManager.IMPORTANCE_LOW
            );
            nm.createNotificationChannel(channel);
        }

        int notificationId = (int) (System.currentTimeMillis() & 0x7fffffff);
        Notification.Builder builder = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                ? new Notification.Builder(context, CHANNEL_ID)
                : new Notification.Builder(context);

        builder.setSmallIcon(android.R.drawable.stat_sys_download)
                .setContentTitle("Downloading GIF: " + fileName)
                .setContentText("Downloading stream...")
                .setOngoing(true)
                .setProgress(100, 0, false);

        if (nm != null) {
            nm.notify(notificationId, builder.build());
        }

        File tempMp4 = null;
        File tempGif = null;
        try {
            tempMp4 = File.createTempFile("piko_gif_src_", ".mp4", context.getCacheDir());
            tempGif = new File(finalFile.getParentFile(), "temp_" + fileName);
            if (tempGif.exists()) {
                tempGif.delete();
            }

            downloadStreamToFile(urlString, tempMp4, (bytesRead, totalBytes) -> {
                if (nm != null && totalBytes > 0) {
                    int pct = Math.min(45, (int) ((bytesRead * 45L) / totalBytes));
                    builder.setProgress(100, pct, false);
                    nm.notify(notificationId, builder.build());
                }
            });

            if (nm != null) {
                builder.setContentTitle("Converting to GIF: " + fileName)
                        .setContentText("Decoding & encoding GIF frames...")
                        .setProgress(100, 50, false);
                nm.notify(notificationId, builder.build());
            }

            final long[] lastUpdate = {0L};
            Mp4ToGifConverter.convert(tempMp4, tempGif, (currentFrame, totalFrames) -> {
                long now = System.currentTimeMillis();
                if (nm != null && (now - lastUpdate[0] > 180 || currentFrame == totalFrames)) {
                    lastUpdate[0] = now;
                    int pct = 45 + Math.min(54, (currentFrame * 54) / Math.max(1, totalFrames));
                    builder.setContentText("Encoding frame " + currentFrame + "/" + totalFrames)
                            .setProgress(100, pct, false);
                    nm.notify(notificationId, builder.build());
                }
            });

            if (finalFile.exists()) {
                finalFile.delete();
            }
            if (!tempGif.renameTo(finalFile)) {
                throw new IOException("Failed to move converted GIF to " + finalFile.getAbsolutePath());
            }

            MediaScannerConnection.scanFile(
                    context,
                    new String[]{finalFile.getAbsolutePath()},
                    new String[]{"image/gif"},
                    null
            );

            String completedLabel = resolveLocalizedString("exo_download_completed", "Download completed") + ": " + fileName;
            MAIN_HANDLER.post(() -> {
                if (nm != null) {
                    builder.setSmallIcon(android.R.drawable.stat_sys_download_done)
                            .setContentTitle(completedLabel)
                            .setContentText(finalFile.getParentFile().getName() + "/" + fileName)
                            .setOngoing(false)
                            .setProgress(0, 0, false);
                    nm.notify(notificationId, builder.build());
                }
                showToast(context, completedLabel);
            });
        } catch (Throwable e) {
            Log.e(TAG, "GIF download/conversion failed", e);
            if (tempGif != null && tempGif.exists()) {
                tempGif.delete();
            }
            MAIN_HANDLER.post(() -> {
                if (nm != null) {
                    nm.cancel(notificationId);
                }
                showToast(context, "GIF download failed: " + e.getMessage());
            });
        } finally {
            if (tempMp4 != null && tempMp4.exists()) {
                tempMp4.delete();
            }
        }
    }

    private interface DownloadProgress {
        void onProgress(long bytesRead, long totalBytes);
    }

    private static void downloadStreamToFile(String urlString, File destFile, DownloadProgress progress) throws IOException {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(urlString);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            conn.connect();

            int responseCode = conn.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                throw new IOException("HTTP " + responseCode);
            }

            long contentLength = conn.getContentLengthLong();
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
                    if (progress != null && now - lastNotify > 150) {
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

    private static File resolveTargetDirectory() {
        String publicFolder = "Pictures";
        String subFolder = "Twitter";
        try {
            Class<?> settingsClass = Class.forName("app.morphe.extension.twitter.settings.Settings");
            Class<?> utilsClass = Class.forName("app.morphe.extension.twitter.Utils");
            Object vidSubfolderSetting = settingsClass.getField("VID_SUBFOLDER").get(null);
            Method getStringPref = utilsClass.getDeclaredMethod("getStringPref", vidSubfolderSetting.getClass());
            String configuredSubfolder = (String) getStringPref.invoke(null, vidSubfolderSetting);
            if (configuredSubfolder != null && !configuredSubfolder.trim().isEmpty()) {
                subFolder = configuredSubfolder.trim();
            }
        } catch (Throwable ignored) {
        }
        return new File(Environment.getExternalStorageDirectory(), publicFolder + "/" + subFolder);
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

    static String resolveLocalizedString(String key, String fallback) {
        try {
            Class<?> stringRef = Class.forName("app.morphe.extension.shared.StringRef");
            Method strMethod = stringRef.getDeclaredMethod("str", String.class);
            String val = (String) strMethod.invoke(null, key);
            if (val != null && !val.isEmpty() && !val.equals(key)) {
                return val;
            }
        } catch (Throwable ignored) {
        }
        return fallback;
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
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
            }
        });
    }
}
