package io.github.emotionbug.summaryengine;

import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

/** Streaming decode with independent, time-aligned 15-second chunks for every channel. */
final class AudioChunks {

    static void decode(FileInputStream input, File directory, PcmChunks.Cancellation cancelled,
                       PcmChunks.Consumer consumer) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        PcmChunks chunks = null;
        try {
            // File descriptor overload cannot resolve a URL or make a network request.
            extractor.setDataSource(input.getFD());
            int track = -1;
            MediaFormat format = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat candidate = extractor.getTrackFormat(i);
                String mime = candidate.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    if (track != -1) throw new IOException("Recording has multiple audio tracks; refusing to omit a track");
                    track = i; format = candidate;
                }
            }
            if (track == -1) throw new IOException("Recording contains no decodable audio track");
            extractor.selectTrack(track);
            format.setInteger(MediaFormat.KEY_PCM_ENCODING, AudioFormat.ENCODING_PCM_16BIT);
            codec = MediaCodec.createDecoderByType(format.getString(MediaFormat.KEY_MIME));
            codec.configure(format, null, null, 0);
            codec.start();
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean inputEnded = false, outputEnded = false;
            int sampleRate = 0, channels = 0, encoding = AudioFormat.ENCODING_PCM_16BIT;
            long lastProgress = android.os.SystemClock.elapsedRealtime();
            while (!outputEnded) {
                cancelled.check();
                boolean progress = false;
                if (!inputEnded) {
                    int index = codec.dequeueInputBuffer(10000);
                    if (index >= 0) {
                        ByteBuffer buffer = codec.getInputBuffer(index);
                        if (buffer == null) throw new IOException("Decoder returned no input buffer");
                        buffer.clear();
                        int size = extractor.readSampleData(buffer, 0);
                        if (size < 0) {
                            codec.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputEnded = true;
                        } else {
                            codec.queueInputBuffer(index, 0, size, extractor.getSampleTime(), 0);
                            extractor.advance();
                        }
                        progress = true;
                    }
                }
                int index = codec.dequeueOutputBuffer(info, 10000);
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat output = codec.getOutputFormat();
                    int nextRate = output.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    int nextChannels = output.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    int nextEncoding = output.containsKey(MediaFormat.KEY_PCM_ENCODING)
                            ? output.getInteger(MediaFormat.KEY_PCM_ENCODING) : AudioFormat.ENCODING_PCM_16BIT;
                    if (nextRate < 8000 || nextRate > 192000 || nextChannels < 1 || nextChannels > 8)
                        throw new IOException("Unsupported decoded sample rate/channel count: " + nextRate + "/" + nextChannels);
                    if (nextEncoding != AudioFormat.ENCODING_PCM_16BIT && nextEncoding != AudioFormat.ENCODING_PCM_FLOAT)
                        throw new IOException("Unsupported decoded PCM encoding: " + nextEncoding);
                    if (chunks != null && (sampleRate != nextRate || channels != nextChannels))
                        throw new IOException("Decoded channel layout or sample rate changed during recording");
                    if (chunks == null) chunks = new PcmChunks(directory, nextRate, nextChannels, cancelled, consumer);
                    sampleRate = nextRate; channels = nextChannels; encoding = nextEncoding;
                    progress = true;
                } else if (index >= 0) {
                    try {
                        if (info.size > 0 && (info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0) {
                            if (chunks == null) throw new IOException("Decoder produced PCM before its format");
                            ByteBuffer buffer = codec.getOutputBuffer(index);
                            if (buffer == null) throw new IOException("Decoder returned no output buffer");
                            buffer.position(info.offset); buffer.limit(info.offset + info.size);
                            chunks.add(buffer, encoding == AudioFormat.ENCODING_PCM_FLOAT);
                        }
                        outputEnded = (info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                    } finally { codec.releaseOutputBuffer(index, false); }
                    progress = true;
                }
                // Inference deliberately blocks decoding; do not count its elapsed time as decoder stalling.
                if (progress) lastProgress = android.os.SystemClock.elapsedRealtime();
                else if (android.os.SystemClock.elapsedRealtime() - lastProgress > 30000)
                    throw new IOException("Audio decoder stalled for 30 seconds");
            }
            if (chunks == null) throw new IOException("Recording decoded to no audio samples");
            chunks.finish();
        } finally {
            try { if (chunks != null) chunks.close(); }
            finally {
                try { if (codec != null) codec.release(); }
                finally { extractor.release(); }
            }
        }
    }

}
