package dev.utaa.cutlog.extension.editor;

import java.util.Locale;

/** フレームの描画で使う計算。Android に依らないので単体テストで確かめる。 */
final class FrameMath {
    /** 録画のタイムコードのフレームレート。 */
    static final int TIMECODE_FPS = 30;
    /** REC の点滅の周期。 */
    static final long BLINK_PERIOD_MS = 1000;

    private FrameMath() {}

    /** 0〜1 の決まった乱数。同じ引数なら同じ値になる（プレビューと書き出しで揃える）。 */
    static float hash(int a, int b) {
        int h = a * 374761393 + b * 668265263;
        h = (h ^ (h >>> 13)) * 1274126177;
        h ^= h >>> 16;
        return (h & 0x7fffffff) / (float) 0x7fffffff;
    }

    /** 録画のタイムコード（時:分:秒:フレーム）。 */
    static String timecode(long timeMs) {
        long totalFrames = Math.max(0, timeMs) * TIMECODE_FPS / 1000;
        long frames = totalFrames % TIMECODE_FPS;
        long seconds = totalFrames / TIMECODE_FPS;
        return String.format(Locale.ROOT, "%02d:%02d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60, frames);
    }

    /** REC の赤い点を出すか。周期の前半だけ出す。 */
    static boolean recVisible(long timeMs) {
        return Math.floorMod(timeMs, BLINK_PERIOD_MS) < BLINK_PERIOD_MS / 2;
    }

    /** シネマの黒帯の高さ（片側）。幅 width の 2.39:1 の帯を、高さ height の中央に残す。 */
    static float cinemaBar(float width, float height) {
        float band = width / 2.39f;
        return Math.max(0f, (height - band) / 2f);
    }
}
