/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;

import java.io.File;
import java.nio.ByteBuffer;

public final class Mp4TrackMuxer {
    private static final int DEFAULT_BUFFER_SIZE = 4 * 1024 * 1024;
    private static final int MAX_BUFFER_SIZE = 16 * 1024 * 1024;

    private Mp4TrackMuxer() {
    }

    public static Result mux(
            File videoFile,
            File audioFile,
            File outputFile
    ) throws Exception {
        if (outputFile.exists() && !outputFile.delete()) {
            throw new IllegalStateException("Could not replace merged media");
        }
        File parent = outputFile.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Could not create merge cache");
        }

        MediaExtractor videoExtractor = new MediaExtractor();
        MediaExtractor audioExtractor = new MediaExtractor();
        MediaMuxer muxer = null;
        boolean started = false;
        try {
            videoExtractor.setDataSource(videoFile.getAbsolutePath());
            audioExtractor.setDataSource(audioFile.getAbsolutePath());

            int videoTrack = findTrack(videoExtractor, "video/");
            int audioTrack = findTrack(audioExtractor, "audio/");
            if (videoTrack < 0) {
                throw new IllegalStateException("Downloaded video has no video track");
            }
            if (audioTrack < 0) {
                throw new IllegalStateException("Downloaded audio has no audio track");
            }

            MediaFormat videoFormat =
                    videoExtractor.getTrackFormat(videoTrack);
            MediaFormat audioFormat =
                    audioExtractor.getTrackFormat(audioTrack);
            muxer = new MediaMuxer(
                    outputFile.getAbsolutePath(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4
            );
            int outputVideoTrack = muxer.addTrack(videoFormat);
            int outputAudioTrack = muxer.addTrack(audioFormat);
            muxer.start();
            started = true;

            long videoDuration = copyTrack(
                    videoExtractor,
                    videoTrack,
                    muxer,
                    outputVideoTrack,
                    videoFormat
            );
            long audioDuration = copyTrack(
                    audioExtractor,
                    audioTrack,
                    muxer,
                    outputAudioTrack,
                    audioFormat
            );
            if (videoDuration <= 0 || audioDuration <= 0) {
                throw new IllegalStateException(
                        "Downloaded media track was empty"
                );
            }

            muxer.stop();
            started = false;
            muxer.release();
            muxer = null;

            Result result = validate(outputFile);
            if (result.durationUs <= 0) {
                throw new IllegalStateException(
                        "Merged media has no duration"
                );
            }
            return result;
        } catch (Exception error) {
            if (outputFile.exists()) {
                //noinspection ResultOfMethodCallIgnored
                outputFile.delete();
            }
            throw error;
        } finally {
            videoExtractor.release();
            audioExtractor.release();
            if (muxer != null) {
                if (started) {
                    try {
                        muxer.stop();
                    } catch (Throwable ignored) {
                    }
                }
                try {
                    muxer.release();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static int findTrack(MediaExtractor extractor, String prefix) {
        for (int index = 0; index < extractor.getTrackCount(); index++) {
            MediaFormat format = extractor.getTrackFormat(index);
            String mime = format.getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(prefix)) return index;
        }
        return -1;
    }

    private static long copyTrack(
            MediaExtractor extractor,
            int inputTrack,
            MediaMuxer muxer,
            int outputTrack,
            MediaFormat format
    ) {
        extractor.selectTrack(inputTrack);
        ByteBuffer buffer = ByteBuffer.allocateDirect(bufferSize(format));
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        long lastPresentationTimeUs = -1;
        while (true) {
            buffer.clear();
            int size = extractor.readSampleData(buffer, 0);
            if (size < 0) break;
            long presentationTimeUs = extractor.getSampleTime();
            if (presentationTimeUs < 0) break;

            info.offset = 0;
            info.size = size;
            info.presentationTimeUs = presentationTimeUs;
            info.flags = extractor.getSampleFlags();
            buffer.position(0);
            buffer.limit(size);
            muxer.writeSampleData(outputTrack, buffer, info);
            lastPresentationTimeUs = presentationTimeUs;
            extractor.advance();
        }
        extractor.unselectTrack(inputTrack);
        return lastPresentationTimeUs;
    }

    private static int bufferSize(MediaFormat format) {
        int size = DEFAULT_BUFFER_SIZE;
        try {
            if (format.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) {
                size = Math.max(
                        size,
                        format.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE)
                );
            }
        } catch (Throwable ignored) {
        }
        return Math.min(size, MAX_BUFFER_SIZE);
    }

    private static Result validate(File file) throws Exception {
        if (!file.isFile() || file.length() < 128L * 1024L) {
            throw new IllegalStateException("Merged media was too small");
        }

        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(file.getAbsolutePath());
            int width = 0;
            int height = 0;
            long durationUs = 0;
            boolean video = false;
            boolean audio = false;
            for (int index = 0; index < extractor.getTrackCount(); index++) {
                MediaFormat format = extractor.getTrackFormat(index);
                String mime = format.getString(MediaFormat.KEY_MIME);
                if (mime == null) continue;
                if (mime.startsWith("video/")) {
                    video = true;
                    if (format.containsKey(MediaFormat.KEY_WIDTH)) {
                        width = format.getInteger(MediaFormat.KEY_WIDTH);
                    }
                    if (format.containsKey(MediaFormat.KEY_HEIGHT)) {
                        height = format.getInteger(MediaFormat.KEY_HEIGHT);
                    }
                } else if (mime.startsWith("audio/")) {
                    audio = true;
                }
                if (format.containsKey(MediaFormat.KEY_DURATION)) {
                    durationUs = Math.max(
                            durationUs,
                            format.getLong(MediaFormat.KEY_DURATION)
                    );
                }
            }
            if (!video || !audio) {
                throw new IllegalStateException(
                        "Merged media is missing audio or video"
                );
            }
            return new Result(width, height, durationUs);
        } finally {
            extractor.release();
        }
    }

    public static final class Result {
        public final int width;
        public final int height;
        public final long durationUs;

        Result(int width, int height, long durationUs) {
            this.width = width;
            this.height = height;
            this.durationUs = durationUs;
        }

        public int qualityEdge() {
            if (width <= 0) return height;
            if (height <= 0) return width;
            return MediaVariant.normalizeQualityEdge(
                    Math.min(width, height)
            );
        }
    }
}
