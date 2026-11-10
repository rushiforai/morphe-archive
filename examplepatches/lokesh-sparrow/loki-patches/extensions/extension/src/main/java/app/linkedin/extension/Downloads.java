/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.widget.Toast;

/**
 * Saving media through the system DownloadManager, which keeps downloading after LinkedIn is
 * closed and shows the progress in the notification shade.
 */
final class Downloads {

    private Downloads() {
    }

    /** Shows one translated message. */
    static void toast(Context context, String text) {
        CharSequence message = I18n.tr(text);
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }

    /** Confirms that the downloads were queued: one file, or a count of them. */
    static void toastStarted(Context context, int count, boolean video) {
        String where = location(video);
        if (count == 1) {
            toast(context, I18n.f("Downloading to %1$s", where));
        } else {
            toast(context, I18n.f("Saving %1$s files to %2$s", count, where));
        }
    }

    /**
     * The public directory the file type belongs in. With "split photos and videos" on this is the
     * standard Movies/Pictures pair, otherwise the one folder picked in the settings.
     */
    static String baseDir(boolean video) {
        if (!Settings.downloadSplitByType()) return Settings.downloadBaseDir();
        return video ? "Movies" : "Pictures";
    }

    /** The folder path shown to the user, such as "Pictures/LinkedIn". */
    static String location(boolean video) {
        String root = baseDir(video);
        String subfolder = Settings.downloadFolder();
        if (subfolder.isEmpty()) return root;
        return root + "/" + subfolder;
    }

    /**
     * Queues one download and returns whether that worked. A failure is reported to the user and
     * logged; it never propagates, since this runs from a click handler.
     */
    static boolean enqueue(Context context, String url, String baseName, boolean video) {
        try {
            String extension = video ? ".mp4" : ".jpg";
            String fileName = "linkedin_" + baseName + extension;
            String subfolder = Settings.downloadFolder();
            String relativePath = subfolder.isEmpty() ? fileName : subfolder + "/" + fileName;
            DownloadManager.Request request = buildRequest(url, fileName, relativePath, video);
            DownloadManager downloads = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            downloads.enqueue(request);
            return true;
        } catch (Throwable failure) {
            Diagnostics.error("enqueue failed", failure);
            String reason = failure.getMessage();
            toast(context, I18n.f("Download failed: %1$s", reason));
            return false;
        }
    }

    /** The DownloadManager request for one file: named, typed and placed in the chosen folder. */
    private static DownloadManager.Request buildRequest(String url, String fileName, String relativePath, boolean video) {
        Uri source = Uri.parse(url);
        DownloadManager.Request request = new DownloadManager.Request(source);
        request.setTitle(fileName);
        request.setMimeType(video ? "video/mp4" : "image/jpeg");
        // Visible, and replaced by a "download complete" notification when it finishes.
        request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
        request.setDestinationInExternalPublicDir(baseDir(video), relativePath);
        return request;
    }
}
