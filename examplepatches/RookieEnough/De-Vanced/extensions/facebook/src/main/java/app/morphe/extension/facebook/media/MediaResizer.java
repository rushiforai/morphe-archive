/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.media.MediaExtractor;
import android.media.MediaFormat;

import java.io.File;

/**
 * Normalizes downloaded video dimensions to the configured De-Vanced target.
 *
 * Conversion is delegated to a hardware decoder-to-encoder surface pipeline;
 * decoded frames never become Java Bitmaps.
 */
public final class MediaResizer {
    private MediaResizer() {
    }

    public static Result resizeIfNeeded(
            File input,
            File output,
            int targetShortEdge
    ) throws Exception {
        if (input == null || !input.isFile()) {
            throw new IllegalArgumentException(
                    "Video source does not exist"
            );
        }
        Result source = inspect(input, false);
        if (targetShortEdge <= 0 ||
                Math.min(source.width, source.height) ==
                        targetShortEdge) {
            return source;
        }
        return HardwareVideoTranscoder.transcode(
                input,
                output,
                targetShortEdge
        );
    }

    private static Result inspect(
            File file,
            boolean transcoded
    ) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(file.getAbsolutePath());
            int track = findTrack(extractor, "video/");
            if (track < 0) {
                throw new IllegalStateException(
                        "Video track not found"
                );
            }
            MediaFormat format = extractor.getTrackFormat(track);
            return new Result(
                    file,
                    integer(format, MediaFormat.KEY_WIDTH, 0),
                    integer(format, MediaFormat.KEY_HEIGHT, 0),
                    transcoded
            );
        } finally {
            extractor.release();
        }
    }

    private static int findTrack(
            MediaExtractor extractor,
            String prefix
    ) {
        for (int index = 0;
             index < extractor.getTrackCount();
             index++) {
            MediaFormat format = extractor.getTrackFormat(index);
            String mime = format.getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(prefix)) {
                return index;
            }
        }
        return -1;
    }

    private static int integer(
            MediaFormat format,
            String key,
            int fallback
    ) {
        try {
            return format.containsKey(key)
                    ? format.getInteger(key)
                    : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static final class Result {
        public final File file;
        public final int width;
        public final int height;
        public final boolean transcoded;

        Result(
                File file,
                int width,
                int height,
                boolean transcoded
        ) {
            this.file = file;
            this.width = width;
            this.height = height;
            this.transcoded = transcoded;
        }

        public int qualityEdge() {
            return MediaVariant.normalizeQualityEdge(
                    Math.min(width, height)
            );
        }
    }
}
