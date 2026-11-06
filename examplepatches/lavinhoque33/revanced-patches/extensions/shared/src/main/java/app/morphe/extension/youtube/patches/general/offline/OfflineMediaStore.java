/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.PendingIntent;
import android.app.RecoverableSecurityException;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import java.util.Locale;

import app.morphe.extension.shared.utils.Logger;

/**
 * Stores finished downloads: videos below {@code Movies}, audio below {@code Music} and thumbnails
 * below {@code Pictures}, each in the folder of its setting. Android 10+ uses MediaStore, which
 * needs no storage permission for files the app inserts itself. Older versions use the
 * app-specific directories of the same names, which need no permission either.
 */
@SuppressLint("NewApi")
final class OfflineMediaStore {
    /** The MediaStore collection of a download, and the top-level directory it must be in. */
    enum Collection {
        VIDEO(Environment.DIRECTORY_MOVIES),
        AUDIO(Environment.DIRECTORY_MUSIC),
        IMAGE(Environment.DIRECTORY_PICTURES),
        SUBTITLE(Environment.DIRECTORY_MOVIES);

        final String directory;

        Collection(String directory) {
            this.directory = directory;
        }

        Uri contentUri() {
            final String volume = MediaStore.VOLUME_EXTERNAL_PRIMARY;
            return switch (this) {
                case VIDEO -> MediaStore.Video.Media.getContentUri(volume);
                case AUDIO -> MediaStore.Audio.Media.getContentUri(volume);
                case IMAGE -> MediaStore.Images.Media.getContentUri(volume);
                case SUBTITLE -> MediaStore.Files.getContentUri(volume);
            };
        }

        /** The folder as the user sees it, e.g. {@code Movies/RVX/Video}. */
        String relativePath(String folder) {
            return directory + "/" + folder;
        }
    }

    private OfflineMediaStore() {
    }

    /** A download being written to its final place. Either {@link #commit} or {@link #abort} it. */
    static final class Pending {
        private final ContentResolver resolver;
        private final Uri uri;
        /** Pre-Q only: the file being written, renamed over {@link #destination} on commit. */
        private final File file;
        private final File destination;
        private final ParcelFileDescriptor descriptor;

        private Pending(ContentResolver resolver, @Nullable Uri uri, @Nullable File file,
                        @Nullable File destination, ParcelFileDescriptor descriptor) {
            this.resolver = resolver;
            this.uri = uri;
            this.file = file;
            this.destination = destination;
            this.descriptor = descriptor;
        }

        /** Open for reading and writing, empty. Owned by this object. */
        FileDescriptor fileDescriptor() {
            return descriptor.getFileDescriptor();
        }

        /** Size of the video written so far. */
        long length() {
            return descriptor.getStatSize();
        }

        /** Publishes the video. @return The uri of the saved video. */
        Uri commit() throws IOException {
            descriptor.close();
            if (uri == null) {
                if (!file.renameTo(destination)) {
                    //noinspection ResultOfMethodCallIgnored
                    file.delete();
                    throw new IOException("Could not publish the video");
                }
                return Uri.fromFile(destination);
            }
            ContentValues done = new ContentValues();
            done.put(MediaStore.Video.Media.IS_PENDING, 0);
            if (resolver.update(uri, done, null, null) < 1) throw new IOException("Could not publish the video");
            return uri;
        }

        /** Discards the video. Does not throw. */
        void abort() {
            try {
                descriptor.close();
            } catch (IOException ignored) {
            }
            try {
                if (uri != null) resolver.delete(uri, null, null);
                //noinspection ResultOfMethodCallIgnored
                else file.delete();
            } catch (RuntimeException ex) {
                Logger.printDebug(() -> "Could not remove the unfinished video", ex);
            }
        }
    }

    static String mimeType(String displayName) {
        String name = displayName.toLowerCase(Locale.ROOT);
        String extension = name.substring(name.lastIndexOf('.') + 1);
        return switch (extension) {
            case "webm" -> "video/webm";
            case "opus" -> "audio/ogg";
            case "m4a" -> "audio/mp4";
            case "jpg" -> "image/jpeg";
            case "webp" -> "image/webp";
            case "png" -> "image/png";
            case "srt" -> "application/x-subrip";
            case "vtt" -> "text/vtt";
            default -> "video/mp4";
        };
    }

    static void retainSubtitleMime(Context context, Uri uri, String displayName) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R || !"content".equals(uri.getScheme())
                || !"text/vtt".equals(mimeType(displayName))) return;

        // Publishing forces a scan, which can replace an unrecognised .vtt MIME with octet-stream.
        // Android's provider permits MIME-only updates. Disable placement recomputation so this
        // update does not add DATA and trigger a second scan. No file is moved or renamed.
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.MIME_TYPE, "text/vtt");
        Bundle options = new Bundle();
        options.putBoolean("android:query-arg-allow-movement", false);
        try {
            if (context.getContentResolver().update(uri, values, options) < 1) {
                Logger.printInfo(() -> "MediaProvider did not retain the VTT MIME type");
            }
        } catch (RuntimeException ex) {
            // The published sidecar remains usable even if an OEM provider declines this metadata update.
            Logger.printInfo(() -> "MediaProvider could not retain the VTT MIME type", ex);
        }
    }

    /**
     * @param folder Relative to the collection's directory, already sanitized by {@link OfflineOptions}.
     */
    static Pending create(Context context, Collection collection, String folder, String displayName)
            throws IOException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return createMediaStoreItem(context, collection, collection.relativePath(folder), displayName);
        }

        File directory = new File(context.getExternalFilesDir(collection.directory), folder);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Could not create " + directory);
        }
        File destination = new File(directory, displayName);
        File partial = new File(directory, displayName + "." + System.nanoTime() + ".part");
        ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(partial,
                ParcelFileDescriptor.MODE_READ_WRITE | ParcelFileDescriptor.MODE_CREATE
                        | ParcelFileDescriptor.MODE_TRUNCATE);
        return new Pending(context.getContentResolver(), null, partial, destination, descriptor);
    }

    /**
     * Must be called off the main thread.
     *
     * @return The uri of a readable file with this name in the folder, or null if there is none.
     */
    @Nullable
    static Uri find(Context context, Collection collection, String folder, String displayName) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            File file = new File(new File(context.getExternalFilesDir(collection.directory), folder), displayName);
            return file.isFile() ? Uri.fromFile(file) : null;
        }

        Uri contentUri = collection.contentUri();
        try (Cursor cursor = context.getContentResolver().query(contentUri,
                new String[]{MediaStore.MediaColumns._ID},
                MediaStore.MediaColumns.DISPLAY_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + "=?",
                new String[]{displayName, collection.relativePath(folder) + "/"}, null)) {
            while (cursor != null && cursor.moveToNext()) {
                Uri row = ContentUris.withAppendedId(contentUri, cursor.getLong(0));
                if (exists(context, row.toString())) return row;
            }
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not look up " + displayName, ex);
        }
        return null;
    }

    private static Pending createMediaStoreItem(Context context, Collection collection, String relativePath,
                                                String displayName) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, displayName);
        values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType(displayName));
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, relativePath);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);

        Uri contentUri = collection.contentUri();
        deleteStaleRows(context, contentUri, relativePath, displayName);
        Uri uri = resolver.insert(contentUri, values);
        if (uri == null) throw new IOException("MediaStore refused the new file");
        try {
            // "t" truncates: a leftover of an earlier attempt must not survive.
            ParcelFileDescriptor descriptor = resolver.openFileDescriptor(uri, "rwt");
            if (descriptor == null) throw new IOException("Could not open the MediaStore item");
            return new Pending(resolver, uri, null, null, descriptor);
        } catch (IOException | RuntimeException ex) {
            resolver.delete(uri, null, null);
            throw ex;
        }
    }

    /**
     * A row whose file was removed behind MediaStore's back (root shell, raw-path file managers)
     * still owns the path, and publishing a new file with the same name then fails.
     */
    private static void deleteStaleRows(Context context, Uri collection, String relativePath, String displayName) {
        ContentResolver resolver = context.getContentResolver();
        try (Cursor cursor = resolver.query(collection,
                new String[]{MediaStore.MediaColumns._ID},
                MediaStore.MediaColumns.DISPLAY_NAME + "=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + "=?",
                new String[]{displayName, relativePath + "/"}, null)) {
            if (cursor == null) return;
            while (cursor.moveToNext()) {
                Uri row = ContentUris.withAppendedId(collection, cursor.getLong(0));
                if (exists(context, row.toString())) continue;
                Logger.printInfo(() -> "Removing the stale MediaStore row " + row);
                resolver.delete(row, null, null);
            }
        } catch (Exception ex) {
            // Not owned by the app (e.g. after a reinstall). Publishing may still fail then.
            Logger.printDebug(() -> "Could not clean up stale rows of " + displayName, ex);
        }
    }

    /** Must be called off the main thread. */
    static boolean exists(Context context, String uriString) {
        Uri uri = Uri.parse(uriString);
        if ("file".equals(uri.getScheme())) {
            String path = uri.getPath();
            return path != null && new File(path).isFile();
        }
        // Open the file rather than query the row: deleting with root or raw-path file managers
        // leaves a stale MediaStore row behind.
        try (ParcelFileDescriptor descriptor = context.getContentResolver().openFileDescriptor(uri, "r")) {
            return descriptor != null;
        } catch (FileNotFoundException ex) {
            return false;
        } catch (SecurityException ex) {
            // Not readable anymore, but not proven deleted either.
            return true;
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not open " + uriString, ex);
            return false;
        }
    }

    /**
     * Deletes the file. Files the app does not own anymore (e.g. after a reinstall) need the
     * user's consent, which is requested with the platform delete dialog.
     *
     * @return True if the file is gone now, false if a consent dialog was shown instead.
     */
    static boolean delete(Activity activity, String uriString) {
        Uri uri = Uri.parse(uriString);
        if ("file".equals(uri.getScheme())) {
            String path = uri.getPath();
            if (path != null) {
                //noinspection ResultOfMethodCallIgnored
                new File(path).delete();
            }
            return true;
        }
        ContentResolver resolver = activity.getContentResolver();
        try {
            resolver.delete(uri, null, null);
            return true;
        } catch (SecurityException ex) {
            try {
                PendingIntent request = null;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    request = MediaStore.createDeleteRequest(resolver, Collections.singletonList(uri));
                } else if (ex instanceof RecoverableSecurityException recoverable) {
                    request = recoverable.getUserAction().getActionIntent();
                }
                if (request != null) {
                    activity.startIntentSenderForResult(request.getIntentSender(), 0, null, 0, 0, 0);
                    return false;
                }
            } catch (Exception requestException) {
                Logger.printException(() -> "Could not request deletion of " + uriString, requestException);
            }
            Logger.printException(() -> "Could not delete " + uriString, ex);
            return false;
        }
    }
}
