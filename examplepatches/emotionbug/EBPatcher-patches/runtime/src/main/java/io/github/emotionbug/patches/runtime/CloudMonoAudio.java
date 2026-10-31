package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.os.SystemClock;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/** Saved AAC/MP4 only. No capture, resampling, whole-recording PCM buffer, or source writes. */
final class CloudMonoAudio {
    interface Cancellation { void check() throws Exception; }
    static final class Input {
        final Uri uri;
        final long bytes;
        final CloudMonoFiles.Lease lease;
        Input(Uri uri, long bytes, CloudMonoFiles.Lease lease) { this.uri = uri; this.bytes = bytes; this.lease = lease; }
    }
    private static final long STALL_MS = 10000;
    private static final long MAX_WALL_MS = 30 * 60 * 1000;
    private static final long MAX_SECONDS = 24 * 60 * 60;
    private static final long MAX_BYTES = 512L * 1024 * 1024;

    static Input prepare(Context context, Uri source, Uri companion, Cancellation cancellation) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        CloudMonoFiles.Lease lease = null;
        boolean success = false;
        Throwable primary = null;
        try {
            cancellation.check();
            extractor.setDataSource(context, source, null);
            MediaFormat input = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat candidate = extractor.getTrackFormat(i);
                String mime = candidate.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    if (input != null) throw new IOException("Multiple cloud audio tracks are unsupported");
                    input = candidate; extractor.selectTrack(i);
                }
            }
            if (input == null) throw new IOException("No saved audio track");
            int channels = input.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            if (channels == 1) return null; // Original bytes and descriptor stay untouched.
            int rate = input.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            if (channels != 2 || !MediaFormat.MIMETYPE_AUDIO_AAC.equals(input.getString(MediaFormat.KEY_MIME))
                    || rate < 8000 || rate > 48000)
                throw new IOException("Unsupported stereo cloud audio format");
            if (input.containsKey(MediaFormat.KEY_DURATION) && input.getLong(MediaFormat.KEY_DURATION) > MAX_SECONDS * 1000000)
                throw new IOException("Saved audio exceeds the cloud conversion bound");
            long companionBytes = compatibleCompanion(context, companion, input);
            if (companionBytes > 0) return new Input(companion, companionBytes, null);
            lease = CloudMonoFiles.create(context.getCacheDir());
            transcode(extractor, input, rate, lease, cancellation);
            Input converted = new Input(Uri.fromFile(lease.file), lease.file.length(), lease);
            success = true;
            return converted;
        } catch (Exception | Error failure) {
            primary = failure;
            throw failure;
        } finally {
            RuntimeException releaseFailure = null;
            try { extractor.release(); }
            catch (RuntimeException failure) {
                success = false;
                if (primary != null) primary.addSuppressed(failure); else releaseFailure = failure;
            }
            if (!success && lease != null) try { lease.close(); }
            catch (IOException failure) {
                if (primary != null) primary.addSuppressed(failure);
                else if (releaseFailure != null) releaseFailure.addSuppressed(failure);
                else throw failure;
            }
            if (releaseFailure != null) throw releaseFailure;
        }
    }
    /** v1q's same-recording mono member is reused only after checking its actual encoded track. */
    private static long compatibleCompanion(Context context, Uri uri, MediaFormat stereo) {
        if (uri == null) return -1;
        MediaExtractor mono = new MediaExtractor();
        try (AssetFileDescriptor file = context.getContentResolver().openAssetFileDescriptor(uri, "r")) {
            if (file == null || file.getLength() <= 0) return -1;
            mono.setDataSource(context, uri, null);
            if (mono.getTrackCount() != 1) return -1;
            MediaFormat format = mono.getTrackFormat(0);
            if (format.getInteger(MediaFormat.KEY_CHANNEL_COUNT) != 1
                    || format.getInteger(MediaFormat.KEY_SAMPLE_RATE) != stereo.getInteger(MediaFormat.KEY_SAMPLE_RATE)
                    || !MediaFormat.MIMETYPE_AUDIO_AAC.equals(format.getString(MediaFormat.KEY_MIME))
                    || !format.containsKey(MediaFormat.KEY_DURATION) || !stereo.containsKey(MediaFormat.KEY_DURATION))
                return -1;
            long tolerance = 2048L * 1000000 / stereo.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            return Math.abs(format.getLong(MediaFormat.KEY_DURATION) - stereo.getLong(MediaFormat.KEY_DURATION)) <= tolerance
                    ? file.getLength() : -1;
        } catch (IOException | RuntimeException unavailable) { return -1; }
        finally { mono.release(); }
    }


    private static void transcode(MediaExtractor extractor, MediaFormat source, int rate,
                                  CloudMonoFiles.Lease lease, Cancellation cancellation) throws Exception {
        MediaCodec decoder = null, encoder = null;
        MediaMuxer muxer = null;
        boolean decoderStarted = false, encoderStarted = false, muxerStarted = false;
        try {
            source.setInteger(MediaFormat.KEY_PCM_ENCODING, AudioFormat.ENCODING_PCM_16BIT);
            decoder = MediaCodec.createDecoderByType(MediaFormat.MIMETYPE_AUDIO_AAC);
            decoder.configure(source, null, null, 0);
            decoder.start(); decoderStarted = true;
            MediaFormat output = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, rate, 1);
            output.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
            // Matches the embedded recorder's per-channel bitrate; source rate and filename are retained.
            output.setInteger(MediaFormat.KEY_BIT_RATE, 64000);
            output.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 8192);
            encoder = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_AAC);
            encoder.configure(output, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            encoder.start(); encoderStarted = true;
            muxer = new MediaMuxer(lease.file.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            MediaCodec.BufferInfo decoded = new MediaCodec.BufferInfo(), encoded = new MediaCodec.BufferInfo();
            boolean inputDone = false, decoderDone = false, encoderEos = false, outputDone = false;
            int held = -1, track = -1;
            ByteBuffer pcm = null;
            long frames = 0, encodedBytes = 0, inputBytes = 0;
            long start = SystemClock.elapsedRealtime(), progress = start;
            while (!outputDone) {
                cancellation.check();
                long now = SystemClock.elapsedRealtime();
                if (now - start > MAX_WALL_MS || now - progress > STALL_MS)
                    throw new IOException("Cloud audio conversion timed out");
                boolean advanced = false;
                int out = encoder.dequeueOutputBuffer(encoded, 0);
                if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerStarted) throw new IOException("AAC output format changed twice");
                    MediaFormat actual = encoder.getOutputFormat();
                    if (actual.getInteger(MediaFormat.KEY_CHANNEL_COUNT) != 1 || actual.getInteger(MediaFormat.KEY_SAMPLE_RATE) != rate)
                        throw new IOException("AAC encoder changed cloud audio format");
                    track = muxer.addTrack(actual); muxer.start(); muxerStarted = true; advanced = true;
                } else if (out >= 0) {
                    try {
                        if (encoded.size > 0 && (encoded.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0) {
                            if (!muxerStarted) throw new IOException("AAC data before output format");
                            ByteBuffer data = encoder.getOutputBuffer(out);
                            if (data == null) throw new IOException("Missing encoded cloud audio");
                            data.position(encoded.offset); data.limit(encoded.offset + encoded.size);
                            encodedBytes += encoded.size;
                            if (encodedBytes > MAX_BYTES) throw new IOException("Cloud audio exceeds output byte bound");
                            muxer.writeSampleData(track, data, encoded);
                        }
                        outputDone = (encoded.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                    } finally { encoder.releaseOutputBuffer(out, false); }
                    advanced = true;
                }
                if (held < 0 && !decoderDone) {
                    held = decoder.dequeueOutputBuffer(decoded, 0);
                    if (held == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                        MediaFormat actual = decoder.getOutputFormat();
                        if (actual.getInteger(MediaFormat.KEY_CHANNEL_COUNT) != 2 || actual.getInteger(MediaFormat.KEY_SAMPLE_RATE) != rate
                                || (actual.containsKey(MediaFormat.KEY_PCM_ENCODING)
                                && actual.getInteger(MediaFormat.KEY_PCM_ENCODING) != AudioFormat.ENCODING_PCM_16BIT))
                            throw new IOException("Decoder changed stereo PCM16 format");
                        advanced = true;
                    } else if (held >= 0) {
                        pcm = decoder.getOutputBuffer(held);
                        if (pcm == null || decoded.size % 4 != 0) throw new IOException("Invalid interleaved stereo PCM");
                        pcm.position(decoded.offset); pcm.limit(decoded.offset + decoded.size); pcm.order(ByteOrder.LITTLE_ENDIAN);
                        advanced = true;
                    }
                }
                if (held >= 0 && pcm != null) {
                    if (pcm.hasRemaining()) {
                        int in = encoder.dequeueInputBuffer(1000);
                        if (in >= 0) {
                            ByteBuffer mono = encoder.getInputBuffer(in);
                            if (mono == null || mono.capacity() < 2) throw new IOException("Missing mono encoder input");
                            mono.clear(); mono.order(ByteOrder.LITTLE_ENDIAN);
                            int count = CloudMonoPcm.mix(pcm, mono);
                            encoder.queueInputBuffer(in, 0, count * 2, frames * 1000000 / rate, 0);
                            frames += count;
                            if (frames > rate * MAX_SECONDS) throw new IOException("Cloud audio exceeds decoded frame bound");
                            advanced = true;
                        }
                    }
                    if (!pcm.hasRemaining()) {
                        decoderDone = (decoded.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                        decoder.releaseOutputBuffer(held, false); held = -1; pcm = null; advanced = true;
                    }
                }
                if (decoderDone && !encoderEos) {
                    int in = encoder.dequeueInputBuffer(1000);
                    if (in >= 0) {
                        encoder.queueInputBuffer(in, 0, 0, frames * 1000000 / rate, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                        encoderEos = true; advanced = true;
                    }
                }
                if (!inputDone) {
                    int in = decoder.dequeueInputBuffer(1000);
                    if (in >= 0) {
                        ByteBuffer compressed = decoder.getInputBuffer(in);
                        if (compressed == null) throw new IOException("Missing AAC decoder input");
                        compressed.clear();
                        if (extractor.getSampleSize() > compressed.capacity()) throw new IOException("Oversized saved AAC packet");
                        int size = extractor.readSampleData(compressed, 0);
                        if (size < 0) {
                            decoder.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM); inputDone = true;
                        } else {
                            inputBytes += size;
                            if (inputBytes > MAX_BYTES) throw new IOException("Cloud audio exceeds input byte bound");
                            decoder.queueInputBuffer(in, 0, size, extractor.getSampleTime(), 0); extractor.advance();
                        }
                        advanced = true;
                    }
                }
                if (advanced) progress = SystemClock.elapsedRealtime();
            }
            if (!muxerStarted || frames == 0 || encodedBytes == 0) throw new IOException("Empty cloud mono audio");
            muxer.stop(); muxerStarted = false;
            cancellation.check();
        } finally {
            if (decoder != null) {
                if (decoderStarted) try { decoder.stop(); } catch (RuntimeException ignored) {}
                try { decoder.release(); } catch (RuntimeException ignored) {}
            }
            if (encoder != null) {
                if (encoderStarted) try { encoder.stop(); } catch (RuntimeException ignored) {}
                try { encoder.release(); } catch (RuntimeException ignored) {}
            }
            if (muxer != null) {
                if (muxerStarted) try { muxer.stop(); } catch (RuntimeException ignored) {}
                try { muxer.release(); } catch (RuntimeException ignored) {}
            }
        }
    }
}
