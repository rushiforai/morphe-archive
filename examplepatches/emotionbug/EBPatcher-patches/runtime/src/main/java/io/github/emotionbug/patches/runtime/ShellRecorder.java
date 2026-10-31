package io.github.emotionbug.patches.runtime;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.media.MediaRecorder;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import android.system.Os;
import android.system.OsConstants;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.List;

/** Independently implemented shell-only Shizuku UserService; never opens a microphone source. */
public final class ShellRecorder extends Binder {
    public static final String DESCRIPTOR = "io.github.emotionbug.patches.runtime.IShellRecorder";
    public static final String CALLBACK = "io.github.emotionbug.patches.runtime.IShellCallback";
    private static final int SHIZUKU_DESTROY = 16777115;
    private static final int SHELL_UID = 2000;
    private static final long CODEC_TIMEOUT_MS = 5000;
    private final Context context;
    private Context audioContext;
    private java.lang.reflect.Method setAudioContext;
    private final int ownerUid;
    private final Object lock = new Object();
    private Worker worker;
    private boolean destroyed;
    private boolean exitWhenIdle;

    public ShellRecorder(Context context) {
        this.context = context;
        this.ownerUid = context.getApplicationInfo().uid;
        attachInterface(null, DESCRIPTOR);
    }

    private void requireOwner() {
        if (Process.myUid() != SHELL_UID || Binder.getCallingUid() != ownerUid)
            throw new SecurityException("Only the owning app may use a UID 2000 recorder");
    }

    private String permissionProblem() {
        if (Process.myUid() != SHELL_UID) return "Shizuku must run as shell UID 2000, not root";
        if (context.checkPermission(Manifest.permission.RECORD_AUDIO, Process.myPid(), SHELL_UID)
                != PackageManager.PERMISSION_GRANTED)
            return "Shell UID 2000 lacks RECORD_AUDIO";
        if (context.checkPermission("android.permission.CAPTURE_AUDIO_OUTPUT", Process.myPid(), SHELL_UID)
                != PackageManager.PERMISSION_GRANTED)
            return "Shell UID 2000 lacks privileged CAPTURE_AUDIO_OUTPUT for VOICE_CALL";
        return null;
    }

    private synchronized void prepareAudioAttribution() throws Exception {
        if (audioContext != null) return;
        Context shell = context.createPackageContext("com.android.shell", 0);
        Class<?> threadClass = Class.forName("android.app.ActivityThread");
        Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
        // createPackageContext retains its caller's operation package. Build an independent
        // app context so Android constructs both operation package and attribution for shell.
        java.lang.reflect.Field loaded = shell.getClass().getDeclaredField("mPackageInfo");
        loaded.setAccessible(true);
        java.lang.reflect.Method create = shell.getClass().getDeclaredMethod("createAppContext",
                threadClass, Class.forName("android.app.LoadedApk"));
        create.setAccessible(true);
        shell = (Context) create.invoke(null, thread, loaded.get(shell));
        if (shell.getApplicationInfo().uid != SHELL_UID)
            throw new SecurityException("Shell package does not belong to UID 2000");
        if (android.os.Build.VERSION.SDK_INT >= 31) {
            if (shell.getAttributionSource().getUid() != SHELL_UID
                    || !"com.android.shell".equals(shell.getAttributionSource().getPackageName()))
                throw new SecurityException("Invalid shell audio attribution");
            setAudioContext = AudioRecord.Builder.class.getMethod("setContext", Context.class);
        } else {
            // API 29–30 AudioRecord reads ActivityThread.currentOpPackageName().
            // This is the dedicated shell UserService process, never the app process.
            java.lang.reflect.Field initial = threadClass.getDeclaredField("mInitialApplication");
            initial.setAccessible(true);
            initial.set(thread, android.app.Instrumentation.newApplication(android.app.Application.class, shell));
        }
        audioContext = shell;
    }

    private static int channelMask(int channels) {
        if (channels == 1) return AudioFormat.CHANNEL_IN_MONO;
        if (channels == 2) return AudioFormat.CHANNEL_IN_STEREO;
        throw new IllegalArgumentException("Call capture requires one or two channels");
    }

    private AudioRecord createAudioRecord(int bufferBytes, int channels) throws Exception {
        prepareAudioAttribution();
        AudioRecord.Builder builder = new AudioRecord.Builder()
                .setAudioSource(MediaRecorder.AudioSource.VOICE_CALL)
                .setAudioFormat(new AudioFormat.Builder().setSampleRate(RecorderMath.SAMPLE_RATE)
                        .setChannelMask(channelMask(channels)).setEncoding(AudioFormat.ENCODING_PCM_16BIT).build())
                .setBufferSizeInBytes(bufferBytes);
        if (setAudioContext != null) setAudioContext.invoke(builder, audioContext);
        return builder.build();
    }

    private static MediaFormat format(int channels) {
        MediaFormat f = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, RecorderMath.SAMPLE_RATE, channels);
        f.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
        f.setInteger(MediaFormat.KEY_BIT_RATE, 64000 * channels);
        f.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 4096 * channels);
        return f;
    }

    /** Does not create AudioRecord, start capture, or write output. */
    private String preflight(int channels) {
        String reason = permissionProblem();
        if (reason != null) return reason;
        synchronized (lock) {
            if (destroyed) return "Recorder service has been destroyed";
            if (worker != null) return "Recorder is already active";
        }
        MediaCodec probe = null;
        try {
            prepareAudioAttribution();
            if (AudioRecord.getMinBufferSize(RecorderMath.SAMPLE_RATE, channelMask(channels),
                    AudioFormat.ENCODING_PCM_16BIT) <= 0)
                return "16 kHz PCM16 capture format is unavailable; channels=" + channels;
            MediaFormat requested = format(channels);
            String encoder = new MediaCodecList(MediaCodecList.REGULAR_CODECS).findEncoderForFormat(requested);
            if (encoder == null) return "AAC-LC encoder for the requested channels is unavailable";
            probe = MediaCodec.createByCodecName(encoder);
            probe.configure(requested, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            return null;
        } catch (Exception e) {
            return "Shell attribution or AAC-LC preflight failed: " + message(e);
        } finally {
            if (probe != null) try { probe.release(); } catch (RuntimeException ignored) { }
        }
    }

    @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        if (code == INTERFACE_TRANSACTION) {
            if (reply != null) reply.writeString(DESCRIPTOR);
            return true;
        }
        if (code == SHIZUKU_DESTROY) {
            if (Process.myUid() != SHELL_UID || Binder.getCallingUid() != SHELL_UID)
                throw new SecurityException("Only the shell Shizuku server may destroy this process");
            destroy(true);
            if (reply != null) reply.writeNoException();
            return true;
        }
        if (code < 1 || code > 4) return super.onTransact(code, data, reply, flags);
        requireOwner();
        data.enforceInterface(DESCRIPTOR);
        switch (code) {
            case 1:
                String reason = preflight(data.readInt());
                reply.writeNoException();
                reply.writeString(reason);
                return true;
            case 2:
                int requestedOwner = data.readInt();
                String filename = data.readString();
                ParcelFileDescriptor output = data.readInt() != 0 ? ParcelFileDescriptor.CREATOR.createFromParcel(data) : null;
                IBinder callback = data.readStrongBinder();
                int channels = data.readInt();
                try {
                    if (requestedOwner != ownerUid) throw new SecurityException("Output owner UID mismatch");
                    if (filename == null || filename.isEmpty() || output == null || callback == null)
                        throw new IllegalArgumentException("Filename, output descriptor and callback are required");
                    channelMask(channels);
                    synchronized (lock) {
                        if (destroyed || worker != null) throw new IllegalStateException("Recorder unavailable or busy");
                        Worker next = new Worker(output, callback, channels);
                        callback.linkToDeath(next, 0);
                        worker = next;
                        try { next.start(); } catch (RuntimeException | Error e) {
                            worker = null;
                            callback.unlinkToDeath(next, 0);
                            throw e;
                        }
                        output = null; // Worker owns the received descriptor, not the app's descriptor.
                    }
                } finally { close(output); }
                reply.writeNoException();
                return true;
            case 3:
                synchronized (lock) { if (worker != null) worker.stopRequested = true; }
                reply.writeNoException();
                return true;
            case 4:
                destroy(false);
                reply.writeNoException();
                return true;
            default: return false;
        }
    }

    private void destroy(boolean exit) {
        synchronized (lock) {
            destroyed = true;
            exitWhenIdle |= exit;
            if (worker != null) {
                worker.aborted = true;
                worker.stopRequested = true;
            }
            else if (exitWhenIdle) new Thread(() -> System.exit(0), "Recorder-exit").start();
        }
    }

    private static void close(ParcelFileDescriptor fd) {
        if (fd != null) try { fd.close(); } catch (IOException ignored) { }
    }
    private static String message(Throwable error) {
        return error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
    }
    private static final class Failure extends Exception {
        final int code;
        Failure(int code, String message) { super(message); this.code = code; }
    }

    private final class Worker extends Thread implements IBinder.DeathRecipient {
        final ParcelFileDescriptor output;
        final IBinder callback;
        final int channels;
        volatile boolean stopRequested;
        volatile boolean callbackDead;
        volatile boolean aborted;
        volatile boolean captureSilenced;
        volatile boolean captureLayoutChanged;
        boolean captureLayoutObserved;
        boolean recordingCallbackRegistered;
        final AudioManager.AudioRecordingCallback recordingCallback = new AudioManager.AudioRecordingCallback() {
            @Override public void onRecordingConfigChanged(List<AudioRecordingConfiguration> configurations) {
                for (AudioRecordingConfiguration configuration : configurations) {
                    if (configuration.isClientSilenced()) captureSilenced = true;
                    if (channels == 2 && (configuration.getClientFormat().getChannelCount() != 2
                            || configuration.getFormat().getChannelCount() != 2
                            || configuration.getClientAudioSource() != MediaRecorder.AudioSource.VOICE_CALL))
                        captureLayoutChanged = true;
                }
            }
        };
        AudioRecord audio;
        MediaCodec codec;
        MediaMuxer muxer;
        boolean codecStarted;
        boolean muxerStarted;
        boolean outputEos;
        int track = -1;
        long frames;
        long encodedBytes;
        final MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        final RecorderMath.Signal signal = new RecorderMath.Signal();

        Worker(ParcelFileDescriptor output, IBinder callback, int channels) {
            super("Shell-call-recorder");
            this.output = output;
            this.callback = callback;
            this.channels = channels;
        }
        @Override public void binderDied() { callbackDead = true; stopRequested = true; }

        private void notifyCallback(int transaction, int error, String reason) throws RemoteException {
            if (callbackDead) return;
            Parcel request = Parcel.obtain();
            Parcel response = Parcel.obtain();
            try {
                request.writeInterfaceToken(CALLBACK);
                if (transaction == 2) {
                    request.writeLong(RecorderMath.durationMs(frames, RecorderMath.SAMPLE_RATE));
                    request.writeLong(frames);
                    request.writeLong(encodedBytes);
                } else if (transaction == 3) {
                    request.writeInt(error);
                    request.writeString(reason);
                }
                if (!callback.transact(transaction, request, response, 0))
                    throw new RemoteException("Recorder callback transaction rejected");
                response.readException();
            } finally { response.recycle(); request.recycle(); }
        }

        @Override public void run() {
            Throwable failure = null;
            try { record(); } catch (Throwable e) { failure = e; }
            // All resources are released before a terminal callback, even on a failed capture.
            if (audio != null) {
                if (recordingCallbackRegistered) try { audio.unregisterAudioRecordingCallback(recordingCallback); }
                catch (RuntimeException e) { if (failure == null) failure = e; }
                try { if (audio.getRecordingState() == AudioRecord.RECORDSTATE_RECORDING) audio.stop(); }
                catch (RuntimeException e) { if (failure == null) failure = e; }
                try { audio.release(); } catch (RuntimeException e) { if (failure == null) failure = e; }
            }
            if (codec != null) {
                if (codecStarted) try { codec.stop(); } catch (RuntimeException e) { if (failure == null) failure = e; }
                try { codec.release(); } catch (RuntimeException e) { if (failure == null) failure = e; }
            }
            if (muxer != null) {
                if (muxerStarted) try { muxer.stop(); } catch (RuntimeException e) { if (failure == null) failure = e; }
                try { muxer.release(); } catch (RuntimeException e) { if (failure == null) failure = e; }
            }
            if (failure == null) {
                try { Os.fsync(output.getFileDescriptor()); } catch (Exception e) { failure = e; }
            }
            try { output.close(); } catch (IOException e) { if (failure == null) failure = e; }
            if (failure == null && captureSilenced) failure = new Failure(2007, "Capture was silenced by Android");
            if (failure == null && captureLayoutChanged) failure = new Failure(2007, "Android changed the separate-channel capture format");
            if (failure == null && aborted) failure = new Failure(2001, "Recorder service was destroyed");
            try {
                if (failure == null) notifyCallback(2, 0, null);
                else notifyCallback(3, failure instanceof Failure ? ((Failure) failure).code
                        : failure instanceof SecurityException ? 1002 : 2001, message(failure));
            } catch (RemoteException | RuntimeException ignored) {
                // A dead owner cannot publish the pending file; never claim successful delivery.
            } finally {
                callback.unlinkToDeath(this, 0);
                synchronized (lock) {
                    worker = null;
                    if (exitWhenIdle) System.exit(0);
                }
            }
        }

        private void checkCapture() throws Failure {
            AudioRecordingConfiguration configuration = audio.getActiveRecordingConfiguration();
            if (captureSilenced || (configuration != null && configuration.isClientSilenced()))
                throw new Failure(2007, "Android reports the VOICE_CALL capture client is silenced");
            if (channels != 2) return;
            if (captureLayoutChanged || (configuration != null
                    && (configuration.getClientFormat().getChannelCount() != 2
                    || configuration.getFormat().getChannelCount() != 2
                    || configuration.getClientAudioSource() != MediaRecorder.AudioSource.VOICE_CALL)))
                throw new Failure(2007, "Device did not preserve two VOICE_CALL capture channels; disable Keep call channels separate");
            if (!captureLayoutObserved && configuration != null) {
                captureLayoutObserved = true;
                android.util.Log.i("EmbeddedRecorder", "capture_source=VOICE_CALL client_channels=2 device_channels=2 channel_roles=unverified");
            }
        }

        private void record() throws Exception {
            String permission = permissionProblem();
            if (permission != null) throw new Failure(1002, permission);
            Os.lseek(output.getFileDescriptor(), 0, OsConstants.SEEK_SET);
            Os.ftruncate(output.getFileDescriptor(), 0);
            int minimum = AudioRecord.getMinBufferSize(RecorderMath.SAMPLE_RATE,
                    channelMask(channels), AudioFormat.ENCODING_PCM_16BIT);
            if (minimum <= 0) throw new Failure(2001, "PCM16 format is unsupported; channels=" + channels);
            MediaFormat requested = format(channels);
            String encoder = new MediaCodecList(MediaCodecList.REGULAR_CODECS).findEncoderForFormat(requested);
            if (encoder == null) throw new Failure(2001, "AAC-LC encoder is unavailable for channels=" + channels);
            codec = MediaCodec.createByCodecName(encoder);
            codec.configure(requested, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            muxer = new MediaMuxer(output.getFileDescriptor(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            audio = createAudioRecord(Math.max(minimum, 8192 * channels), channels);
            if (audio.getState() != AudioRecord.STATE_INITIALIZED)
                throw new Failure(2001, "VOICE_CALL AudioRecord initialization failed; device policy may deny call capture");
            if (audio.getChannelCount() != channels || audio.getSampleRate() != RecorderMath.SAMPLE_RATE
                    || audio.getAudioFormat() != AudioFormat.ENCODING_PCM_16BIT
                    || audio.getAudioSource() != MediaRecorder.AudioSource.VOICE_CALL)
                throw new Failure(2001, "Device changed the requested VOICE_CALL PCM format");
            audio.registerAudioRecordingCallback(Runnable::run, recordingCallback);
            recordingCallbackRegistered = true;
            codec.start();
            codecStarted = true;
            audio.startRecording();
            if (audio.getRecordingState() != AudioRecord.RECORDSTATE_RECORDING)
                throw new Failure(2001, "VOICE_CALL did not enter recording state");
            checkCapture();
            notifyCallback(1, 0, null);
            short[] pcm = new short[2048 * channels];
            long lastPcm = SystemClock.elapsedRealtime();
            while (!stopRequested) {
                checkCapture();
                int count = audio.read(pcm, 0, pcm.length, AudioRecord.READ_NON_BLOCKING);
                if (count < 0) throw new Failure(2001, "VOICE_CALL PCM read failed: " + count);
                if (count == 0) {
                    drain();
                    if (SystemClock.elapsedRealtime() - lastPcm >= CODEC_TIMEOUT_MS)
                        throw new Failure(2007, "VOICE_CALL produced no PCM frames");
                    SystemClock.sleep(5);
                    continue;
                }
                if (count % channels != 0) throw new Failure(2001, "VOICE_CALL returned an incomplete PCM frame");
                lastPcm = SystemClock.elapsedRealtime();
                signal.add(pcm, count);
                int offset = 0;
                while (offset < count) {
                    int index = inputIndex();
                    ByteBuffer input = codec.getInputBuffer(index);
                    if (input == null || input.capacity() < 2 * channels) throw new Failure(2001, "Invalid AAC input buffer");
                    input.clear();
                    input.order(ByteOrder.LITTLE_ENDIAN);
                    int chunk = Math.min(count - offset, input.remaining() / (2 * channels) * channels);
                    for (int i = 0; i < chunk; i++) input.putShort(pcm[offset + i]);
                    codec.queueInputBuffer(index, 0, chunk * 2,
                            RecorderMath.timestampUs(frames, RecorderMath.SAMPLE_RATE), 0);
                    frames += chunk / channels;
                    offset += chunk;
                    drain();
                }
            }
            checkCapture();
            if (channels == 2 && !captureLayoutObserved)
                throw new Failure(2007, "Android did not expose a verifiable two-channel capture configuration");
            audio.stop();
            int index = inputIndex();
            codec.queueInputBuffer(index, 0, 0, RecorderMath.timestampUs(frames, RecorderMath.SAMPLE_RATE),
                    MediaCodec.BUFFER_FLAG_END_OF_STREAM);
            long deadline = SystemClock.elapsedRealtime() + CODEC_TIMEOUT_MS;
            while (!outputEos) {
                drain();
                if (SystemClock.elapsedRealtime() >= deadline) throw new Failure(2001, "AAC EOS timed out");
                if (!outputEos) SystemClock.sleep(5);
            }
            if (captureSilenced) throw new Failure(2007, "Capture was silenced by Android");
            if (aborted) throw new Failure(2001, "Recorder service was destroyed");
            if (RecorderMath.isTooShort(frames, RecorderMath.SAMPLE_RATE))
                throw new Failure(2006, "Recording contains less than two seconds of PCM");
            if (signal.isSilent()) throw new Failure(2007, "VOICE_CALL recording contains only silence or near-silence");
            if (!muxerStarted || encodedBytes == 0) throw new Failure(2001, "AAC encoder produced no media samples");
        }

        private int inputIndex() throws Exception {
            long deadline = SystemClock.elapsedRealtime() + CODEC_TIMEOUT_MS;
            do {
                int index = codec.dequeueInputBuffer(10000);
                if (index >= 0) return index;
                drain();
            } while (SystemClock.elapsedRealtime() < deadline);
            throw new Failure(2001, "AAC input buffer timed out");
        }

        private void drain() throws Exception {
            // Bound each drain pass even if a defective codec never stops producing buffers.
            long deadline = SystemClock.elapsedRealtime() + CODEC_TIMEOUT_MS;
            while (SystemClock.elapsedRealtime() < deadline) {
                int index = codec.dequeueOutputBuffer(info, 0);
                if (index == MediaCodec.INFO_TRY_AGAIN_LATER) return;
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerStarted) throw new Failure(2001, "AAC output format changed twice");
                    MediaFormat encoded = codec.getOutputFormat();
                    if (encoded.getInteger(MediaFormat.KEY_CHANNEL_COUNT) != channels
                            || encoded.getInteger(MediaFormat.KEY_SAMPLE_RATE) != RecorderMath.SAMPLE_RATE)
                        throw new Failure(2001, "AAC encoder changed the recording channel count or sample rate");
                    track = muxer.addTrack(encoded);
                    muxer.start();
                    muxerStarted = true;
                } else if (index >= 0) {
                    try {
                        if (info.size > 0 && (info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0) {
                            if (!muxerStarted) throw new Failure(2001, "AAC data arrived before its format");
                            ByteBuffer buffer = codec.getOutputBuffer(index);
                            if (buffer == null) throw new Failure(2001, "AAC output buffer is missing");
                            buffer.position(info.offset);
                            buffer.limit(info.offset + info.size);
                            muxer.writeSampleData(track, buffer, info);
                            encodedBytes += info.size;
                        }
                        if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) outputEos = true;
                    } finally { codec.releaseOutputBuffer(index, false); }
                    if (outputEos) return;
                }
            }
            throw new Failure(2001, "AAC output drain timed out");
        }
    }
}
