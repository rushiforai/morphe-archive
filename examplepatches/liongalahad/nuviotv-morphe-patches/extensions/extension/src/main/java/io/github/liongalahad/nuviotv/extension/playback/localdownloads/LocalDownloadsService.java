package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.provider.DocumentsContract;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;
import io.github.liongalahad.nuviotv.extension.storage.segmented.SegmentedMedia;

/** Foreground transfer service. Hidden dialogs do not stop the active download. */
public final class LocalDownloadsService extends Service {
    private static final String TAG = "MorpheDownloadService";
    private static final String CHANNEL_ID = "morphe_local_downloads";
    private static final int NOTIFICATION_ID = 18732;
    private static final int BUFFER_SIZE = 128 * 1024;
    private static final String[] VIDEO_EXTENSIONS = {
            ".mp4", ".mkv", ".webm", ".avi", ".mov", ".m4v", ".ts", ".m2ts",
            ".mpg", ".mpeg", ".wmv", ".flv", ".3gp"
    };
    private static volatile WeakReference<LocalDownloadsService> activeService =
            new WeakReference<>(null);
    private volatile HttpURLConnection activeConnection;
    private volatile Thread workerThread;

    @Override public void onCreate() {
        super.onCreate();
        activeService = new WeakReference<>(this);
        createNotificationChannel();
    }

    @Override public void onDestroy() {
        LocalDownloadsService active = activeService.get();
        if (active == this) activeService = new WeakReference<>(null);
        super.onDestroy();
    }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        LocalDownloadsRuntime.DownloadRequest request = LocalDownloadsRuntime.takeActiveRequest();
        if (request == null) { stopSelf(startId); return START_NOT_STICKY; }
        startForeground(NOTIFICATION_ID, notification("Preparing " + request.progressTitle(), 0, 0));
        workerThread = new Thread(() -> runTransfer(request, startId), "MorpheLocalDownload");
        workerThread.start();
        return START_NOT_STICKY;
    }

    @Override public IBinder onBind(Intent intent) { return null; }

    private void runTransfer(LocalDownloadsRuntime.DownloadRequest request, int startId) {
        HttpURLConnection connection = null;
        OutputTarget target = null;
        try {
            if (LocalDownloadsRuntime.isCancelRequested()) throw new CancelledException();
            LocalDownloadsStorageStats.Snapshot storage =
                    LocalDownloadsStorageStats.snapshot(this, MorpheStoragePath.uri());
            if (!storage.isAvailable()) {
                throw new IOException(
                        "Selected storage is unavailable. Reconnect it or choose another local storage path."
                );
            }
            connection = open(request.url, request.headers);
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) throw new IOException("Source returned HTTP " + status);
            long responseSize = connection.getContentLengthLong();
            long declaredSize = request.declaredSize != null ? request.declaredSize : -1L;
            long expected = Math.max(declaredSize, responseSize);
            long free = storage.availableBytes;
            long allowed = allowedBytes(free, LocalDownloadsSettings.freePercent());
            Log.i(TAG, "Capacity check declared=" + declaredSize + " response=" + responseSize +
                    " expected=" + expected + " free=" + free + " allowed=" + allowed);
            if (isTooLarge(expected, free, LocalDownloadsSettings.freePercent())) {
                LocalDownloadsRuntime.rejectForSize(
                        request,
                        "This file is larger than the configured " +
                                LocalDownloadsSettings.freePercent() +
                                "% of free storage. Select a source with a smaller file size."
                );
                return;
            }

            String folder = downloadFolderName(request);
            String filename = safeVideoFilename(request.filename, request.url);
            boolean segmented = LocalDownloadsStorageFormat.shouldSegment(
                    this, MorpheStoragePath.uri(), expected);
            Log.i(TAG, "Storage format=" + LocalDownloadsStorageFormat.classify(
                    this, MorpheStoragePath.uri()) + " segmented=" + segmented);
            target = OutputTarget.create(this, request, folder, filename, segmented);
            long written = 0L;
            long lastUpdate = 0L;
            try (InputStream input = new BufferedInputStream(connection.getInputStream(), BUFFER_SIZE);
                 OutputStream output = new BufferedOutputStream(target.open(), BUFFER_SIZE)) {
                byte[] buffer = new byte[BUFFER_SIZE];
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    if (LocalDownloadsRuntime.isCancelRequested()) throw new CancelledException();
                    if (count == 0) continue;
                    written += count;
                    if (written > allowed) {
                        throw new TooLargeException(LocalDownloadsSettings.freePercent());
                    }
                    output.write(buffer, 0, count);
                    long now = android.os.SystemClock.elapsedRealtime();
                    if (now - lastUpdate >= 250L) {
                        lastUpdate = now;
                        LocalDownloadsRuntime.updateProgress(written, expected);
                        updateNotification(request.progressTitle(), written, expected);
                    }
                }
                output.flush();
            }
            String finalUri = target.commit();
            String storedFilename = target.finalFilename();
            List<String> subtitleUris = downloadSubtitles(request, target, storedFilename, written);
            String folderUri = target.folderUri();
            List<String> assetUris = target.assetUris();
            String manifestUri = target.manifestUri();
            LocalDownloadsRuntime.DownloadedEntry entry = new LocalDownloadsRuntime.DownloadedEntry(
                    request.identity, finalUri, folderUri, storedFilename, written, subtitleUris,
                    assetUris, manifestUri, request.sourceKey
            );
            target = null;
            LocalDownloadsRuntime.completeDownload(entry);
            updateNotification("Download finished: " + request.progressTitle(), 1, 1);
        } catch (CancelledException cancelled) {
            if (target != null) target.delete();
            LocalDownloadsRuntime.updateStateForService(
                    LocalDownloadsRuntime.DownloadState.cancelled(request.progressTitle())
            );
        } catch (TooLargeException tooLarge) {
            if (target != null) target.delete();
            LocalDownloadsRuntime.rejectForSize(
                    request,
                    "This file exceeded the configured " + tooLarge.percent +
                            "% of free storage. Select a source with a smaller file size."
            );
        } catch (Throwable error) {
            if (target != null) target.delete();
            if (LocalDownloadsRuntime.isCancelRequested()) {
                LocalDownloadsRuntime.updateStateForService(
                        LocalDownloadsRuntime.DownloadState.cancelled(request.progressTitle())
                );
            } else {
                Log.e(TAG, "Download failed", error);
                LocalDownloadsRuntime.failDownload(
                        request.progressTitle(),
                        "Download failed: " + safeMessage(error)
                );
            }
        } finally {
            if (connection != null) connection.disconnect();
            clearActiveConnection(connection);
            workerThread = null;
            stopForeground(false);
            stopSelf(startId);
        }
    }

    static long allowedBytes(long freeBytes, int percent) {
        if (freeBytes <= 0 || percent <= 0) return 0L;
        return freeBytes / 100L * percent + (freeBytes % 100L) * percent / 100L;
    }

    static boolean isTooLarge(long fileBytes, long freeBytes, int percent) {
        return fileBytes >= 0 && fileBytes > allowedBytes(freeBytes, percent);
    }

    static String downloadFolderName(LocalDownloadsRuntime.DownloadRequest request) {
        String title = sanitize(request == null ? null : request.displayTitle, "Downloaded title");
        Integer season = request == null ? null : request.identity.season;
        if (season == null || !"series".equalsIgnoreCase(request.identity.contentType)) return title;
        return sanitize(title + " - Season " + season, "Downloaded series");
    }

    static SegmentedLocation segmentedLocation(
            LocalDownloadsRuntime.DownloadRequest request, String logicalParent
    ) {
        return segmentedLocation(request, logicalParent, null);
    }

    static SegmentedLocation segmentedLocation(
            LocalDownloadsRuntime.DownloadRequest request, String logicalParent, String filename
    ) {
        Integer season = request == null ? null : request.identity.season;
        Integer episode = request == null ? null : request.identity.episode;
        if (request != null && "series".equalsIgnoreCase(request.identity.contentType) &&
                season != null && episode != null) {
            String episodeCode = String.format(Locale.US, "S%02dE%02d", season, episode);
            String episodeTitle = storageLabel(request.identity.episodeTitle, "");
            String bundleLabel = episodeTitle.isEmpty()
                    ? episodeCode : episodeCode + " - " + episodeTitle;
            return new SegmentedLocation(logicalParent, bundleLabel);
        }
        String title = storageLabel(request == null ? null : request.displayTitle, "Downloaded title");
        String fileLabel = filename == null ? title : storageLabel(stripExtension(filename), title);
        return new SegmentedLocation(logicalParent, fileLabel);
    }

    private static String storageLabel(String value, String fallback) {
        String label = sanitize(value, fallback);
        return label.length() > 80 ? label.substring(0, 80).trim() : label;
    }

    static final class SegmentedLocation {
        final String logicalParent;
        final String bundleLabel;

        SegmentedLocation(String logicalParent, String bundleLabel) {
            this.logicalParent = sanitize(logicalParent, "Downloaded title");
            this.bundleLabel = storageLabel(bundleLabel, "Downloaded video");
        }

        String bundleFolderName(String bundleId) {
            String suffix = bundleId == null ? "download" : bundleId.replace("-", "");
            if (suffix.length() > 8) suffix = suffix.substring(0, 8);
            return bundleLabel + " [" + suffix + "]";
        }

        String manifestName() {
            return bundleLabel + SegmentedMedia.DESCRIPTIVE_MANIFEST_SUFFIX;
        }

        String partName(int index) {
            return bundleLabel + " - part " + String.format(Locale.US, "%04d", index) + ".bin";
        }
    }

    private List<String> downloadSubtitles(
            LocalDownloadsRuntime.DownloadRequest request,
            OutputTarget target,
            String videoFilename,
            long actualVideoSize
    ) throws CancelledException {
        List<LocalDownloadsRuntime.SubtitleDownload> subtitles =
                LocalDownloadsRuntime.fetchAddonSubtitles(request, actualVideoSize);
        if (subtitles.isEmpty()) return Collections.emptyList();
        String base = stripExtension(videoFilename);
        Map<String, Integer> languageCounts = new HashMap<>();
        List<String> saved = new ArrayList<>();
        List<String> savedNames = new ArrayList<>();
        for (LocalDownloadsRuntime.SubtitleDownload subtitle : subtitles) {
            if (LocalDownloadsRuntime.isCancelRequested()) {
                deleteSidecars(target, savedNames);
                throw new CancelledException();
            }
            String language = sanitizeLanguage(subtitle.language);
            int count = languageCounts.containsKey(language) ? languageCounts.get(language) + 1 : 1;
            languageCounts.put(language, count);
            String extension = subtitleExtension(subtitle.url);
            String name = base + "." + language + (count == 1 ? "" : "." + count) + "." + extension;
            HttpURLConnection connection = null;
            try {
                connection = open(subtitle.url, Collections.emptyMap());
                int status = connection.getResponseCode();
                if (status < 200 || status >= 300) continue;
                try (InputStream input = new BufferedInputStream(connection.getInputStream());
                     OutputStream output = new BufferedOutputStream(target.openSidecar(name))) {
                    byte[] buffer = new byte[32 * 1024];
                    int read;
                    while ((read = input.read(buffer)) >= 0) {
                        if (LocalDownloadsRuntime.isCancelRequested()) {
                            target.deleteSidecar(name);
                            deleteSidecars(target, savedNames);
                            throw new CancelledException();
                        }
                        if (read > 0) output.write(buffer, 0, read);
                    }
                    output.flush();
                }
                saved.add(target.sidecarUri(name));
                savedNames.add(name);
            } catch (CancelledException cancelled) {
                throw cancelled;
            } catch (Throwable error) {
                Log.w(TAG, "Unable to save addon subtitle " + name, error);
                target.deleteSidecar(name);
            } finally {
                if (connection != null) connection.disconnect();
                clearActiveConnection(connection);
            }
        }
        return saved;
    }

    private static void deleteSidecars(OutputTarget target, List<String> names) {
        for (String name : names) target.deleteSidecar(name);
    }

    private HttpURLConnection open(String rawUrl, Map<String, String> headers)
            throws IOException, CancelledException {
        URL current = new URL(rawUrl);
        for (int redirect = 0; redirect < 6; redirect++) {
            if (LocalDownloadsRuntime.isCancelRequested()) throw new CancelledException();
            HttpURLConnection connection = (HttpURLConnection) current.openConnection();
            activeConnection = connection;
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(20_000);
            connection.setReadTimeout(30_000);
            connection.setRequestProperty("Accept-Encoding", "identity");
            for (Map.Entry<String, String> header : headers.entrySet()) {
                connection.setRequestProperty(header.getKey(), header.getValue());
            }
            int status = connection.getResponseCode();
            if (LocalDownloadsRuntime.isCancelRequested()) {
                connection.disconnect();
                clearActiveConnection(connection);
                throw new CancelledException();
            }
            if (status < 300 || status > 399) return connection;
            String location = connection.getHeaderField("Location");
            connection.disconnect();
            clearActiveConnection(connection);
            if (location == null) throw new IOException("Redirect did not include a destination");
            current = new URL(current, location);
        }
        throw new IOException("Source redirected too many times");
    }

    static void cancelActiveTransfer() {
        LocalDownloadsService service = activeService.get();
        if (service == null) return;
        HttpURLConnection connection = service.activeConnection;
        if (connection != null) connection.disconnect();
        Thread worker = service.workerThread;
        if (worker != null) worker.interrupt();
    }

    private void clearActiveConnection(HttpURLConnection connection) {
        if (activeConnection == connection) activeConnection = null;
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return;
        NotificationChannel channel = new NotificationChannel(
                CHANNEL_ID, "Local downloads", NotificationManager.IMPORTANCE_LOW
        );
        channel.setDescription("Progress for Morphe local media downloads");
        getSystemService(NotificationManager.class).createNotificationChannel(channel);
    }

    private Notification notification(String text, long bytes, long total) {
        Intent open = new Intent(this, LocalDownloadsProgressActivity.class);
        PendingIntent pending = PendingIntent.getActivity(
                this, 0, open,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );
        Notification.Builder builder = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                ? new Notification.Builder(this, CHANNEL_ID) : new Notification.Builder(this);
        builder.setSmallIcon(android.R.drawable.stat_sys_download)
                .setContentTitle("Nuvio local download")
                .setContentText(text)
                .setOnlyAlertOnce(true)
                .setOngoing(bytes < total || total <= 0)
                .setContentIntent(pending);
        if (total > 0) builder.setProgress(100, (int) Math.min(100L, bytes * 100L / total), false);
        else if (bytes > 0) builder.setProgress(100, 0, true);
        return builder.build();
    }

    @android.annotation.SuppressLint("NotificationPermission")
    private void updateNotification(String title, long bytes, long total) {
        ((NotificationManager) getSystemService(NOTIFICATION_SERVICE))
                .notify(NOTIFICATION_ID, notification(title, bytes, total));
    }

    static String safeVideoFilename(String source, String rawUrl) {
        String name = source == null ? "" : Uri.parse(source).getLastPathSegment();
        if (name == null || name.trim().isEmpty()) name = Uri.parse(rawUrl).getLastPathSegment();
        if (name == null || name.trim().isEmpty()) name = "video.mp4";
        name = sanitize(name, "video.mp4");
        String lower = name.toLowerCase(Locale.ROOT);
        int extensionEnd = -1;
        for (String extension : VIDEO_EXTENSIONS) {
            int start = lower.lastIndexOf(extension);
            if (start >= 0 && start + extension.length() > extensionEnd) {
                extensionEnd = start + extension.length();
            }
        }
        if (extensionEnd > 0) return name.substring(0, extensionEnd);
        return name + ".mp4";
    }

    private static String stripExtension(String name) {
        int dot = name == null ? -1 : name.lastIndexOf('.');
        return dot <= 0 ? (name == null ? "video" : name) : name.substring(0, dot);
    }

    private static String sanitizeLanguage(String language) {
        String value = language == null ? "und" : language.toLowerCase(Locale.ROOT)
                .replaceAll("[^a-z0-9_-]", "");
        return value.isEmpty() ? "und" : value;
    }

    private static String subtitleExtension(String rawUrl) {
        String name = Uri.parse(rawUrl).getLastPathSegment();
        String extension = "";
        if (name != null && name.lastIndexOf('.') >= 0) {
            extension = name.substring(name.lastIndexOf('.') + 1).toLowerCase(Locale.ROOT);
        }
        return extension.matches("srt|vtt|ass|ssa|ttml|dfxp") ? extension : "srt";
    }

    private static String videoMimeType(String filename) {
        String extension = "";
        int dot = filename == null ? -1 : filename.lastIndexOf('.');
        if (dot >= 0) extension = filename.substring(dot + 1).toLowerCase(Locale.ROOT);
        if ("mp4".equals(extension) || "m4v".equals(extension) || "mov".equals(extension))
            return "video/mp4";
        if ("mkv".equals(extension)) return "video/x-matroska";
        if ("webm".equals(extension)) return "video/webm";
        if ("ts".equals(extension) || "m2ts".equals(extension)) return "video/mp2t";
        return "application/octet-stream";
    }

    private static String sanitize(String value, String fallback) {
        String cleaned = value == null ? "" : value.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        while (cleaned.endsWith(".")) cleaned = cleaned.substring(0, cleaned.length() - 1).trim();
        if (cleaned.isEmpty()) cleaned = fallback;
        return cleaned.length() > 120 ? cleaned.substring(0, 120).trim() : cleaned;
    }

    static String uniqueSegmentedFilename(String filename, Iterable<String> existingNames) {
        Set<String> existing = new HashSet<>();
        if (existingNames != null) for (String value : existingNames) {
            if (value != null) existing.add(value.toLowerCase(Locale.ROOT));
        }
        int dot = filename.lastIndexOf('.');
        String base = dot > 0 ? filename.substring(0, dot) : filename;
        String extension = dot > 0 ? filename.substring(dot) : "";
        for (int index = 1; index < 10_000; index++) {
            String candidate = index == 1 ? filename : base + " (" + index + ")" + extension;
            String normalized = candidate.toLowerCase(Locale.ROOT);
            if (!existing.contains(normalized) &&
                    !existing.contains(normalized + SegmentedMedia.MANIFEST_SUFFIX)) {
                return candidate;
            }
        }
        return base + "-" + System.currentTimeMillis() + extension;
    }

    private static String safeMessage(Throwable error) {
        String message = error.getMessage();
        return message == null || message.trim().isEmpty() ? error.getClass().getSimpleName() : message;
    }

    private static final class CancelledException extends IOException { }
    private static final class TooLargeException extends IOException {
        final int percent; TooLargeException(int percent) { this.percent = percent; }
    }

    private abstract static class OutputTarget {
        abstract OutputStream open() throws IOException;
        abstract String commit() throws IOException;
        abstract void delete();
        abstract String finalFilename();
        abstract String folderUri();
        abstract OutputStream openSidecar(String name) throws IOException;
        abstract String sidecarUri(String name) throws IOException;
        abstract void deleteSidecar(String name);
        abstract List<String> assetUris();
        abstract String manifestUri();

        static OutputTarget create(LocalDownloadsService service,
                                   LocalDownloadsRuntime.DownloadRequest request,
                                   String folderName, String filename, boolean segmented)
                throws IOException {
            Uri root = MorpheStoragePath.uri();
            if ("file".equalsIgnoreCase(root.getScheme())) {
                String selectedPath = root.getPath();
                if (selectedPath == null) {
                    throw new IOException(
                            "Selected local storage path is not writable. Choose another path in Morphe settings."
                    );
                }
                File selected = new File(selectedPath);
                boolean allowCreateDefault = MorpheStoragePath.value() == null &&
                        selected.equals(MorpheStoragePath.defaultFolder());
                if (!MorpheStoragePath.isWritableSelection(service, root, allowCreateDefault)) {
                    throw new IOException(
                            "Selected local storage path is not writable. Choose another path in Morphe settings."
                    );
                }
                if (segmented) {
                    return new SegmentedFileOutputTarget(service, selected, filename,
                            segmentedLocation(request, folderName, filename));
                }
                File directory = new File(selected, folderName);
                if (!directory.isDirectory() && !directory.mkdirs()) {
                    throw new IOException(
                            "Unable to create a download folder in the selected local storage path. " +
                                    "Check that the drive is writable or choose another path in Morphe settings."
                    );
                }
                return new FileOutputTarget(directory, filename);
            }
            if ("content".equalsIgnoreCase(root.getScheme())) {
                return segmented
                        ? new SegmentedDocumentOutputTarget(service, root, filename,
                                segmentedLocation(request, folderName, filename))
                        : new DocumentOutputTarget(service.getContentResolver(), root, folderName, filename);
            }
            throw new IOException("Unsupported local storage path");
        }
    }

    private static final class FileOutputTarget extends OutputTarget {
        final File partial, complete;
        FileOutputTarget(File directory, String filename) throws IOException {
            complete = uniqueFile(directory, filename);
            partial = new File(directory, complete.getName() + ".partial");
            if (partial.exists() && !partial.delete()) throw new IOException("Unable to clear partial download");
        }
        @Override OutputStream open() throws IOException { return new FileOutputStream(partial); }
        @Override String commit() throws IOException {
            if (!partial.renameTo(complete)) throw new IOException("Unable to finish downloaded file");
            return Uri.fromFile(complete).toString();
        }
        @Override void delete() {
            if (partial.exists() && !partial.delete()) partial.deleteOnExit();
            if (complete.exists() && !complete.delete()) complete.deleteOnExit();
        }
        @Override String finalFilename() { return complete.getName(); }
        @Override String folderUri() { return Uri.fromFile(complete.getParentFile()).toString(); }
        @Override OutputStream openSidecar(String name) throws IOException {
            return new FileOutputStream(new File(complete.getParentFile(), name));
        }
        @Override String sidecarUri(String name) {
            return Uri.fromFile(new File(complete.getParentFile(), name)).toString();
        }
        @Override void deleteSidecar(String name) {
            File sidecar = new File(complete.getParentFile(), name);
            if (sidecar.exists()) sidecar.delete();
        }
        @Override List<String> assetUris() {
            return Collections.singletonList(Uri.fromFile(complete).toString());
        }
        @Override String manifestUri() { return ""; }
        private static File uniqueFile(File directory, String filename) {
            File candidate = new File(directory, filename);
            if (!candidate.exists()) return candidate;
            int dot = filename.lastIndexOf('.');
            String base = dot > 0 ? filename.substring(0, dot) : filename;
            String extension = dot > 0 ? filename.substring(dot) : "";
            for (int index = 2; index < 10_000; index++) {
                candidate = new File(directory, base + " (" + index + ")" + extension);
                if (!candidate.exists()) return candidate;
            }
            return new File(directory, base + "-" + System.currentTimeMillis() + extension);
        }
    }

    interface PartOpener {
        OutputStream open(int index) throws IOException;
    }

    /** Rolls only between writes, so no empty trailing part is created at an exact boundary. */
    static final class RollingOutputStream extends OutputStream {
        private final long limit;
        private final PartOpener opener;
        private final List<Long> sizes = new ArrayList<>();
        private OutputStream current;
        private long currentSize;
        private boolean closed;

        RollingOutputStream(long limit, PartOpener opener) {
            this.limit = limit;
            this.opener = opener;
        }

        List<Long> sizes() { return Collections.unmodifiableList(sizes); }

        @Override public void write(int value) throws IOException {
            byte[] single = {(byte) value};
            write(single, 0, 1);
        }

        @Override public void write(byte[] buffer, int offset, int length) throws IOException {
            if (closed) throw new IOException("Segmented output is closed");
            if (buffer == null) throw new NullPointerException("buffer");
            if (offset < 0 || length < 0 || offset + length > buffer.length)
                throw new IndexOutOfBoundsException();
            while (length > 0) {
                ensurePart();
                int count = (int) Math.min((long) length, limit - currentSize);
                current.write(buffer, offset, count);
                currentSize += count;
                offset += count;
                length -= count;
                if (currentSize == limit && length > 0) finishPart();
            }
        }

        @Override public void flush() throws IOException {
            if (current != null) current.flush();
        }

        @Override public void close() throws IOException {
            if (closed) return;
            closed = true;
            if (current != null) finishPart();
        }

        private void ensurePart() throws IOException {
            if (current == null) {
                current = opener.open(sizes.size());
                currentSize = 0L;
            }
        }

        private void finishPart() throws IOException {
            OutputStream value = current;
            current = null;
            if (value == null) return;
            IOException failure = null;
            try { value.flush(); } catch (IOException error) { failure = error; }
            try { value.close(); } catch (IOException error) { if (failure == null) failure = error; }
            if (failure != null) throw failure;
            if (currentSize > 0L) sizes.add(currentSize);
            currentSize = 0L;
        }
    }

    private static final class SegmentedFileOutputTarget extends OutputTarget {
        final LocalDownloadsService service;
        final SegmentedLocation location;
        final File selectedRoot, logicalDirectory, complete, legacyStoreDirectory, bundleDirectory,
                manifestPartial, manifestComplete;
        final String bundleId = UUID.randomUUID().toString();
        final List<File> partialParts = new ArrayList<>();
        final List<File> completeParts = new ArrayList<>();
        final List<String> assets = new ArrayList<>();
        final Map<String, File> sidecars = new HashMap<>();
        RollingOutputStream rolling;
        String committedManifest = "";
        boolean collapsed;
        final long segmentBytes;

        SegmentedFileOutputTarget(LocalDownloadsService service, File selectedRoot, String filename,
                                  SegmentedLocation location) throws IOException {
            this(service, selectedRoot, filename, location,
                    LocalDownloadsStorageFormat.SEGMENT_BYTES);
        }

        SegmentedFileOutputTarget(LocalDownloadsService service, File selectedRoot, String filename,
                                  SegmentedLocation location, long segmentBytes) throws IOException {
            this.service = service;
            this.selectedRoot = selectedRoot;
            this.location = location;
            this.segmentBytes = segmentBytes;
            logicalDirectory = new File(selectedRoot, location.logicalParent);
            if (!logicalDirectory.isDirectory() && !logicalDirectory.mkdirs()) {
                throw new IOException("Unable to create title folder");
            }
            legacyStoreDirectory = new File(selectedRoot, SegmentedMedia.STORE_DIRECTORY);
            List<String> existingNames = hiddenSegmentedFilenames(
                    service, logicalDirectory, location.logicalParent);
            if (legacyStoreDirectory.isDirectory()) existingNames.addAll(hiddenSegmentedFilenames(
                    service, legacyStoreDirectory, location.logicalParent));
            String[] logicalValues = logicalDirectory.list();
            if (logicalValues != null) Collections.addAll(existingNames, logicalValues);
            complete = new File(logicalDirectory, uniqueSegmentedFilename(filename, existingNames));
            bundleDirectory = new File(logicalDirectory, location.bundleFolderName(bundleId));
            if (!bundleDirectory.isDirectory() && !bundleDirectory.mkdirs()) {
                throw new IOException("Unable to create segmented-media bundle");
            }
            manifestComplete = new File(bundleDirectory, location.manifestName());
            manifestPartial = new File(bundleDirectory, location.manifestName() + ".partial");
            if (manifestPartial.exists() && !manifestPartial.delete()) {
                throw new IOException("Unable to clear partial segmented manifest");
            }
        }

        @Override OutputStream open() {
            rolling = new RollingOutputStream(segmentBytes, index -> {
                String token = location.partName(index + 1);
                File completePart = new File(bundleDirectory, token);
                File partialPart = new File(bundleDirectory, token + ".partial");
                if (partialPart.exists() && !partialPart.delete()) {
                    throw new IOException("Unable to clear partial media segment");
                }
                completeParts.add(completePart);
                partialParts.add(partialPart);
                return new FileOutputStream(partialPart);
            });
            return rolling;
        }

        @Override String commit() throws IOException {
            if (rolling == null || rolling.sizes().isEmpty()) {
                throw new IOException("Downloaded media is empty");
            }
            List<Long> sizes = rolling.sizes();
            List<SegmentedMedia.Segment> segments = new ArrayList<>();
            for (int index = 0; index < sizes.size(); index++) {
                if (!partialParts.get(index).renameTo(completeParts.get(index))) {
                    throw new IOException("Unable to finish media segment " + (index + 1));
                }
            }
            if (completeParts.size() == 1 && completeParts.get(0).renameTo(complete)) {
                collapsed = true;
                completeParts.clear();
                partialParts.clear();
                assets.clear();
                assets.add(Uri.fromFile(complete).toString());
                deleteEmptyDirectory(bundleDirectory);
                return Uri.fromFile(complete).toString();
            }
            for (int index = 0; index < sizes.size(); index++) {
                String uri = Uri.fromFile(completeParts.get(index)).toString();
                assets.add(uri);
                segments.add(new SegmentedMedia.Segment(Uri.parse(uri), sizes.get(index)));
            }
            SegmentedMedia.Manifest manifest = new SegmentedMedia.Manifest(bundleId,
                    complete.getName(), videoMimeType(complete.getName()),
                    location.logicalParent, segments);
            try (OutputStream output = new FileOutputStream(manifestPartial)) {
                SegmentedMedia.write(output, manifest);
            }
            if (!manifestPartial.renameTo(manifestComplete)) {
                throw new IOException("Unable to finish segmented media manifest");
            }
            committedManifest = Uri.fromFile(manifestComplete).toString();
            Uri virtual = SegmentedMedia.virtualUri(service, Uri.parse(committedManifest), bundleId);
            if (virtual == null) throw new IOException("Unable to create segmented playback URI");
            return virtual.toString();
        }

        @Override void delete() {
            deleteFile(partialParts); deleteFile(completeParts);
            deleteFile(new ArrayList<>(sidecars.values()));
            if (collapsed && complete.exists()) complete.delete();
            if (manifestPartial.exists()) manifestPartial.delete();
            if (manifestComplete.exists()) manifestComplete.delete();
            SegmentedMedia.cleanupContainer(service, Uri.fromFile(manifestComplete));
            deleteEmptyDirectory(bundleDirectory);
            deleteEmptyDirectory(logicalDirectory);
        }
        private static void deleteFile(List<File> values) {
            for (File value : values) if (value.exists()) value.delete();
        }
        @Override String finalFilename() { return complete.getName(); }
        @Override String folderUri() { return Uri.fromFile(logicalDirectory).toString(); }
        @Override OutputStream openSidecar(String name) throws IOException {
            File sidecar = new File(collapsed ? logicalDirectory : bundleDirectory, name);
            sidecars.put(name, sidecar);
            return new FileOutputStream(sidecar);
        }
        @Override String sidecarUri(String name) {
            File sidecar = sidecars.get(name);
            return Uri.fromFile(sidecar == null
                    ? new File(collapsed ? logicalDirectory : bundleDirectory, name) : sidecar).toString();
        }
        @Override void deleteSidecar(String name) {
            File sidecar = sidecars.remove(name);
            if (sidecar == null) sidecar = new File(
                    collapsed ? logicalDirectory : bundleDirectory, name);
            if (sidecar.exists()) sidecar.delete();
        }
        @Override List<String> assetUris() { return new ArrayList<>(assets); }
        @Override String manifestUri() { return committedManifest; }

        private static List<String> hiddenSegmentedFilenames(
                Context context, File storeDirectory, String logicalParent
        ) {
            List<String> names = new ArrayList<>();
            collectHiddenSegmentedFilenames(context, storeDirectory, logicalParent, names, 0);
            return names;
        }

        private static void collectHiddenSegmentedFilenames(
                Context context, File directory, String logicalParent, List<String> names, int depth
        ) {
            if (directory == null || depth > 8) return;
            File[] children = directory.listFiles();
            if (children == null) return;
            for (File child : children) {
                if (child.isDirectory()) {
                    collectHiddenSegmentedFilenames(context, child, logicalParent, names, depth + 1);
                } else if (child.isFile() && SegmentedMedia.isBundleManifestName(child.getName())) {
                    try {
                        SegmentedMedia.Manifest manifest = SegmentedMedia.read(
                                context, Uri.fromFile(child));
                        if (logicalParent.equalsIgnoreCase(manifest.logicalParent)) {
                            names.add(manifest.filename);
                        }
                    } catch (IOException ignored) { }
                }
            }
        }

        private static void deleteEmptyDirectory(File directory) {
            String[] children = directory == null ? null : directory.list();
            if (directory != null && directory.isDirectory() && children != null && children.length == 0) {
                directory.delete();
            }
        }
    }

    private static final class SegmentedDocumentOutputTarget extends OutputTarget {
        final LocalDownloadsService service;
        final ContentResolver resolver;
        final Uri tree, folder, legacyStoreFolder, bundleFolder;
        final SegmentedLocation location;
        final String filename;
        final String bundleId = UUID.randomUUID().toString();
        final List<Uri> partialParts = new ArrayList<>();
        final List<Uri> completeParts = new ArrayList<>();
        final List<String> assets = new ArrayList<>();
        final Map<String, Uri> sidecars = new HashMap<>();
        RollingOutputStream rolling;
        Uri manifestPartial, manifestComplete;
        Uri collapsedDocument;
        final long segmentBytes;

        SegmentedDocumentOutputTarget(LocalDownloadsService service, Uri tree, String filename,
                                      SegmentedLocation location) throws IOException {
            this(service, tree, filename, location, LocalDownloadsStorageFormat.SEGMENT_BYTES);
        }

        SegmentedDocumentOutputTarget(LocalDownloadsService service, Uri tree, String filename,
                                      SegmentedLocation location, long segmentBytes) throws IOException {
            this.service = service;
            this.resolver = service.getContentResolver();
            this.tree = tree;
            this.location = location;
            this.segmentBytes = segmentBytes;
            Uri root = DocumentsContract.buildDocumentUriUsingTree(
                    tree, DocumentsContract.getTreeDocumentId(tree));
            legacyStoreFolder = DocumentOutputTarget.findChild(
                    resolver, tree, root, SegmentedMedia.STORE_DIRECTORY);
            Uri existingLogicalFolder = DocumentOutputTarget.findChild(
                    resolver, tree, root, location.logicalParent);
            if (existingLogicalFolder == null) existingLogicalFolder = DocumentsContract.createDocument(
                    resolver, root, DocumentsContract.Document.MIME_TYPE_DIR,
                    location.logicalParent);
            if (existingLogicalFolder == null) throw new IOException("Unable to create title folder");
            folder = existingLogicalFolder;
            List<String> existing = existingLogicalFolder == null
                    ? new ArrayList<>()
                    : DocumentOutputTarget.childNames(resolver, tree, existingLogicalFolder);
            existing.addAll(hiddenSegmentedFilenames(
                    service, resolver, tree, folder, location.logicalParent));
            if (legacyStoreFolder != null) existing.addAll(hiddenSegmentedFilenames(
                    service, resolver, tree, legacyStoreFolder, location.logicalParent));
            this.filename = uniqueSegmentedFilename(filename, existing);
            bundleFolder = DocumentsContract.createDocument(resolver, folder,
                    DocumentsContract.Document.MIME_TYPE_DIR,
                    location.bundleFolderName(bundleId));
            if (bundleFolder == null) throw new IOException("Unable to create segmented-media bundle");
        }

        @Override OutputStream open() {
            rolling = new RollingOutputStream(segmentBytes, index -> {
                String name = location.partName(index + 1) + ".partial";
                Uri uri = DocumentsContract.createDocument(
                        resolver, bundleFolder, "application/octet-stream", name);
                if (uri == null) throw new IOException("Unable to create media segment");
                partialParts.add(uri);
                OutputStream stream = resolver.openOutputStream(uri, "w");
                if (stream == null) throw new IOException("Unable to open media segment");
                return stream;
            });
            return rolling;
        }

        @Override String commit() throws IOException {
            if (rolling == null || rolling.sizes().isEmpty()) {
                throw new IOException("Downloaded media is empty");
            }
            List<Long> sizes = rolling.sizes();
            List<SegmentedMedia.Segment> segments = new ArrayList<>();
            for (int index = 0; index < sizes.size(); index++) {
                String finalName = location.partName(index + 1);
                Uri complete = DocumentsContract.renameDocument(
                        resolver, partialParts.get(index), finalName);
                if (complete == null) throw new IOException("Unable to finish media segment " + (index + 1));
                completeParts.add(complete);
            }
            if (completeParts.size() == 1) {
                Uri collapsed = collapseSinglePart();
                if (collapsed != null) {
                    collapsedDocument = collapsed;
                    completeParts.clear();
                    assets.clear();
                    assets.add(collapsed.toString());
                    try { DocumentsContract.deleteDocument(resolver, bundleFolder); }
                    catch (Exception ignored) { }
                    return collapsed.toString();
                }
            }
            for (int index = 0; index < sizes.size(); index++) {
                Uri complete = completeParts.get(index);
                assets.add(complete.toString());
                segments.add(new SegmentedMedia.Segment(complete, sizes.get(index)));
            }
            manifestPartial = DocumentsContract.createDocument(resolver, bundleFolder,
                    "application/json", location.manifestName() + ".partial");
            if (manifestPartial == null) throw new IOException("Unable to create segmented media manifest");
            try (OutputStream output = resolver.openOutputStream(manifestPartial, "w")) {
                if (output == null) throw new IOException("Unable to open segmented media manifest");
                SegmentedMedia.write(output, new SegmentedMedia.Manifest(bundleId, filename,
                        videoMimeType(filename), location.logicalParent, segments));
            }
            manifestComplete = DocumentsContract.renameDocument(resolver, manifestPartial,
                    location.manifestName());
            if (manifestComplete == null) throw new IOException("Unable to finish segmented media manifest");
            Uri virtual = SegmentedMedia.virtualUri(service, manifestComplete, bundleId);
            if (virtual == null) throw new IOException("Unable to create segmented playback URI");
            return virtual.toString();
        }

        @Override void delete() {
            List<Uri> values = new ArrayList<>();
            values.addAll(partialParts); values.addAll(completeParts);
            if (collapsedDocument != null) values.add(collapsedDocument);
            if (manifestPartial != null) values.add(manifestPartial);
            if (manifestComplete != null) values.add(manifestComplete);
            values.addAll(sidecars.values());
            for (Uri value : values) try { DocumentsContract.deleteDocument(resolver, value); }
            catch (Exception ignored) { }
            Uri cleanupManifest = manifestComplete != null ? manifestComplete : manifestPartial;
            if (cleanupManifest == null) {
                String bundleDocumentId = DocumentsContract.getDocumentId(bundleFolder);
                cleanupManifest = DocumentsContract.buildDocumentUriUsingTree(
                        tree, bundleDocumentId + "/" + location.manifestName());
            }
            if (cleanupManifest != null) SegmentedMedia.cleanupContainer(service, cleanupManifest);
        }
        @Override String finalFilename() { return filename; }
        @Override String folderUri() { return folder.toString(); }
        @Override OutputStream openSidecar(String name) throws IOException {
            Uri uri = DocumentsContract.createDocument(
                    resolver, collapsedDocument == null ? bundleFolder : folder,
                    "application/octet-stream", name);
            if (uri == null) throw new IOException("Unable to create subtitle file");
            sidecars.put(name, uri);
            OutputStream stream = resolver.openOutputStream(uri, "w");
            if (stream == null) throw new IOException("Unable to open subtitle file");
            return stream;
        }
        @Override String sidecarUri(String name) throws IOException {
            Uri uri = sidecars.get(name);
            if (uri == null) throw new IOException("Subtitle file was not created");
            return uri.toString();
        }
        @Override void deleteSidecar(String name) {
            Uri uri = sidecars.remove(name);
            if (uri != null) try { DocumentsContract.deleteDocument(resolver, uri); }
            catch (Exception ignored) { }
        }
        @Override List<String> assetUris() { return new ArrayList<>(assets); }
        @Override String manifestUri() {
            return manifestComplete == null ? "" : manifestComplete.toString();
        }

        private Uri collapseSinglePart() {
            Uri part = completeParts.get(0);
            Uri renamed = null;
            try {
                renamed = DocumentsContract.renameDocument(resolver, part, filename);
                if (renamed == null) return null;
                Uri moved = DocumentsContract.moveDocument(
                        resolver, renamed, bundleFolder, folder);
                if (moved != null) return moved;
            } catch (Exception error) {
                Log.i(TAG, "Document provider retained a one-part segmented bundle", error);
            }
            if (renamed != null) {
                try {
                    Uri restored = DocumentsContract.renameDocument(
                            resolver, renamed, location.partName(1));
                    if (restored != null) completeParts.set(0, restored);
                    else completeParts.set(0, renamed);
                } catch (Exception ignored) {
                    completeParts.set(0, renamed);
                }
            }
            return null;
        }

        private static List<String> hiddenSegmentedFilenames(
                Context context, ContentResolver resolver, Uri tree, Uri store,
                String logicalParent
        ) {
            List<String> names = new ArrayList<>();
            try {
                collectHiddenSegmentedFilenames(context, resolver, tree,
                        DocumentsContract.getDocumentId(store), logicalParent, names, 0);
            } catch (Exception error) {
                Log.w(TAG, "Unable to inspect hidden segmented-media filenames", error);
            }
            return names;
        }

        private static void collectHiddenSegmentedFilenames(
                Context context, ContentResolver resolver, Uri tree, String parentId,
                String logicalParent, List<String> names, int depth
        ) {
            if (parentId == null || depth > 8) return;
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
            try (Cursor cursor = resolver.query(children,
                    new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                            DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                            DocumentsContract.Document.COLUMN_MIME_TYPE}, null, null, null)) {
                if (cursor == null) return;
                while (cursor.moveToNext()) {
                    String documentId = cursor.getString(0);
                    String name = cursor.getString(1);
                    String mime = cursor.getString(2);
                    if (documentId == null || name == null) continue;
                    if (DocumentsContract.Document.MIME_TYPE_DIR.equals(mime)) {
                        collectHiddenSegmentedFilenames(context, resolver, tree, documentId,
                                logicalParent, names, depth + 1);
                    } else if (SegmentedMedia.isBundleManifestName(name)) {
                        try {
                            SegmentedMedia.Manifest manifest = SegmentedMedia.read(context,
                                    DocumentsContract.buildDocumentUriUsingTree(tree, documentId));
                            if (logicalParent.equalsIgnoreCase(manifest.logicalParent)) {
                                names.add(manifest.filename);
                            }
                        } catch (IOException ignored) { }
                    }
                }
            }
        }
    }

    private static final class DocumentOutputTarget extends OutputTarget {
        final ContentResolver resolver; final Uri partial; final Uri folder; final String filename;
        Uri complete;
        final Map<String, Uri> sidecars = new HashMap<>();
        DocumentOutputTarget(ContentResolver resolver, Uri tree, String folderName, String filename)
                throws IOException {
            this.resolver = resolver; this.filename = filename;
            Uri root = DocumentsContract.buildDocumentUriUsingTree(
                    tree, DocumentsContract.getTreeDocumentId(tree)
            );
            Uri selectedFolder = findChild(resolver, tree, root, folderName);
            if (selectedFolder == null) selectedFolder = DocumentsContract.createDocument(
                    resolver, root, DocumentsContract.Document.MIME_TYPE_DIR, folderName
            );
            if (selectedFolder == null) throw new IOException("Unable to create title folder");
            folder = selectedFolder;
            Uri created = DocumentsContract.createDocument(
                    resolver, selectedFolder, "application/octet-stream", filename + ".partial"
            );
            if (created == null) throw new IOException("Unable to create downloaded file");
            partial = created;
        }
        @Override OutputStream open() throws IOException {
            OutputStream stream = resolver.openOutputStream(partial, "w");
            if (stream == null) throw new IOException("Unable to open downloaded file");
            return stream;
        }
        @Override String commit() throws IOException {
            Uri renamed = DocumentsContract.renameDocument(resolver, partial, filename);
            if (renamed == null) throw new IOException("Unable to finish downloaded file");
            complete = renamed;
            return renamed.toString();
        }
        @Override void delete() {
            try { DocumentsContract.deleteDocument(resolver, complete == null ? partial : complete); }
            catch (Exception ignored) { }
        }
        @Override String finalFilename() { return filename; }
        @Override String folderUri() { return folder.toString(); }
        @Override OutputStream openSidecar(String name) throws IOException {
            Uri uri = DocumentsContract.createDocument(resolver, folder, "application/octet-stream", name);
            if (uri == null) throw new IOException("Unable to create subtitle file");
            sidecars.put(name, uri);
            OutputStream stream = resolver.openOutputStream(uri, "w");
            if (stream == null) throw new IOException("Unable to open subtitle file");
            return stream;
        }
        @Override String sidecarUri(String name) throws IOException {
            Uri uri = sidecars.get(name);
            if (uri == null) throw new IOException("Subtitle file was not created");
            return uri.toString();
        }
        @Override void deleteSidecar(String name) {
            Uri uri = sidecars.remove(name);
            if (uri != null) try { DocumentsContract.deleteDocument(resolver, uri); }
            catch (Exception ignored) { }
        }
        @Override List<String> assetUris() {
            Uri value = complete == null ? partial : complete;
            return Collections.singletonList(value.toString());
        }
        @Override String manifestUri() { return ""; }
        private static Uri findChild(ContentResolver resolver, Uri tree, Uri parent, String name) {
            String parentId = DocumentsContract.getDocumentId(parent);
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
            try (Cursor cursor = resolver.query(children,
                    new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                            DocumentsContract.Document.COLUMN_DISPLAY_NAME}, null, null, null)) {
                if (cursor == null) return null;
                while (cursor.moveToNext()) if (name.equals(cursor.getString(1))) {
                    return DocumentsContract.buildDocumentUriUsingTree(tree, cursor.getString(0));
                }
            } catch (Exception error) { Log.w(TAG, "Unable to inspect storage folder", error); }
            return null;
        }
        private static List<String> childNames(ContentResolver resolver, Uri tree, Uri parent) {
            List<String> names = new ArrayList<>();
            String parentId = DocumentsContract.getDocumentId(parent);
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, parentId);
            try (Cursor cursor = resolver.query(children,
                    new String[]{DocumentsContract.Document.COLUMN_DISPLAY_NAME}, null, null, null)) {
                if (cursor != null) while (cursor.moveToNext()) names.add(cursor.getString(0));
            } catch (Exception error) {
                Log.w(TAG, "Unable to inspect existing storage filenames", error);
            }
            return names;
        }
    }
}
