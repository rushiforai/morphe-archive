/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.SystemClock;
import android.view.Surface;

import java.io.File;
import java.nio.ByteBuffer;

/**
 * Single-pass transcoder producing universally shareable MP4 files.
 *
 * Video is converted to H.264 and audio to AAC-LC in one pipeline: a
 * single extractor read feeds both codec chains, and a single muxer
 * writes the output. Tracks that already use the target codec are
 * copied without decoding.
 *
 * Because dimensions are preserved (no resize), the video decoder
 * writes directly to the encoder input surface, skipping the
 * SurfaceTexture and OpenGL path entirely.
 */
final class ShareableTranscoder {
    private static final long CODEC_TIMEOUT_US = 10_000L;
    private static final float FAST_OPERATING_RATE = 120f;
    private static final int AAC_BIT_RATE = 128_000;
    private static final int COPY_BUFFER_SIZE = 512 * 1024;

    private ShareableTranscoder() {
    }

    static void transcode(
            File input,
            File output,
            boolean transcodeVideo,
            boolean transcodeAudio
    ) throws Exception {
        if (output.exists() && !output.delete()) {
            throw new IllegalStateException(
                    "Could not replace shareable output"
            );
        }
        File parent = output.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException(
                    "Could not create shareable output directory"
            );
        }

        MediaExtractor extractor = new MediaExtractor();
        MediaCodec videoDecoder = null;
        MediaCodec videoEncoder = null;
        MediaCodec audioDecoder = null;
        MediaCodec audioEncoder = null;
        MediaMuxer muxer = null;
        Surface encoderSurface = null;
        boolean muxerStarted = false;
        int muxerVideoTrack = -1;
        int muxerAudioTrack = -1;
        try {
            extractor.setDataSource(input.getAbsolutePath());
            int videoTrack = findTrack(extractor, "video/");
            int audioTrack = findTrack(extractor, "audio/");
            if (videoTrack < 0) {
                throw new IllegalStateException(
                        "Video track not found"
                );
            }

            MediaFormat videoFormat =
                    extractor.getTrackFormat(videoTrack);
            String videoMime =
                    videoFormat.getString(MediaFormat.KEY_MIME);
            int width = intValue(
                    videoFormat, MediaFormat.KEY_WIDTH, 0
            );
            int height = intValue(
                    videoFormat, MediaFormat.KEY_HEIGHT, 0
            );
            if (videoMime == null || width <= 0 || height <= 0) {
                throw new IllegalStateException(
                        "Video format is incomplete"
                );
            }

            MediaFormat audioFormat = null;
            if (audioTrack >= 0) {
                audioFormat =
                        extractor.getTrackFormat(audioTrack);
            }
            boolean hasAudio = audioTrack >= 0 &&
                    audioFormat != null;
            boolean doAudioTranscode =
                    transcodeAudio && hasAudio;

            muxer = new MediaMuxer(
                    output.getAbsolutePath(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4
            );
            int rotation = intValue(
                    videoFormat, MediaFormat.KEY_ROTATION, 0
            );
            if (rotation == 90 || rotation == 180 ||
                    rotation == 270) {
                muxer.setOrientationHint(rotation);
            }

            // Video setup.
            if (transcodeVideo) {
                MediaCodecInfo encoderInfo =
                        findAvcSurfaceEncoder();
                MediaFormat outputVideo =
                        MediaFormat.createVideoFormat(
                                "video/avc", width, height
                        );
                outputVideo.setInteger(
                        MediaFormat.KEY_COLOR_FORMAT,
                        MediaCodecInfo.CodecCapabilities
                                .COLOR_FormatSurface
                );
                outputVideo.setInteger(
                        MediaFormat.KEY_FRAME_RATE,
                        intValue(
                                videoFormat,
                                MediaFormat.KEY_FRAME_RATE,
                                30
                        )
                );
                outputVideo.setInteger(
                        MediaFormat.KEY_I_FRAME_INTERVAL, 2
                );
                outputVideo.setInteger(
                        MediaFormat.KEY_BIT_RATE,
                        intValue(
                                videoFormat,
                                MediaFormat.KEY_BIT_RATE,
                                4_000_000
                        )
                );
                setOperatingRate(outputVideo);
                setOperatingRate(videoFormat);

                videoEncoder = MediaCodec.createByCodecName(
                        encoderInfo.getName()
                );
                videoEncoder.configure(
                        outputVideo,
                        null,
                        null,
                        MediaCodec.CONFIGURE_FLAG_ENCODE
                );
                encoderSurface =
                        videoEncoder.createInputSurface();
                videoEncoder.start();

                // Direct surface: decoder renders straight into
                // the encoder input surface. No SurfaceTexture,
                // no OpenGL, no copies.
                videoDecoder =
                        MediaCodec.createDecoderByType(videoMime);
                videoDecoder.configure(
                        videoFormat,
                        encoderSurface,
                        null,
                        0
                );
                videoDecoder.start();
            } else {
                muxerVideoTrack = muxer.addTrack(videoFormat);
            }

            // Audio setup.
            if (doAudioTranscode) {
                String audioMime =
                        audioFormat.getString(MediaFormat.KEY_MIME);
                int sampleRate = intValue(
                        audioFormat,
                        MediaFormat.KEY_SAMPLE_RATE,
                        44100
                );
                int channels = intValue(
                        audioFormat,
                        MediaFormat.KEY_CHANNEL_COUNT,
                        2
                );
                MediaFormat outputAudio =
                        MediaFormat.createAudioFormat(
                                "audio/mp4a-latm",
                                sampleRate,
                                channels
                        );
                outputAudio.setInteger(
                        MediaFormat.KEY_AAC_PROFILE,
                        MediaCodecInfo.CodecProfileLevel
                                .AACObjectLC
                );
                outputAudio.setInteger(
                        MediaFormat.KEY_BIT_RATE,
                        AAC_BIT_RATE
                );
                setOperatingRate(outputAudio);
                setOperatingRate(audioFormat);

                audioEncoder = MediaCodec.createEncoderByType(
                        "audio/mp4a-latm"
                );
                audioEncoder.configure(
                        outputAudio,
                        null,
                        null,
                        MediaCodec.CONFIGURE_FLAG_ENCODE
                );
                audioEncoder.start();

                audioDecoder =
                        MediaCodec.createDecoderByType(audioMime);
                audioDecoder.configure(
                        audioFormat, null, null, 0
                );
                audioDecoder.start();
            } else if (hasAudio) {
                muxerAudioTrack = muxer.addTrack(audioFormat);
            }

            // Select extractor tracks.
            extractor.selectTrack(videoTrack);
            if (hasAudio) {
                extractor.selectTrack(audioTrack);
            }

            Pump pump = new Pump(
                    extractor,
                    videoTrack,
                    audioTrack,
                    videoDecoder,
                    videoEncoder,
                    audioDecoder,
                    audioEncoder,
                    muxer,
                    transcodeVideo,
                    doAudioTranscode,
                    hasAudio
            );
            pump.run();

            muxerStarted = pump.muxerStarted;
            muxerVideoTrack = pump.muxerVideoTrack;
            muxerAudioTrack = pump.muxerAudioTrack;

            if (muxerStarted) {
                muxer.stop();
                muxerStarted = false;
            }
            muxer.release();
            muxer = null;
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
            extractor.release();
            releaseCodec(videoDecoder);
            releaseCodec(videoEncoder);
            releaseCodec(audioDecoder);
            releaseCodec(audioEncoder);
            if (encoderSurface != null) {
                encoderSurface.release();
            }
            if (muxer != null) {
                if (muxerStarted) {
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

    private static void releaseCodec(MediaCodec codec) {
        if (codec == null) return;
        try {
            codec.stop();
        } catch (Throwable ignored) {
        }
        codec.release();
    }

    private static void setOperatingRate(MediaFormat format) {
        try {
            format.setFloat(
                    MediaFormat.KEY_OPERATING_RATE,
                    FAST_OPERATING_RATE
            );
        } catch (Throwable ignored) {
        }
    }

    private static MediaCodecInfo findAvcSurfaceEncoder() {
        MediaCodecList codecs = new MediaCodecList(
                MediaCodecList.REGULAR_CODECS
        );
        for (MediaCodecInfo info : codecs.getCodecInfos()) {
            if (!info.isEncoder()) continue;
            for (String mime : info.getSupportedTypes()) {
                if (!"video/avc".equalsIgnoreCase(mime)) continue;
                try {
                    int[] formats = info.getCapabilitiesForType(mime)
                            .colorFormats;
                    for (int format : formats) {
                        if (format ==
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
                "No hardware AVC surface encoder found"
        );
    }

    private static int findTrack(
            MediaExtractor extractor,
            String prefix
    ) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            MediaFormat format = extractor.getTrackFormat(i);
            String mime = format.getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(prefix)) {
                return i;
            }
        }
        return -1;
    }

    private static int intValue(
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

    /**
     * Drives all codec chains and direct copy paths in one loop.
     */
    private static final class Pump {
        final MediaExtractor extractor;
        final int videoTrack;
        final int audioTrack;
        final MediaCodec videoDecoder;
        final MediaCodec videoEncoder;
        final MediaCodec audioDecoder;
        final MediaCodec audioEncoder;
        final MediaMuxer muxer;
        final boolean transcodeVideo;
        final boolean transcodeAudio;
        final boolean hasAudio;

        boolean muxerStarted;
        int muxerVideoTrack = -1;
        int muxerAudioTrack = -1;

        boolean videoExtractorDone;
        boolean videoDecoderDone;
        boolean videoEncoderDone;
        boolean audioExtractorDone;
        boolean audioDecoderDone;
        boolean audioEncoderDone;
        boolean audioCopyDone;

        final ByteBuffer copyBuffer =
                ByteBuffer.allocateDirect(COPY_BUFFER_SIZE);
        final MediaCodec.BufferInfo bufferInfo =
                new MediaCodec.BufferInfo();

        Pump(
                MediaExtractor extractor,
                int videoTrack,
                int audioTrack,
                MediaCodec videoDecoder,
                MediaCodec videoEncoder,
                MediaCodec audioDecoder,
                MediaCodec audioEncoder,
                MediaMuxer muxer,
                boolean transcodeVideo,
                boolean transcodeAudio,
                boolean hasAudio
        ) {
            this.extractor = extractor;
            this.videoTrack = videoTrack;
            this.audioTrack = audioTrack;
            this.videoDecoder = videoDecoder;
            this.videoEncoder = videoEncoder;
            this.audioDecoder = audioDecoder;
            this.audioEncoder = audioEncoder;
            this.muxer = muxer;
            this.transcodeVideo = transcodeVideo;
            this.transcodeAudio = transcodeAudio;
            this.hasAudio = hasAudio;
        }

        void run() {
            long deadline = SystemClock.elapsedRealtime() +
                    180_000L;
            while (!isDone()) {
                if (SystemClock.elapsedRealtime() > deadline) {
                    throw new IllegalStateException(
                            "Shareable conversion timed out"
                    );
                }
                boolean progressed = false;
                progressed |= pumpVideo();
                progressed |= pumpAudio();
                if (!progressed) {
                    try {
                        Thread.sleep(2);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new IllegalStateException(
                                "Conversion interrupted", e
                        );
                    }
                }
            }
            // Drain any remaining encoder output.
            drainVideoEncoder(true);
            drainAudioEncoder(true);
        }

        boolean isDone() {
            boolean videoDone = transcodeVideo
                    ? videoEncoderDone
                    : videoExtractorDone;
            boolean audioDone;
            if (!hasAudio) {
                audioDone = true;
            } else if (transcodeAudio) {
                audioDone = audioEncoderDone;
            } else {
                audioDone = audioCopyDone;
            }
            return videoDone && audioDone;
        }

        boolean pumpVideo() {
            if (transcodeVideo) {
                return pumpVideoTranscode();
            }
            return pumpVideoCopy();
        }

        boolean pumpVideoTranscode() {
            boolean progressed = false;
            // Feed decoder.
            if (!videoExtractorDone) {
                int index = videoDecoder.dequeueInputBuffer(
                        CODEC_TIMEOUT_US
                );
                if (index >= 0) {
                    ByteBuffer input =
                            videoDecoder.getInputBuffer(index);
                    int size = readSample(
                            input, videoTrack
                    );
                    if (size < 0) {
                        videoDecoder.queueInputBuffer(
                                index, 0, 0, 0,
                                MediaCodec
                                        .BUFFER_FLAG_END_OF_STREAM
                        );
                        videoExtractorDone = true;
                    } else {
                        videoDecoder.queueInputBuffer(
                                index, 0, size,
                                extractor.getSampleTime(),
                                extractor.getSampleFlags()
                        );
                        extractor.advance();
                    }
                    progressed = true;
                }
            }
            // Drain decoder to encoder surface.
            if (!videoDecoderDone) {
                MediaCodec.BufferInfo info =
                        new MediaCodec.BufferInfo();
                int status = videoDecoder.dequeueOutputBuffer(
                        info, CODEC_TIMEOUT_US
                );
                if (status >= 0) {
                    boolean eos = (info.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            != 0;
                    // Render to surface; timestamp drives
                    // the encoder.
                    videoDecoder.releaseOutputBuffer(
                            status, info.size > 0
                    );
                    if (eos) {
                        videoDecoderDone = true;
                        videoEncoder.signalEndOfInputStream();
                    }
                    progressed = true;
                } else if (status ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    progressed = true;
                }
            }
            progressed |= drainVideoEncoder(false);
            return progressed;
        }

        boolean drainVideoEncoder(boolean endOfStream) {
            boolean progressed = false;
            MediaCodec.BufferInfo info =
                    new MediaCodec.BufferInfo();
            while (true) {
                int status = videoEncoder.dequeueOutputBuffer(
                        info, endOfStream ? CODEC_TIMEOUT_US : 0
                );
                if (status ==
                        MediaCodec.INFO_TRY_AGAIN_LATER) {
                    break;
                }
                if (status ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerStarted) {
                        throw new IllegalStateException(
                                "Video encoder format changed twice"
                        );
                    }
                    muxerVideoTrack = muxer.addTrack(
                            videoEncoder.getOutputFormat()
                    );
                    maybeStartMuxer();
                    progressed = true;
                    continue;
                }
                if (status >= 0) {
                    ByteBuffer output =
                            videoEncoder.getOutputBuffer(status);
                    if ((info.flags &
                            MediaCodec.BUFFER_FLAG_CODEC_CONFIG)
                            != 0) {
                        info.size = 0;
                    }
                    if (info.size > 0) {
                        ensureMuxerStarted();
                        output.position(info.offset);
                        output.limit(info.offset + info.size);
                        muxer.writeSampleData(
                                muxerVideoTrack, output, info
                        );
                    }
                    if ((info.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            != 0) {
                        videoEncoderDone = true;
                    }
                    videoEncoder.releaseOutputBuffer(
                            status, false
                    );
                    progressed = true;
                    if (videoEncoderDone) break;
                }
            }
            return progressed;
        }

        boolean pumpVideoCopy() {
            if (videoExtractorDone) return false;
            copyBuffer.clear();
            int size = readSample(copyBuffer, videoTrack);
            if (size < 0) {
                videoExtractorDone = true;
                return true;
            }
            ensureMuxerStarted();
            bufferInfo.offset = 0;
            bufferInfo.size = size;
            bufferInfo.presentationTimeUs =
                    extractor.getSampleTime();
            bufferInfo.flags = extractor.getSampleFlags();
            copyBuffer.position(0);
            copyBuffer.limit(size);
            muxer.writeSampleData(
                    muxerVideoTrack, copyBuffer, bufferInfo
            );
            extractor.advance();
            return true;
        }

        boolean pumpAudio() {
            if (!hasAudio) return false;
            if (transcodeAudio) {
                return pumpAudioTranscode();
            }
            return pumpAudioCopy();
        }

        boolean pumpAudioTranscode() {
            boolean progressed = false;
            // Feed decoder.
            if (!audioExtractorDone) {
                int index = audioDecoder.dequeueInputBuffer(
                        CODEC_TIMEOUT_US
                );
                if (index >= 0) {
                    ByteBuffer input =
                            audioDecoder.getInputBuffer(index);
                    int size = readSample(
                            input, audioTrack
                    );
                    if (size < 0) {
                        audioDecoder.queueInputBuffer(
                                index, 0, 0, 0,
                                MediaCodec
                                        .BUFFER_FLAG_END_OF_STREAM
                        );
                        audioExtractorDone = true;
                    } else {
                        audioDecoder.queueInputBuffer(
                                index, 0, size,
                                extractor.getSampleTime(),
                                extractor.getSampleFlags()
                        );
                        extractor.advance();
                    }
                    progressed = true;
                }
            }
            // Decoder -> encoder.
            if (!audioDecoderDone) {
                MediaCodec.BufferInfo info =
                        new MediaCodec.BufferInfo();
                int status = audioDecoder.dequeueOutputBuffer(
                        info, CODEC_TIMEOUT_US
                );
                if (status >= 0) {
                    boolean eos = (info.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            != 0;
                    if (info.size > 0) {
                        int encIndex =
                                audioEncoder.dequeueInputBuffer(
                                        CODEC_TIMEOUT_US
                                );
                        if (encIndex >= 0) {
                            ByteBuffer encInput =
                                    audioEncoder.getInputBuffer(
                                            encIndex
                                    );
                            ByteBuffer decOutput =
                                    audioDecoder.getOutputBuffer(
                                            status
                                    );
                            decOutput.position(info.offset);
                            decOutput.limit(
                                    info.offset + info.size
                            );
                            encInput.clear();
                            encInput.put(decOutput);
                            audioEncoder.queueInputBuffer(
                                    encIndex, 0, info.size,
                                    info.presentationTimeUs,
                                    eos ? MediaCodec
                                            .BUFFER_FLAG_END_OF_STREAM
                                            : 0
                            );
                        }
                    } else if (eos) {
                        int encIndex =
                                audioEncoder.dequeueInputBuffer(
                                        CODEC_TIMEOUT_US
                                );
                        if (encIndex >= 0) {
                            audioEncoder.queueInputBuffer(
                                    encIndex, 0, 0, 0,
                                    MediaCodec
                                            .BUFFER_FLAG_END_OF_STREAM
                            );
                        }
                    }
                    audioDecoder.releaseOutputBuffer(
                            status, false
                    );
                    if (eos) audioDecoderDone = true;
                    progressed = true;
                } else if (status ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    progressed = true;
                }
            }
            progressed |= drainAudioEncoder(false);
            return progressed;
        }

        boolean drainAudioEncoder(boolean endOfStream) {
            boolean progressed = false;
            MediaCodec.BufferInfo info =
                    new MediaCodec.BufferInfo();
            while (true) {
                int status = audioEncoder.dequeueOutputBuffer(
                        info, endOfStream ? CODEC_TIMEOUT_US : 0
                );
                if (status ==
                        MediaCodec.INFO_TRY_AGAIN_LATER) {
                    break;
                }
                if (status ==
                        MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (muxerAudioTrack >= 0) {
                        throw new IllegalStateException(
                                "Audio encoder format changed twice"
                        );
                    }
                    muxerAudioTrack = muxer.addTrack(
                            audioEncoder.getOutputFormat()
                    );
                    maybeStartMuxer();
                    progressed = true;
                    continue;
                }
                if (status >= 0) {
                    ByteBuffer output =
                            audioEncoder.getOutputBuffer(status);
                    if ((info.flags &
                            MediaCodec.BUFFER_FLAG_CODEC_CONFIG)
                            != 0) {
                        info.size = 0;
                    }
                    if (info.size > 0) {
                        ensureMuxerStarted();
                        output.position(info.offset);
                        output.limit(info.offset + info.size);
                        muxer.writeSampleData(
                                muxerAudioTrack, output, info
                        );
                    }
                    if ((info.flags &
                            MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            != 0) {
                        audioEncoderDone = true;
                    }
                    audioEncoder.releaseOutputBuffer(
                            status, false
                    );
                    progressed = true;
                    if (audioEncoderDone) break;
                }
            }
            return progressed;
        }

        boolean pumpAudioCopy() {
            if (audioCopyDone) return false;
            copyBuffer.clear();
            int size = readSample(copyBuffer, audioTrack);
            if (size < 0) {
                audioCopyDone = true;
                return true;
            }
            ensureMuxerStarted();
            bufferInfo.offset = 0;
            bufferInfo.size = size;
            bufferInfo.presentationTimeUs =
                    extractor.getSampleTime();
            bufferInfo.flags = extractor.getSampleFlags();
            copyBuffer.position(0);
            copyBuffer.limit(size);
            muxer.writeSampleData(
                    muxerAudioTrack, copyBuffer, bufferInfo
            );
            extractor.advance();
            return true;
        }

        int readSample(ByteBuffer buffer, int track) {
            // The extractor's selected track must match the
            // read; we peek the sample track first.
            int sampleTrack = extractor.getSampleTrackIndex();
            if (sampleTrack != track) {
                return 0;
            }
            return extractor.readSampleData(buffer, 0);
        }

        void maybeStartMuxer() {
            if (muxerStarted) return;
            boolean videoReady = transcodeVideo
                    ? muxerVideoTrack >= 0
                    : true;
            boolean audioReady = !hasAudio || transcodeAudio
                    ? muxerAudioTrack >= 0 || !hasAudio
                    : true;
            // For copy tracks the muxer track was added up
            // front, so start as soon as any transcoded
            // track reports its format. If nothing needs
            // transcoding, start immediately.
            if (!transcodeVideo && !transcodeAudio) {
                muxer.start();
                muxerStarted = true;
                return;
            }
            if (transcodeVideo && !transcodeAudio) {
                if (muxerVideoTrack >= 0) {
                    muxer.start();
                    muxerStarted = true;
                }
                return;
            }
            if (!transcodeVideo && transcodeAudio) {
                if (muxerAudioTrack >= 0) {
                    muxer.start();
                    muxerStarted = true;
                }
                return;
            }
            if (muxerVideoTrack >= 0 &&
                    (!hasAudio || muxerAudioTrack >= 0)) {
                muxer.start();
                muxerStarted = true;
            }
        }

        void ensureMuxerStarted() {
            if (!muxerStarted) {
                maybeStartMuxer();
            }
            if (!muxerStarted) {
                throw new IllegalStateException(
                        "Muxer not started before sample write"
                );
            }
        }
    }
}
