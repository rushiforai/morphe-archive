package dev.utaa.cutlog.extension.render;

/** 時刻で変わる効果の計算。Android に依らないので単体テストで確かめる。 */
final class EffectMath {
    /** RGB の色相が 1 周する時間。文字の RGB と揃える。 */
    static final long RAINBOW_PERIOD_US = 2_000_000;

    private EffectMath() {}

    /**
     * 輝度を保ったまま色相を degrees 回す 4x4 の色行列（OpenGL と同じ列優先）を、無変換と intensity で
     * 混ぜたもの。intensity 0 で無変換、1 で完全に回す。
     */
    static float[] hueRotation(float degrees, float intensity) {
        double radians = Math.toRadians(degrees);
        float cos = (float) Math.cos(radians);
        float sin = (float) Math.sin(radians);
        // 行優先で、出力 = m * (r, g, b)。係数は輝度（0.213, 0.715, 0.072）を保つ一般的な色相回転。
        float[][] m = {
            {0.213f + cos * 0.787f - sin * 0.213f, 0.715f - cos * 0.715f - sin * 0.715f, 0.072f - cos * 0.072f + sin * 0.928f},
            {0.213f - cos * 0.213f + sin * 0.143f, 0.715f + cos * 0.285f + sin * 0.140f, 0.072f - cos * 0.072f - sin * 0.283f},
            {0.213f - cos * 0.213f - sin * 0.787f, 0.715f - cos * 0.715f + sin * 0.715f, 0.072f + cos * 0.928f + sin * 0.072f},
        };
        float[] matrix = new float[16];
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                float identity = row == col ? 1f : 0f;
                // 列優先: matrix[col * 4 + row]。
                matrix[col * 4 + row] = identity + (m[row][col] - identity) * intensity;
            }
        }
        matrix[15] = 1f;
        return matrix;
    }

    /**
     * 反転・ズームの変換。{scaleX, scaleY, translateX, translateY}（正規化座標。y は上が正）。
     * panX・panY は -1〜1 で、拡大して余った範囲のどこを見せるか（panX 正で右側、panY 正で下側）。
     * 移動は拡大した分（zoom - 1）までに抑え、動画の外が見えないようにする。
     */
    static float[] transform(boolean flipX, boolean flipY, float zoom, float panX, float panY) {
        float z = Math.max(1f, zoom);
        float room = z - 1f;
        float px = Math.max(-1f, Math.min(1f, panX));
        float py = Math.max(-1f, Math.min(1f, panY));
        return new float[] {(flipX ? -z : z), (flipY ? -z : z), -px * room, py * room};
    }

    /** 時刻 timeUs での RGB の色相（度）。 */
    static float rainbowDegrees(long timeUs) {
        return 360f * Math.floorMod(timeUs, RAINBOW_PERIOD_US) / RAINBOW_PERIOD_US;
    }

    /**
     * 時刻 timeUs での揺れ。{dx, dy, 角度（度）, 拡大率}。dx・dy は正規化座標（-1〜1 の幅 2）での移動量。
     * 周期の違う sin を重ねて不規則に見せ、動いても画面の端が見えないよう、移動量の分だけ拡大する。
     */
    static float[] shake(long timeUs, float intensity) {
        double t = timeUs / 1_000_000.0;
        float amplitude = 0.04f * intensity;
        float dx = (float) (Math.sin(t * 23.0) * 0.6 + Math.sin(t * 37.0 + 1.3) * 0.4) * amplitude;
        float dy = (float) (Math.sin(t * 29.0 + 0.7) * 0.6 + Math.sin(t * 41.0 + 2.1) * 0.4) * amplitude;
        float degrees = (float) (Math.sin(t * 19.0 + 0.4) * 1.5 * intensity);
        float scale = 1f + amplitude * 1.5f + Math.abs(degrees) * 0.01f;
        return new float[] {dx, dy, degrees, scale};
    }
}
