package dev.utaa.cutlog.extension.render;

/**
 * 書き出しの出力仕様。公式撮影分（Phase 0 で ffprobe）に揃える。
 *
 * <p>撮影した動画は解像度・長さ・音声が既に公式どおりなので、映像コーデックだけを固定する。
 * 端末内から取り込んだ動画（F4）は、すべてをここの値へ揃える。
 */
public final class OutputProfile {
    /** 公式撮影分は HEVC Main。Media3 Transformer の既定は H.264 なので明示する。 */
    public static final String VIDEO_MIME_TYPE = "video/hevc";
    public static final String AUDIO_MIME_TYPE = "audio/mp4a-latm";
    public static final int AUDIO_SAMPLE_RATE = 48_000;
    public static final int AUDIO_CHANNELS = 1;
    public static final float FRAME_RATE = 30f;
    /** 公式の固定長 2.065978 秒。 */
    public static final long CLIP_DURATION_MS = 2_066;
    public static final int LONG_SIDE = 1280;
    public static final int SHORT_SIDE = 720;

    private OutputProfile() {}

    /** 取り込んだ動画から切り出す長さ。撮影画面で選んだ長さに合わせ、公式の 2 秒なら公式の固定長にする。 */
    public static long clipDurationMs(long selectedMs) {
        return selectedMs <= 2_000L ? CLIP_DURATION_MS : selectedMs;
    }

    /** 入力の向きに合わせた出力解像度 {幅, 高さ}。公式も回転メタデータではなく解像度で縦横を表す。 */
    public static int[] sizeFor(int width, int height) {
        return height > width ? new int[] {SHORT_SIDE, LONG_SIDE} : new int[] {LONG_SIDE, SHORT_SIDE};
    }
}
