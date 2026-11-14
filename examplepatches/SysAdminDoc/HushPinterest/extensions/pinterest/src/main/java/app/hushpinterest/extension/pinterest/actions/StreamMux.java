/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

/**
 * Joins a streamed video's picture and sound into one MP4 with Android's own MediaExtractor and
 * MediaMuxer. Every sample is copied as it is, so nothing is decoded or encoded again.
 */
final class StreamMux {
    private StreamMux() {}

    /** The largest single sample copied. A frame of a 4K video is far smaller. */
    private static final int MOST_SAMPLE = 64 << 20;
    private static final int FIRST_BUFFER = 1 << 20;

    /** One input file, and which of its tracks go where in the joined file. */
    private static final class Input {
        final MediaExtractor extractor = new MediaExtractor();
        /** The output track for each of this input's tracks, or -1 for one that isn't copied. */
        int[] tracks = new int[0];
        /** Every sample of this input has been copied. */
        boolean ended;

        /** Moves to the next sample, noting the end of the input. */
        void advance() {
            if (!extractor.advance()) ended = true;
        }
    }

    /**
     * Writes the first video track of [video], with the first audio track of [audio] (or of [video]
     * when [audio] is null), into [out] as an MP4. [out] must be open for writing and seeking.
     */
    static void join(File video, @Nullable File audio, FileDescriptor out) throws IOException {
        List<Input> inputs = new ArrayList<>();
        MediaMuxer muxer = null;
        boolean started = false;
        try {
            Input pictures = open(video, inputs);
            Input sound = audio == null ? pictures : open(audio, inputs);
            int pictureTrack = track(pictures.extractor, "video/");
            if (pictureTrack < 0) throw new IOException("The stream has no picture");
            int soundTrack = track(sound.extractor, "audio/");
            MediaFormat pictureFormat = pictures.extractor.getTrackFormat(pictureTrack);
            MediaFormat soundFormat = soundTrack < 0 ? null : sound.extractor.getTrackFormat(soundTrack);

            muxer = new MediaMuxer(out, MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            if (pictureFormat.containsKey(MediaFormat.KEY_ROTATION)) {
                int rotation = pictureFormat.getInteger(MediaFormat.KEY_ROTATION);
                if (rotation == 90 || rotation == 180 || rotation == 270) muxer.setOrientationHint(rotation);
            }
            pictures.extractor.selectTrack(pictureTrack);
            pictures.tracks[pictureTrack] = muxer.addTrack(pictureFormat);
            if (soundFormat != null) {
                sound.extractor.selectTrack(soundTrack);
                sound.tracks[soundTrack] = muxer.addTrack(soundFormat);
            }
            muxer.start();
            started = true;

            ByteBuffer buffer = ByteBuffer.allocateDirect(Math.max(FIRST_BUFFER,
                    Math.max(largest(pictureFormat), soundFormat == null ? 0 : largest(soundFormat))));
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            long copied = 0;
            while (true) {
                // The earliest waiting sample goes next, so picture and sound stay interleaved.
                Input from = null;
                for (Input input : inputs) {
                    if (input.ended || input.extractor.getSampleTrackIndex() < 0) continue;
                    if (from == null || input.extractor.getSampleTime() < from.extractor.getSampleTime()) from = input;
                }
                if (from == null) break;
                MediaExtractor extractor = from.extractor;
                int index = extractor.getSampleTrackIndex();
                int target = index < from.tracks.length ? from.tracks[index] : -1;
                if (target < 0) {
                    from.advance();
                    continue;
                }
                long size = extractor.getSampleSize();
                if (size > MOST_SAMPLE) throw new IOException("A sample of the stream is too big");
                if (size > buffer.capacity()) buffer = ByteBuffer.allocateDirect((int) size);
                buffer.clear();
                int read = extractor.readSampleData(buffer, 0);
                // No sample left: this input is done.
                if (read < 0) {
                    from.ended = true;
                    continue;
                }
                info.set(0, read, Math.max(0, extractor.getSampleTime()),
                        (extractor.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0 ? MediaCodec.BUFFER_FLAG_KEY_FRAME : 0);
                muxer.writeSampleData(target, buffer, info);
                copied++;
                from.advance();
            }
            if (copied == 0) throw new IOException("The stream has no samples");
            muxer.stop();
            started = false;
        } catch (IllegalStateException | IllegalArgumentException refused) {
            throw new IOException("Couldn't join the stream", refused);
        } finally {
            if (muxer != null) {
                try {
                    if (started) muxer.stop();
                } catch (RuntimeException alreadyFailed) {
                    // The join failed already. The caller deletes what was written.
                }
                try { muxer.release(); } catch (RuntimeException ignored) { /* Nothing left to free. */ }
            }
            for (Input input : inputs) {
                try { input.extractor.release(); } catch (RuntimeException ignored) { /* Nothing left to free. */ }
            }
        }
    }

    private static Input open(File file, List<Input> inputs) throws IOException {
        Input input = new Input();
        inputs.add(input);
        input.extractor.setDataSource(file.getPath());
        input.tracks = new int[input.extractor.getTrackCount()];
        java.util.Arrays.fill(input.tracks, -1);
        return input;
    }

    /** The first track whose type starts with [kind], or -1. */
    private static int track(MediaExtractor extractor, String kind) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            String mime = extractor.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(kind)) return i;
        }
        return -1;
    }

    private static int largest(MediaFormat format) {
        if (!format.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) return 0;
        int size = format.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE);
        return size > 0 && size <= MOST_SAMPLE ? size : 0;
    }
}
