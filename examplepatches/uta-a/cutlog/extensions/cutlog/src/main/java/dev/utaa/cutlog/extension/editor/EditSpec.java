package dev.utaa.cutlog.extension.editor;

import java.util.ArrayList;
import java.util.List;

/** 編集内容。プレビューと書き出しの両方がこの値だけを見る。 */
public final class EditSpec {
    public FilterPreset filter = FilterPreset.NONE;
    /** 明るさ・コントラスト・彩度。いずれも -1〜1、0 で無調整。 */
    public float brightness;
    public float contrast;
    public float saturation;
    /** 動画全体にかける効果と強さ（0〜1）。入っているものがかかる。 */
    public final java.util.EnumMap<VideoEffect, Float> effects = new java.util.EnumMap<>(VideoEffect.class);
    /** 左右・上下の反転。 */
    public boolean flipX;
    public boolean flipY;
    /** 拡大率（1〜3）と、拡大して余った範囲のどこを見せるか（-1〜1。横は正で右、縦は正で下）。 */
    public float zoom = 1f;
    public float panX;
    public float panY;
    /** 再生の速さ。1 で等速。書き出した動画の長さは元の長さ ÷ speed になる。 */
    public float speed = 1f;
    /** 逆再生。オンの間は、逆再生にした中間ファイルを入力にする。 */
    public boolean reverse;
    /** 動画に重ねるフレーム。 */
    public FrameStyle frame = FrameStyle.NONE;
    /** 書き出し後の動画の長さ。「最後まで」表示する要素の終わりになる。 */
    public long durationMs;
    /** 動画の上に重ねる要素。後ろほど手前に描く。 */
    public final List<Layer> layers = new ArrayList<>();

    public boolean hasColorEdits() {
        return filter != FilterPreset.NONE || brightness != 0f || contrast != 0f || saturation != 0f;
    }

    public boolean isEmpty() {
        return !hasColorEdits() && !hasTransform() && speed == 1f && !reverse && effects.isEmpty() && frame == FrameStyle.NONE && layers.isEmpty();
    }

    public boolean hasTransform() {
        return flipX || flipY || zoom > 1f;
    }
}
