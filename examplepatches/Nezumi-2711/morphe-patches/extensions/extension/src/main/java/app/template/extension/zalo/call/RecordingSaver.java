package app.template.extension.zalo.call;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.shared.ZaloEnv;

/** Turns the recorder's temporary WAV into an m4a in Music/ZaloRecordings (WAV copy on failure). */
final class RecordingSaver {
    private RecordingSaver() { }

    static final String FOLDER = "ZaloRecordings";
    static final String RELATIVE_PATH = Environment.DIRECTORY_MUSIC + "/" + FOLDER;
    private static final String TAG = CallRecorder.TAG;

    private static final class Wav {
        int channels;
        int sampleRate;
        long dataOffset;
        long dataLength;
    }

    static void save(File wav, String peerName, boolean outgoing, long when, long minDurationMs) {
        Context context = ZaloEnv.appContext();
        if (context == null || wav == null || !wav.isFile()) {
            NezumiLog.w(TAG, "nothing to save");
            CallRecorder.toast("Không có dữ liệu ghi âm");
            return;
        }
        Wav info;
        try {
            info = parse(wav);
        } catch (Throwable failure) {
            NezumiLog.e(TAG, "bad wav header", failure);
            info = null;
        }
        if (info != null) {
            long durationMs = info.dataLength * 1000L / ((long) info.sampleRate * info.channels * 2);
            if (durationMs < minDurationMs) {
                NezumiLog.i(TAG, "too short (" + durationMs + " ms), dropped");
                //noinspection ResultOfMethodCallIgnored
                wav.delete();
                return;
            }
        } else if (wav.length() < 44 + 16000L * 2 * 2) { // unparsable and under ~2 s at 16 kHz
            //noinspection ResultOfMethodCallIgnored
            wav.delete();
            return;
        }
        String base = fileBase(peerName, outgoing, when);
        if (info != null) {
            try {
                String name = base + ".m4a";
                saveEncoded(context, wav, info, name);
                //noinspection ResultOfMethodCallIgnored
                wav.delete();
                CallRecorder.toast("Đã lưu: " + name);
                return;
            } catch (Throwable failure) {
                NezumiLog.e(TAG, "m4a encode failed, falling back to wav", failure);
            }
        }
        try {
            String name = base + ".wav";
            saveWavCopy(context, wav, name);
            //noinspection ResultOfMethodCallIgnored
            wav.delete();
            CallRecorder.toast("Không chuyển được m4a, đã lưu WAV: " + name);
        } catch (Throwable failure) {
            NezumiLog.e(TAG, "wav copy failed", failure);
            CallRecorder.toast("Lưu bản ghi thất bại (giữ tại " + wav.getAbsolutePath() + ")");
        }
    }

    private static String fileBase(String peerName, boolean outgoing, long when) {
        String name = peerName == null ? "" : peerName.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", " ")
            .replaceAll("\\s+", "_").replaceAll("^[._]+|[._]+$", "");
        if (name.length() > 40) name = name.substring(0, 40);
        if (name.isEmpty()) name = "call";
        return name + "_" + (outgoing ? "out" : "in") + "_"
            + new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date(when));
    }

    // ---- WAV parsing ----

    private static Wav parse(File file) throws IOException {
        try (RandomAccessFile in = new RandomAccessFile(file, "r")) {
            long length = in.length();
            byte[] head = new byte[12];
            in.readFully(head);
            if (!"RIFF".equals(new String(head, 0, 4, "US-ASCII")) || !"WAVE".equals(new String(head, 8, 4, "US-ASCII"))) {
                throw new IOException("not a RIFF/WAVE file");
            }
            Wav wav = new Wav();
            int bits = 0;
            int format = 0;
            long position = 12;
            while (position + 8 <= length) {
                in.seek(position);
                byte[] chunk = new byte[8];
                in.readFully(chunk);
                String id = new String(chunk, 0, 4, "US-ASCII");
                long size = le32(chunk, 4) & 0xFFFFFFFFL;
                if ("fmt ".equals(id)) {
                    byte[] fmt = new byte[16];
                    in.readFully(fmt);
                    format = le16(fmt, 0);
                    wav.channels = le16(fmt, 2);
                    wav.sampleRate = le32(fmt, 4);
                    bits = le16(fmt, 14);
                } else if ("data".equals(id)) {
                    wav.dataOffset = position + 8;
                    long available = length - wav.dataOffset;
                    // A recording cut off by call teardown can leave size 0 / 0xFFFFFFFF in the header.
                    wav.dataLength = (size == 0 || size > available) ? available : size;
                    break;
                }
                position += 8 + size + (size & 1);
            }
            if (wav.dataOffset == 0) throw new IOException("no data chunk");
            if (format != 1 && format != 0xFFFE) throw new IOException("unsupported format " + format);
            if (bits != 16) throw new IOException("unsupported bit depth " + bits);
            if (wav.channels < 1 || wav.channels > 2 || wav.sampleRate < 8000) {
                throw new IOException("unsupported layout " + wav.channels + "ch " + wav.sampleRate + "Hz");
            }
            wav.dataLength -= wav.dataLength % (2L * wav.channels);
            return wav;
        }
    }

    private static int le16(byte[] b, int o) {
        return (b[o] & 0xFF) | ((b[o + 1] & 0xFF) << 8);
    }

    private static int le32(byte[] b, int o) {
        return le16(b, o) | (le16(b, o + 2) << 16);
    }

    // ---- Output targets ----

    private static final class Target {
        Uri uri;          // MediaStore row (API 29+)
        File file;        // direct file (older Android)
        ParcelFileDescriptor descriptor;
    }

    private static Target open(Context context, String name, String mime) throws IOException {
        Target target = new Target();
        if (Build.VERSION.SDK_INT >= 29) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.Audio.Media.DISPLAY_NAME, name);
            values.put(MediaStore.Audio.Media.MIME_TYPE, mime);
            values.put(MediaStore.Audio.Media.RELATIVE_PATH, RELATIVE_PATH);
            values.put(MediaStore.Audio.Media.IS_PENDING, 1);
            target.uri = context.getContentResolver().insert(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, values);
            if (target.uri == null) throw new IOException("MediaStore insert failed");
            target.descriptor = context.getContentResolver().openFileDescriptor(target.uri, "rw");
            if (target.descriptor == null) throw new IOException("cannot open " + target.uri);
        } else {
            File dir = new File(context.getExternalFilesDir(Environment.DIRECTORY_MUSIC), FOLDER);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("cannot create " + dir);
            target.file = new File(dir, name);
        }
        return target;
    }

    private static void finish(Context context, Target target) {
        closeQuietly(target);
        if (target.uri != null) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.Audio.Media.IS_PENDING, 0);
            context.getContentResolver().update(target.uri, values, null, null);
        }
    }

    private static void discard(Context context, Target target) {
        closeQuietly(target);
        try {
            if (target.uri != null) context.getContentResolver().delete(target.uri, null, null);
            if (target.file != null) //noinspection ResultOfMethodCallIgnored
                target.file.delete();
        } catch (RuntimeException ignored) { }
    }

    private static void closeQuietly(Target target) {
        try {
            if (target.descriptor != null) target.descriptor.close();
        } catch (IOException ignored) { }
        target.descriptor = null;
    }

    private static void saveWavCopy(Context context, File wav, String name) throws IOException {
        Target target = open(context, name, "audio/x-wav");
        try {
            ContentResolver resolver = context.getContentResolver();
            try (InputStream in = new FileInputStream(wav);
                 OutputStream out = target.uri != null ? resolver.openOutputStream(target.uri, "w")
                     : new java.io.FileOutputStream(target.file)) {
                byte[] buffer = new byte[64 * 1024];
                for (int read; (read = in.read(buffer)) > 0; ) out.write(buffer, 0, read);
            }
            finish(context, target);
        } catch (IOException | RuntimeException failure) {
            discard(context, target);
            throw failure;
        }
    }

    // ---- PCM16 -> AAC/m4a ----

    private static void saveEncoded(Context context, File wav, Wav info, String name) throws Exception {
        Target target = open(context, name, "audio/mp4");
        try {
            if (target.descriptor != null) {
                encode(wav, info, new MediaMuxer(target.descriptor.getFileDescriptor(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4));
            } else {
                encode(wav, info, new MediaMuxer(target.file.getAbsolutePath(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4));
            }
            finish(context, target);
        } catch (Exception | Error failure) {
            discard(context, target);
            throw failure;
        }
    }

    private static void encode(File wav, Wav info, MediaMuxer muxer) throws IOException {
        MediaFormat format = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, info.sampleRate, info.channels);
        format.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
        format.setInteger(MediaFormat.KEY_BIT_RATE, info.channels == 1 ? 64000 : 96000);
        format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 16384);
        MediaCodec codec = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_AAC);
        boolean muxerStarted = false;
        boolean codecStarted = false;
        try (RandomAccessFile in = new RandomAccessFile(wav, "r")) {
            codec.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            codec.start();
            codecStarted = true;
            in.seek(info.dataOffset);
            long remaining = info.dataLength;
            long bytesPerSecond = (long) info.sampleRate * info.channels * 2;
            long fed = 0;
            byte[] chunk = new byte[8192];
            MediaCodec.BufferInfo bufferInfo = new MediaCodec.BufferInfo();
            int track = -1;
            boolean inputDone = false;
            boolean outputDone = false;
            while (!outputDone) {
                if (!inputDone) {
                    int index = codec.dequeueInputBuffer(10_000);
                    if (index >= 0) {
                        ByteBuffer buffer = codec.getInputBuffer(index);
                        buffer.clear();
                        int want = (int) Math.min(Math.min(chunk.length, buffer.capacity()), remaining);
                        int read = want > 0 ? in.read(chunk, 0, want) : -1;
                        if (read <= 0) {
                            codec.queueInputBuffer(index, 0, 0, fed * 1_000_000L / bytesPerSecond,
                                MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            buffer.put(chunk, 0, read);
                            codec.queueInputBuffer(index, 0, read, fed * 1_000_000L / bytesPerSecond, 0);
                            fed += read;
                            remaining -= read;
                        }
                    }
                }
                int out = codec.dequeueOutputBuffer(bufferInfo, 10_000);
                if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerStarted) throw new IllegalStateException("format changed twice");
                    track = muxer.addTrack(codec.getOutputFormat());
                    muxer.start();
                    muxerStarted = true;
                } else if (out >= 0) {
                    ByteBuffer encoded = codec.getOutputBuffer(out);
                    if ((bufferInfo.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0) bufferInfo.size = 0;
                    if (bufferInfo.size > 0) {
                        if (!muxerStarted) throw new IllegalStateException("muxer not started");
                        encoded.position(bufferInfo.offset);
                        encoded.limit(bufferInfo.offset + bufferInfo.size);
                        muxer.writeSampleData(track, encoded, bufferInfo);
                    }
                    codec.releaseOutputBuffer(out, false);
                    if ((bufferInfo.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) outputDone = true;
                }
            }
        } finally {
            try {
                if (codecStarted) codec.stop();
            } catch (RuntimeException ignored) { }
            codec.release();
            try {
                if (muxerStarted) muxer.stop();
            } catch (RuntimeException ignored) { }
            muxer.release();
        }
    }
}
