/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.Build;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * The phone's AAC encoder writing a mono .m4a, or its Opus encoder writing a mono .ogg, fed from
 * the recorder's one thread. Every wait on the encoder is bounded, so a codec that stops answering
 * ends the recording as a failure rather than holding the thread.
 */
final class CallAac implements CallRecorder.Output {
    private static final int BIT_RATE = 64_000;
    /** Opus keeps a voice clear at half AAC's rate, which is the point of choosing it. */
    static final int OPUS_BIT_RATE = 32_000;
    private static final long WAIT_US = 10_000;
    /** About ten seconds of waits before the encoder counts as stuck. */
    private static final int PATIENCE = 1_000;

    private final File file;
    private final MediaCodec codec;
    private final MediaMuxer muxer;
    private final MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
    private int track = -1;
    private boolean muxing;
    private boolean wrote;
    private long samples;

    CallAac(File file, CallRecordings.Format kind) throws IOException {
        this.file = file;
        boolean opus = kind == CallRecordings.Format.OPUS;
        if (opus && Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) throw new IOException("Opus files need Android 10");
        MediaFormat format = encoding(kind);
        format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 16 * 1024);
        MediaCodec encoder = MediaCodec.createEncoderByType(kind.codec);
        try {
            encoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            encoder.start();
            muxer = new MediaMuxer(file.getPath(), opus
                    ? MediaMuxer.OutputFormat.MUXER_OUTPUT_OGG : MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
        } catch (IOException | RuntimeException failure) {
            encoder.release();
            throw failure;
        }
        codec = encoder;
    }

    /** What the encoder is asked for: mono call audio at the mixer's rate, AAC-LC or Opus. */
    static MediaFormat encoding(CallRecordings.Format kind) {
        MediaFormat format = MediaFormat.createAudioFormat(kind.codec, CallMixer.RATE, 1);
        if (kind == CallRecordings.Format.OPUS) {
            format.setInteger(MediaFormat.KEY_BIT_RATE, OPUS_BIT_RATE);
        } else {
            format.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
            format.setInteger(MediaFormat.KEY_BIT_RATE, BIT_RATE);
        }
        return format;
    }

    @Override public void write(short[] pcm, int count) throws IOException {
        int sent = 0;
        int waits = 0;
        while (sent < count) {
            int index = codec.dequeueInputBuffer(WAIT_US);
            if (index < 0) {
                if (++waits > PATIENCE) throw new IOException("The audio encoder stopped taking input");
                drain(false);
                continue;
            }
            ByteBuffer input = codec.getInputBuffer(index);
            if (input == null) throw new IOException("The audio encoder gave no input buffer");
            input.clear();
            int length = Math.min(count - sent, input.remaining() / 2);
            input.order(ByteOrder.nativeOrder()).asShortBuffer().put(pcm, sent, length);
            codec.queueInputBuffer(index, 0, length * 2, samples * 1_000_000L / CallMixer.RATE, 0);
            samples += length;
            sent += length;
            drain(false);
        }
    }

    @Override public File finish() throws IOException {
        try {
            int index = -1;
            for (int waits = 0; index < 0; waits++) {
                if (waits > PATIENCE) throw new IOException("The audio encoder never took the end of the call");
                index = codec.dequeueInputBuffer(WAIT_US);
                if (index < 0) drain(false);
            }
            codec.queueInputBuffer(index, 0, 0, samples * 1_000_000L / CallMixer.RATE, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
            drain(true);
            if (!wrote) throw new IOException("The audio encoder wrote nothing");
            muxer.stop();
            muxing = false;
            return file;
        } finally {
            release();
        }
    }

    @Override public void abandon() {
        release();
        if (!file.delete() && file.exists()) file.deleteOnExit();
    }

    private void release() {
        try {
            codec.release();
        } catch (RuntimeException ignored) {
            // Already released, or the codec died: either way there's nothing left to free.
        }
        try {
            // A muxer that never got a sample can't be stopped, only released.
            if (muxing && wrote) muxer.stop();
        } catch (RuntimeException ignored) {
            // The file is going anyway.
        }
        muxing = false;
        try {
            muxer.release();
        } catch (RuntimeException ignored) {
            // Released twice.
        }
    }

    /** Moves encoded audio into the file: whatever is ready, or with [end] everything up to the end flag. */
    private void drain(boolean end) throws IOException {
        for (int waits = 0; waits <= PATIENCE; ) {
            int index = codec.dequeueOutputBuffer(info, end ? WAIT_US : 0);
            if (index == MediaCodec.INFO_TRY_AGAIN_LATER) {
                if (!end) return;
                waits++;
                continue;
            }
            if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                if (muxing) throw new IOException("The audio encoder changed format mid-call");
                track = muxer.addTrack(codec.getOutputFormat());
                muxer.start();
                muxing = true;
                continue;
            }
            if (index < 0) {
                waits++;
                continue;
            }
            ByteBuffer output = codec.getOutputBuffer(index);
            boolean last = (info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
            if ((info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0 && info.size > 0 && output != null) {
                if (!muxing) throw new IOException("The audio encoder sent audio before its format");
                output.position(info.offset);
                output.limit(info.offset + info.size);
                muxer.writeSampleData(track, output, info);
                wrote = true;
            }
            codec.releaseOutputBuffer(index, false);
            if (last) return;
        }
        if (end) throw new IOException("The audio encoder never finished");
    }
}
