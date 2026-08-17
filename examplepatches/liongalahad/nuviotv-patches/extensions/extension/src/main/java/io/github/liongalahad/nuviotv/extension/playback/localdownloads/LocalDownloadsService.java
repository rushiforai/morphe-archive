package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ContentResolver;
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
import java.util.List;
import java.util.Locale;
import java.util.Map;

import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

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
            target = OutputTarget.create(this, folder, filename);
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
            target = null;
            LocalDownloadsRuntime.DownloadedEntry entry = new LocalDownloadsRuntime.DownloadedEntry(
                    request.identity, finalUri, folderUri, storedFilename, written, subtitleUris
            );
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

    private static String sanitize(String value, String fallback) {
        String cleaned = value == null ? "" : value.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        while (cleaned.endsWith(".")) cleaned = cleaned.substring(0, cleaned.length() - 1).trim();
        if (cleaned.isEmpty()) cleaned = fallback;
        return cleaned.length() > 120 ? cleaned.substring(0, 120).trim() : cleaned;
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

        static OutputTarget create(LocalDownloadsService service, String folderName, String filename)
                throws IOException {
            Uri root = MorpheStoragePath.uri();
            if ("file".equalsIgnoreCase(root.getScheme())) {
                File directory = new File(root.getPath(), folderName);
                if (!directory.isDirectory() && !directory.mkdirs()) {
                    throw new IOException("Unable to create " + directory.getAbsolutePath());
                }
                return new FileOutputTarget(directory, filename);
            }
            if ("content".equalsIgnoreCase(root.getScheme())) {
                return new DocumentOutputTarget(service.getContentResolver(), root, folderName, filename);
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
    }
}
