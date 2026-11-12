/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.net.Uri;

import java.io.File;
import java.io.IOException;

import app.morphe.extension.shared.utils.Logger;

/** Entry hook for the stock cache reader; the format's online URL is only an optional fallback. */
public final class StreamSwapDataSource {
    private StreamSwapDataSource() {}

    public static boolean isLocal(Uri uri) {
        return "file".equals(uri.getScheme());
    }

    /**
     * Null for unrelated sources, the file URI of the audio copy, or of a stream of a video copy, while it is intact. Otherwise the format's
     * online URL, or an IOException (a failed file open, like stock) when a SABR response never had one.
     */
    public static Uri route(Uri uri, long position, long length) throws IOException {
        StreamSwapSources.Source source = StreamSwapSources.find(uri);
        if (source == null) return null;
        if (!StreamSwap.supported() || StreamSwap.onMainThread() || !source.available) return fallback(source);
        try {
            File file = source.served.file();
            long size = source.served.length();
            if (!file.isFile() || file.length() != size || file.lastModified() != source.fileModified) {
                source.available = false;
                return fallback(source);
            }
            Logger.printDebug(() -> "StreamSwap: source=FILE v=" + source.videoId + " kind=" + source.served.kind()
                    + " itag=" + source.served.itag() + " position=" + position
                    + " length=" + length + " thread=" + Thread.currentThread().getName());
            return Uri.fromFile(file);
        } catch (SecurityException ex) {
            source.available = false;
            return fallback(source);
        }
    }

    private static Uri fallback(StreamSwapSources.Source source) throws IOException {
        return Uri.parse(source.fallback());
    }
}
