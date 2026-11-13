package dev.utaa.cutlog.extension.editor;

/**
 * 動画の上に重ねる要素（文字・スタンプ）の共通部分。位置とサイズは動画の大きさに対する比率で持ち、
 * 表示区間は書き出し後の動画の時間で持つ。
 */
public abstract class Layer {
    /** 終わりを指定しない（動画の最後まで表示する）ことを表す {@link #endMs}。 */
    public static final long UNTIL_END = Long.MAX_VALUE;

    /** 中心の位置。左上が (0, 0)、右下が (1, 1)。 */
    public float x;
    public float y;
    /** 高さ。動画の短辺に対する比率。 */
    public float size;
    /** 時計回りの角度（度）。 */
    public float rotation;
    /** 表示区間。 */
    public long startMs;
    public long endMs = UNTIL_END;
    public LayerAnimation animationIn = LayerAnimation.NONE;
    public LayerAnimation animationOut = LayerAnimation.NONE;

    protected Layer(float size, float x, float y) {
        this.size = size;
        this.x = x;
        this.y = y;
    }

    /** タイムラインに出す短い名前。 */
    public abstract String label();

    /** 見た目が時刻で変わるか。変わるなら、プレビューも書き出しも毎フレーム描き直す。 */
    public boolean isAnimated() {
        return startMs > 0 || endMs != UNTIL_END
                || animationIn != LayerAnimation.NONE || animationOut != LayerAnimation.NONE;
    }

    /** 長さ {@code durationMs} の動画での表示の終わり。 */
    public long endMs(long durationMs) {
        return Math.min(endMs, durationMs);
    }
}
