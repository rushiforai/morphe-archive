package dev.utaa.cutlog.extension.editor;

import android.graphics.Bitmap;

/**
 * スタンプ 1 件。絵文字か、端末から選んだ画像のどちらか。画像は縮小した Bitmap をメモリにだけ持ち、
 * ファイルには残さない。大きさ（{@link #size}）は高さで、画像の幅は縦横比から決める。
 */
public final class StickerSpec extends Layer {
    public final String emoji;
    public final Bitmap image;

    private StickerSpec(String emoji, Bitmap image, float size) {
        super(size, 0.5f, 0.5f);
        this.emoji = emoji;
        this.image = image;
    }

    public static StickerSpec emoji(String emoji, float size) {
        return new StickerSpec(emoji, null, size);
    }

    public static StickerSpec image(Bitmap image, float size) {
        return new StickerSpec(null, image, size);
    }

    /** 幅 ÷ 高さ。絵文字は 1。 */
    public float aspect() {
        return image != null ? image.getWidth() / (float) image.getHeight() : 1f;
    }

    @Override
    public String label() {
        return emoji != null ? emoji : "画像";
    }
}
