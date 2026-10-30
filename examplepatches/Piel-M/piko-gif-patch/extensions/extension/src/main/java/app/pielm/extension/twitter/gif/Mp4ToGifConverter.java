package app.pielm.extension.twitter.gif;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.media.Image;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMetadataRetriever;
import android.util.Log;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Converts a Twitter/X MP4 animated GIF stream into a real looping GIF89a (.gif) file.
 *
 * <p>Frames are decoded with {@link MediaCodec} into YUV {@link Image}s and converted to ARGB
 * manually. This works reliably across vendors (Samsung, Pixel, Xiaomi...), unlike
 * {@link MediaMetadataRetriever} which frequently returns {@code null} frames for the small
 * baseline H.264 clips served by {@code video.twimg.com/tweet_video/}. The retriever is only kept
 * as a last-resort fallback.</p>
 */
public final class Mp4ToGifConverter {
    private static final String TAG = "PikoGifPatch";

    /** Hard cap on the number of GIF frames, longer clips are decimated evenly. */
    private static final int MAX_OUTPUT_FRAMES = 200;
    /** Longest side of the produced GIF, larger sources are downscaled. */
    private static final int MAX_DIMENSION = 480;
    private static final int DEFAULT_FRAME_DELAY_MS = 40;
    private static final long CODEC_TIMEOUT_US = 10_000L;
    /** ~5s without any decoder output after EOS was queued means the codec is stuck. */
    private static final int MAX_IDLE_LOOPS = 500;

    public interface ProgressListener {
        void onFrameProgress(int currentFrame, int totalFrames);
    }

    private Mp4ToGifConverter() {
    }

    public static void convert(File mp4File, File outputGifFile, ProgressListener listener) throws Exception {
        validateMp4(mp4File);
        sanitizeMp4CttsBox(mp4File);

        List<Long> ptsUsList = extractSortedVideoPtsUs(mp4File);
        int totalSourceFrames = ptsUsList.size();
        int frameStep = Math.max(1, (totalSourceFrames + MAX_OUTPUT_FRAMES - 1) / MAX_OUTPUT_FRAMES);
        int targetOutputFrames = totalSourceFrames > 0 ? (totalSourceFrames + frameStep - 1) / frameStep : 0;

        try (OutputStream out = new BufferedOutputStream(new FileOutputStream(outputGifFile), 65536)) {
            AnimatedGifEncoder encoder = new AnimatedGifEncoder();
            encoder.setRepeat(0);
            encoder.setQuality(10);
            if (!encoder.start(out)) {
                throw new IOException("Failed to initialize GIF89a output stream");
            }

            FrameSink sink = new FrameSink(encoder, frameStep, targetOutputFrames, listener);

            Throwable codecError = null;
            try {
                decodeWithMediaCodec(mp4File, sink);
            } catch (Throwable t) {
                codecError = t;
                Log.w(TAG, "MediaCodec decoding failed after " + sink.encodedFrames + " frames", t);
            }

            if (sink.encodedFrames == 0 && sink.pending == null) {
                try {
                    decodeWithRetriever(mp4File, ptsUsList, frameStep, sink);
                } catch (Throwable t) {
                    Log.w(TAG, "MediaMetadataRetriever fallback failed", t);
                    if (codecError == null) codecError = t;
                }
            }

            sink.flush();

            if (sink.encodedFrames == 0) {
                String reason = codecError != null
                        ? codecError.getClass().getSimpleName() + ": " + codecError.getMessage()
                        : "decoder produced no frames";
                throw new IOException("No video frames could be decoded (" + reason + ")");
            }

            encoder.finish();
        }
    }

    // ---------------------------------------------------------------------------------------------
    // MediaCodec path
    // ---------------------------------------------------------------------------------------------

    private static void decodeWithMediaCodec(File mp4File, FrameSink sink) throws IOException {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        try {
            extractor.setDataSource(mp4File.getAbsolutePath());
            int track = findVideoTrack(extractor);
            if (track < 0) {
                throw new IOException("No video track in MP4");
            }
            extractor.selectTrack(track);
            MediaFormat format = extractor.getTrackFormat(track);
            String mime = format.getString(MediaFormat.KEY_MIME);

            codec = MediaCodec.createDecoderByType(mime);
            format.setInteger(MediaFormat.KEY_COLOR_FORMAT,
                    MediaCodecInfo.CodecCapabilities.COLOR_FormatYUV420Flexible);
            codec.configure(format, null, null, 0);
            codec.start();

            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean inputDone = false;
            int idleLoops = 0;

            while (true) {
                if (!inputDone) {
                    int inIndex = codec.dequeueInputBuffer(CODEC_TIMEOUT_US);
                    if (inIndex >= 0) {
                        ByteBuffer inBuf = codec.getInputBuffer(inIndex);
                        int size = inBuf != null ? extractor.readSampleData(inBuf, 0) : -1;
                        if (size < 0) {
                            codec.queueInputBuffer(inIndex, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            codec.queueInputBuffer(inIndex, 0, size, extractor.getSampleTime(), 0);
                            extractor.advance();
                        }
                    }
                }

                int outIndex = codec.dequeueOutputBuffer(info, CODEC_TIMEOUT_US);
                if (outIndex >= 0) {
                    idleLoops = 0;
                    boolean eos = (info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0;
                    if (!(eos && info.size == 0)) {
                        if (sink.keepsNext()) {
                            Image image = null;
                            try {
                                image = codec.getOutputImage(outIndex);
                                if (image != null) {
                                    int[] argb = imageToArgb(image, sink);
                                    sink.offer(argb, sink.width, sink.height, info.presentationTimeUs);
                                }
                            } finally {
                                if (image != null) image.close();
                            }
                        } else {
                            sink.skip();
                        }
                    }
                    codec.releaseOutputBuffer(outIndex, false);
                    if (eos) break;
                } else if (outIndex == MediaCodec.INFO_TRY_AGAIN_LATER) {
                    if (inputDone && ++idleLoops > MAX_IDLE_LOOPS) {
                        Log.w(TAG, "Decoder stalled, stopping with " + sink.encodedFrames + " frames");
                        break;
                    }
                }
                // INFO_OUTPUT_FORMAT_CHANGED: Image carries its own crop/strides, nothing to do.
            }
        } finally {
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Throwable ignored) {
                }
                try {
                    codec.release();
                } catch (Throwable ignored) {
                }
            }
            try {
                extractor.release();
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Converts a YUV_420_888 {@link Image} to ARGB, applying the crop rect and downscaling with
     * nearest-neighbour sampling. Output dimensions are fixed by the first decoded frame.
     */
    private static int[] imageToArgb(Image image, FrameSink sink) {
        Rect crop = image.getCropRect();
        int srcLeft = crop != null ? crop.left : 0;
        int srcTop = crop != null ? crop.top : 0;
        int srcW = crop != null && crop.width() > 0 ? crop.width() : image.getWidth();
        int srcH = crop != null && crop.height() > 0 ? crop.height() : image.getHeight();

        if (sink.width == 0) {
            int[] dims = scaledDimensions(srcW, srcH);
            sink.width = dims[0];
            sink.height = dims[1];
        }
        int dstW = sink.width;
        int dstH = sink.height;

        Image.Plane[] planes = image.getPlanes();
        byte[] yData = planeBytes(planes[0].getBuffer());
        byte[] uData = planeBytes(planes[1].getBuffer());
        byte[] vData = planeBytes(planes[2].getBuffer());
        int yRow = planes[0].getRowStride();
        int yPix = planes[0].getPixelStride();
        int uRow = planes[1].getRowStride();
        int uPix = planes[1].getPixelStride();
        int vRow = planes[2].getRowStride();
        int vPix = planes[2].getPixelStride();

        int[] argb = new int[dstW * dstH];
        int k = 0;
        for (int dy = 0; dy < dstH; dy++) {
            int sy = srcTop + (int) ((long) dy * srcH / dstH);
            int yRowOff = sy * yRow;
            int uvY = sy >> 1;
            int uRowOff = uvY * uRow;
            int vRowOff = uvY * vRow;
            for (int dx = 0; dx < dstW; dx++) {
                int sx = srcLeft + (int) ((long) dx * srcW / dstW);
                int uvX = sx >> 1;

                int yi = yRowOff + sx * yPix;
                int ui = uRowOff + uvX * uPix;
                int vi = vRowOff + uvX * vPix;

                int y = (yi < yData.length ? yData[yi] & 0xff : 16) - 16;
                int u = (ui < uData.length ? uData[ui] & 0xff : 128) - 128;
                int v = (vi < vData.length ? vData[vi] & 0xff : 128) - 128;
                if (y < 0) y = 0;

                // BT.601 limited range -> RGB
                int c = 298 * y + 128;
                int r = (c + 409 * v) >> 8;
                int g = (c - 100 * u - 208 * v) >> 8;
                int b = (c + 516 * u) >> 8;
                r = r < 0 ? 0 : (r > 255 ? 255 : r);
                g = g < 0 ? 0 : (g > 255 ? 255 : g);
                b = b < 0 ? 0 : (b > 255 ? 255 : b);

                argb[k++] = 0xff000000 | (r << 16) | (g << 8) | b;
            }
        }
        return argb;
    }

    private static byte[] planeBytes(ByteBuffer buffer) {
        ByteBuffer dup = buffer.duplicate();
        dup.rewind();
        byte[] data = new byte[dup.remaining()];
        dup.get(data);
        return data;
    }

    // ---------------------------------------------------------------------------------------------
    // MediaMetadataRetriever fallback
    // ---------------------------------------------------------------------------------------------

    private static void decodeWithRetriever(File mp4File, List<Long> ptsUsList, int frameStep, FrameSink sink)
            throws IOException {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(mp4File.getAbsolutePath());
            List<Long> times = ptsUsList;
            if (times.isEmpty()) {
                String durationStr = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
                long durationMs = durationStr != null ? Long.parseLong(durationStr) : 2000L;
                times = new ArrayList<>();
                for (long t = 0; t < durationMs; t += DEFAULT_FRAME_DELAY_MS) {
                    times.add(t * 1000L);
                }
            }
            // Decimation already happens here, so the sink must keep every frame we hand over.
            sink.step = 1;
            for (int i = 0; i < times.size(); i += frameStep) {
                long timeUs = times.get(i);
                Bitmap frame = retriever.getFrameAtTime(timeUs, MediaMetadataRetriever.OPTION_CLOSEST);
                if (frame == null) {
                    frame = retriever.getFrameAtTime(timeUs, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
                }
                if (frame == null) continue;
                try {
                    if (sink.width == 0) {
                        int[] dims = scaledDimensions(frame.getWidth(), frame.getHeight());
                        sink.width = dims[0];
                        sink.height = dims[1];
                    }
                    Bitmap scaled = frame;
                    if (frame.getWidth() != sink.width || frame.getHeight() != sink.height) {
                        scaled = Bitmap.createScaledBitmap(frame, sink.width, sink.height, true);
                    }
                    int[] argb = new int[sink.width * sink.height];
                    scaled.getPixels(argb, 0, sink.width, 0, 0, sink.width, sink.height);
                    if (scaled != frame) scaled.recycle();
                    sink.offer(argb, sink.width, sink.height, timeUs);
                } finally {
                    frame.recycle();
                }
            }
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------------------------

    /**
     * Receives decoded frames in presentation order, keeps one every {@code step} frames and
     * computes each GIF frame delay from the real presentation timestamps.
     */
    private static final class FrameSink {
        final AnimatedGifEncoder encoder;
        final int targetFrames;
        final ProgressListener listener;
        int step;
        int width;
        int height;

        int sourceIndex;
        int encodedFrames;
        int[] pending;
        long pendingPtsUs = -1;
        long firstPtsUs = -1;
        long lastDelayMs = DEFAULT_FRAME_DELAY_MS;

        FrameSink(AnimatedGifEncoder encoder, int step, int targetFrames, ProgressListener listener) {
            this.encoder = encoder;
            this.step = step;
            this.targetFrames = targetFrames;
            this.listener = listener;
        }

        boolean keepsNext() {
            return sourceIndex % step == 0;
        }

        void skip() {
            sourceIndex++;
        }

        void offer(int[] argb, int w, int h, long ptsUs) {
            int index = sourceIndex++;
            if (index % step != 0) return;
            if (pending != null) {
                long delayMs = (ptsUs - pendingPtsUs) / 1000L;
                if (delayMs <= 0) delayMs = lastDelayMs;
                emit(delayMs);
            }
            if (firstPtsUs < 0) firstPtsUs = ptsUs;
            pending = argb;
            pendingPtsUs = ptsUs;
        }

        void flush() {
            if (pending != null) {
                emit(lastDelayMs);
            }
        }

        private void emit(long delayMs) {
            lastDelayMs = delayMs;
            encoder.addFrame(pending, width, height, (int) Math.min(Integer.MAX_VALUE, delayMs));
            pending = null;
            encodedFrames++;
            if (listener != null) {
                listener.onFrameProgress(encodedFrames, Math.max(encodedFrames, targetFrames));
            }
        }
    }

    private static int[] scaledDimensions(int srcW, int srcH) {
        int longest = Math.max(srcW, srcH);
        if (longest <= MAX_DIMENSION) {
            return new int[]{srcW, srcH};
        }
        float scale = MAX_DIMENSION / (float) longest;
        return new int[]{
                Math.max(1, Math.round(srcW * scale)),
                Math.max(1, Math.round(srcH * scale))
        };
    }

    /** Fails early with a readable message when the server did not return an MP4 container. */
    private static void validateMp4(File file) throws IOException {
        long length = file.length();
        if (length < 32) {
            throw new IOException("Downloaded file is empty (" + length + " bytes)");
        }
        byte[] header = new byte[12];
        try (InputStream in = new FileInputStream(file)) {
            int read = 0;
            while (read < header.length) {
                int n = in.read(header, read, header.length - read);
                if (n < 0) break;
                read += n;
            }
        }
        boolean isMp4 = header[4] == 'f' && header[5] == 't' && header[6] == 'y' && header[7] == 'p';
        if (!isMp4) {
            throw new IOException("Downloaded file is not an MP4 (" + length + " bytes)");
        }
    }

    /**
     * Twitter's MP4 muxer ("Twitter-vork muxer") writes the 'ctts' (Composition Time to Sample)
     * atom with flags = 1 (header 0x00000001). Android's native libstagefright parser
     * (SampleTable.cpp) strictly enforces `if (U32_AT(header) != 0) return ERROR_MALFORMED;`.
     * When flags != 0, Stagefright rejects the track as malformed and MediaExtractor returns 0 tracks!
     *
     * This method scans MP4 metadata boxes and zeroes out the 4-byte version/flags header of 'ctts',
     * allowing Android's MediaExtractor, MediaMetadataRetriever, and MediaCodec to parse and decode
     * the video track normally.
     */
    public static void sanitizeMp4CttsBox(File mp4File) {
        if (mp4File == null || !mp4File.exists() || mp4File.length() < 16) {
            return;
        }
        try (RandomAccessFile raf = new RandomAccessFile(mp4File, "rw")) {
            sanitizeBoxes(raf, 0, raf.length());
        } catch (Throwable t) {
            Log.w(TAG, "Unable to sanitize MP4 ctts box", t);
        }
    }

    private static void sanitizeBoxes(RandomAccessFile raf, long start, long end) throws IOException {
        long pos = start;
        byte[] typeBuf = new byte[4];
        while (pos + 8 <= end) {
            raf.seek(pos);
            long size = raf.readInt() & 0xffffffffL;
            raf.readFully(typeBuf);
            String type = new String(typeBuf, "ISO-8859-1");

            long hdrLen = 8;
            if (size == 1) {
                if (pos + 16 > end) break;
                size = raf.readLong();
                hdrLen = 16;
            } else if (size == 0) {
                size = end - pos;
            }

            if (size < hdrLen || pos + size > end) {
                break;
            }

            if ("ctts".equals(type)) {
                if (pos + hdrLen + 4 <= end) {
                    raf.seek(pos + hdrLen);
                    int vFlags = raf.readInt();
                    if (vFlags != 0) {
                        Log.i(TAG, "Sanitizing ctts box at " + pos + " (flags was 0x" + Integer.toHexString(vFlags) + ")");
                        raf.seek(pos + hdrLen);
                        raf.writeInt(0);
                    }
                }
            } else if ("moov".equals(type) || "trak".equals(type) || "mdia".equals(type)
                    || "minf".equals(type) || "stbl".equals(type) || "edts".equals(type)) {
                sanitizeBoxes(raf, pos + hdrLen, pos + size);
            }

            pos += size;
        }
    }

    private static int findVideoTrack(MediaExtractor extractor) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            String mime = extractor.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith("video/")) {
                return i;
            }
        }
        return -1;
    }

    private static List<Long> extractSortedVideoPtsUs(File mp4File) {
        List<Long> ptsList = new ArrayList<>();
        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(mp4File.getAbsolutePath());
            int videoTrack = findVideoTrack(extractor);
            if (videoTrack >= 0) {
                extractor.selectTrack(videoTrack);
                while (true) {
                    long sampleTime = extractor.getSampleTime();
                    if (sampleTime < 0) break;
                    ptsList.add(sampleTime);
                    if (!extractor.advance()) break;
                }
                Collections.sort(ptsList);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read sample timestamps", t);
        } finally {
            try {
                extractor.release();
            } catch (Throwable ignored) {
            }
        }
        return ptsList;
    }
}
