package dev.utaa.cutlog.extension.editor;

/** 速度の選択肢と、速度を変えたときの長さの計算。Android に依らないので単体テストで確かめる。 */
final class Speed {
    static final float[] CHOICES = {0.5f, 0.75f, 1f, 1.5f, 2f};
    /** 書き出した動画の長さの範囲。撮影秒数の選択（最大 15 秒）と揃える。 */
    static final long MIN_OUTPUT_MS = 1000;
    static final long MAX_OUTPUT_MS = 15_000;

    private Speed() {}

    /** 元の長さ baseMs の動画を speed 倍で再生したときの長さ。 */
    static long outputMs(long baseMs, float speed) {
        return Math.round(baseMs / speed);
    }

    /** 書き出した長さが範囲に収まるか。元から範囲外の長さ（等速）は、そのまま選べる。 */
    static boolean allowed(long baseMs, float speed) {
        if (speed == 1f) {
            return true;
        }
        long output = outputMs(baseMs, speed);
        return output >= MIN_OUTPUT_MS && output <= MAX_OUTPUT_MS;
    }

    /** 表示区間の時刻を、速度を from から to に変えたときの時刻に直す（同じ場面に合わせる）。 */
    static long rescale(long timeMs, float from, float to) {
        if (timeMs == Layer.UNTIL_END) {
            return Layer.UNTIL_END;
        }
        return Math.round(timeMs * (double) from / to);
    }

    static String label(float speed) {
        return speed == (int) speed ? (int) speed + "x" : speed + "x";
    }
}
