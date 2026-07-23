package dev.skulldogged.cobalt.extension;

import android.annotation.SuppressLint;
import android.app.DownloadManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.net.Uri;
import android.os.Environment;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import android.webkit.MimeTypeMap;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import androidx.media3.muxer.MediaMuxerCompat;

@SuppressLint({"NewApi", "NotificationPermission"})
public final class CobaltDownloadService extends Service {
    static final String EXTRA_SOURCE_URL = "source_url";
    static final String EXTRA_RECORD_ID = "record_id";

    private static final String CHANNEL_ID = "cobalt_downloads";
    private static final int NOTIFICATION_ID = 0x434F4241;
    private static final int RESULT_NOTIFICATION_ID = NOTIFICATION_ID + 1;
    private static final int BUFFER_SIZE = 256 * 1024;
    private static final ExecutorService JOB_EXECUTOR = Executors.newSingleThreadExecutor();

    private NotificationManager notificationManager;
    private int smallIcon;

    @Override
    public void onCreate() {
        super.onCreate();
        notificationManager = getSystemService(NotificationManager.class);
        smallIcon = getApplicationInfo().icon;
        if (smallIcon == 0) {
            smallIcon = android.R.drawable.stat_sys_download;
        }
        createNotificationChannel();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String sourceUrl = intent == null ? null : intent.getStringExtra(EXTRA_SOURCE_URL);
        String recordId = intent == null ? null : intent.getStringExtra(EXTRA_RECORD_ID);
        if (notificationManager != null) {
            notificationManager.cancel(RESULT_NOTIFICATION_ID);
        }
        startForeground(
                NOTIFICATION_ID,
                buildNotification("Preparing download…", 0, true, true)
        );

        if (sourceUrl == null || sourceUrl.isEmpty()) {
            finishWithFailure(recordId, "No video URL was provided", startId);
            return START_NOT_STICKY;
        }
        if (recordId == null || recordId.isEmpty()) {
            recordId = CobaltDownloadRepository.create(this, sourceUrl);
        }

        String finalRecordId = recordId;
        JOB_EXECUTOR.execute(() -> runDownload(sourceUrl, finalRecordId, startId));
        return START_NOT_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void runDownload(String sourceUrl, String recordId, int startId) {
        File jobDirectory = new File(
                getCacheDir(),
                "cobalt-downloads/" + UUID.randomUUID()
        );

        try {
            CobaltResponse response = CobaltClient.request(sourceUrl);
            CobaltDownloadRepository.setFilename(this, recordId, response.filename);
            if (response.kind == CobaltResponse.Kind.DIRECT) {
                long downloadId = enqueueDirectDownload(response);
                CobaltDownloadRepository.setDirect(
                        this,
                        recordId,
                        sanitizeDirectFilename(response.filename),
                        downloadId
                );
                finishWithoutResult(startId);
                return;
            }

            if (!jobDirectory.mkdirs() && !jobDirectory.isDirectory()) {
                throw new CobaltException("Could not create temporary download storage");
            }

            File videoFile = new File(jobDirectory, "video.part");
            File audioFile = new File(jobDirectory, "audio.part");
            ProgressTracker tracker = new ProgressTracker(recordId, response.filename);
            ExecutorService downloads = Executors.newFixedThreadPool(2);

            try {
                Future<?> video = downloads.submit(() -> {
                    try {
                        downloadTunnel(response.tunnels.get(0), videoFile, 0, tracker);
                    } catch (Exception exception) {
                        throw new DownloadRuntimeException(exception);
                    }
                });
                Future<?> audio = downloads.submit(() -> {
                    try {
                        downloadTunnel(response.tunnels.get(1), audioFile, 1, tracker);
                    } catch (Exception exception) {
                        throw new DownloadRuntimeException(exception);
                    }
                });
                waitFor(video);
                waitFor(audio);
            } finally {
                downloads.shutdownNow();
            }

            updateProgress(response.filename, "Finalizing MP4…", 90, false);
            CobaltDownloadRepository.setFinalizing(this, recordId, response.filename, 90);
            String filename = sanitizeMp4Filename(response.filename);
            Uri outputUri = remuxToMediaStore(
                    videoFile,
                    audioFile,
                    filename,
                    response.filename,
                    recordId
            );
            finishWithSuccess(recordId, filename, outputUri, startId);
        } catch (Exception exception) {
            finishWithFailure(recordId, safeMessage(exception), startId);
        } finally {
            deleteRecursively(jobDirectory);
        }
    }

    private void downloadTunnel(
            String tunnelUrl,
            File destination,
            int index,
            ProgressTracker tracker
    ) throws Exception {
        URL url = requireHttps(tunnelUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(20_000);
        connection.setReadTimeout(60_000);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("Accept", "*/*");
        connection.setRequestProperty("User-Agent", "Cobalt-Morphe/0.2");

        try {
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) {
                throw new CobaltException("cobalt tunnel returned HTTP " + status);
            }

            long expected = connection.getContentLengthLong();
            if (expected <= 0) {
                expected = parseLength(connection.getHeaderField("Estimated-Content-Length"));
            }
            tracker.setExpected(index, expected);

            byte[] buffer = new byte[BUFFER_SIZE];
            long received = 0;
            try (InputStream input = connection.getInputStream();
                 FileOutputStream output = new FileOutputStream(destination)) {
                int count;
                while ((count = input.read(buffer)) != -1) {
                    output.write(buffer, 0, count);
                    received += count;
                    tracker.setReceived(index, received);
                }
                output.getFD().sync();
            }

            if (received == 0) {
                throw new CobaltException("cobalt returned an empty media stream");
            }
            if (connection.getContentLengthLong() > 0
                    && received != connection.getContentLengthLong()) {
                throw new CobaltException("cobalt media stream was incomplete");
            }
        } finally {
            connection.disconnect();
        }
    }

    private Uri remuxToMediaStore(
            File videoFile,
            File audioFile,
            String filename,
            String notificationTitle,
            String recordId
    ) throws Exception {
        ContentResolver resolver = getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, filename);
        values.put(MediaStore.MediaColumns.MIME_TYPE, "video/mp4");
        values.put(
                MediaStore.MediaColumns.RELATIVE_PATH,
                Environment.DIRECTORY_DOWNLOADS
        );
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);

        Uri collection = MediaStore.Downloads.getContentUri(
                MediaStore.VOLUME_EXTERNAL_PRIMARY
        );
        Uri outputUri = resolver.insert(collection, values);
        if (outputUri == null) {
            throw new CobaltException("Could not create the output file");
        }

        boolean completed = false;
        try (ParcelFileDescriptor descriptor = resolver.openFileDescriptor(outputUri, "rw")) {
            if (descriptor == null) {
                throw new CobaltException("Could not open the output file");
            }
            remux(
                    videoFile,
                    audioFile,
                    descriptor,
                    notificationTitle,
                    recordId
            );
            completed = true;
        } finally {
            if (!completed) {
                resolver.delete(outputUri, null, null);
            }
        }

        ContentValues publish = new ContentValues();
        publish.put(MediaStore.MediaColumns.IS_PENDING, 0);
        resolver.update(outputUri, publish, null, null);
        return outputUri;
    }

    private void remux(
            File videoFile,
            File audioFile,
            ParcelFileDescriptor output,
            String notificationTitle,
            String recordId
    ) throws Exception {
        MediaExtractor video = new MediaExtractor();
        MediaExtractor audio = new MediaExtractor();
        MediaMuxerCompat muxer = null;
        boolean muxerStarted = false;

        try {
            video.setDataSource(videoFile.getAbsolutePath());
            audio.setDataSource(audioFile.getAbsolutePath());
            int videoSourceTrack = selectTrack(video, true);
            int audioSourceTrack = selectTrack(audio, false);
            MediaFormat videoFormat = video.getTrackFormat(videoSourceTrack);
            MediaFormat audioFormat = audio.getTrackFormat(audioSourceTrack);
            requireVideoMime(videoFormat);
            requireAudioMime(audioFormat);

            video.selectTrack(videoSourceTrack);
            audio.selectTrack(audioSourceTrack);

            muxer = new MediaMuxerCompat(
                    output.getFileDescriptor(),
                    MediaMuxerCompat.OUTPUT_FORMAT_MP4
            );
            int videoTargetTrack = muxer.addTrack(videoFormat);
            int audioTargetTrack = muxer.addTrack(audioFormat);
            muxer.start();
            muxerStarted = true;

            long duration = Math.max(durationOf(videoFormat), durationOf(audioFormat));
            long lastUpdate = 0;
            ByteBuffer sampleBuffer = ByteBuffer.allocate(BUFFER_SIZE);
            MediaCodec.BufferInfo sampleInfo = new MediaCodec.BufferInfo();

            while (video.getSampleTrackIndex() >= 0 || audio.getSampleTrackIndex() >= 0) {
                boolean useVideo = audio.getSampleTrackIndex() < 0
                        || (video.getSampleTrackIndex() >= 0
                        && video.getSampleTime() <= audio.getSampleTime());
                MediaExtractor source = useVideo ? video : audio;
                int targetTrack = useVideo ? videoTargetTrack : audioTargetTrack;
                long sampleSize = source.getSampleSize();
                if (sampleSize > Integer.MAX_VALUE) {
                    throw new CobaltException("A media sample was too large to process");
                }
                if (sampleSize > sampleBuffer.capacity()) {
                    sampleBuffer = ByteBuffer.allocate((int) sampleSize);
                }
                sampleBuffer.clear();
                int size = source.readSampleData(sampleBuffer, 0);
                if (size < 0) {
                    source.advance();
                    continue;
                }

                int codecFlags = (source.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0
                        ? MediaCodec.BUFFER_FLAG_KEY_FRAME
                        : 0;
                sampleInfo.set(0, size, source.getSampleTime(), codecFlags);
                muxer.writeSampleData(targetTrack, sampleBuffer, sampleInfo);

                long now = System.currentTimeMillis();
                if (duration > 0 && now - lastUpdate >= 500) {
                    int remuxProgress = (int) Math.min(
                            9,
                            (Math.max(0, source.getSampleTime()) * 9) / duration
                    );
                    updateProgress(
                            notificationTitle,
                            "Finalizing MP4…",
                            90 + remuxProgress,
                            false
                    );
                    CobaltDownloadRepository.setFinalizing(
                            this,
                            recordId,
                            notificationTitle,
                            90 + remuxProgress
                    );
                    lastUpdate = now;
                }
                source.advance();
            }
        } finally {
            if (muxer != null) {
                if (muxerStarted) {
                    muxer.stop();
                }
            }
            video.release();
            audio.release();
        }
    }

    private int selectTrack(MediaExtractor extractor, boolean video) throws Exception {
        String prefix = video ? "video/" : "audio/";
        for (int index = 0; index < extractor.getTrackCount(); index++) {
            String mime = extractor.getTrackFormat(index).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(prefix)) {
                return index;
            }
        }
        throw new CobaltException(video ? "Video stream had no video track" : "Audio stream had no audio track");
    }

    private void requireAudioMime(MediaFormat format) throws Exception {
        String actual = format.getString(MediaFormat.KEY_MIME);
        if (!"audio/opus".equalsIgnoreCase(actual)
                && !"audio/mp4a-latm".equalsIgnoreCase(actual)) {
            throw new CobaltException(
                    "Expected Opus or AAC audio but cobalt returned " + actual
            );
        }
    }

    private void requireVideoMime(MediaFormat format) throws Exception {
        String actual = format.getString(MediaFormat.KEY_MIME);
        if (!"video/av01".equalsIgnoreCase(actual)
                && !"video/x-vnd.on2.vp9".equalsIgnoreCase(actual)
                && !"video/avc".equalsIgnoreCase(actual)) {
            throw new CobaltException(
                    "Expected AV1, VP9, or AVC video but cobalt returned " + actual
            );
        }
    }

    private long durationOf(MediaFormat format) {
        return format.containsKey(MediaFormat.KEY_DURATION)
                ? format.getLong(MediaFormat.KEY_DURATION)
                : -1;
    }

    private long enqueueDirectDownload(CobaltResponse response) throws Exception {
        URL url = requireHttps(response.url);
        String filename = sanitizeDirectFilename(response.filename);
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url.toString()))
                .setTitle(filename)
                .setDescription("Downloaded through cobalt")
                .setNotificationVisibility(
                        DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                .setAllowedOverMetered(true)
                .setAllowedOverRoaming(false)
                .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, filename);
        String mimeType = mimeTypeFromFilename(filename);
        if (mimeType != null) {
            request.setMimeType(mimeType);
        }
        DownloadManager manager = getSystemService(DownloadManager.class);
        if (manager == null) {
            throw new CobaltException("Android DownloadManager is unavailable");
        }
        return manager.enqueue(request);
    }

    private URL requireHttps(String value) throws Exception {
        URL url = new URL(value);
        if (!"https".equalsIgnoreCase(url.getProtocol())) {
            throw new CobaltException("cobalt returned a non-HTTPS URL");
        }
        return url;
    }

    private void waitFor(Future<?> future) throws Exception {
        try {
            future.get();
        } catch (Exception exception) {
            Throwable cause = exception.getCause();
            if (cause instanceof DownloadRuntimeException && cause.getCause() instanceof Exception) {
                throw (Exception) cause.getCause();
            }
            throw exception;
        }
    }

    private long parseLength(String value) {
        if (value == null) {
            return -1;
        }
        try {
            return Long.parseLong(value);
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private String sanitizeDirectFilename(String filename) {
        return limitFilename(sanitizeFilename(filename, "cobalt-download"));
    }

    private String sanitizeMp4Filename(String filename) {
        String safe = sanitizeFilename(filename, "cobalt-download.mp4");
        if (!safe.toLowerCase(java.util.Locale.US).endsWith(".mp4")) {
            safe += ".mp4";
        }
        return limitFilename(safe);
    }

    private String sanitizeFilename(String filename, String fallback) {
        String safe = filename == null ? "" : filename
                .replaceAll("[\\\\/:*?\"<>|]", "_")
                .replaceAll("[\\r\\n]", " ")
                .trim();
        if (safe.isEmpty() || ".".equals(safe) || "..".equals(safe)) {
            return fallback;
        }
        return safe;
    }

    private String limitFilename(String filename) {
        String safe = filename;
        if (safe.length() > 180) {
            int dot = safe.lastIndexOf('.');
            String extension = dot > 0 && safe.length() - dot <= 12
                    ? safe.substring(dot)
                    : "";
            int baseLength = 180 - extension.length();
            safe = safe.substring(0, baseLength).trim() + extension;
        }
        return safe;
    }

    private String mimeTypeFromFilename(String filename) {
        int dot = filename.lastIndexOf('.');
        if (dot < 0 || dot + 1 >= filename.length()) {
            return null;
        }
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(
                filename.substring(dot + 1).toLowerCase(java.util.Locale.US)
        );
    }

    private String safeMessage(Exception exception) {
        String message = exception.getMessage();
        if (message == null || message.trim().isEmpty()) {
            message = exception.getClass().getSimpleName();
        }
        return message;
    }

    private void createNotificationChannel() {
        if (notificationManager == null) {
            return;
        }
        NotificationChannel channel = new NotificationChannel(
                CHANNEL_ID,
                "Cobalt downloads",
                NotificationManager.IMPORTANCE_LOW
        );
        channel.setDescription("Progress for downloads prepared through cobalt");
        notificationManager.createNotificationChannel(channel);
    }

    private Notification buildNotification(
            String text,
            int progress,
            boolean indeterminate,
            boolean ongoing
    ) {
        return buildNotification("Cobalt download", text, progress, indeterminate, ongoing);
    }

    private Notification buildNotification(
            String title,
            String text,
            int progress,
            boolean indeterminate,
            boolean ongoing
    ) {
        Notification.Builder builder = new Notification.Builder(this, CHANNEL_ID)
                .setSmallIcon(smallIcon)
                .setContentTitle(title)
                .setContentText(text)
                .setOnlyAlertOnce(true)
                .setOngoing(ongoing)
                .setAutoCancel(!ongoing)
                .setCategory(Notification.CATEGORY_PROGRESS);
        if (ongoing) {
            builder.setProgress(100, progress, indeterminate);
        }
        return builder.build();
    }

    private void updateProgress(String title, String text, int progress, boolean indeterminate) {
        if (notificationManager != null) {
            notificationManager.notify(
                    NOTIFICATION_ID,
                    buildNotification(title, text, progress, indeterminate, true)
            );
        }
    }

    private void finishWithoutResult(int startId) {
        stopForeground(STOP_FOREGROUND_REMOVE);
        if (notificationManager != null) {
            notificationManager.cancel(NOTIFICATION_ID);
        }
        CobaltDownloader.onJobFinished();
        stopSelf(startId);
    }

    private void finishWithSuccess(String recordId, String filename, Uri outputUri, int startId) {
        CobaltDownloadRepository.setComplete(this, recordId, filename, outputUri);
        Intent viewIntent = new Intent(Intent.ACTION_VIEW)
                .setDataAndType(outputUri, "video/mp4")
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        PendingIntent contentIntent = PendingIntent.getActivity(
                this,
                outputUri.hashCode(),
                viewIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );

        stopForeground(STOP_FOREGROUND_REMOVE);
        if (notificationManager != null) {
            notificationManager.cancel(NOTIFICATION_ID);
            notificationManager.notify(
                    RESULT_NOTIFICATION_ID,
                    new Notification.Builder(this, CHANNEL_ID)
                            .setSmallIcon(smallIcon)
                            .setContentTitle(filename)
                            .setContentText("Download complete")
                            .setOnlyAlertOnce(true)
                            .setAutoCancel(true)
                            .setCategory(Notification.CATEGORY_STATUS)
                            .setContentIntent(contentIntent)
                            .build()
            );
        }
        CobaltDownloader.onJobFinished();
        stopSelf(startId);
    }

    private void finishWithFailure(String recordId, String message, int startId) {
        CobaltDownloadRepository.setFailed(this, recordId, message);
        stopForeground(STOP_FOREGROUND_REMOVE);
        if (notificationManager != null) {
            notificationManager.cancel(NOTIFICATION_ID);
            notificationManager.notify(
                    RESULT_NOTIFICATION_ID,
                    buildNotification(
                            "Cobalt download failed",
                            message,
                            0,
                            false,
                            false
                    )
            );
        }
        CobaltDownloader.onJobFinished();
        stopSelf(startId);
    }

    private void deleteRecursively(File file) {
        if (file == null || !file.exists()) {
            return;
        }
        File[] children = file.listFiles();
        if (children != null) {
            for (File child : children) {
                deleteRecursively(child);
            }
        }
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }

    private final class ProgressTracker {
        private final long[] expected = {-1, -1};
        private final long[] received = {0, 0};
        private final String title;
        private final String recordId;
        private long lastUpdate;

        ProgressTracker(String recordId, String title) {
            this.recordId = recordId;
            this.title = title;
        }

        synchronized void setExpected(int index, long value) {
            expected[index] = value;
            publish(true);
        }

        synchronized void setReceived(int index, long value) {
            received[index] = value;
            publish(false);
        }

        private void publish(boolean force) {
            long now = System.currentTimeMillis();
            if (!force && now - lastUpdate < 500) {
                return;
            }
            lastUpdate = now;

            if (expected[0] <= 0 || expected[1] <= 0) {
                updateProgress(title, "Downloading video and audio…", 0, true);
                CobaltDownloadRepository.setDownloading(
                        CobaltDownloadService.this,
                        recordId,
                        title,
                        received[0] + received[1],
                        -1,
                        0
                );
                return;
            }
            long totalExpected = expected[0] + expected[1];
            long totalReceived = received[0] + received[1];
            int progress = (int) Math.min(90, (totalReceived * 90) / totalExpected);
            updateProgress(
                    title,
                    "Downloading video and audio… " + progress + "%",
                    progress,
                    false
            );
            CobaltDownloadRepository.setDownloading(
                    CobaltDownloadService.this,
                    recordId,
                    title,
                    totalReceived,
                    totalExpected,
                    progress
            );
        }
    }

    private static final class DownloadRuntimeException extends RuntimeException {
        DownloadRuntimeException(Exception cause) {
            super(cause);
        }
    }
}
