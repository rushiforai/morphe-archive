/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioPlaybackCaptureConfiguration;
import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.media.projection.MediaProjection;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.Surface;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.live.ScreenCapture;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

/**
 * Records what the phone's screen shows, with the app's own sound when it can (#37), as the source of
 * a {@link LiveRecorder}. It encodes H.264 and AAC into an MP4 of its own while the recording runs,
 * then feeds that file into the recorder's spool, so the recorder's limits, its notices and its crash
 * recovery all apply as they do to a stream recording. It runs on the recorder's thread.
 */
final class ScreenSource implements LiveRecorder.Source {
    /** The longest side of the recorded picture, in pixels. */
    static final int MAX_SIDE = 1920;
    private static final int FRAME_RATE = 30;
    private static final int SAMPLE_RATE = 44100;
    private static final int AUDIO_BITRATE = 128_000;
    private static final long POLL_MS = 8;
    private static final long END_WAIT_MS = 4000;
    private static final int COPY_BUFFER = 64 * 1024;

    private final Context app;
    private final File video;
    private final int width;
    private final int height;
    private final int dpi;
    private final boolean wantAudio;

    ScreenSource(Context app, File video, DisplayMetrics metrics, boolean audio) {
        int[] size = captureSize(metrics.widthPixels, metrics.heightPixels);
        this.app = app;
        this.video = video;
        this.width = size[0];
        this.height = size[1];
        this.dpi = metrics.densityDpi;
        this.wantAudio = audio;
    }

    /**
     * The picture's size: the screen's, scaled down so its longer side is at most {@link #MAX_SIDE},
     * and each side even, which H.264 needs.
     */
    static int[] captureSize(int screenWidth, int screenHeight) {
        double scale = Math.min(1.0, (double) MAX_SIDE / Math.max(screenWidth, screenHeight));
        int w = Math.max(2, (int) Math.round(screenWidth * scale)) & ~1;
        int h = Math.max(2, (int) Math.round(screenHeight * scale)) & ~1;
        return new int[]{w, h};
    }

    @Override
    public void pump(LiveRecorder.Output out, LiveRecorder.Control control) throws IOException {
        MediaProjection projection = ScreenCapture.take();
        if (projection == null) throw new IOException("Screen recording was not allowed");
        Encoder encoder = new Encoder(projection);
        control.onStop(encoder);
        try {
            encoder.run(control);
        } finally {
            control.release(encoder);
            encoder.release();
            ScreenCapture.release(projection);
        }
        copy(out);
    }

    private void copy(LiveRecorder.Output out) throws IOException {
        if (!video.exists()) return;
        try (FileInputStream in = new FileInputStream(video)) {
            byte[] buffer = new byte[COPY_BUFFER];
            int read;
            while ((read = in.read(buffer)) > 0) out.write(buffer, 0, read);
        } finally {
            if (!video.delete()) Logger.printInfo(() -> "Could not remove a screen recording's work file");
        }
    }

    /** The encoders, the muxer and the display feeding them, driven by one loop. */
    private final class Encoder implements Closeable {
        private final MediaProjection projection;
        private volatile boolean stopRequested;
        private MediaCodec videoCodec;
        private MediaCodec audioCodec;
        private MediaMuxer muxer;
        private VirtualDisplay display;
        private Surface surface;
        private AudioRecord audioRecord;
        private int videoTrack = -1;
        private int audioTrack = -1;
        private boolean muxerStarted;
        private boolean videoDone;
        private boolean audioDone;
        private boolean audioInputDone;
        private long originUs;
        private long lastVideoUs;
        private long lastAudioUs;
        private long audioFrames;

        Encoder(MediaProjection projection) {
            this.projection = projection;
        }

        @Override
        public void close() {
            stopRequested = true;
        }

        void run(LiveRecorder.Control control) throws IOException {
            setUp();
            originUs = System.nanoTime() / 1000L;
            ScreenCapture.whenEnded(this::close);
            MediaCodec.BufferInfo videoInfo = new MediaCodec.BufferInfo();
            MediaCodec.BufferInfo audioInfo = new MediaCodec.BufferInfo();
            byte[] pcm = new byte[4096];
            long endAt = 0;
            boolean endSignalled = false;
            while (!(videoDone && audioDone)) {
                if (stopRequested && !endSignalled) {
                    endSignalled = true;
                    videoCodec.signalEndOfInputStream();
                    endAt = System.nanoTime() / 1_000_000L + END_WAIT_MS;
                }
                if (endSignalled && System.nanoTime() / 1_000_000L > endAt) break;
                boolean moved = drainVideo(videoInfo);
                if (audioCodec != null) {
                    moved |= feedAudio(pcm, endSignalled);
                    moved |= drainAudio(audioInfo);
                }
                if (!moved && !control.pause(POLL_MS) && !stopRequested) stopRequested = true;
            }
        }

        private void setUp() throws IOException {
            MediaFormat format = MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_AVC, width, height);
            format.setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface);
            format.setInteger(MediaFormat.KEY_BIT_RATE, Math.min(12_000_000, Math.max(2_000_000, width * height * 4)));
            format.setInteger(MediaFormat.KEY_FRAME_RATE, FRAME_RATE);
            format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, 2);
            videoCodec = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_VIDEO_AVC);
            videoCodec.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            surface = videoCodec.createInputSurface();
            videoCodec.start();
            muxer = new MediaMuxer(video.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            display = projection.createVirtualDisplay("hushfeed-live", width, height, dpi,
                    DisplayManager.VIRTUAL_DISPLAY_FLAG_AUTO_MIRROR, surface, null, null);
            if (wantAudio) setUpAudio(projection);
            audioDone = audioCodec == null;
        }

        /** Sound is optional: any failure here leaves a recording of the picture alone. */
        private void setUpAudio(MediaProjection projection) {
            if (Build.VERSION.SDK_INT < 29) return;
            try {
                AudioPlaybackCaptureConfiguration capture = new AudioPlaybackCaptureConfiguration.Builder(projection)
                        .addMatchingUsage(AudioAttributes.USAGE_MEDIA)
                        .addMatchingUsage(AudioAttributes.USAGE_GAME)
                        .addMatchingUsage(AudioAttributes.USAGE_UNKNOWN)
                        .build();
                AudioFormat pcmFormat = new AudioFormat.Builder()
                        .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                        .setSampleRate(SAMPLE_RATE)
                        .setChannelMask(AudioFormat.CHANNEL_IN_STEREO)
                        .build();
                AudioRecord record = new AudioRecord.Builder()
                        .setAudioPlaybackCaptureConfig(capture)
                        .setAudioFormat(pcmFormat)
                        .setBufferSizeInBytes(SAMPLE_RATE * 4)
                        .build();
                if (record.getState() != AudioRecord.STATE_INITIALIZED) {
                    record.release();
                    return;
                }
                MediaFormat format = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, SAMPLE_RATE, 2);
                format.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
                format.setInteger(MediaFormat.KEY_BIT_RATE, AUDIO_BITRATE);
                format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 16384);
                MediaCodec codec = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_AAC);
                codec.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
                codec.start();
                record.startRecording();
                audioRecord = record;
                audioCodec = codec;
            } catch (IOException | RuntimeException failure) {
                Logger.printInfo(() -> "Screen recording without sound: " + failure);
                releaseAudio();
            }
        }

        private boolean drainVideo(MediaCodec.BufferInfo info) {
            if (videoDone) return false;
            boolean moved = false;
            while (true) {
                int index = videoCodec.dequeueOutputBuffer(info, 0);
                if (index == MediaCodec.INFO_TRY_AGAIN_LATER) return moved;
                moved = true;
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    videoTrack = muxer.addTrack(videoCodec.getOutputFormat());
                    startMuxerWhenReady();
                    continue;
                }
                if (index < 0) continue;
                ByteBuffer data = videoCodec.getOutputBuffer(index);
                boolean config = (info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0;
                if (data != null && !config && info.size > 0 && muxerStarted) {
                    info.presentationTimeUs = Math.max(lastVideoUs, info.presentationTimeUs - originUs);
                    lastVideoUs = info.presentationTimeUs;
                    data.position(info.offset);
                    data.limit(info.offset + info.size);
                    muxer.writeSampleData(videoTrack, data, info);
                }
                videoCodec.releaseOutputBuffer(index, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    videoDone = true;
                    return true;
                }
            }
        }

        /** Moves captured sound into the AAC encoder; once the recording ends, signals its end. */
        private boolean feedAudio(byte[] pcm, boolean ending) {
            if (audioInputDone) return false;
            int index = audioCodec.dequeueInputBuffer(0);
            if (index < 0) return false;
            ByteBuffer input = audioCodec.getInputBuffer(index);
            int read = ending ? 0 : audioRecord.read(pcm, 0, Math.min(pcm.length, input.capacity()),
                    AudioRecord.READ_NON_BLOCKING);
            long timeUs = System.nanoTime() / 1000L - originUs;
            if (ending) {
                audioCodec.queueInputBuffer(index, 0, 0, Math.max(timeUs, 0), MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                audioInputDone = true;
                return true;
            }
            if (read <= 0) {
                audioCodec.queueInputBuffer(index, 0, 0, 0, 0);
                return false;
            }
            input.clear();
            input.put(pcm, 0, read);
            audioCodec.queueInputBuffer(index, 0, read, Math.max(timeUs, 0), 0);
            audioFrames += read / 4;
            return true;
        }

        private boolean drainAudio(MediaCodec.BufferInfo info) {
            if (audioDone) return false;
            boolean moved = false;
            while (true) {
                int index = audioCodec.dequeueOutputBuffer(info, 0);
                if (index == MediaCodec.INFO_TRY_AGAIN_LATER) return moved;
                moved = true;
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    audioTrack = muxer.addTrack(audioCodec.getOutputFormat());
                    startMuxerWhenReady();
                    continue;
                }
                if (index < 0) continue;
                ByteBuffer data = audioCodec.getOutputBuffer(index);
                boolean config = (info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0;
                if (data != null && !config && info.size > 0 && muxerStarted) {
                    info.presentationTimeUs = Math.max(lastAudioUs, info.presentationTimeUs);
                    lastAudioUs = info.presentationTimeUs;
                    data.position(info.offset);
                    data.limit(info.offset + info.size);
                    muxer.writeSampleData(audioTrack, data, info);
                }
                audioCodec.releaseOutputBuffer(index, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    audioDone = true;
                    return true;
                }
            }
        }

        private void startMuxerWhenReady() {
            if (muxerStarted || videoTrack < 0 || (audioCodec != null && audioTrack < 0)) return;
            muxer.start();
            muxerStarted = true;
        }

        private void releaseAudio() {
            if (audioRecord != null) {
                try {
                    audioRecord.stop();
                } catch (RuntimeException ignored) {
                    // Not started.
                }
                audioRecord.release();
                audioRecord = null;
            }
            if (audioCodec != null) {
                try {
                    audioCodec.stop();
                } catch (RuntimeException ignored) {
                    // Not started.
                }
                audioCodec.release();
                audioCodec = null;
            }
        }

        void release() {
            if (display != null) display.release();
            if (surface != null) surface.release();
            releaseAudio();
            if (videoCodec != null) {
                try {
                    videoCodec.stop();
                } catch (RuntimeException ignored) {
                    // Not started.
                }
                videoCodec.release();
            }
            if (muxer != null) {
                try {
                    if (muxerStarted) muxer.stop();
                } catch (RuntimeException failure) {
                    Logger.printInfo(() -> "Could not finish a screen recording's file: " + failure);
                }
                muxer.release();
            }
        }
    }
}
