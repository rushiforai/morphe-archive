package app.flip.callrecord;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.provider.ContactsContract;
import android.provider.MediaStore;
import android.telecom.Connection;
import android.util.Log;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Records every Voice call (Wi-Fi / mobile data calls) automatically, both sides, to
 * Recordings/Voice calls/ as .m4a.
 *
 * The patch swaps the AudioRecord.read / AudioTrack.write calls in Voice's WebRTC audio threads
 * for {@link #read} and {@link #write}, which pass the call through unchanged and copy the PCM.
 * The two sides are lined up by time, mixed to mono, and encoded to AAC.
 */
public class CallRecorder extends ContentProvider {
    private static final String TAG = "FlipCallRecorder";
    private static final int RATE = 48000;
    private static final int RING = RATE * 10;
    /** A side that sent nothing for this long is treated as silent so the other side keeps flowing. */
    private static final long STALL_MS = 400;
    /** No audio from either side for this long ends the recording. */
    private static final long END_MS = 2500;

    private static volatile Context appContext;

    // Connection info from VoipConnectionService.
    private static volatile Connection lastConnection;
    private static volatile boolean lastIncoming;
    private static volatile long lastConnectionAt;

    private static Session session;
    private static final Object LOCK = new Object();

    @Override
    public boolean onCreate() {
        Context c = getContext();
        if (c != null) appContext = c.getApplicationContext() != null ? c.getApplicationContext() : c;
        return true;
    }

    // region Hooks.

    public static void onIncoming(Object connection) {
        onConnection(connection, true);
    }

    public static void onOutgoing(Object connection) {
        onConnection(connection, false);
    }

    private static void onConnection(Object connection, boolean incoming) {
        if (!(connection instanceof Connection)) return;
        lastConnection = (Connection) connection;
        lastIncoming = incoming;
        lastConnectionAt = System.currentTimeMillis();
    }

    /** Replaces AudioRecord.read(ByteBuffer, int) in Voice's mic thread. */
    public static int read(AudioRecord record, ByteBuffer buffer, int size) {
        int n = record.read(buffer, size);
        if (n > 0) {
            try {
                feed(0, buffer, buffer.position(), n, record.getSampleRate(), record.getChannelCount(),
                        record.getAudioFormat());
            } catch (Throwable t) {
                Log.e(TAG, "mic copy failed", t);
            }
        }
        return n;
    }

    /** Replaces AudioTrack.write(ByteBuffer, int, int) in Voice's speaker thread. */
    public static int write(AudioTrack track, ByteBuffer buffer, int size, int mode) {
        try {
            feed(1, buffer, buffer.position(), size, track.getSampleRate(), track.getChannelCount(),
                    track.getAudioFormat());
        } catch (Throwable t) {
            Log.e(TAG, "speaker copy failed", t);
        }
        return track.write(buffer, size, mode);
    }

    // endregion

    private static void feed(int side, ByteBuffer buffer, int position, int bytes, int rate, int channels, int format) {
        if (appContext == null || bytes <= 0 || rate <= 0 || channels <= 0) return;
        short[] mono = toMono(buffer, position, bytes, channels, format);
        if (mono == null) return;
        Session s;
        synchronized (LOCK) {
            if (session == null || session.finished) {
                session = new Session();
                session.start();
            }
            s = session;
        }
        s.add(side, mono, rate);
    }

    private static short[] toMono(ByteBuffer buffer, int position, int bytes, int channels, int format) {
        ByteBuffer b = buffer.duplicate().order(ByteOrder.LITTLE_ENDIAN);
        b.position(position);
        if (format == AudioFormat.ENCODING_PCM_FLOAT) {
            int frames = bytes / (4 * channels);
            short[] out = new short[frames];
            for (int i = 0; i < frames; i++) {
                float sum = 0;
                for (int c = 0; c < channels; c++) sum += b.getFloat();
                float v = sum / channels;
                out[i] = (short) Math.max(-32768, Math.min(32767, (int) (v * 32767f)));
            }
            return out;
        }
        if (format != AudioFormat.ENCODING_PCM_16BIT && format != AudioFormat.ENCODING_DEFAULT) return null;
        int frames = bytes / (2 * channels);
        short[] out = new short[frames];
        for (int i = 0; i < frames; i++) {
            int sum = 0;
            for (int c = 0; c < channels; c++) sum += b.getShort();
            out[i] = (short) (sum / channels);
        }
        return out;
    }

    /** One recorded call. */
    private static final class Session implements Runnable {
        final long startedAt = System.currentTimeMillis();
        final int[] ring = new int[RING];
        long flushed; // samples handed to the encoder
        final long[] pos = new long[2]; // next sample index per side, -1 until the side starts
        final long[] lastAt = new long[2];
        final double[] resamplePhase = new double[2];
        final short[] resampleLast = new short[2];
        volatile boolean finished;

        Uri uri;
        ParcelFileDescriptor pfd;
        MediaCodec codec;
        MediaMuxer muxer;
        int track = -1;
        boolean muxerStarted;
        long encodedSamples;
        long maxAbs;

        Session() {
            pos[0] = -1;
            pos[1] = -1;
        }

        void start() {
            Thread t = new Thread(this, "FlipCallRecorder");
            t.setDaemon(true);
            t.start();
        }

        void add(int side, short[] in, int rate) {
            short[] samples = rate == RATE ? in : resample(side, in, rate);
            long now = System.currentTimeMillis();
            synchronized (this) {
                if (finished) return;
                if (pos[side] < 0) {
                    pos[side] = Math.max(flushed, (now - startedAt) * RATE / 1000 - samples.length);
                }
                // A side that paused (e.g. hold) restarts at "now" instead of running behind.
                long nowPos = (now - startedAt) * RATE / 1000;
                if (nowPos - pos[side] > RATE / 2) pos[side] = Math.max(flushed, nowPos - samples.length);
                long p = pos[side];
                for (int i = 0; i < samples.length; i++) {
                    long idx = p + i;
                    if (idx < flushed || idx >= flushed + RING) continue;
                    ring[(int) (idx % RING)] += samples[i];
                }
                pos[side] = p + samples.length;
                lastAt[side] = now;
            }
        }

        private short[] resample(int side, short[] in, int rate) {
            double step = (double) rate / RATE;
            int outLen = (int) ((in.length - resamplePhase[side]) / step);
            if (outLen <= 0) return new short[0];
            short[] out = new short[outLen];
            double x = resamplePhase[side];
            for (int i = 0; i < outLen; i++) {
                int i0 = (int) Math.floor(x);
                double f = x - i0;
                short a = i0 < 0 ? resampleLast[side] : in[Math.min(i0, in.length - 1)];
                short b = in[Math.min(i0 + 1, in.length - 1)];
                out[i] = (short) (a + (b - a) * f);
                x += step;
            }
            resamplePhase[side] = x - in.length;
            resampleLast[side] = in[in.length - 1];
            return out;
        }

        @Override
        public void run() {
            try {
                open();
                while (true) {
                    Thread.sleep(100);
                    long now = System.currentTimeMillis();
                    short[] chunk;
                    boolean end;
                    synchronized (this) {
                        long last = Math.max(lastAt[0], lastAt[1]);
                        end = now - last > END_MS;
                        long target = Long.MAX_VALUE;
                        boolean any = false;
                        for (int s = 0; s < 2; s++) {
                            if (pos[s] < 0) continue;
                            if (now - lastAt[s] > STALL_MS) continue;
                            any = true;
                            target = Math.min(target, pos[s]);
                        }
                        if (!any || end) target = Math.max(pos[0], pos[1]);
                        if (target <= flushed) {
                            chunk = null;
                        } else {
                            int n = (int) Math.min(target - flushed, RING);
                            chunk = new short[n];
                            for (int i = 0; i < n; i++) {
                                int k = (int) ((flushed + i) % RING);
                                int v = ring[k];
                                ring[k] = 0;
                                chunk[i] = (short) Math.max(-32768, Math.min(32767, v));
                            }
                            flushed += n;
                        }
                        if (end) finished = true;
                    }
                    if (chunk != null) encode(chunk, false);
                    if (end) break;
                }
                encode(new short[0], true);
                close();
            } catch (Throwable t) {
                Log.e(TAG, "recording failed", t);
                finished = true;
                abort();
            }
        }

        private void open() throws Exception {
            ContentResolver cr = appContext.getContentResolver();
            ContentValues v = new ContentValues();
            v.put(MediaStore.MediaColumns.DISPLAY_NAME, "Voice call " + stamp(startedAt) + ".m4a");
            v.put(MediaStore.MediaColumns.MIME_TYPE, "audio/mp4");
            if (Build.VERSION.SDK_INT >= 29) {
                v.put(MediaStore.MediaColumns.RELATIVE_PATH,
                        (Build.VERSION.SDK_INT >= 31 ? "Recordings" : "Music") + "/Voice calls");
                v.put(MediaStore.MediaColumns.IS_PENDING, 1);
            }
            uri = cr.insert(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, v);
            if (uri == null) throw new IllegalStateException("MediaStore insert failed");
            pfd = cr.openFileDescriptor(uri, "rw");
            muxer = new MediaMuxer(pfd.getFileDescriptor(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);

            MediaFormat f = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, RATE, 1);
            f.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
            f.setInteger(MediaFormat.KEY_BIT_RATE, 64000);
            f.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 16384);
            codec = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_AAC);
            codec.configure(f, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            codec.start();
            Log.w(TAG, "Recording started: " + uri);
        }

        private void encode(short[] pcm, boolean eos) {
            int offset = 0;
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean eosQueued = false;
            while (offset < pcm.length || (eos && !eosQueued)) {
                int in = codec.dequeueInputBuffer(10_000);
                if (in >= 0) {
                    ByteBuffer ib = codec.getInputBuffer(in);
                    ib.clear();
                    ib.order(ByteOrder.LITTLE_ENDIAN);
                    int n = Math.min(pcm.length - offset, ib.capacity() / 2);
                    for (int i = 0; i < n; i++) {
                        short s = pcm[offset + i];
                        ib.putShort(s);
                        maxAbs = Math.max(maxAbs, Math.abs((int) s));
                    }
                    long pts = encodedSamples * 1_000_000L / RATE;
                    offset += n;
                    encodedSamples += n;
                    boolean last = eos && offset >= pcm.length;
                    codec.queueInputBuffer(in, 0, n * 2, pts, last ? MediaCodec.BUFFER_FLAG_END_OF_STREAM : 0);
                    if (last) eosQueued = true;
                }
                drain(info, false);
            }
            if (eos) drain(info, true);
        }

        private void drain(MediaCodec.BufferInfo info, boolean untilEos) {
            while (true) {
                int out = codec.dequeueOutputBuffer(info, untilEos ? 10_000 : 0);
                if (out == MediaCodec.INFO_TRY_AGAIN_LATER) {
                    if (!untilEos) return;
                    continue;
                }
                if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    track = muxer.addTrack(codec.getOutputFormat());
                    muxer.start();
                    muxerStarted = true;
                    continue;
                }
                if (out < 0) continue;
                ByteBuffer ob = codec.getOutputBuffer(out);
                boolean config = (info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0;
                if (!config && info.size > 0 && muxerStarted) {
                    ob.position(info.offset);
                    ob.limit(info.offset + info.size);
                    muxer.writeSampleData(track, ob, info);
                }
                codec.releaseOutputBuffer(out, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) return;
            }
        }

        private void close() throws Exception {
            codec.stop();
            codec.release();
            if (muxerStarted) muxer.stop();
            muxer.release();
            pfd.close();
            ContentResolver cr = appContext.getContentResolver();
            long seconds = encodedSamples / RATE;
            if (seconds < 1 || !muxerStarted) {
                cr.delete(uri, null, null);
                Log.w(TAG, "Recording too short, deleted");
                return;
            }
            ContentValues v = new ContentValues();
            if (Build.VERSION.SDK_INT >= 29) v.put(MediaStore.MediaColumns.IS_PENDING, 0);
            v.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName() + ".m4a");
            try {
                cr.update(uri, v, null, null);
            } catch (Throwable t) {
                // Name clash or similar: keep the default name.
                ContentValues p = new ContentValues();
                if (Build.VERSION.SDK_INT >= 29) p.put(MediaStore.MediaColumns.IS_PENDING, 0);
                cr.update(uri, p, null, null);
            }
            Log.w(TAG, "Recording saved: " + seconds + " s, peak " + maxAbs);
        }

        private void abort() {
            try {
                if (codec != null) codec.release();
            } catch (Throwable ignored) {
            }
            try {
                if (muxer != null) muxer.release();
            } catch (Throwable ignored) {
            }
            try {
                if (pfd != null) pfd.close();
            } catch (Throwable ignored) {
            }
            try {
                if (uri != null && encodedSamples < RATE) appContext.getContentResolver().delete(uri, null, null);
                else if (uri != null && Build.VERSION.SDK_INT >= 29) {
                    ContentValues v = new ContentValues();
                    v.put(MediaStore.MediaColumns.IS_PENDING, 0);
                    appContext.getContentResolver().update(uri, v, null, null);
                }
            } catch (Throwable ignored) {
            }
        }

        private String fileName() {
            String who = null;
            String direction = "";
            Connection c = lastConnection;
            // The connection is made just before the audio starts; ignore one from an earlier call.
            if (c != null && Math.abs(lastConnectionAt - startedAt) < 120_000) {
                direction = lastIncoming ? "Incoming" : "Outgoing";
                try {
                    Uri address = c.getAddress();
                    String number = address != null ? address.getSchemeSpecificPart() : null;
                    if (number != null && !number.isEmpty()) {
                        String name = contactName(number);
                        who = name != null ? name + " (" + number + ")" : number;
                    }
                } catch (Throwable ignored) {
                }
                if (who == null) {
                    try {
                        CharSequence n = c.getCallerDisplayName();
                        if (n != null && n.length() > 0) who = n.toString();
                    } catch (Throwable ignored) {
                    }
                }
            }
            StringBuilder sb = new StringBuilder();
            if (who != null) sb.append(who).append(' ');
            sb.append(stamp(startedAt));
            if (!direction.isEmpty()) sb.append(' ').append(direction);
            return sb.toString().replaceAll("[\\\\/:*?\"<>|]", "_");
        }
    }

    private static String contactName(String number) {
        Cursor c = null;
        try {
            Uri u = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(number));
            c = appContext.getContentResolver().query(u,
                    new String[]{ContactsContract.PhoneLookup.DISPLAY_NAME}, null, null, null);
            if (c != null && c.moveToFirst()) return c.getString(0);
        } catch (Throwable ignored) {
        } finally {
            if (c != null) c.close();
        }
        return null;
    }

    private static String stamp(long t) {
        return new SimpleDateFormat("yyyy-MM-dd HH-mm-ss", Locale.US).format(new Date(t));
    }

    @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri u) { return null; }
    @Override public Uri insert(Uri u, ContentValues v) { return null; }
    @Override public int delete(Uri u, String s, String[] a) { return 0; }
    @Override public int update(Uri u, ContentValues v, String s, String[] a) { return 0; }
}
