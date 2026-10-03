/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.media.MediaExtractor;
import android.media.MediaFormat;

import java.io.File;

/**
 * Normalizes downloaded media to universally shareable codecs.
 *
 * Some Reels are served as AV1 video or xHE-AAC audio, which WhatsApp and
 * other apps reject on share. This normalizer converts such files to
 * H.264 video and AAC-LC audio in a single pass so they can be shared
 * anywhere.
 *
 * Speed tricks applied:
 * - Fast path: files already using H.264 + AAC-LC are returned untouched.
 * - Per-track selectivity: only the tracks that need conversion are
 *   re-encoded; compatible tracks are copied without decoding.
 * - Direct surface: video frames go straight from decoder to encoder
 *   surface because dimensions are preserved (no resize), skipping the
 *   SurfaceTexture and OpenGL path entirely.
 * - Single pass: one extractor read and one muxer write for both tracks.
 */
public final class MediaShareNormalizer {
    private MediaShareNormalizer() {
    }

    /**
     * Returns a file guaranteed to use H.264 video and AAC-LC audio.
     * May return {@code input} itself when it is already compatible.
     * On any failure the original file is returned unchanged.
     */
    public static File normalizeForShare(File input) {
        if (input == null || !input.isFile()) {
            return input;
        }
        try {
            TrackInfo info = inspect(input);
            if (info.videoOk && info.audioOk) {
                return input;
            }
            File output = siblingTempFile(input);
            try {
                ShareableTranscoder.transcode(
                        input,
                        output,
                        !info.videoOk,
                        info.hasAudio && !info.audioOk
                );
                return output;
            } catch (Throwable error) {
                if (output.exists()) {
                    //noinspection ResultOfMethodCallIgnored
                    output.delete();
                }
                return input;
            }
        } catch (Throwable ignored) {
            return input;
        }
    }

    private static File siblingTempFile(File input) {
        File parent = input.getParentFile();
        String name = input.getName();
        int dot = name.lastIndexOf('.');
        String base = dot >= 0 ? name.substring(0, dot) : name;
        return new File(
                parent,
                base + ".shareable.mp4"
        );
    }

    private static TrackInfo inspect(File input) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(input.getAbsolutePath());
            boolean videoOk = true;
            boolean audioOk = true;
            boolean hasAudio = false;
            boolean hasVideo = false;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat format = extractor.getTrackFormat(i);
                String mime = format.getString(MediaFormat.KEY_MIME);
                if (mime == null) continue;
                if (mime.startsWith("video/")) {
                    hasVideo = true;
                    videoOk = isH264(mime, format);
                } else if (mime.startsWith("audio/")) {
                    hasAudio = true;
                    audioOk = isAacLc(mime, format);
                }
            }
            if (!hasVideo) {
                throw new IllegalStateException(
                        "No video track found"
                );
            }
            TrackInfo info = new TrackInfo();
            info.videoOk = videoOk;
            info.audioOk = audioOk;
            info.hasAudio = hasAudio;
            return info;
        } finally {
            extractor.release();
        }
    }

    private static boolean isH264(String mime, MediaFormat format) {
        if ("video/avc".equalsIgnoreCase(mime)) {
            return true;
        }
        return false;
    }

    private static boolean isAacLc(String mime, MediaFormat format) {
        if (!"audio/mp4a-latm".equalsIgnoreCase(mime)) {
            return false;
        }
        try {
            if (format.containsKey(MediaFormat.KEY_AAC_PROFILE)) {
                int profile = format.getInteger(
                        MediaFormat.KEY_AAC_PROFILE
                );
                return profile ==
                        android.media.MediaCodecInfo.CodecProfileLevel
                                .AACObjectLC;
            }
        } catch (Throwable ignored) {
        }
        return true;
    }

    private static final class TrackInfo {
        boolean videoOk;
        boolean audioOk;
        boolean hasAudio;
    }
}
