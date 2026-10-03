/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.graphics.SurfaceTexture;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.opengl.GLES11Ext;
import android.opengl.GLES20;
import android.opengl.Matrix;
import android.os.SystemClock;
import android.view.Surface;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

/**
 * Resizes video with the device's hardware decoder and encoder.
 *
 * Frames stay on GPU surfaces for the entire conversion. This avoids the
 * multi-hundred-megabyte bitmap churn caused by MediaMetadataRetriever.
 */
final class HardwareVideoTranscoder {
    private static final long CODEC_TIMEOUT_US = 10_000L;
    private static final long FRAME_WAIT_MS = 5_000L;
    private static final int DEFAULT_FRAME_RATE = 30;
    private static final int MAX_LOW_QUALITY_FRAME_RATE = 30;
    private static final float FAST_OPERATING_RATE = 120f;
    private static final int DEFAULT_AUDIO_BUFFER = 512 * 1024;
    private static final int MAX_AUDIO_BUFFER = 8 * 1024 * 1024;

    private HardwareVideoTranscoder() {
    }

    static MediaResizer.Result transcode(
            File input,
            File output,
            int targetShortEdge
    ) throws Exception {
        if (output.exists() && !output.delete()) {
            throw new IllegalStateException("Could not replace resized video");
        }
        File parent = output.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Could not create resize cache");
        }

        MediaExtractor videoExtractor = new MediaExtractor();
        MediaExtractor audioExtractor = new MediaExtractor();
        MediaCodec decoder = null;
        MediaCodec encoder = null;
        EncoderInputSurface encoderInput = null;
        DecoderOutputSurface decoderOutput = null;
        MediaMuxer muxer = null;
        MuxerState muxerState = null;
        try {
            videoExtractor.setDataSource(input.getAbsolutePath());
            audioExtractor.setDataSource(input.getAbsolutePath());

            int videoTrack = findTrack(videoExtractor, "video/");
            int audioTrack = findTrack(audioExtractor, "audio/");
            if (videoTrack < 0) {
                throw new IllegalStateException("Video track not found");
            }

            MediaFormat inputVideo =
                    videoExtractor.getTrackFormat(videoTrack);
            String inputMime = inputVideo.getString(MediaFormat.KEY_MIME);
            int sourceWidth = integer(
                    inputVideo,
                    MediaFormat.KEY_WIDTH,
                    0
            );
            int sourceHeight = integer(
                    inputVideo,
                    MediaFormat.KEY_HEIGHT,
                    0
            );
            if (inputMime == null ||
                    sourceWidth <= 0 ||
                    sourceHeight <= 0) {
                throw new IllegalStateException(
                        "Video format is incomplete"
                );
            }

            int[] dimensions = targetDimensions(
                    sourceWidth,
                    sourceHeight,
                    targetShortEdge
            );
            int outputWidth = dimensions[0];
            int outputHeight = dimensions[1];
            int maximumFrameRate = targetShortEdge <= 480
                    ? MAX_LOW_QUALITY_FRAME_RATE
                    : 60;
            int frameRate = Math.max(
                    1,
                    Math.min(
                            integer(
                                    inputVideo,
                                    MediaFormat.KEY_FRAME_RATE,
                                    DEFAULT_FRAME_RATE
                            ),
                            maximumFrameRate
                    )
            );
            try {
                inputVideo.setInteger(MediaFormat.KEY_PRIORITY, 0);
                inputVideo.setFloat(
                        MediaFormat.KEY_OPERATING_RATE,
                        FAST_OPERATING_RATE
                );
            } catch (Throwable ignored) {
            }
            long durationUs = longValue(
                    inputVideo,
                    MediaFormat.KEY_DURATION,
                    0L
            );
            long durationMs = Math.max(0L, durationUs / 1_000L);
            long conversionLimitMs = Math.max(
                    30_000L,
                    Math.min(
                            120_000L,
                            durationMs * 2L + 15_000L
                    )
            );

            MediaCodecInfo encoderInfo = findSurfaceEncoder();
            MediaFormat outputVideo = MediaFormat.createVideoFormat(
                    "video/avc",
                    outputWidth,
                    outputHeight
            );
            outputVideo.setInteger(
                    MediaFormat.KEY_COLOR_FORMAT,
                    MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface
            );
            outputVideo.setInteger(
                    MediaFormat.KEY_FRAME_RATE,
                    frameRate
            );
            outputVideo.setInteger(
                    MediaFormat.KEY_I_FRAME_INTERVAL,
                    2
            );
            outputVideo.setInteger(
                    MediaFormat.KEY_BIT_RATE,
                    targetBitrate(
                            inputVideo,
                            sourceWidth,
                            sourceHeight,
                            outputWidth,
                            outputHeight
                    )
            );
            try {
                outputVideo.setInteger(MediaFormat.KEY_PRIORITY, 0);
                outputVideo.setFloat(
                        MediaFormat.KEY_OPERATING_RATE,
                        FAST_OPERATING_RATE
                );
            } catch (Throwable ignored) {
            }

            encoder = MediaCodec.createByCodecName(encoderInfo.getName());
            encoder.configure(
                    outputVideo,
                    null,
                    null,
                    MediaCodec.CONFIGURE_FLAG_ENCODE
            );
            Surface codecInputSurface = encoder.createInputSurface();
            encoderInput = new EncoderInputSurface(codecInputSurface);
            encoderInput.makeCurrent();
            decoderOutput = new DecoderOutputSurface(
                    outputWidth,
                    outputHeight
            );

            decoder = MediaCodec.createDecoderByType(inputMime);
            decoder.configure(
                    inputVideo,
                    decoderOutput.surface(),
                    null,
                    0
            );

            muxer = new MediaMuxer(
                    output.getAbsolutePath(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4
            );
            int rotation = integer(
                    inputVideo,
                    MediaFormat.KEY_ROTATION,
                    0
            );
            if (rotation == 90 ||
                    rotation == 180 ||
                    rotation == 270) {
                muxer.setOrientationHint(rotation);
            }

            int outputAudioTrack = -1;
            if (audioTrack >= 0) {
                outputAudioTrack = muxer.addTrack(
                        audioExtractor.getTrackFormat(audioTrack)
                );
            }
            muxerState = new MuxerState(
                    muxer,
                    outputAudioTrack
            );

            videoExtractor.selectTrack(videoTrack);
            encoder.start();
            decoder.start();
            transcodeVideo(
                    videoExtractor,
                    decoder,
                    decoderOutput,
                    encoder,
                    encoderInput,
                    muxerState,
                    1_000_000L / frameRate,
                    SystemClock.elapsedRealtime() +
                            conversionLimitMs
            );

            if (!muxerState.started) {
                throw new IllegalStateException(
                        "Video encoder produced no output format"
                );
            }
            if (audioTrack >= 0) {
                copyAudio(
                        audioExtractor,
                        audioTrack,
                        muxer,
                        outputAudioTrack
                );
            }

            muxer.stop();
            muxerState.started = false;
            muxer.release();
            muxer = null;
            return inspect(output);
        } catch (Throwable error) {
            if (output.exists()) {
                //noinspection ResultOfMethodCallIgnored
                output.delete();
            }
            if (error instanceof Exception) {
                throw (Exception) error;
            }
            throw new RuntimeException(error);
        } finally {
            videoExtractor.release();
            audioExtractor.release();
            if (decoder != null) {
                try {
                    decoder.stop();
                } catch (Throwable ignored) {
                }
                decoder.release();
            }
            if (decoderOutput != null) {
                decoderOutput.release();
            }
            if (encoder != null) {
                try {
                    encoder.stop();
                } catch (Throwable ignored) {
                }
                encoder.release();
            }
            if (encoderInput != null) {
                encoderInput.release();
            }
            if (muxer != null) {
                if (muxerState != null && muxerState.started) {
                    try {
                        muxer.stop();
                    } catch (Throwable ignored) {
                    }
                }
                try {
                    muxer.release();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static void transcodeVideo(
            MediaExtractor extractor,
            MediaCodec decoder,
            DecoderOutputSurface decoderOutput,
            MediaCodec encoder,
            EncoderInputSurface encoderInput,
            MuxerState muxerState,
            long minimumFrameIntervalUs,
            long deadlineMs
    ) throws Exception {
        MediaCodec.BufferInfo decoderInfo =
                new MediaCodec.BufferInfo();
        MediaCodec.BufferInfo encoderInfo =
                new MediaCodec.BufferInfo();
        boolean decoderInputDone = false;
        boolean decoderOutputDone = false;
        boolean encoderDone = false;
        long lastRenderedTimeUs = Long.MIN_VALUE;

        while (!encoderDone) {
            if (SystemClock.elapsedRealtime() > deadlineMs) {
                throw new IllegalStateException(
                        "Hardware video conversion timed out"
                );
            }
            if (!decoderInputDone) {
                int inputIndex = decoder.dequeueInputBuffer(
                        CODEC_TIMEOUT_US
                );
                if (inputIndex >= 0) {
                    ByteBuffer input = decoder.getInputBuffer(inputIndex);
                    if (input == null) {
                        throw new IllegalStateException(
                                "Video decoder input buffer is unavailable"
                        );
                    }
                    int size = extractor.readSampleData(input, 0);
                    if (size < 0) {
                        decoder.queueInputBuffer(
                                inputIndex,
                                0,
                                0,
                                0,
                                MediaCodec.BUFFER_FLAG_END_OF_STREAM
                        );
                        decoderInputDone = true;
                    } else {
                        decoder.queueInputBuffer(
                                inputIndex,
                                0,
                                size,
                                extractor.getSampleTime(),
                                extractor.getSampleFlags()
                        );
                        extractor.advance();
                    }
                }
            }

            boolean decoderOutputAvailable = !decoderOutputDone;
            boolean encoderOutputAvailable = true;
            while (decoderOutputAvailable ||
                    encoderOutputAvailable) {
                int encoderStatus = encoder.dequeueOutputBuffer(
                        encoderInfo,
                        CODEC_TIMEOUT_US
                );
                if (encoderStatus ==
                        MediaCodec.INFO_TRY_AGAIN_LATER) {
                    encoderOutputAvailable = false;
                } else if (encoderStatus ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerState.started) {
                        throw new IllegalStateException(
                                "Video encoder changed format twice"
                        );
                    }
                    muxerState.videoTrack = muxerState.muxer.addTrack(
                            encoder.getOutputFormat()
                    );
                    muxerState.muxer.start();
                    muxerState.started = true;
                } else if (encoderStatus >= 0) {
                    ByteBuffer output =
                            encoder.getOutputBuffer(encoderStatus);
                    if ((encoderInfo.flags &
                            MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0) {
                        encoderInfo.size = 0;
                    }
                    if (encoderInfo.size > 0) {
                        if (!muxerState.started || output == null) {
                            throw new IllegalStateException(
                                    "Video muxer is not ready"
                            );
                        }
                        output.position(encoderInfo.offset);
                        output.limit(
                                encoderInfo.offset + encoderInfo.size
                        );
                        muxerState.muxer.writeSampleData(
                                muxerState.videoTrack,
                                output,
                                encoderInfo
                        );
                    }
                    encoderDone = (encoderInfo.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                    encoder.releaseOutputBuffer(
                            encoderStatus,
                            false
                    );
                    if (encoderDone) break;
                    continue;
                }

                if (encoderStatus !=
                        MediaCodec.INFO_TRY_AGAIN_LATER) {
                    continue;
                }
                if (decoderOutputDone) continue;

                int decoderStatus = decoder.dequeueOutputBuffer(
                        decoderInfo,
                        CODEC_TIMEOUT_US
                );
                if (decoderStatus ==
                        MediaCodec.INFO_TRY_AGAIN_LATER) {
                    decoderOutputAvailable = false;
                } else if (decoderStatus ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    // The decoder's actual output format is informational.
                } else if (decoderStatus >= 0) {
                    long presentationTimeUs =
                            decoderInfo.presentationTimeUs;
                    boolean render = decoderInfo.size > 0 &&
                            (lastRenderedTimeUs == Long.MIN_VALUE ||
                                    presentationTimeUs -
                                            lastRenderedTimeUs >=
                                            Math.max(
                                                    1L,
                                                    minimumFrameIntervalUs -
                                                            1_000L
                                            ));
                    decoder.releaseOutputBuffer(
                            decoderStatus,
                            render
                    );
                    if (render) {
                        lastRenderedTimeUs = presentationTimeUs;
                        decoderOutput.awaitNewImage();
                        decoderOutput.drawImage();
                        encoderInput.setPresentationTime(
                                presentationTimeUs * 1_000L
                        );
                        if (!encoderInput.swapBuffers()) {
                            throw new IllegalStateException(
                                    "Video encoder surface swap failed"
                            );
                        }
                    }
                    if ((decoderInfo.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                        decoderOutputDone = true;
                        encoder.signalEndOfInputStream();
                    }
                }
            }
        }
    }

    private static void copyAudio(
            MediaExtractor extractor,
            int track,
            MediaMuxer muxer,
            int outputTrack
    ) {
        extractor.selectTrack(track);
        MediaFormat format = extractor.getTrackFormat(track);
        int bufferSize = DEFAULT_AUDIO_BUFFER;
        try {
            if (format.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) {
                bufferSize = Math.max(
                        bufferSize,
                        format.getInteger(
                                MediaFormat.KEY_MAX_INPUT_SIZE
                        )
                );
            }
        } catch (Throwable ignored) {
        }
        bufferSize = Math.min(bufferSize, MAX_AUDIO_BUFFER);

        ByteBuffer buffer = ByteBuffer.allocateDirect(bufferSize);
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        while (true) {
            buffer.clear();
            int size = extractor.readSampleData(buffer, 0);
            if (size < 0) break;
            long presentationTimeUs = extractor.getSampleTime();
            if (presentationTimeUs < 0) break;
            info.offset = 0;
            info.size = size;
            info.presentationTimeUs = presentationTimeUs;
            info.flags = extractor.getSampleFlags();
            buffer.position(0);
            buffer.limit(size);
            muxer.writeSampleData(outputTrack, buffer, info);
            extractor.advance();
        }
        extractor.unselectTrack(track);
    }

    private static MediaCodecInfo findSurfaceEncoder() {
        MediaCodecList codecs = new MediaCodecList(
                MediaCodecList.REGULAR_CODECS
        );
        for (MediaCodecInfo info : codecs.getCodecInfos()) {
            if (!info.isEncoder()) continue;
            for (String mime : info.getSupportedTypes()) {
                if (!"video/avc".equalsIgnoreCase(mime)) continue;
                try {
                    int[] colorFormats =
                            info.getCapabilitiesForType(mime)
                                    .colorFormats;
                    for (int colorFormat : colorFormats) {
                        if (colorFormat ==
                                MediaCodecInfo.CodecCapabilities
                                        .COLOR_FormatSurface) {
                            return info;
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        throw new IllegalStateException(
                "No hardware AVC surface encoder was found"
        );
    }

    private static int targetBitrate(
            MediaFormat source,
            int sourceWidth,
            int sourceHeight,
            int outputWidth,
            int outputHeight
    ) {
        long sourceBitrate = longValue(
                source,
                MediaFormat.KEY_BIT_RATE,
                2_000_000L
        );
        double scale =
                (double) outputWidth * outputHeight /
                        Math.max(
                                1L,
                                (long) sourceWidth * sourceHeight
                        );
        long target = (long) (sourceBitrate * scale);
        return (int) Math.max(
                200_000L,
                Math.min(12_000_000L, target)
        );
    }

    private static int[] targetDimensions(
            int width,
            int height,
            int targetShortEdge
    ) {
        float scale = targetShortEdge /
                (float) Math.min(width, height);
        return new int[]{
                even(Math.round(width * scale)),
                even(Math.round(height * scale))
        };
    }

    private static int even(int value) {
        return Math.max(2, value & ~1);
    }

    private static MediaResizer.Result inspect(File file)
            throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(file.getAbsolutePath());
            int videoTrack = findTrack(extractor, "video/");
            if (videoTrack < 0) {
                throw new IllegalStateException(
                        "Converted video track not found"
                );
            }
            MediaFormat format =
                    extractor.getTrackFormat(videoTrack);
            return new MediaResizer.Result(
                    file,
                    integer(format, MediaFormat.KEY_WIDTH, 0),
                    integer(format, MediaFormat.KEY_HEIGHT, 0),
                    true
            );
        } finally {
            extractor.release();
        }
    }

    private static int findTrack(
            MediaExtractor extractor,
            String prefix
    ) {
        for (int index = 0;
             index < extractor.getTrackCount();
             index++) {
            MediaFormat format = extractor.getTrackFormat(index);
            String mime = format.getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(prefix)) {
                return index;
            }
        }
        return -1;
    }

    private static int integer(
            MediaFormat format,
            String key,
            int fallback
    ) {
        try {
            return format.containsKey(key)
                    ? format.getInteger(key)
                    : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static long longValue(
            MediaFormat format,
            String key,
            long fallback
    ) {
        try {
            return format.containsKey(key)
                    ? format.getLong(key)
                    : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static final class MuxerState {
        final MediaMuxer muxer;
        final int audioTrack;
        int videoTrack = -1;
        boolean started;

        MuxerState(MediaMuxer muxer, int audioTrack) {
            this.muxer = muxer;
            this.audioTrack = audioTrack;
        }
    }

    private static final class EncoderInputSurface {
        private EGLDisplay display = EGL14.EGL_NO_DISPLAY;
        private EGLContext context = EGL14.EGL_NO_CONTEXT;
        private EGLSurface eglSurface = EGL14.EGL_NO_SURFACE;
        private Surface surface;

        EncoderInputSurface(Surface surface) {
            if (surface == null) {
                throw new NullPointerException("Encoder surface is null");
            }
            this.surface = surface;
            setupEgl();
        }

        void makeCurrent() {
            if (!EGL14.eglMakeCurrent(
                    display,
                    eglSurface,
                    eglSurface,
                    context
            )) {
                throw new IllegalStateException(
                        "eglMakeCurrent failed"
                );
            }
        }

        boolean swapBuffers() {
            return EGL14.eglSwapBuffers(display, eglSurface);
        }

        void setPresentationTime(long nanoseconds) {
            EGLExt.eglPresentationTimeANDROID(
                    display,
                    eglSurface,
                    nanoseconds
            );
        }

        void release() {
            if (display != EGL14.EGL_NO_DISPLAY) {
                EGL14.eglMakeCurrent(
                        display,
                        EGL14.EGL_NO_SURFACE,
                        EGL14.EGL_NO_SURFACE,
                        EGL14.EGL_NO_CONTEXT
                );
                EGL14.eglDestroySurface(display, eglSurface);
                EGL14.eglDestroyContext(display, context);
                EGL14.eglReleaseThread();
                EGL14.eglTerminate(display);
            }
            if (surface != null) {
                surface.release();
                surface = null;
            }
            display = EGL14.EGL_NO_DISPLAY;
            context = EGL14.EGL_NO_CONTEXT;
            eglSurface = EGL14.EGL_NO_SURFACE;
        }

        private void setupEgl() {
            display = EGL14.eglGetDisplay(
                    EGL14.EGL_DEFAULT_DISPLAY
            );
            if (display == EGL14.EGL_NO_DISPLAY) {
                throw new IllegalStateException(
                        "Could not get EGL display"
                );
            }
            int[] versions = new int[2];
            if (!EGL14.eglInitialize(
                    display,
                    versions,
                    0,
                    versions,
                    1
            )) {
                throw new IllegalStateException(
                        "Could not initialize EGL"
                );
            }

            int[] configAttributes = {
                    EGL14.EGL_RED_SIZE, 8,
                    EGL14.EGL_GREEN_SIZE, 8,
                    EGL14.EGL_BLUE_SIZE, 8,
                    EGL14.EGL_ALPHA_SIZE, 8,
                    EGL14.EGL_RENDERABLE_TYPE,
                    EGL14.EGL_OPENGL_ES2_BIT,
                    EGL14.EGL_NONE
            };
            EGLConfig[] configs = new EGLConfig[1];
            int[] configCount = new int[1];
            if (!EGL14.eglChooseConfig(
                    display,
                    configAttributes,
                    0,
                    configs,
                    0,
                    configs.length,
                    configCount,
                    0
            ) || configCount[0] <= 0) {
                throw new IllegalStateException(
                        "Could not choose EGL config"
                );
            }

            int[] contextAttributes = {
                    EGL14.EGL_CONTEXT_CLIENT_VERSION, 2,
                    EGL14.EGL_NONE
            };
            context = EGL14.eglCreateContext(
                    display,
                    configs[0],
                    EGL14.EGL_NO_CONTEXT,
                    contextAttributes,
                    0
            );
            checkEgl("eglCreateContext");

            int[] surfaceAttributes = {
                    EGL14.EGL_NONE
            };
            eglSurface = EGL14.eglCreateWindowSurface(
                    display,
                    configs[0],
                    surface,
                    surfaceAttributes,
                    0
            );
            checkEgl("eglCreateWindowSurface");
        }

        private static void checkEgl(String operation) {
            int error = EGL14.eglGetError();
            if (error != EGL14.EGL_SUCCESS) {
                throw new IllegalStateException(
                        operation + " failed: 0x" +
                                Integer.toHexString(error)
                );
            }
        }
    }

    private static final class DecoderOutputSurface
            implements SurfaceTexture.OnFrameAvailableListener {
        private final Object frameSync = new Object();
        private final TextureRenderer renderer;
        private SurfaceTexture texture;
        private Surface surface;
        private boolean frameAvailable;

        DecoderOutputSurface(int width, int height) {
            renderer = new TextureRenderer(width, height);
            renderer.create();
            texture = new SurfaceTexture(renderer.textureId());
            texture.setOnFrameAvailableListener(this);
            surface = new Surface(texture);
        }

        Surface surface() {
            return surface;
        }

        void awaitNewImage() {
            synchronized (frameSync) {
                long deadline =
                        System.currentTimeMillis() + FRAME_WAIT_MS;
                while (!frameAvailable) {
                    long remaining =
                            deadline - System.currentTimeMillis();
                    if (remaining <= 0) {
                        throw new IllegalStateException(
                                "Timed out waiting for decoded video frame"
                        );
                    }
                    try {
                        frameSync.wait(remaining);
                    } catch (InterruptedException error) {
                        Thread.currentThread().interrupt();
                        throw new IllegalStateException(
                                "Video conversion was interrupted",
                                error
                        );
                    }
                }
                frameAvailable = false;
            }
            texture.updateTexImage();
        }

        void drawImage() {
            renderer.draw(texture);
        }

        void release() {
            if (texture != null) {
                texture.setOnFrameAvailableListener(null);
            }
            if (surface != null) {
                surface.release();
                surface = null;
            }
            if (texture != null) {
                texture.release();
                texture = null;
            }
            renderer.release();
        }

        @Override
        public void onFrameAvailable(SurfaceTexture ignored) {
            synchronized (frameSync) {
                frameAvailable = true;
                frameSync.notifyAll();
            }
        }
    }

    private static final class TextureRenderer {
        private static final int FLOAT_SIZE_BYTES = 4;
        private static final int VERTEX_SIZE = 5;
        private static final int VERTEX_STRIDE =
                VERTEX_SIZE * FLOAT_SIZE_BYTES;
        private static final float[] VERTICES = {
                -1.0f, -1.0f, 0.0f, 0.0f, 0.0f,
                 1.0f, -1.0f, 0.0f, 1.0f, 0.0f,
                -1.0f,  1.0f, 0.0f, 0.0f, 1.0f,
                 1.0f,  1.0f, 0.0f, 1.0f, 1.0f
        };
        private static final String VERTEX_SHADER =
                "uniform mat4 uTextureMatrix;\n" +
                "attribute vec4 aPosition;\n" +
                "attribute vec4 aTextureCoordinate;\n" +
                "varying vec2 vTextureCoordinate;\n" +
                "void main() {\n" +
                "  gl_Position = aPosition;\n" +
                "  vTextureCoordinate = " +
                "(uTextureMatrix * aTextureCoordinate).xy;\n" +
                "}\n";
        private static final String FRAGMENT_SHADER =
                "#extension GL_OES_EGL_image_external : require\n" +
                "precision mediump float;\n" +
                "varying vec2 vTextureCoordinate;\n" +
                "uniform samplerExternalOES sTexture;\n" +
                "void main() {\n" +
                "  gl_FragColor = texture2D(" +
                "sTexture, vTextureCoordinate);\n" +
                "}\n";

        private final FloatBuffer vertices;
        private final float[] textureMatrix = new float[16];
        private final int width;
        private final int height;
        private int program;
        private int textureId = -1;
        private int positionHandle;
        private int textureCoordinateHandle;
        private int textureMatrixHandle;

        TextureRenderer(int width, int height) {
            this.width = width;
            this.height = height;
            vertices = ByteBuffer
                    .allocateDirect(
                            VERTICES.length * FLOAT_SIZE_BYTES
                    )
                    .order(ByteOrder.nativeOrder())
                    .asFloatBuffer();
            vertices.put(VERTICES).position(0);
            Matrix.setIdentityM(textureMatrix, 0);
        }

        void create() {
            program = createProgram(
                    VERTEX_SHADER,
                    FRAGMENT_SHADER
            );
            positionHandle = GLES20.glGetAttribLocation(
                    program,
                    "aPosition"
            );
            textureCoordinateHandle = GLES20.glGetAttribLocation(
                    program,
                    "aTextureCoordinate"
            );
            textureMatrixHandle = GLES20.glGetUniformLocation(
                    program,
                    "uTextureMatrix"
            );
            if (positionHandle < 0 ||
                    textureCoordinateHandle < 0 ||
                    textureMatrixHandle < 0) {
                throw new IllegalStateException(
                        "Video resize shader attributes are missing"
                );
            }

            int[] textures = new int[1];
            GLES20.glGenTextures(1, textures, 0);
            textureId = textures[0];
            GLES20.glBindTexture(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    textureId
            );
            GLES20.glTexParameteri(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_MIN_FILTER,
                    GLES20.GL_LINEAR
            );
            GLES20.glTexParameteri(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_MAG_FILTER,
                    GLES20.GL_LINEAR
            );
            GLES20.glTexParameteri(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_WRAP_S,
                    GLES20.GL_CLAMP_TO_EDGE
            );
            GLES20.glTexParameteri(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_WRAP_T,
                    GLES20.GL_CLAMP_TO_EDGE
            );
            checkGl("create external video texture");
        }

        int textureId() {
            return textureId;
        }

        void draw(SurfaceTexture texture) {
            texture.getTransformMatrix(textureMatrix);
            GLES20.glViewport(0, 0, width, height);
            GLES20.glClearColor(0f, 0f, 0f, 1f);
            GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);
            GLES20.glUseProgram(program);

            vertices.position(0);
            GLES20.glVertexAttribPointer(
                    positionHandle,
                    3,
                    GLES20.GL_FLOAT,
                    false,
                    VERTEX_STRIDE,
                    vertices
            );
            GLES20.glEnableVertexAttribArray(positionHandle);

            vertices.position(3);
            GLES20.glVertexAttribPointer(
                    textureCoordinateHandle,
                    2,
                    GLES20.GL_FLOAT,
                    false,
                    VERTEX_STRIDE,
                    vertices
            );
            GLES20.glEnableVertexAttribArray(
                    textureCoordinateHandle
            );
            GLES20.glUniformMatrix4fv(
                    textureMatrixHandle,
                    1,
                    false,
                    textureMatrix,
                    0
            );
            GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
            GLES20.glBindTexture(
                    GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    textureId
            );
            GLES20.glDrawArrays(
                    GLES20.GL_TRIANGLE_STRIP,
                    0,
                    4
            );
            checkGl("draw resized video frame");
        }

        void release() {
            if (textureId >= 0) {
                int[] textures = {textureId};
                GLES20.glDeleteTextures(1, textures, 0);
                textureId = -1;
            }
            if (program != 0) {
                GLES20.glDeleteProgram(program);
                program = 0;
            }
        }

        private static int createProgram(
                String vertexSource,
                String fragmentSource
        ) {
            int vertexShader = compileShader(
                    GLES20.GL_VERTEX_SHADER,
                    vertexSource
            );
            int fragmentShader = compileShader(
                    GLES20.GL_FRAGMENT_SHADER,
                    fragmentSource
            );
            int program = GLES20.glCreateProgram();
            GLES20.glAttachShader(program, vertexShader);
            GLES20.glAttachShader(program, fragmentShader);
            GLES20.glLinkProgram(program);
            int[] status = new int[1];
            GLES20.glGetProgramiv(
                    program,
                    GLES20.GL_LINK_STATUS,
                    status,
                    0
            );
            GLES20.glDeleteShader(vertexShader);
            GLES20.glDeleteShader(fragmentShader);
            if (status[0] == 0) {
                String log = GLES20.glGetProgramInfoLog(program);
                GLES20.glDeleteProgram(program);
                throw new IllegalStateException(
                        "Could not link video resize shader: " + log
                );
            }
            return program;
        }

        private static int compileShader(
                int type,
                String source
        ) {
            int shader = GLES20.glCreateShader(type);
            GLES20.glShaderSource(shader, source);
            GLES20.glCompileShader(shader);
            int[] status = new int[1];
            GLES20.glGetShaderiv(
                    shader,
                    GLES20.GL_COMPILE_STATUS,
                    status,
                    0
            );
            if (status[0] == 0) {
                String log = GLES20.glGetShaderInfoLog(shader);
                GLES20.glDeleteShader(shader);
                throw new IllegalStateException(
                        "Could not compile video resize shader: " + log
                );
            }
            return shader;
        }

        private static void checkGl(String operation) {
            int error = GLES20.glGetError();
            if (error != GLES20.GL_NO_ERROR) {
                throw new IllegalStateException(
                        operation + " failed: 0x" +
                                Integer.toHexString(error)
                );
            }
        }
    }
}
