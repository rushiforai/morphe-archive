/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-22.
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
    private static final String PLAYBACK_CHUNK_LOADER = "ExoPlayer:Loader:ChunkSampleStream";

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
        if (!StreamSwap.supported() || StreamSwap.onMainThread() || !source.available) return fallback(uri, source);
        try {
            File file = source.served.file();
            long size = source.served.length();
            if (!file.isFile() || file.length() != size || file.lastModified() != source.fileModified) {
                source.available = false;
                return fallback(uri, source);
            }
            Logger.printDebug(() -> "StreamSwap: source=FILE v=" + source.videoId + " kind=" + source.served.kind()
                    + " itag=" + source.served.itag() + " position=" + position
                    + " length=" + length + " thread=" + Thread.currentThread().getName());
            return Uri.fromFile(file);
        } catch (SecurityException ex) {
            source.available = false;
            return fallback(uri, source);
        }
    }

    /** A format may be offered long before it is selected. This supplies only the format identity, not evidence. */
    public static PlaybackSourceInspector.LocalFormat inspectionFormat(Uri uri) {
        StreamSwapSources.Source source = StreamSwapSources.find(uri);
        return source == null ? null : source.inspectionFormat;
    }

    /** Called only for a new plain file reader, with the original chunk URI rather than the resolved file URI. */
    public static PlaybackSourceInspector.Read inspectFileRead(Uri uri) {
        if (!isPlaybackChunk()) return null;

        StreamSwapSources.Source source = StreamSwapSources.find(uri);
        return source == null || !source.available || source.inspectionFormat == null ? null
                : PlaybackSourceInspector.openLocal(uri.getQueryParameter("cpn"), source.inspectionFormat);
    }

    private static boolean isPlaybackChunk() {
        // Exclude stock's separate response/cache prefetch readers, even for the same recording.
        return PLAYBACK_CHUNK_LOADER.equals(Thread.currentThread().getName());
    }

    private static Uri fallback(Uri original, StreamSwapSources.Source source) throws IOException {
        if (source.inspectionFormat != null && isPlaybackChunk()) {
            PlaybackSourceInspector.openFallback(original.getQueryParameter("cpn"), source.inspectionFormat);
        }
        return Uri.parse(source.fallback());
    }
}
