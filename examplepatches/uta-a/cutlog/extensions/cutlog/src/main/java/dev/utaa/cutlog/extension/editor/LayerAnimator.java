package dev.utaa.cutlog.extension.editor;

/**
 * 文字・スタンプの「ある時刻での見た目」を求める。プレビューと書き出しの両方がこれを使う。
 * Android の API に依らない計算だけにして、単体テストで確かめる。
 */
public final class LayerAnimator {
    /** 入り・出のアニメーションの長さ。表示区間が短いときは区間の 3 分の 1 まで縮める。 */
    static final long ANIMATION_MS = 500;
    /** スライドで動く距離（動画の高さに対する比率）。 */
    static final float SLIDE_DISTANCE = 0.08f;

    /** ある時刻での見た目。 */
    public static final class State {
        public boolean visible;
        /** 0〜1。 */
        public float alpha = 1f;
        /** 縦にずらす量（動画の高さに対する比率、下が正）。 */
        public float offsetY;
        public float scale = 1f;
        /** タイプで出す文字の割合（0〜1）。 */
        public float reveal = 1f;

        void reset() {
            visible = true;
            alpha = 1f;
            offsetY = 0f;
            scale = 1f;
            reveal = 1f;
        }
    }

    private LayerAnimator() {}

    /** 長さ durationMs の動画の時刻 timeMs での、layer の見た目を out に入れる。 */
    public static void stateAt(Layer layer, long timeMs, long durationMs, State out) {
        out.reset();
        long start = layer.startMs;
        long end = layer.endMs(durationMs);
        // 最後のフレームは動画の長さちょうどの手前で終わるため、最後まで表示する要素は end を含める。
        boolean untilEnd = end >= durationMs;
        if (timeMs < start || timeMs > end || (timeMs == end && !untilEnd)) {
            out.visible = false;
            return;
        }
        long length = Math.max(1, end - start);
        long animation = Math.min(ANIMATION_MS, length / 3);
        if (animation <= 0) {
            return;
        }
        long sinceStart = timeMs - start;
        long untilEndMs = end - timeMs;
        if (layer.animationIn != LayerAnimation.NONE && sinceStart < animation) {
            apply(layer.animationIn, (float) sinceStart / animation, true, layer, out);
        } else if (layer.animationOut != LayerAnimation.NONE && untilEndMs < animation) {
            apply(layer.animationOut, (float) untilEndMs / animation, false, layer, out);
        }
    }

    /**
     * progress は「完全に表示された状態」までの進み具合（入りは 0 → 1、出は 1 → 0）。
     */
    private static void apply(LayerAnimation animation, float progress, boolean entering, Layer layer, State out) {
        float eased = easeOut(progress);
        switch (animation) {
            case FADE:
                out.alpha = eased;
                break;
            case SLIDE:
                out.alpha = eased;
                // 入りは下から、出は上へ。
                out.offsetY = (entering ? 1f : -1f) * SLIDE_DISTANCE * (1f - eased);
                break;
            case POP:
                out.scale = entering ? overshoot(progress) : eased;
                out.alpha = Math.min(1f, progress * 2f);
                break;
            case TYPE:
                if (layer instanceof TextSpec) {
                    out.reveal = progress;
                } else {
                    out.alpha = eased;
                }
                break;
            default:
                break;
        }
    }

    private static float easeOut(float t) {
        float clamped = Math.max(0f, Math.min(1f, t));
        float inverse = 1f - clamped;
        return 1f - inverse * inverse * inverse;
    }

    /** 1 を少し越えてから 1 に戻る。 */
    private static float overshoot(float t) {
        float clamped = Math.max(0f, Math.min(1f, t));
        float s = 1.70158f;
        float x = clamped - 1f;
        return x * x * ((s + 1f) * x + s) + 1f;
    }

    /** タイプで出す文字数。reveal が 0 より大きければ最低 1 文字。 */
    public static int revealedLength(String text, float reveal) {
        int length = text.codePointCount(0, text.length());
        if (reveal >= 1f) {
            return length;
        }
        if (reveal <= 0f) {
            return 0;
        }
        return Math.max(1, (int) Math.ceil(length * reveal));
    }
}
