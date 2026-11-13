package dev.utaa.cutlog.extension.render;

import android.content.Context;
import android.graphics.Rect;
import android.media.Image;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import dev.utaa.cutlog.shaded.androidx.media3.common.Effect;
import dev.utaa.cutlog.shaded.androidx.media3.common.MediaItem;
import dev.utaa.cutlog.shaded.androidx.media3.effect.Presentation;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Composition;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.DefaultEncoderFactory;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.EditedMediaItem;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.EditedMediaItemSequence;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Effects;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.ExportException;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.ExportResult;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.ProgressHolder;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Transformer;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.VideoEncoderSettings;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * 動画の区間を逆再生にした中間ファイル（H.264 + AAC の mp4）を作る。Media3 に逆再生が無いため、
 * 映像は後ろから少しずつ復号して逆順にエンコードし、音声は PCM に戻して逆順にしてから AAC にし直す。
 *
 * <p>後ろから復号すると、そのたびに直前のキーフレームから復号し直すことになり、キーフレームが少ない動画では
 * 長さの 2 乗で遅くなる。そこで先に Transformer（GPU）で区間を切り出し、表示上の向き・大きさにして、全フレームを
 * キーフレームにした下ごしらえを作る。そこから {@link #CHUNK} 枚ずつ YUV のまま復号し、そのままエンコーダーへ渡す。
 * メモリに載せるのは {@link #CHUNK} 枚分の YUV と、区間の PCM だけ。
 *
 * <p>main thread から始める。取り出しとエンコードは裏のスレッドで動き、進み具合と結果は main thread へ返す。
 * 途中でやめたら出力を消す。
 */
public final class Reverser {
    public interface Callback {
        void onProgress(float progress);

        void onSuccess(File output);

        void onError(Exception error);
    }

    private static final String VIDEO_MIME = MediaFormat.MIMETYPE_VIDEO_AVC;
    private static final String AUDIO_MIME = MediaFormat.MIMETYPE_AUDIO_AAC;
    /** 中間ファイルなので、最後の書き出しでの劣化が目立たないよう高めにする。 */
    private static final int VIDEO_BITRATE = 12_000_000;
    private static final int AUDIO_BITRATE = 128_000;
    private static final int MAX_SIDE = 1280;
    /** 一度に復号して溜めるフレームの数。720p の YUV は 1 枚 1.4MB ほど。 */
    private static final int CHUNK = 16;
    private static final long TIMEOUT_US = 10_000;
    /** 全フレームがキーフレームの下ごしらえは 1 枚ごとの容量が大きいので、ビットレートも高めにする。 */
    private static final int INTRA_BITRATE = 40_000_000;
    /** 進み具合のうち、下ごしらえが占める割合。 */
    private static final float PREPARE_SHARE = 0.4f;
    private static final long PROGRESS_INTERVAL_MS = 100;

    private final Context context;
    private final Uri source;
    private final long startMs;
    private final long lengthMs;
    private final int displayWidth;
    private final int displayHeight;
    private final File output;
    private final Callback callback;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private final File intra;
    private Transformer transformer;

    private Reverser(Context context, Uri source, long startMs, long lengthMs, int displayWidth, int displayHeight,
            File output, Callback callback) {
        this.context = context.getApplicationContext();
        this.source = source;
        this.startMs = startMs;
        this.lengthMs = lengthMs;
        this.displayWidth = displayWidth;
        this.displayHeight = displayHeight;
        this.output = output;
        this.callback = callback;
        this.intra = new File(output.getPath() + ".intra.mp4");
    }

    /** source の [startMs, startMs + lengthMs) を逆再生にして output へ書く。displayWidth・Height は表示上の向き。 */
    public static Reverser start(Context context, Uri source, long startMs, long lengthMs, int displayWidth,
            int displayHeight, File output, Callback callback) {
        Reverser reverser = new Reverser(context, source, startMs, lengthMs, displayWidth, displayHeight, output, callback);
        reverser.prepare();
        return reverser;
    }

    /** やめる。callback はもう呼ばない。main thread から呼ぶ。 */
    public void cancel() {
        cancelled.set(true);
        if (transformer != null) {
            transformer.cancel();
            transformer = null;
            intra.delete();
        }
    }

    /** 区間を切り出し、表示上の向き・大きさで全フレームをキーフレームにした下ごしらえを intra へ書く。 */
    private void prepare() {
        intra.delete();
        int[] size = ReverseMath.encodeSize(displayWidth, displayHeight, MAX_SIDE);
        VideoEncoderSettings settings = new VideoEncoderSettings.Builder()
                .setBitrate(INTRA_BITRATE)
                .setiFrameIntervalSeconds(0f)
                .build();
        transformer = new Transformer.Builder(context)
                .setVideoMimeType(VIDEO_MIME)
                .setPortraitEncodingEnabled(true)
                .setEncoderFactory(new DefaultEncoderFactory.Builder(context)
                        .setRequestedVideoEncoderSettings(settings)
                        .build())
                .addListener(new Transformer.Listener() {
                    @Override
                    public void onCompleted(Composition composition, ExportResult result) {
                        transformer = null;
                        if (cancelled.get()) {
                            intra.delete();
                            return;
                        }
                        Log.i(CaptureInterceptor.TAG, "Prepared intra-only video: " + result.width + "x" + result.height
                                + ", " + result.videoFrameCount + " frames");
                        new Thread(Reverser.this::run, "cutlog-reverse").start();
                    }

                    @Override
                    public void onError(Composition composition, ExportResult result, ExportException error) {
                        transformer = null;
                        intra.delete();
                        if (cancelled.get()) {
                            return;
                        }
                        Log.w(CaptureInterceptor.TAG, "Cannot prepare the video for reversing.", error);
                        callback.onError(error);
                    }
                })
                .build();
        MediaItem item = new MediaItem.Builder()
                .setUri(source)
                .setClippingConfiguration(new MediaItem.ClippingConfiguration.Builder()
                        .setStartPositionMs(startMs)
                        .setEndPositionMs(startMs + lengthMs)
                        .build())
                .build();
        List<Effect> effects = Collections.singletonList(
                Presentation.createForWidthAndHeight(size[0], size[1], Presentation.LAYOUT_SCALE_TO_FIT));
        EditedMediaItem edited = new EditedMediaItem.Builder(item)
                .setRemoveAudio(true)
                .setEffects(new Effects(Collections.emptyList(), effects))
                .build();
        // HDR の動画は、書き出しと同じく SDR へ落とす。
        Composition composition = new Composition.Builder(new EditedMediaItemSequence.Builder(edited).build())
                .setHdrMode(Composition.HDR_MODE_TONE_MAP_HDR_TO_SDR_USING_OPEN_GL)
                .build();
        transformer.start(composition, intra.getPath());
        pollProgress();
    }

    private void pollProgress() {
        Transformer current = transformer;
        if (current == null || cancelled.get()) {
            return;
        }
        ProgressHolder holder = new ProgressHolder();
        if (current.getProgress(holder) == Transformer.PROGRESS_STATE_AVAILABLE) {
            callback.onProgress(PREPARE_SHARE * holder.progress / 100f);
        }
        main.postDelayed(this::pollProgress, PROGRESS_INTERVAL_MS);
    }

    private void run() {
        try {
            reverse();
            main.post(() -> {
                if (!cancelled.get()) {
                    callback.onSuccess(output);
                } else {
                    output.delete();
                }
            });
        } catch (Exception e) {
            output.delete();
            if (!cancelled.get()) {
                Log.w(CaptureInterceptor.TAG, "Cannot reverse the video.", e);
                main.post(() -> callback.onError(e));
            }
        } finally {
            intra.delete();
        }
    }

    private void checkCancelled() {
        if (cancelled.get()) {
            throw new CancellationException();
        }
    }

    private void reverse() throws IOException {
        long began = System.nanoTime();
        output.delete();
        AudioTrack audio = reverseAudio();
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec decoder = null;
        MediaCodec encoder = null;
        MediaMuxer muxer = null;
        try {
            extractor.setDataSource(intra.getPath());
            int track = findTrack(extractor, "video/");
            if (track < 0) {
                throw new IOException("No video track in the prepared video");
            }
            extractor.selectTrack(track);
            MediaFormat input = extractor.getTrackFormat(track);
            long[] times = sampleTimes(extractor);
            int count = times.length;
            if (count == 0) {
                throw new IOException("No frames to reverse");
            }
            int width = input.getInteger(MediaFormat.KEY_WIDTH);
            int height = input.getInteger(MediaFormat.KEY_HEIGHT);

            input.setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatYUV420Flexible);
            decoder = MediaCodec.createDecoderByType(input.getString(MediaFormat.KEY_MIME));
            decoder.configure(input, null, null, 0);
            decoder.start();

            MediaFormat format = MediaFormat.createVideoFormat(VIDEO_MIME, width, height);
            format.setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatYUV420Flexible);
            format.setInteger(MediaFormat.KEY_BIT_RATE, VIDEO_BITRATE);
            format.setInteger(MediaFormat.KEY_FRAME_RATE, input.getNumber(MediaFormat.KEY_FRAME_RATE, 30).intValue());
            format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, 1);
            encoder = MediaCodec.createEncoderByType(VIDEO_MIME);
            encoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            encoder.start();
            muxer = new MediaMuxer(output.getPath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            muxer.setOrientationHint(input.getInteger(MediaFormat.KEY_ROTATION, 0));
            Muxing muxing = new Muxing(muxer, audio);

            // 逆再生の k 枚目は、元の最後のフレームから元の間隔のまま遡った時刻に置く。
            long lastUs = times[count - 1];
            int written = 0;
            for (int chunkEnd = count; chunkEnd > 0; chunkEnd -= CHUNK) {
                checkCancelled();
                int chunkStart = Math.max(0, chunkEnd - CHUNK);
                byte[][][] frames = decodeRange(extractor, decoder, times, chunkStart, chunkEnd, width, height);
                for (int k = frames.length - 1; k >= 0; k--) {
                    checkCancelled();
                    byte[][] frame = frames[k];
                    frames[k] = null;
                    queueFrame(encoder, muxing, frame, width, height, lastUs - times[chunkStart + k]);
                    written++;
                    float progress = PREPARE_SHARE + (1f - PREPARE_SHARE) * written / count;
                    main.post(() -> {
                        if (!cancelled.get()) {
                            callback.onProgress(progress);
                        }
                    });
                }
            }
            int index;
            while ((index = encoder.dequeueInputBuffer(TIMEOUT_US)) < 0) {
                drain(encoder, muxing, false);
            }
            long endUs = lastUs - times[0] + (count > 1 ? (lastUs - times[0]) / (count - 1) : 33_333);
            encoder.queueInputBuffer(index, 0, 0, endUs, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
            drain(encoder, muxing, true);
            Log.i(CaptureInterceptor.TAG, "Reversed " + written + " frames (" + width + "x" + height + "), audio="
                    + (audio != null) + ", " + (System.nanoTime() - began) / 1_000_000 + "ms");
        } finally {
            if (decoder != null) {
                decoder.release();
            }
            if (encoder != null) {
                try {
                    encoder.stop();
                } catch (RuntimeException ignored) {
                    // 失敗の途中で止める場合は、stop できない状態のことがある。
                }
                encoder.release();
            }
            if (muxer != null) {
                try {
                    muxer.stop();
                } catch (RuntimeException ignored) {
                    // 始まる前に失敗した場合は stop できない。出力は呼び出し側で消す。
                }
                muxer.release();
            }
            extractor.release();
        }
    }

    private static int findTrack(MediaExtractor extractor, String mimePrefix) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            String mime = extractor.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(mimePrefix)) {
                return i;
            }
        }
        return -1;
    }

    /** 選んだトラックの全サンプルの時刻を、表示順に並べて返す。読み終えたら先頭へ戻す。 */
    private static long[] sampleTimes(MediaExtractor extractor) {
        long[] times = new long[64];
        int count = 0;
        long time;
        while ((time = extractor.getSampleTime()) >= 0) {
            if (count == times.length) {
                times = Arrays.copyOf(times, count * 2);
            }
            times[count++] = time;
            extractor.advance();
        }
        extractor.seekTo(0, MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
        times = Arrays.copyOf(times, count);
        Arrays.sort(times);
        return times;
    }

    /**
     * times[start]〜times[end - 1] のフレームを復号し、I420（Y・U・V を詰めて並べたもの）で返す。
     * 直前のキーフレームから復号するが、下ごしらえは全フレームがキーフレームなので、ほぼ区間の分だけで済む。
     */
    private byte[][][] decodeRange(MediaExtractor extractor, MediaCodec decoder, long[] times, int start, int end,
            int width, int height) throws IOException {
        decoder.flush();
        extractor.seekTo(times[start], MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
        byte[][][] frames = new byte[end - start][][];
        int got = 0;
        boolean inputDone = false;
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        while (got < frames.length) {
            checkCancelled();
            if (!inputDone) {
                int index = decoder.dequeueInputBuffer(TIMEOUT_US);
                if (index >= 0) {
                    ByteBuffer buffer = decoder.getInputBuffer(index);
                    int size = buffer != null ? extractor.readSampleData(buffer, 0) : -1;
                    if (size < 0) {
                        decoder.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                        inputDone = true;
                    } else {
                        decoder.queueInputBuffer(index, 0, size, extractor.getSampleTime(), 0);
                        extractor.advance();
                    }
                }
            }
            int index = decoder.dequeueOutputBuffer(info, inputDone ? TIMEOUT_US : 0);
            if (index < 0) {
                continue;
            }
            int slot = Arrays.binarySearch(times, start, end, info.presentationTimeUs);
            if (slot >= 0 && frames[slot - start] == null) {
                Image image = decoder.getOutputImage(index);
                if (image != null) {
                    frames[slot - start] = copyImage(image, width, height);
                    image.close();
                    got++;
                }
            }
            decoder.releaseOutputBuffer(index, false);
            if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                break;
            }
        }
        if (got < frames.length) {
            throw new IOException("Decoded " + got + " of " + frames.length + " frames at " + times[start] + "us");
        }
        return frames;
    }

    /** 復号した Image の表示範囲を I420 に詰めて写す。 */
    private static byte[][] copyImage(Image image, int width, int height) {
        Rect crop = image.getCropRect();
        Image.Plane[] planes = image.getPlanes();
        byte[] y = new byte[width * height];
        byte[] u = new byte[width * height / 4];
        byte[] v = new byte[width * height / 4];
        readPlane(planes[0], y, width, height, crop.left, crop.top);
        readPlane(planes[1], u, width / 2, height / 2, crop.left / 2, crop.top / 2);
        readPlane(planes[2], v, width / 2, height / 2, crop.left / 2, crop.top / 2);
        return new byte[][] {y, u, v};
    }

    private static void readPlane(Image.Plane plane, byte[] bytes, int width, int height, int left, int top) {
        ByteBuffer buffer = plane.getBuffer();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        for (int row = 0; row < height; row++) {
            int base = (top + row) * rowStride + left * pixelStride;
            int rowStart = row * width;
            if (pixelStride == 1) {
                buffer.position(base);
                buffer.get(bytes, rowStart, width);
            } else {
                for (int x = 0; x < width; x++) {
                    bytes[rowStart + x] = buffer.get(base + x * pixelStride);
                }
            }
        }
    }

    /** I420 のフレームをエンコーダーへ入れる。プレーンの並びは Image の stride に従う。 */
    private void queueFrame(MediaCodec encoder, Muxing muxing, byte[][] frame, int width, int height, long ptsUs) {
        int index;
        while ((index = encoder.dequeueInputBuffer(TIMEOUT_US)) < 0) {
            checkCancelled();
            drain(encoder, muxing, false);
        }
        Image image = encoder.getInputImage(index);
        if (image == null) {
            throw new IllegalStateException("Encoder has no input image");
        }
        Image.Plane[] planes = image.getPlanes();
        writePlane(planes[0], frame[0], width, height);
        writePlane(planes[1], frame[1], width / 2, height / 2);
        writePlane(planes[2], frame[2], width / 2, height / 2);
        encoder.queueInputBuffer(index, 0, width * height * 3 / 2, ptsUs, 0);
        drain(encoder, muxing, false);
    }

    /** 詰めて並べた 1 面を、Image のプレーンへ写す。画素が隣り合っていれば行ごとにまとめて書く。 */
    private static void writePlane(Image.Plane plane, byte[] bytes, int width, int height) {
        ByteBuffer buffer = plane.getBuffer();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        for (int y = 0; y < height; y++) {
            int rowStart = y * width;
            if (pixelStride == 1) {
                buffer.position(y * rowStride);
                buffer.put(bytes, rowStart, width);
            } else {
                int base = y * rowStride;
                for (int x = 0; x < width; x++) {
                    buffer.put(base + x * pixelStride, bytes[rowStart + x]);
                }
            }
        }
    }

    /** エンコーダーの出力を muxer へ書く。映像の形式が決まったところで muxer を始める。 */
    private void drain(MediaCodec encoder, Muxing muxing, boolean untilEnd) {
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        while (true) {
            // 途中では出力が無ければ待たずに戻る。待つと 1 フレームごとに待ち時間が積み重なる。
            int index = encoder.dequeueOutputBuffer(info, untilEnd ? TIMEOUT_US : 0);
            if (index == MediaCodec.INFO_TRY_AGAIN_LATER) {
                if (!untilEnd) {
                    return;
                }
                checkCancelled();
                continue;
            }
            if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                muxing.start(encoder.getOutputFormat());
                continue;
            }
            if (index < 0) {
                continue;
            }
            ByteBuffer data = encoder.getOutputBuffer(index);
            if ((info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0 && info.size > 0 && data != null) {
                muxing.writeVideo(data, info);
            }
            encoder.releaseOutputBuffer(index, false);
            if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                return;
            }
        }
    }

    /** 映像のトラックが決まってから、音声のトラックと合わせて muxer を始め、先に作った音声を書く。 */
    private static final class Muxing {
        private final MediaMuxer muxer;
        private final AudioTrack audio;
        private int videoTrack = -1;

        Muxing(MediaMuxer muxer, AudioTrack audio) {
            this.muxer = muxer;
            this.audio = audio;
        }

        void start(MediaFormat videoFormat) {
            if (videoTrack >= 0) {
                return;
            }
            videoTrack = muxer.addTrack(videoFormat);
            int audioTrack = audio != null ? muxer.addTrack(audio.format) : -1;
            muxer.start();
            if (audio != null) {
                for (int i = 0; i < audio.samples.size(); i++) {
                    muxer.writeSampleData(audioTrack, ByteBuffer.wrap(audio.samples.get(i)), audio.infos.get(i));
                }
            }
        }

        void writeVideo(ByteBuffer data, MediaCodec.BufferInfo info) {
            if (videoTrack < 0) {
                throw new IllegalStateException("Video sample before format");
            }
            muxer.writeSampleData(videoTrack, data, info);
        }
    }

    /** 逆順にして AAC にし直した音声。 */
    private static final class AudioTrack {
        final MediaFormat format;
        final List<byte[]> samples;
        final List<MediaCodec.BufferInfo> infos;

        AudioTrack(MediaFormat format, List<byte[]> samples, List<MediaCodec.BufferInfo> infos) {
            this.format = format;
            this.samples = samples;
            this.infos = infos;
        }
    }

    /** 区間の音声を PCM に戻して逆順にし、AAC にし直す。音声が無ければ null。 */
    private AudioTrack reverseAudio() throws IOException {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec decoder = null;
        MediaCodec encoder = null;
        try {
            extractor.setDataSource(context, source, null);
            int track = -1;
            MediaFormat input = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat format = extractor.getTrackFormat(i);
                String mime = format.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    track = i;
                    input = format;
                    break;
                }
            }
            if (track < 0) {
                return null;
            }
            extractor.selectTrack(track);
            long startUs = startMs * 1000;
            long endUs = (startMs + lengthMs) * 1000;
            extractor.seekTo(startUs, MediaExtractor.SEEK_TO_PREVIOUS_SYNC);

            decoder = MediaCodec.createDecoderByType(input.getString(MediaFormat.KEY_MIME));
            decoder.configure(input, null, null, 0);
            decoder.start();
            int channels = input.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            int rate = input.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            ByteArrayOutputStream pcm = new ByteArrayOutputStream();
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean inputDone = false;
            while (true) {
                checkCancelled();
                if (!inputDone) {
                    int index = decoder.dequeueInputBuffer(TIMEOUT_US);
                    if (index >= 0) {
                        ByteBuffer buffer = decoder.getInputBuffer(index);
                        int size = buffer != null ? extractor.readSampleData(buffer, 0) : -1;
                        long time = extractor.getSampleTime();
                        if (size < 0 || time > endUs) {
                            decoder.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            decoder.queueInputBuffer(index, 0, size, time, 0);
                            extractor.advance();
                        }
                    }
                }
                int index = decoder.dequeueOutputBuffer(info, TIMEOUT_US);
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat format = decoder.getOutputFormat();
                    channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    if (format.containsKey(MediaFormat.KEY_PCM_ENCODING)
                            && format.getInteger(MediaFormat.KEY_PCM_ENCODING) != android.media.AudioFormat.ENCODING_PCM_16BIT) {
                        throw new IOException("Unsupported PCM encoding: " + format);
                    }
                } else if (index >= 0) {
                    ByteBuffer data = decoder.getOutputBuffer(index);
                    if (data != null && info.size > 0) {
                        appendClipped(pcm, data, info, startUs, endUs, channels, rate);
                    }
                    decoder.releaseOutputBuffer(index, false);
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                        break;
                    }
                }
            }
            byte[] reversed = ReverseMath.reversePcm16(pcm.toByteArray(), channels);
            if (reversed.length == 0) {
                return null;
            }

            MediaFormat format = MediaFormat.createAudioFormat(AUDIO_MIME, rate, channels);
            format.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC);
            format.setInteger(MediaFormat.KEY_BIT_RATE, AUDIO_BITRATE);
            format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 16 * 1024);
            encoder = MediaCodec.createEncoderByType(AUDIO_MIME);
            encoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            encoder.start();
            return encodeAac(encoder, reversed, channels, rate);
        } finally {
            if (decoder != null) {
                decoder.release();
            }
            if (encoder != null) {
                encoder.release();
            }
            extractor.release();
        }
    }

    /** 出力バッファのうち、区間 [startUs, endUs) に入る部分だけを pcm に足す。 */
    private static void appendClipped(ByteArrayOutputStream pcm, ByteBuffer data, MediaCodec.BufferInfo info,
            long startUs, long endUs, int channels, int rate) {
        int frameBytes = 2 * channels;
        int frames = info.size / frameBytes;
        long first = Math.max(0, (long) Math.ceil((startUs - info.presentationTimeUs) * (double) rate / 1_000_000));
        long last = Math.min(frames, (long) Math.floor((endUs - info.presentationTimeUs) * (double) rate / 1_000_000));
        if (last <= first) {
            return;
        }
        byte[] bytes = new byte[(int) ((last - first) * frameBytes)];
        data.position(info.offset + (int) first * frameBytes);
        data.get(bytes);
        pcm.write(bytes, 0, bytes.length);
    }

    private AudioTrack encodeAac(MediaCodec encoder, byte[] pcm, int channels, int rate) {
        int frameBytes = 2 * channels;
        int chunk = 1024 * frameBytes;
        List<byte[]> samples = new ArrayList<>();
        List<MediaCodec.BufferInfo> infos = new ArrayList<>();
        MediaFormat outputFormat = null;
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        int offset = 0;
        boolean inputDone = false;
        while (true) {
            checkCancelled();
            if (!inputDone) {
                int index = encoder.dequeueInputBuffer(TIMEOUT_US);
                if (index >= 0) {
                    ByteBuffer buffer = encoder.getInputBuffer(index);
                    long ptsUs = (offset / frameBytes) * 1_000_000L / rate;
                    if (offset >= pcm.length || buffer == null) {
                        encoder.queueInputBuffer(index, 0, 0, ptsUs, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                        inputDone = true;
                    } else {
                        int size = Math.min(Math.min(chunk, buffer.remaining()), pcm.length - offset);
                        size -= size % frameBytes;
                        buffer.put(pcm, offset, size);
                        encoder.queueInputBuffer(index, 0, size, ptsUs, 0);
                        offset += size;
                    }
                }
            }
            int index = encoder.dequeueOutputBuffer(info, TIMEOUT_US);
            if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                outputFormat = encoder.getOutputFormat();
            } else if (index >= 0) {
                ByteBuffer data = encoder.getOutputBuffer(index);
                if ((info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0 && info.size > 0 && data != null) {
                    byte[] bytes = new byte[info.size];
                    data.position(info.offset);
                    data.get(bytes);
                    MediaCodec.BufferInfo copy = new MediaCodec.BufferInfo();
                    copy.set(0, info.size, info.presentationTimeUs, info.flags & ~MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                    samples.add(bytes);
                    infos.add(copy);
                }
                encoder.releaseOutputBuffer(index, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    break;
                }
            }
        }
        if (outputFormat == null || samples.isEmpty()) {
            return null;
        }
        return new AudioTrack(outputFormat, samples, infos);
    }
}
