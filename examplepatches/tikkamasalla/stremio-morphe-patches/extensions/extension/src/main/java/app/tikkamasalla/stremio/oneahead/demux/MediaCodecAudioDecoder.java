package app.tikkamasalla.stremio.oneahead.demux;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Build;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Locale;

/**
 * The Android side: one synchronous MediaCodec. Software decoders first by name, so a Dolby
 * hardware instance the player is using is never contended; a busy or missing decoder is a clean
 * failure, never a wait.
 */
public final class MediaCodecAudioDecoder implements AudioDecoder {
    private static final long WAIT_US = 10_000;
    private static final long STUCK_MS = 5_000;

    /** Lowers the calling thread: background cgroup, below the player's threads. */
    public static void lowerThreadPriority() {
        android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND
                + android.os.Process.THREAD_PRIORITY_LESS_FAVORABLE);
    }

    public static final class Factory implements AudioDecoder.Factory {
        private final boolean allowHardware;

        /** @param allowHardware false keeps away from every vendor decoder, for instance while Dolby audio plays */
        public Factory(boolean allowHardware) {
            this.allowHardware = allowHardware;
        }

        @Override
        public boolean canDecode(String mime) {
            return find(mime, allowHardware) != null;
        }

        @Override
        public boolean isSoftware(String mime) {
            return find(mime, false) != null;
        }

        @Override
        public AudioDecoder create(TrackInfo track, Output output) throws DemuxException {
            String name = find(track.mime, allowHardware);
            if (name == null) throw new DemuxException(DemuxException.Kind.DECODER_MISSING, track.mime);
            byte[][] csd = CodecConfig.csd(track);
            if (csd == null) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "bad codec data");
            MediaFormat format = MediaFormat.createAudioFormat(track.mime, track.sampleRate, Math.max(1, track.channels));
            for (int i = 0; i < csd.length; i++) format.setByteBuffer("csd-" + i, ByteBuffer.wrap(csd[i]));
            format.setInteger(MediaFormat.KEY_PRIORITY, 1); // Not real time.
            format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 256 * 1024);
            format.setInteger(MediaFormat.KEY_PCM_ENCODING, PCM_16BIT);
            MediaCodec codec = null;
            try {
                codec = MediaCodec.createByCodecName(name);
                codec.configure(format, null, null, 0);
                codec.start();
                return new MediaCodecAudioDecoder(codec, output, track);
            } catch (IOException | RuntimeException busy) {
                if (codec != null) codec.release();
                throw new DemuxException(DemuxException.Kind.DECODER_BUSY, name + " " + busy.getClass().getSimpleName());
            }
        }

        private static String find(String mime, boolean allowHardware) {
            if (mime == null) return null;
            String hardware = null;
            for (MediaCodecInfo info : new MediaCodecList(MediaCodecList.REGULAR_CODECS).getCodecInfos()) {
                if (info.isEncoder()) continue;
                for (String type : info.getSupportedTypes()) {
                    if (!type.equalsIgnoreCase(mime)) continue;
                    String n = info.getName().toLowerCase(Locale.ROOT);
                    boolean software = n.startsWith("c2.android.") || n.startsWith("omx.google.")
                            || (Build.VERSION.SDK_INT >= 29 && info.isSoftwareOnly() && !info.isVendor());
                    if (software) return info.getName();
                    if (hardware == null) hardware = info.getName();
                }
            }
            return allowHardware ? hardware : null;
        }
    }

    private final MediaCodec codec;
    private final Output output;
    private final MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
    private int channels, rate, encoding = PCM_16BIT;
    private final boolean vorbis;

    private MediaCodecAudioDecoder(MediaCodec codec, Output output, TrackInfo track) {
        this.codec = codec;
        this.output = output;
        this.channels = Math.max(1, track.channels);
        this.rate = track.sampleRate;
        this.vorbis = "audio/vorbis".equals(track.mime);
    }

    @Override
    public void queue(byte[] data, int off, int len, long ptsUs) throws DemuxException {
        // The software Vorbis decoder fails on a packet under 4 bytes; ffmpeg ends its files with one.
        if (vorbis && len < 4) return;
        long deadline = System.currentTimeMillis() + STUCK_MS;
        while (true) {
            try {
                int in = codec.dequeueInputBuffer(WAIT_US);
                if (in >= 0) {
                    ByteBuffer buffer = codec.getInputBuffer(in);
                    buffer.clear();
                    if (len > buffer.remaining()) {
                        throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "frame " + len + " over input buffer");
                    }
                    buffer.put(data, off, len);
                    codec.queueInputBuffer(in, 0, len, ptsUs, 0);
                    drain(false);
                    return;
                }
                drain(false);
            } catch (IllegalStateException failed) {
                throw new DemuxException(DemuxException.Kind.DECODER_FAILED, failed.getClass().getSimpleName());
            }
            if (System.currentTimeMillis() > deadline) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "input stuck");
        }
    }

    @Override
    public void drainToEnd() throws DemuxException {
        try {
            long deadline = System.currentTimeMillis() + STUCK_MS;
            int in;
            while ((in = codec.dequeueInputBuffer(WAIT_US)) < 0) {
                drain(false);
                if (System.currentTimeMillis() > deadline) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "input stuck");
            }
            codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
            drain(true);
        } catch (IllegalStateException failed) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, failed.getClass().getSimpleName());
        }
    }

    private void drain(boolean toEnd) throws DemuxException {
        long deadline = System.currentTimeMillis() + STUCK_MS;
        while (true) {
            int out = codec.dequeueOutputBuffer(info, toEnd ? WAIT_US : 0);
            if (out == MediaCodec.INFO_TRY_AGAIN_LATER) {
                if (!toEnd) return;
                if (System.currentTimeMillis() > deadline) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "output stuck");
            } else if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                MediaFormat f = codec.getOutputFormat();
                if (f.containsKey(MediaFormat.KEY_CHANNEL_COUNT)) channels = f.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                if (f.containsKey(MediaFormat.KEY_SAMPLE_RATE)) rate = f.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                if (f.containsKey(MediaFormat.KEY_PCM_ENCODING)) encoding = f.getInteger(MediaFormat.KEY_PCM_ENCODING);
            } else if (out >= 0) {
                boolean end = (info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                if (info.size > 0) {
                    ByteBuffer pcm = codec.getOutputBuffer(out);
                    pcm.position(info.offset);
                    pcm.limit(info.offset + info.size);
                    pcm.order(ByteOrder.nativeOrder());
                    output.onDecoded(pcm, encoding, channels, rate, info.presentationTimeUs);
                }
                codec.releaseOutputBuffer(out, false);
                deadline = System.currentTimeMillis() + STUCK_MS;
                if (end) return;
            }
        }
    }

    @Override
    public void flush() throws DemuxException {
        try {
            codec.flush();
        } catch (IllegalStateException failed) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, failed.getClass().getSimpleName());
        }
    }

    @Override
    public void release() {
        try {
            codec.stop();
        } catch (RuntimeException ignored) {
            // Releasing is what matters.
        }
        codec.release();
    }
}
