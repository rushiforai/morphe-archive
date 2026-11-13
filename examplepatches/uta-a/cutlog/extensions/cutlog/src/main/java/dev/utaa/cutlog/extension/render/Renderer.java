package dev.utaa.cutlog.extension.render;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import dev.utaa.cutlog.extension.editor.EditSpec;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import dev.utaa.cutlog.shaded.androidx.media3.common.Effect;
import dev.utaa.cutlog.shaded.androidx.media3.common.C;
import dev.utaa.cutlog.shaded.androidx.media3.common.MediaItem;
import dev.utaa.cutlog.shaded.androidx.media3.common.audio.SpeedProvider;
import dev.utaa.cutlog.shaded.androidx.media3.common.audio.AudioProcessor;
import dev.utaa.cutlog.shaded.androidx.media3.common.audio.ChannelMixingAudioProcessor;
import dev.utaa.cutlog.shaded.androidx.media3.common.audio.ChannelMixingMatrix;
import dev.utaa.cutlog.shaded.androidx.media3.common.audio.SonicAudioProcessor;
import dev.utaa.cutlog.shaded.androidx.media3.effect.FrameDropEffect;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Composition;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.EditedMediaItem;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.EditedMediaItemSequence;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Effects;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.ExportException;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.ExportResult;
import dev.utaa.cutlog.shaded.androidx.media3.transformer.Transformer;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Media3 Transformer で編集内容を焼き込んだ mp4 を書き出す。
 *
 * <p>Transformer は Looper スレッドの非同期 API なので、main thread から呼び、結果は main thread の
 * コールバックで受け取る。撮影した動画は音声に手を加えず、録画の AAC をそのまま引き継ぐ。
 * 端末内から取り込んだ動画は、{@link OutputProfile} の解像度・フレームレート・長さ・音声形式へ揃える。
 */
public final class Renderer {
    public interface Callback {
        void onSuccess(File output);

        void onError(Exception error);
    }

    /** 書き出しの指定。 */
    public static final class Request {
        final Uri input;
        final EditSpec spec;
        final int width;
        final int height;
        final File output;
        /** 取り込んだ動画を公式撮影分の仕様へ揃えるか。 */
        boolean normalize;
        long clipStartMs;
        /** 0 以下なら切り出さない。 */
        long clipEndMs;

        public Request(Uri input, EditSpec spec, int width, int height, File output) {
            this.input = input;
            this.spec = spec;
            this.width = width;
            this.height = height;
            this.output = output;
        }

        public Request normalized(long clipStartMs, long clipEndMs) {
            this.normalize = true;
            this.clipStartMs = clipStartMs;
            this.clipEndMs = clipEndMs;
            return this;
        }
    }

    private final Transformer transformer;
    private final File output;

    private Renderer(Transformer transformer, File output) {
        this.transformer = transformer;
        this.output = output;
    }

    public static Renderer start(Context context, Request request, Callback callback) {
        File output = request.output;
        output.delete();
        Transformer.Builder builder = new Transformer.Builder(context)
                .setVideoMimeType(OutputProfile.VIDEO_MIME_TYPE)
                // 公式撮影分は回転メタデータを持たず、解像度そのもので縦横を表す。縦動画も縦のまま符号化する。
                .setPortraitEncodingEnabled(true)
                .addListener(new Transformer.Listener() {
                    @Override
                    public void onCompleted(Composition composition, ExportResult result) {
                        Log.i(CaptureInterceptor.TAG, "Export completed: " + result.width + "x" + result.height
                                + ", " + result.durationMs + "ms, " + result.videoFrameCount + " frames"
                                + ", video=" + result.videoMimeType
                                + " (" + result.videoEncoderName + "), audio=" + result.audioMimeType);
                        if (!OutputProfile.VIDEO_MIME_TYPE.equals(result.videoMimeType)) {
                            output.delete();
                            callback.onError(new IOException("Encoder fell back to " + result.videoMimeType));
                            return;
                        }
                        callback.onSuccess(output);
                    }

                    @Override
                    public void onError(Composition composition, ExportResult result, ExportException error) {
                        Log.w(CaptureInterceptor.TAG, "Export failed.", error);
                        output.delete();
                        callback.onError(error);
                    }
                });
        if (request.normalize) {
            builder.setAudioMimeType(OutputProfile.AUDIO_MIME_TYPE);
        }
        Transformer transformer = builder.build();

        MediaItem.Builder mediaItem = new MediaItem.Builder().setUri(request.input);
        if (request.clipEndMs > 0) {
            mediaItem.setClippingConfiguration(new MediaItem.ClippingConfiguration.Builder()
                    .setStartPositionMs(request.clipStartMs)
                    .setEndPositionMs(request.clipEndMs)
                    .build());
        }
        List<AudioProcessor> audio = new ArrayList<>();
        List<Effect> video = new ArrayList<>();
        float speed = request.spec.speed;
        if (request.normalize || speed > 1f) {
            // 公式撮影分は 30fps 以下。速くすると撮影した動画でもフレームが詰まるため、同じく間引く。
            video.add(FrameDropEffect.createDefaultFrameDropEffect(OutputProfile.FRAME_RATE));
        }
        if (request.normalize) {
            video.addAll(EffectsFactory.normalizeEffects(request.width, request.height));
            audio.addAll(normalizeAudio());
        }
        video.addAll(EffectsFactory.exportEffects(request.spec, request.width, request.height));
        EditedMediaItem.Builder itemBuilder = new EditedMediaItem.Builder(mediaItem.build())
                .setEffects(new Effects(audio, video));
        if (speed != 1f) {
            itemBuilder.setSpeed(new SpeedProvider() {
                @Override
                public float getSpeed(long timeUs) {
                    return speed;
                }

                @Override
                public long getNextSpeedChangeTimeUs(long timeUs) {
                    return C.TIME_UNSET;
                }
            });
        }
        EditedMediaItem item = itemBuilder.build();

        if (request.normalize) {
            // 音声の無い動画にも、公式撮影分と同じく音声トラック（無音）を付ける。HDR は SDR へ落とす。
            Composition composition = new Composition.Builder(
                            new EditedMediaItemSequence.Builder(item).experimentalSetForceAudioTrack(true).build())
                    .setHdrMode(Composition.HDR_MODE_TONE_MAP_HDR_TO_SDR_USING_OPEN_GL)
                    .build();
            transformer.start(composition, output.getPath());
        } else {
            transformer.start(item, output.getPath());
        }
        return new Renderer(transformer, output);
    }

    /** 48kHz モノラルへ変換する。 */
    private static List<AudioProcessor> normalizeAudio() {
        SonicAudioProcessor resample = new SonicAudioProcessor();
        resample.setOutputSampleRateHz(OutputProfile.AUDIO_SAMPLE_RATE);
        ChannelMixingAudioProcessor downmix = new ChannelMixingAudioProcessor();
        // media3 の既定係数は一部のチャンネル数にしか無いため、全チャンネルを均等に混ぜる係数を自分で作る。
        for (int channels = 1; channels <= 8; channels++) {
            float[] coefficients = new float[channels];
            java.util.Arrays.fill(coefficients, 1f / channels);
            downmix.putChannelMixingMatrix(new ChannelMixingMatrix(channels, OutputProfile.AUDIO_CHANNELS, coefficients));
        }
        List<AudioProcessor> processors = new ArrayList<>();
        processors.add(resample);
        processors.add(downmix);
        return processors;
    }

    /** 書き出しを止め、途中まで書いた出力を消す（Transformer.cancel は出力ファイルを消さない）。 */
    public void cancel() {
        transformer.cancel();
        output.delete();
    }
}
