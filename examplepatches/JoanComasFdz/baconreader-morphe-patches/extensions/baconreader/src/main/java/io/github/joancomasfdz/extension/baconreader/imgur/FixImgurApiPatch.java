// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.imgur;

import java.net.HttpURLConnection;

@SuppressWarnings("unused")
public final class FixImgurApiPatch {
    private FixImgurApiPatch() {
    }

    /**
     * The app uploads the raw file without a content type, so Android sends it as
     * "application/x-www-form-urlencoded" and Imgur's API answers 400 Bad Request.
     */
    public static void setUploadContentType(HttpURLConnection connection) {
        connection.setRequestProperty("Content-Type", "application/octet-stream");
    }

    /**
     * Whether an image of an Imgur album is a video. Imgur's API sends "mp4" empty for a still image,
     * which BaconReader takes for a video because it only checks it for null.
     */
    public static boolean isVideo(String mp4) {
        return mp4 != null && !mp4.isEmpty();
    }
}
