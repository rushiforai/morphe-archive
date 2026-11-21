/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.downloads;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.CancellationSignal;
import android.os.OperationCanceledException;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.DocumentsContract;
import android.provider.DocumentsContract.Document;
import android.provider.MediaStore;

import androidx.annotation.Nullable;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.utils.Logger;

/** Copies existing, published MediaStore audio/video. No download, source write or app-private path. */
public final class PortableExport {
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(
            task -> new Thread(task, "rvx-device-export"));
    private static final String[] DOCUMENT_COLUMNS = {
            Document.COLUMN_DISPLAY_NAME, Document.COLUMN_MIME_TYPE, Document.COLUMN_FLAGS
    };
    private static final String[] CHILD_COLUMNS = {Document.COLUMN_DOCUMENT_ID, Document.COLUMN_DISPLAY_NAME};
    private static final String[] MEDIA_COLUMNS = switch (Build.VERSION.SDK_INT) {
        case 26, 27, 28 -> new String[]{MediaStore.MediaColumns.DISPLAY_NAME,
                MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.SIZE};
        case 29 -> new String[]{MediaStore.MediaColumns.DISPLAY_NAME,
                MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.SIZE, MediaStore.MediaColumns.IS_PENDING};
        default -> new String[]{MediaStore.MediaColumns.DISPLAY_NAME,
                MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.SIZE,
                MediaStore.MediaColumns.IS_PENDING, MediaStore.MediaColumns.IS_TRASHED};
    };

    public record Request(String title, boolean playlist, List<Uri> media) {
        public Request {
            media = List.copyOf(media);
            if (media.isEmpty() || (!playlist && media.size() != 1)) {
                throw new IllegalArgumentException("An export needs a file or a nonempty playlist");
            }
            for (Uri uri : media) {
                if (!isPublicMedia(uri)) throw new IllegalArgumentException("Not an external MediaStore media row");
            }
        }
    }

    enum Outcome { FINISHED, CANCELLED, DESTINATION_FAILED }

    record Progress(int processed, int copied, @Nullable String name, long bytes, long size) {}

    record Result(Outcome outcome, int copied, int missing, int total, boolean wrotePlaylist,
                  @Nullable String folderName, int cleanupFailures) {}

    private record Media(String name, String mime, long size) {}

    private record Created(Uri uri, String name) {}

    private PortableExport() {}

    public static boolean isPublicMedia(Uri uri) {
        if (!ContentResolver.SCHEME_CONTENT.equals(uri.getScheme()) || !MediaStore.AUTHORITY.equals(uri.getAuthority())) {
            return false;
        }
        List<String> path = uri.getPathSegments();
        if (path.size() != 4 || "internal".equals(path.get(0)) || !"media".equals(path.get(2))
                || !("audio".equals(path.get(1)) || "video".equals(path.get(1)))) return false;
        try {
            return ContentUris.parseId(uri) > 0;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    static Job enqueue(ContentResolver resolver, Uri tree, Request request) {
        Job job = new Job(resolver, tree, request);
        WORKER.execute(job::run);
        return job;
    }

    // Releasing a retired grant waits for earlier exports that may still be using it.
    static void afterQueuedExports(Runnable action) {
        WORKER.execute(action);
    }

    static final class Job {
        private final ContentResolver resolver;
        private final Uri tree;
        private final Request request;
        private final CancellationSignal signal = new CancellationSignal();
        private int copied;
        private int missing;
        private int cleanupFailures;
        private long lastUpdate;
        volatile Progress progress = new Progress(0, 0, null, 0, -1);
        @Nullable volatile Result result;

        Job(ContentResolver resolver, Uri tree, Request request) {
            this.resolver = resolver;
            this.tree = tree;
            this.request = request;
        }

        void cancel() {
            signal.cancel();
        }

        boolean cancelling() {
            return signal.isCanceled();
        }

        void run() {
            Outcome outcome = Outcome.FINISHED;
            Created folder = null;
            String destinationName = null;
            boolean wrotePlaylist = false;
            try {
                signal.throwIfCanceled();
                Uri root = DocumentsContract.buildDocumentUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
                Directory destination = new Directory(root);
                destinationName = destination.name;
                if (request.playlist()) {
                    folder = destination.create(request.title(), Document.MIME_TYPE_DIR);
                    destination = new Directory(folder.uri());
                }
                List<String> paths = request.playlist() ? new ArrayList<>(request.media().size()) : List.of();
                // A repeated playlist entry references its first copy; the M3U8 still contains both positions.
                Map<Uri, String> alreadyCopied = request.playlist() ? new HashMap<>() : Map.of();
                byte[] buffer = new byte[128 * 1024];
                for (Uri source : request.media()) {
                    signal.throwIfCanceled();
                    String name = alreadyCopied.get(source);
                    if (name == null) {
                        try {
                            name = copy(source, destination, buffer);
                        } catch (SourceFailure ex) {
                            Logger.printDebug(() -> "Published export source is unavailable", ex);
                            missing++;
                            update(null, 0, -1);
                            continue;
                        }
                    }
                    if (request.playlist()) {
                        alreadyCopied.putIfAbsent(source, name);
                        paths.add(name);
                    }
                    copied++;
                    update(null, 0, -1);
                }
                if (folder != null && !paths.isEmpty()) {
                    writePlaylist(destination, paths);
                    wrotePlaylist = true;
                }
            } catch (OperationCanceledException ex) {
                outcome = Outcome.CANCELLED;
            } catch (IOException | RuntimeException ex) {
                outcome = cancelling() ? Outcome.CANCELLED : Outcome.DESTINATION_FAILED;
                Logger.printDebug(() -> "Document tree export could not finish", ex);
            } finally {
                if (folder != null && copied == 0) {
                    if (delete(folder.uri())) folder = null;
                }
                String folderName = request.playlist() ? (folder == null ? null : folder.name()) : destinationName;
                result = new Result(outcome, copied, missing, request.media().size(), wrotePlaylist,
                        folderName, cleanupFailures);
            }
        }

        private String copy(Uri source, Directory destination, byte[] buffer) throws IOException {
            Media media = readMedia(source);
            update(media.name(), 0, media.size());
            InputStream input = openInput(source);
            Created target = null;
            boolean complete = false;
            try {
                target = destination.create(media.name(), media.mime());
                try (OutputStream output = openOutput(target.uri())) {
                    long bytes = 0;
                    while (true) {
                        signal.throwIfCanceled();
                        int count = read(input, buffer);
                        if (count < 0) break;
                        output.write(buffer, 0, count);
                        bytes += count;
                        if (SystemClock.elapsedRealtime() - lastUpdate >= 200) update(media.name(), bytes, media.size());
                    }
                    if (bytes == 0 || (media.size() > 0 && bytes != media.size())) {
                        throw new SourceFailure("The published file was empty or changed during export");
                    }
                    signal.throwIfCanceled();
                }
                signal.throwIfCanceled();
                complete = true;
                return target.name();
            } finally {
                if (!complete && target != null) delete(target.uri());
                try {
                    input.close();
                } catch (IOException ex) {
                    Logger.printDebug(() -> "Could not close the published export source", ex);
                }
            }
        }

        private static int read(InputStream input, byte[] buffer) throws SourceFailure {
            try {
                return input.read(buffer);
            } catch (IOException ex) {
                throw new SourceFailure(ex);
            }
        }

        private Media readMedia(Uri uri) throws SourceFailure {
            try (Cursor cursor = resolver.query(uri, MEDIA_COLUMNS, null, null, null, signal)) {
                if (cursor != null && cursor.moveToFirst() && (MEDIA_COLUMNS.length < 4 || cursor.getInt(3) == 0)
                        && (MEDIA_COLUMNS.length < 5 || cursor.getInt(4) == 0)) {
                    String name = cursor.getString(0);
                    String mime = cursor.getString(1);
                    if (name != null && !name.isBlank() && mime != null
                            && (mime.startsWith("audio/") || mime.startsWith("video/"))) {
                        return new Media(name, mime, cursor.isNull(2) ? -1 : cursor.getLong(2));
                    }
                }
            } catch (OperationCanceledException ex) {
                throw ex;
            } catch (RuntimeException ex) {
                throw new SourceFailure(ex);
            }
            throw new SourceFailure("No published media row for this entry");
        }

        private InputStream openInput(Uri uri) throws SourceFailure {
            try {
                ParcelFileDescriptor descriptor = resolver.openFileDescriptor(uri, "r", signal);
                if (descriptor != null) return new ParcelFileDescriptor.AutoCloseInputStream(descriptor);
            } catch (OperationCanceledException ex) {
                throw ex;
            } catch (IOException | RuntimeException ex) {
                throw new SourceFailure(ex);
            }
            throw new SourceFailure("No stream for this published media row");
        }

        private OutputStream openOutput(Uri uri) throws IOException {
            signal.throwIfCanceled();
            // "rw" implies random access; a document provider can serve "w" through a pipe.
            ParcelFileDescriptor descriptor = resolver.openFileDescriptor(uri, "w", signal);
            if (descriptor == null) throw new IOException("No output stream for the created document");
            return new ParcelFileDescriptor.AutoCloseOutputStream(descriptor);
        }

        private void writePlaylist(Directory directory, List<String> paths) throws IOException {
            update(null, 0, -1);
            Created document = directory.create(request.title() + ".m3u8", "application/vnd.apple.mpegurl");
            boolean complete = false;
            try {
                try (BufferedWriter output = new BufferedWriter(
                        new OutputStreamWriter(openOutput(document.uri()), StandardCharsets.UTF_8))) {
                    output.write("#EXTM3U\n");
                    for (String path : paths) {
                        signal.throwIfCanceled();
                        output.write("./");
                        output.write(path);
                        output.write('\n');
                    }
                }
                signal.throwIfCanceled();
                complete = true;
            } finally {
                if (!complete) delete(document.uri());
            }
        }

        private boolean delete(Uri uri) {
            try {
                if (DocumentsContract.deleteDocument(resolver, uri)) return true;
            } catch (IOException | RuntimeException ex) {
                Logger.printDebug(() -> "Could not clean up the incomplete export document", ex);
            }
            cleanupFailures++;
            return false;
        }

        private void update(@Nullable String name, long bytes, long size) {
            lastUpdate = SystemClock.elapsedRealtime();
            progress = new Progress(copied + missing, copied, name, bytes, size);
        }

        private final class Directory {
            private final Uri uri;
            private final String id;
            private final String name;
            private final Set<String> childIds = new HashSet<>();
            private final Set<String> names = new HashSet<>();

            Directory(Uri uri) throws IOException {
                this.uri = uri;
                id = DocumentsContract.getDocumentId(uri);
                try (Cursor cursor = resolver.query(uri, DOCUMENT_COLUMNS, null, signal)) {
                    if (cursor == null || !cursor.moveToFirst() || !Document.MIME_TYPE_DIR.equals(cursor.getString(1))
                            || (cursor.getInt(2) & Document.FLAG_DIR_SUPPORTS_CREATE) == 0) {
                        throw new IOException("The selected folder does not allow creating files");
                    }
                    name = cursor.getString(0);
                }
                Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, id);
                try (Cursor cursor = resolver.query(children, CHILD_COLUMNS, null, signal)) {
                    if (cursor == null) throw new IOException("Could not list the selected folder");
                    while (cursor.moveToNext()) {
                        signal.throwIfCanceled();
                        childIds.add(cursor.getString(0));
                        String name = cursor.getString(1);
                        if (name != null) names.add(ExportNames.key(name));
                    }
                }
            }

            Created create(String name, String mime) throws IOException {
                signal.throwIfCanceled();
                String desired = ExportNames.unused(name, Document.MIME_TYPE_DIR.equals(mime), names);
                Uri document = DocumentsContract.createDocument(resolver, uri, mime, desired);
                if (document == null || !tree.getAuthority().equals(document.getAuthority())) {
                    throw new IOException("The provider did not create a document");
                }
                String documentId = DocumentsContract.getDocumentId(document);
                if (id.equals(documentId) || DocumentsContract.getTreeDocumentId(tree).equals(documentId)
                        || !childIds.add(documentId)) {
                    // Never open or delete a document which already existed in the folder.
                    throw new IOException("The provider returned an existing document");
                }
                boolean valid = false;
                try (Cursor cursor = resolver.query(document, DOCUMENT_COLUMNS, null, signal)) {
                    if (cursor == null || !cursor.moveToFirst()) throw new IOException("Unable to read the new document");
                    if ((cursor.getInt(2) & Document.FLAG_SUPPORTS_DELETE) == 0) {
                        throw new IOException("The provider does not allow cleaning up unfinished documents");
                    }
                    String actual = cursor.getString(0);
                    if (actual == null || !names.add(ExportNames.key(actual))) {
                        throw new IOException("The provider did not create a distinct file name");
                    }
                    ExportNames.requirePortable(actual);
                    valid = true;
                    return new Created(document, actual);
                } finally {
                    if (!valid) delete(document);
                }
            }
        }
    }

    private static final class SourceFailure extends IOException {
        SourceFailure(String message) {
            super(message);
        }

        SourceFailure(Throwable cause) {
            super(cause);
        }
    }
}
