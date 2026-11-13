package dev.utaa.cutlog.extension.editor;

/** 焼き込むテキスト 1 件。 */
public final class TextSpec extends Layer {
    public String text;
    public int color;
    public TextFont font = TextFont.GOTHIC;
    /** 文字の周りの暗い縁。Phase 2 からの既定の見た目。 */
    public boolean outline = true;
    /** 右下に落ちる影。 */
    public boolean shadow;
    /** 文字の後ろの角丸の帯。 */
    public boolean background;
    /** 文字の色で光らせる。 */
    public boolean neon;
    /** 色相を時間とともに回す（color は使わない）。 */
    public boolean rainbow;

    public TextSpec(String text, int color, float size, float x, float y) {
        super(size, x, y);
        this.text = text;
        this.color = color;
    }

    @Override
    public String label() {
        return text;
    }

    @Override
    public boolean isAnimated() {
        return rainbow || super.isAnimated();
    }
}
