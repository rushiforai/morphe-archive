package dev.utaa.cutlog.extension.render;

/** 逆再生の中間ファイルを作るときの計算。Android に依らないので単体テストで確かめる。 */
final class ReverseMath {
    private ReverseMath() {}

    /** 16bit PCM を、チャンネルの並びを保ったままサンプル単位で逆順にする。 */
    static byte[] reversePcm16(byte[] pcm, int channels) {
        int frameBytes = 2 * channels;
        int frames = pcm.length / frameBytes;
        byte[] reversed = new byte[frames * frameBytes];
        for (int i = 0; i < frames; i++) {
            System.arraycopy(pcm, i * frameBytes, reversed, (frames - 1 - i) * frameBytes, frameBytes);
        }
        return reversed;
    }

    /** 長い辺を maxSide 以下にし、エンコーダーのために幅・高さを偶数にした大きさ。 */
    static int[] encodeSize(int width, int height, int maxSide) {
        float scale = Math.min(1f, maxSide / (float) Math.max(width, height));
        int w = Math.max(2, Math.round(width * scale) & ~1);
        int h = Math.max(2, Math.round(height * scale) & ~1);
        return new int[] {w, h};
    }
}
