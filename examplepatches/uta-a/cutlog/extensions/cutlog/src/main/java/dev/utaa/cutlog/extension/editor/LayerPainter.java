package dev.utaa.cutlog.extension.editor;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import java.util.List;

/**
 * 文字・スタンプの描画。プレビューと書き出しで同じコードを使い、見た目を揃える。時刻で変わる見た目
 * （RGB など）は、書き出し後の動画の時刻 {@code timeMs} から決める。
 */
public final class LayerPainter {
    /** RGB の色相が 1 周する時間。 */
    static final long RAINBOW_PERIOD_MS = 2000;

    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint box = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final float[] hsv = {0f, 0.85f, 1f};

    private final LayerAnimator.State state = new LayerAnimator.State();
    /** 絵文字の文字サイズ ÷ スタンプの高さ。 */
    private static final float EMOJI_SCALE = 0.85f;
    private final Paint emojiPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint imagePaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);

    public LayerPainter() {
        emojiPaint.setTextAlign(Paint.Align.CENTER);
        emojiPaint.setColor(Color.BLACK);
        // タイプで 1 文字ずつ出しても位置がずれないよう、全文の幅から左端を決めて左揃えで描く。
        fill.setTextAlign(Paint.Align.LEFT);
        stroke.setTextAlign(Paint.Align.LEFT);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setColor(Color.argb(170, 0, 0, 0));
    }

    /** 長さ durationMs の動画の時刻 timeMs での見た目で描く。 */
    public void draw(Canvas canvas, int width, int height, List<Layer> layers, long timeMs, long durationMs) {
        for (Layer layer : layers) {
            draw(canvas, width, height, layer, timeMs, durationMs);
        }
    }

    public void draw(Canvas canvas, int width, int height, Layer layer, long timeMs, long durationMs) {
        LayerAnimator.stateAt(layer, timeMs, durationMs, state);
        if (!state.visible || state.alpha <= 0f || state.scale <= 0f || state.reveal <= 0f) {
            return;
        }
        float cx = layer.x * width;
        float cy = layer.y * height;
        int saved = canvas.save();
        canvas.translate(0f, state.offsetY * height);
        canvas.rotate(layer.rotation, cx, cy);
        canvas.scale(state.scale, state.scale, cx, cy);
        if (state.alpha < 1f) {
            // 縁取り・影・光をまとめて薄くするため、1 枚の層に描いてから透明度をかける。
            canvas.saveLayerAlpha(0f, 0f, width, height, Math.round(state.alpha * 255f));
        }
        if (layer instanceof TextSpec) {
            drawText(canvas, width, height, (TextSpec) layer, timeMs, state.reveal);
        } else if (layer instanceof StickerSpec) {
            drawSticker(canvas, width, height, (StickerSpec) layer);
        }
        canvas.restoreToCount(saved);
    }

    private void drawSticker(Canvas canvas, int width, int height, StickerSpec sticker) {
        float size = sticker.size * Math.min(width, height);
        float cx = sticker.x * width;
        float cy = sticker.y * height;
        if (sticker.image != null) {
            float halfWidth = size * sticker.aspect() / 2f;
            rect.set(cx - halfWidth, cy - size / 2f, cx + halfWidth, cy + size / 2f);
            canvas.drawBitmap(sticker.image, null, rect, imagePaint);
            return;
        }
        // 絵文字は字形の高さが文字サイズより小さいため、少し大きめの文字サイズで描いて高さを合わせる。
        emojiPaint.setTextSize(size * EMOJI_SCALE);
        float baseline = cy - (emojiPaint.ascent() + emojiPaint.descent()) / 2f;
        canvas.drawText(sticker.emoji, cx, baseline, emojiPaint);
    }

    /** 時刻 timeMs での文字の色。 */
    int colorAt(TextSpec text, long timeMs) {
        if (!text.rainbow) {
            return text.color;
        }
        long phase = Math.floorMod(timeMs, RAINBOW_PERIOD_MS);
        hsv[0] = 360f * phase / RAINBOW_PERIOD_MS;
        return Color.HSVToColor(hsv);
    }

    private void drawText(Canvas canvas, int width, int height, TextSpec text, long timeMs, float reveal) {
        float size = text.size * Math.min(width, height);
        int color = colorAt(text, timeMs);
        fill.setTypeface(text.font.typeface());
        fill.setTextSize(size);
        float left = text.x * width - fill.measureText(text.text) / 2f;
        float baseline = text.y * height - (fill.ascent() + fill.descent()) / 2f;
        String shown = text.text.substring(0,
                text.text.offsetByCodePoints(0, LayerAnimator.revealedLength(text.text, reveal)));

        if (text.background) {
            textBox(width, height, text, rect);
            box.setColor(luminance(color) < 0.35f ? Color.argb(220, 255, 255, 255) : Color.argb(150, 0, 0, 0));
            canvas.drawRoundRect(rect, size * 0.3f, size * 0.3f, box);
        }
        if (text.outline) {
            stroke.setTypeface(text.font.typeface());
            stroke.setTextSize(size);
            stroke.setStrokeWidth(size * 0.12f);
            canvas.drawText(shown, left, baseline, stroke);
        }
        if (text.neon) {
            // 文字の色の光を 2 回重ねて濃くし、芯は白に寄せる。
            fill.setColor(color);
            fill.setShadowLayer(size * 0.35f, 0f, 0f, color);
            canvas.drawText(shown, left, baseline, fill);
            fill.setShadowLayer(size * 0.15f, 0f, 0f, color);
            canvas.drawText(shown, left, baseline, fill);
            fill.setColor(blend(color, Color.WHITE, 0.6f));
            fill.clearShadowLayer();
            canvas.drawText(shown, left, baseline, fill);
            return;
        }
        if (text.shadow) {
            fill.setShadowLayer(size * 0.08f, size * 0.06f, size * 0.06f, Color.argb(160, 0, 0, 0));
        } else {
            fill.clearShadowLayer();
        }
        fill.setColor(color);
        canvas.drawText(shown, left, baseline, fill);
        fill.clearShadowLayer();
    }

    /** 背景帯の矩形（回転前）。 */
    private void textBox(int width, int height, TextSpec text, RectF out) {
        float size = text.size * Math.min(width, height);
        float halfWidth = fill.measureText(text.text) / 2f + size * 0.3f;
        float cx = text.x * width;
        float cy = text.y * height;
        out.set(cx - halfWidth, cy - size * 0.7f, cx + halfWidth, cy + size * 0.7f);
    }

    /** 回転前の外接矩形。タップ判定と選択枠に使う。 */
    public RectF bounds(int width, int height, Layer layer) {
        float size = layer.size * Math.min(width, height);
        float halfWidth = size / 2f;
        if (layer instanceof TextSpec) {
            TextSpec text = (TextSpec) layer;
            fill.setTypeface(text.font.typeface());
            fill.setTextSize(size);
            halfWidth = fill.measureText(text.text) / 2f + (text.background ? size * 0.3f : 0f);
        } else if (layer instanceof StickerSpec) {
            float cx = layer.x * width;
            float cy = layer.y * height;
            halfWidth = size * ((StickerSpec) layer).aspect() / 2f;
            return new RectF(cx - halfWidth, cy - size / 2f, cx + halfWidth, cy + size / 2f);
        }
        float cx = layer.x * width;
        float cy = layer.y * height;
        return new RectF(cx - halfWidth, cy - size * 0.7f, cx + halfWidth, cy + size * 0.7f);
    }

    private static float luminance(int color) {
        return (0.299f * Color.red(color) + 0.587f * Color.green(color) + 0.114f * Color.blue(color)) / 255f;
    }

    private static int blend(int from, int to, float ratio) {
        return Color.rgb(
                Math.round(Color.red(from) + (Color.red(to) - Color.red(from)) * ratio),
                Math.round(Color.green(from) + (Color.green(to) - Color.green(from)) * ratio),
                Math.round(Color.blue(from) + (Color.blue(to) - Color.blue(from)) * ratio));
    }
}
