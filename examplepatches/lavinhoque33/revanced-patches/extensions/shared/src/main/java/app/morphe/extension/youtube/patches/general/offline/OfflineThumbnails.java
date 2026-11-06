/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.content.Context;
import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import app.morphe.extension.shared.utils.Logger;

/**
 * Saves the original thumbnail of a video to {@code Pictures}, in the thumbnail folder of the
 * settings. The image bytes are stored as YouTube serves them, without decoding or re-encoding.
 * Saved thumbnails are not library entries: the library lists what the player can play.
 */
final class OfflineThumbnails {
    /** Largest first. {@code maxresdefault} only exists for videos uploaded in HD. */
    private static final String[] SIZES = {"maxresdefault", "sddefault", "hqdefault"};
    private static final String URL_FORMAT = "https://i.ytimg.com/vi/%s/%s.jpg";
    private static final int TIMEOUT_MS = 15_000;
    private static final int MAX_IMAGE_BYTES = 8 * 1024 * 1024;

    private OfflineThumbnails() {
    }

    /** An image as downloaded, with the file extension its bytes call for. */
    record Image(byte[] bytes, String extension) {
    }

    /**
     * Must be called off the main thread.
     *
     * @return The largest thumbnail the server has, or null if none could be downloaded.
     */
    @Nullable
    static Image fetchOriginal(String videoId) {
        for (String size : SIZES) {
            String url = String.format(Locale.US, URL_FORMAT, videoId, size);
            byte[] bytes = fetch(url);
            String extension = bytes == null ? null : extensionOf(bytes);
            if (extension != null) return new Image(bytes, extension);
        }
        return null;
    }

    /**
     * Writes the image to the thumbnail folder as {@code baseName} plus its extension. An image that is
     * already saved under that name is kept, so a video and its audio download share one thumbnail.
     *
     * @return The uri of the saved image.
     */
    static Uri save(Context context, Image image, String baseName) throws IOException {
        String displayName = baseName + "." + image.extension();
        String folder = OfflineOptions.thumbnailFolder();
        Uri existing = OfflineMediaStore.find(context, OfflineMediaStore.Collection.IMAGE, folder, displayName);
        if (existing != null) return existing;

        OfflineMediaStore.Pending pending = OfflineMediaStore.create(context, OfflineMediaStore.Collection.IMAGE,
                folder, displayName);
        try {
            // Not closed: closing the stream would close the descriptor that commit() closes.
            FileOutputStream output = new FileOutputStream(pending.fileDescriptor());
            output.write(image.bytes());
            output.flush();
            return pending.commit();
        } catch (Throwable ex) {
            pending.abort();
            throw ex;
        }
    }

    /** @return {@code jpg}, {@code webp} or {@code png}, or null for anything that is not an image. */
    @Nullable
    static String extensionOf(byte[] bytes) {
        if (bytes.length > 3 && (bytes[0] & 0xFF) == 0xFF && (bytes[1] & 0xFF) == 0xD8 && (bytes[2] & 0xFF) == 0xFF) {
            return "jpg";
        }
        if (bytes.length > 12 && bytes[0] == 'R' && bytes[1] == 'I' && bytes[2] == 'F' && bytes[3] == 'F'
                && bytes[8] == 'W' && bytes[9] == 'E' && bytes[10] == 'B' && bytes[11] == 'P') {
            return "webp";
        }
        if (bytes.length > 8 && (bytes[0] & 0xFF) == 0x89 && bytes[1] == 'P' && bytes[2] == 'N' && bytes[3] == 'G') {
            return "png";
        }
        return null;
    }

    @Nullable
    private static byte[] fetch(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) return null;
            try (InputStream input = connection.getInputStream()) {
                return readAll(input);
            }
        } catch (IOException ex) {
            Logger.printDebug(() -> "Could not fetch the thumbnail " + url, ex);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static byte[] readAll(InputStream input) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int read;
        while ((read = input.read(buffer)) != -1) {
            bytes.write(buffer, 0, read);
            if (bytes.size() > MAX_IMAGE_BYTES) throw new IOException("Thumbnail too large");
        }
        return bytes.toByteArray();
    }
}
