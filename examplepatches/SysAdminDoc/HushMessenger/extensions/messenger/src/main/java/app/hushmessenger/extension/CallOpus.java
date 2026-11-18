package app.hushmessenger.extension;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.Build;
import java.io.FileDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Writes a call as Opus in an OGG file (#193). A WAV of an hour-long call runs to about 115 MB, and the same call as
 * Opus is nearer 10, which is the difference between a recording you keep and one you delete to get the space back.
 * The sound is the same mix as the WAV: the phone's own encoder takes it 20 milliseconds at a time and Android's muxer
 * writes it out. A phone with no Opus encoder isn't offered this, so nothing here has to stand in for one.
 */
@TargetApi(29)
final class CallOpus implements CallMix.Sink {
    static final String MIME = "audio/opus";
    /** Speech at 16 kHz, per channel. Opus holds up well this low, and it's about a tenth of what the WAV takes. */
    private static final int BITS_PER_SECOND = 24000;
    /** Opus works in 20 millisecond frames, which at {@link CallMix#RATE} is this many of them. */
    private static final int FRAME = CallMix.RATE / 50;
    private static final int WAIT_MICROS = 20_000;

    /** Whether this phone can encode Opus at all. Android 10 is the first that can, and not every build does. */
    static boolean available() {
        return available(1);
    }

    /** The same question for a recording with a side on each channel, which not every encoder takes. */
    static boolean available(int channels) {
        if (Build.VERSION.SDK_INT < 29) return false;
        try {
            return new MediaCodecList(MediaCodecList.REGULAR_CODECS).findEncoderForFormat(wanted(channels)) != null;
        } catch (RuntimeException unknown) {
            return false;
        }
    }

    private static MediaFormat wanted(int channels) {
        MediaFormat format = MediaFormat.createAudioFormat(MIME, CallMix.RATE, channels);
        format.setInteger(MediaFormat.KEY_BIT_RATE, BITS_PER_SECOND * channels);
        return format;
    }

    private final MediaCodec encoder;
    private final MediaMuxer muxer;
    private final int channels;
    private final MediaCodec.BufferInfo out = new MediaCodec.BufferInfo();
    // Android is little endian everywhere it runs, and so is the mix handed over, so the bytes go straight across.
    private final ByteBuffer frame;
    private int track = -1;
    private boolean muxing;
    private boolean ended;
    private boolean done;
    /** Frames handed to the encoder, which is what every buffer's timestamp is worked out from. */
    private long queued;

    CallOpus(FileDescriptor file) throws IOException {
        this(file, 1);
    }

    CallOpus(FileDescriptor file, int channels) throws IOException {
        this.channels = channels == 2 ? 2 : 1;
        frame = ByteBuffer.allocate(FRAME * 2 * this.channels).order(ByteOrder.nativeOrder());
        encoder = MediaCodec.createEncoderByType(MIME);
        try {
            encoder.configure(wanted(this.channels), null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            encoder.start();
            muxer = new MediaMuxer(file, MediaMuxer.OutputFormat.MUXER_OUTPUT_OGG);
        } catch (IOException | RuntimeException unusable) {
            encoder.release();
            throw unusable;
        }
    }

    @Override public void write(long at, ByteBuffer samples) throws IOException {
        while (samples.hasRemaining()) {
            int taking = Math.min(samples.remaining(), frame.remaining());
            int wasAt = samples.limit();
            samples.limit(samples.position() + taking);
            frame.put(samples);
            samples.limit(wasAt);
            if (!frame.hasRemaining()) hand(false);
        }
    }

    @Override public void finish() throws IOException {
        if (done) return;
        // The last frame is filled out with silence, since the encoder takes whole frames.
        while (frame.position() > 0 && frame.hasRemaining()) frame.putShort((short) 0);
        hand(true);
        drain(true);
        release();
    }

    /** Lets go of the encoder and the muxer. Safe to call twice, and safe on a recording that went wrong. */
    @Override public void release() {
        if (done) return;
        done = true;
        try {
            encoder.stop();
        } catch (RuntimeException alreadyGone) {
            // Nothing to stop, which is where this was headed.
        }
        encoder.release();
        try {
            if (muxing) muxer.stop();
        } catch (RuntimeException unfinished) {
            // A muxer with no sound in it refuses to stop, and there's nothing to write in that case anyway.
        }
        muxer.release();
    }

    /** Hands the frame over, and takes whatever the encoder has ready. */
    private void hand(boolean last) throws IOException {
        int index = encoder.dequeueInputBuffer(WAIT_MICROS);
        if (index < 0) {
            drain(false);
            index = encoder.dequeueInputBuffer(WAIT_MICROS);
        }
        if (index < 0) throw new IOException("The Opus encoder took nothing");
        frame.flip();
        int bytes = frame.remaining();
        ByteBuffer input = encoder.getInputBuffer(index);
        if (input == null) throw new IOException("The Opus encoder gave no buffer");
        input.clear();
        input.put(frame);
        frame.clear();
        encoder.queueInputBuffer(index, 0, bytes, queued * 1_000_000L / CallMix.RATE,
            last ? MediaCodec.BUFFER_FLAG_END_OF_STREAM : 0);
        queued += bytes / (2 * channels);
        drain(false);
    }

    /** Writes out everything the encoder has ready, and waits for the end of it when [untilEnded]. */
    private void drain(boolean untilEnded) throws IOException {
        while (!ended) {
            int index = encoder.dequeueOutputBuffer(out, untilEnded ? WAIT_MICROS : 0);
            if (index == MediaCodec.INFO_TRY_AGAIN_LATER) {
                if (untilEnded) continue;
                return;
            }
            if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                track = muxer.addTrack(encoder.getOutputFormat());
                muxer.start();
                muxing = true;
                continue;
            }
            if (index < 0) continue;
            ByteBuffer written = encoder.getOutputBuffer(index);
            boolean setup = (out.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0;
            if (!setup && out.size > 0 && muxing && written != null) muxer.writeSampleData(track, written, out);
            encoder.releaseOutputBuffer(index, false);
            if ((out.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) ended = true;
        }
    }
}
