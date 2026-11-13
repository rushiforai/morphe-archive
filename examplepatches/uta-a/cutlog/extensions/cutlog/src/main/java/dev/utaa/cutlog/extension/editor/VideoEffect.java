package dev.utaa.cutlog.extension.editor;

/** 動画全体にかける効果。強さは 0〜1 で、いくつでも重ねられる。 */
public enum VideoEffect {
    /** 色相が時間とともに回る。 */
    RGB("RGB"),
    VHS("VHS"),
    GLITCH("グリッチ"),
    BLUR("ぼかし"),
    VIGNETTE("ビネット"),
    GRAIN("粒子"),
    SHAKE("揺れ");

    public static final float DEFAULT_INTENSITY = 0.5f;

    public final String label;

    VideoEffect(String label) {
        this.label = label;
    }
}
