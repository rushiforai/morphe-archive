package dev.utaa.cutlog.extension.editor;

/** 動画に重ねるフレーム。効果の上、文字・スタンプの下に描く。 */
public enum FrameStyle {
    NONE("なし", false),
    /** 中心に向かう集中線。少しずつ揺らぐ。 */
    SPEED_LINES("集中線", true),
    /** 白い角丸の枠。 */
    BORDER("枠", false),
    /** 長い辺に沿った黒い帯と送り穴。 */
    FILM("フィルム", false),
    /** 四隅のカギ括弧、点滅する REC、タイムコード、電池。 */
    CAMCORDER("録画", true),
    /** 2.39:1 の黒帯。 */
    CINEMA("シネマ", false);

    public final String label;
    /** 時刻で見た目が変わるか。 */
    public final boolean animated;

    FrameStyle(String label, boolean animated) {
        this.label = label;
        this.animated = animated;
    }
}
