package dev.utaa.cutlog.extension.render;

import android.graphics.Matrix;
import dev.utaa.cutlog.extension.editor.EditSpec;
import dev.utaa.cutlog.extension.editor.FilterPreset;
import dev.utaa.cutlog.extension.editor.FrameStyle;
import dev.utaa.cutlog.extension.editor.VideoEffect;
import dev.utaa.cutlog.shaded.androidx.media3.effect.GaussianBlur;
import dev.utaa.cutlog.shaded.androidx.media3.effect.MatrixTransformation;
import dev.utaa.cutlog.shaded.androidx.media3.common.Effect;
import dev.utaa.cutlog.shaded.androidx.media3.effect.Brightness;
import dev.utaa.cutlog.shaded.androidx.media3.effect.Contrast;
import dev.utaa.cutlog.shaded.androidx.media3.effect.HslAdjustment;
import dev.utaa.cutlog.shaded.androidx.media3.effect.OverlayEffect;
import dev.utaa.cutlog.shaded.androidx.media3.effect.Presentation;
import dev.utaa.cutlog.shaded.androidx.media3.effect.RgbFilter;
import dev.utaa.cutlog.shaded.androidx.media3.effect.RgbMatrix;
import dev.utaa.cutlog.shaded.androidx.media3.effect.SingleColorLut;
import dev.utaa.cutlog.shaded.androidx.media3.effect.TextureOverlay;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * {@link EditSpec} を Media3 の Effect に変換する。プレビューと書き出しの両方がここを使う。
 *
 * <p>LUT は GL のテクスチャを持つため、呼び出しごとに新しいインスタンスを作る。
 */
public final class EffectsFactory {
    private static final int LUT_SIZE = 17;

    /** OpenGL と同じ列優先の 4x4 色行列。 */
    private static final float[] SEPIA = {
        0.393f, 0.349f, 0.272f, 0f,
        0.769f, 0.686f, 0.534f, 0f,
        0.189f, 0.168f, 0.131f, 0f,
        0f, 0f, 0f, 1f,
    };

    private EffectsFactory() {}

    /** 取り込んだ動画を出力解像度へ合わせる。縦横比が違う場合ははみ出した部分を切り落とす。 */
    public static List<Effect> normalizeEffects(int width, int height) {
        List<Effect> effects = new ArrayList<>();
        effects.add(Presentation.createForWidthAndHeight(width, height, Presentation.LAYOUT_SCALE_TO_FIT_WITH_CROP));
        return effects;
    }

    /** 色の編集だけ。プレビューではテキストを View で重ねるため、こちらを使う。 */
    public static List<Effect> colorEffects(EditSpec spec) {
        List<Effect> effects = new ArrayList<>();
        switch (spec.filter) {
            case MONO:
                effects.add(RgbFilter.createGrayscaleFilter());
                break;
            case SEPIA:
                effects.add((RgbMatrix) (presentationTimeUs, useHdr) -> SEPIA);
                break;
            case WARM:
            case COOL:
            case FADE:
                effects.add(SingleColorLut.createFromCube(cube(spec.filter)));
                break;
            case NONE:
                break;
        }
        if (spec.brightness != 0f) {
            effects.add(new Brightness(spec.brightness));
        }
        if (spec.contrast != 0f) {
            effects.add(new Contrast(spec.contrast));
        }
        if (spec.saturation != 0f) {
            effects.add(new HslAdjustment.Builder().adjustSaturation(spec.saturation * 100f).build());
        }
        return effects;
    }

    /**
     * 動画全体にかける効果。反転・ズーム → 揺れ → 色の編集 → RGB → ぼかし → グリッチ → VHS → 粒子 → ビネットの順。
     * 文字・スタンプはこの後に重ねるため、効果はかからない。
     */
    public static List<Effect> videoEffects(EditSpec spec) {
        List<Effect> effects = new ArrayList<>();
        if (spec.hasTransform()) {
            float[] t = EffectMath.transform(spec.flipX, spec.flipY, spec.zoom, spec.panX, spec.panY);
            effects.add((MatrixTransformation) presentationTimeUs -> {
                Matrix matrix = new Matrix();
                matrix.postScale(t[0], t[1]);
                matrix.postTranslate(t[2], t[3]);
                return matrix;
            });
        }
        Float shake = spec.effects.get(VideoEffect.SHAKE);
        if (shake != null) {
            float intensity = shake;
            effects.add((MatrixTransformation) presentationTimeUs -> {
                float[] s = EffectMath.shake(presentationTimeUs, intensity);
                Matrix matrix = new Matrix();
                matrix.postScale(s[3], s[3]);
                matrix.postRotate(s[2]);
                matrix.postTranslate(s[0], s[1]);
                return matrix;
            });
        }
        effects.addAll(colorEffects(spec));
        Float rgb = spec.effects.get(VideoEffect.RGB);
        if (rgb != null) {
            float intensity = rgb;
            effects.add((RgbMatrix) (presentationTimeUs, useHdr) ->
                    EffectMath.hueRotation(EffectMath.rainbowDegrees(presentationTimeUs), intensity));
        }
        Float blur = spec.effects.get(VideoEffect.BLUR);
        if (blur != null) {
            effects.add(new GaussianBlur(1f + blur * 11f));
        }
        addShader(effects, spec, VideoEffect.GLITCH, Shaders.GLITCH);
        addShader(effects, spec, VideoEffect.VHS, Shaders.VHS);
        addShader(effects, spec, VideoEffect.GRAIN, Shaders.GRAIN);
        addShader(effects, spec, VideoEffect.VIGNETTE, Shaders.VIGNETTE);
        return effects;
    }

    private static void addShader(List<Effect> effects, EditSpec spec, VideoEffect effect, String shader) {
        Float intensity = spec.effects.get(effect);
        if (intensity != null) {
            effects.add(new ShaderEffect(shader, intensity));
        }
    }

    /** 書き出し用。動画全体の効果の後に文字・スタンプを焼き込む。 */
    public static List<Effect> exportEffects(EditSpec spec, int width, int height) {
        List<Effect> effects = videoEffects(spec);
        if (!spec.layers.isEmpty() || spec.frame != FrameStyle.NONE) {
            List<TextureOverlay> overlays = Collections.singletonList(
                    new LayerOverlay(spec.frame, spec.layers, spec.durationMs, width, height));
            effects.add(new OverlayEffect(overlays));
        }
        return effects;
    }

    private static int[][][] cube(FilterPreset preset) {
        int[][][] cube = new int[LUT_SIZE][LUT_SIZE][LUT_SIZE];
        float[] rgb = new float[3];
        for (int r = 0; r < LUT_SIZE; r++) {
            for (int g = 0; g < LUT_SIZE; g++) {
                for (int b = 0; b < LUT_SIZE; b++) {
                    rgb[0] = r / (float) (LUT_SIZE - 1);
                    rgb[1] = g / (float) (LUT_SIZE - 1);
                    rgb[2] = b / (float) (LUT_SIZE - 1);
                    grade(preset, rgb);
                    cube[r][g][b] = 0xFF000000 | (channel(rgb[0]) << 16) | (channel(rgb[1]) << 8) | channel(rgb[2]);
                }
            }
        }
        return cube;
    }

    private static void grade(FilterPreset preset, float[] rgb) {
        switch (preset) {
            case WARM:
                rgb[0] = rgb[0] * 1.06f + 0.04f;
                rgb[1] = rgb[1] * 1.01f + 0.01f;
                rgb[2] = rgb[2] * 0.88f;
                break;
            case COOL:
                rgb[0] = rgb[0] * 0.90f;
                rgb[1] = rgb[1] * 1.00f + 0.01f;
                rgb[2] = rgb[2] * 1.06f + 0.04f;
                break;
            case FADE: {
                float luma = 0.299f * rgb[0] + 0.587f * rgb[1] + 0.114f * rgb[2];
                for (int i = 0; i < 3; i++) {
                    float desaturated = luma + (rgb[i] - luma) * 0.75f;
                    rgb[i] = 0.10f + desaturated * 0.82f;
                }
                break;
            }
            default:
                break;
        }
    }

    private static int channel(float value) {
        return Math.round(Math.max(0f, Math.min(1f, value)) * 255f);
    }
}
