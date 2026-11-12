package dev.utaa.linimal.extension.features.readers;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;

/** 丸いアバターを描きます。画像がなければ、名前の頭文字を色付きの丸に描きます。 */
final class AvatarPainter {
    private static final int[] PLACEHOLDER_COLORS = {
            0xFF8AA4C8, 0xFF9CC79A, 0xFFD9A47E, 0xFFB79CD0, 0xFF7FBFC4, 0xFFD39AA8,
    };

    private final Paint imagePaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint ringPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Matrix matrix = new Matrix();
    private final Rect textBounds = new Rect();

    AvatarPainter() {
        ringPaint.setStyle(Paint.Style.STROKE);
        textPaint.setColor(0xFFFFFFFF);
        textPaint.setTextAlign(Paint.Align.CENTER);
        textPaint.setFakeBoldText(true);
    }

    /**
     * 中心 (cx, cy)・半径 radius の丸を描きます。ringWidth が 0 より大きければ、外周に ringColor の縁を描き、
     * 重ねたアバターの境目を分かるようにします。
     */
    void draw(Canvas canvas, float cx, float cy, float radius, Bitmap bitmap, String name, String seed,
            float ringWidth, int ringColor) {
        if (bitmap != null && !bitmap.isRecycled()) {
            BitmapShader shader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            float scale = (radius * 2f) / Math.min(bitmap.getWidth(), bitmap.getHeight());
            matrix.reset();
            matrix.setScale(scale, scale);
            matrix.postTranslate(cx - bitmap.getWidth() * scale / 2f, cy - bitmap.getHeight() * scale / 2f);
            shader.setLocalMatrix(matrix);
            imagePaint.setShader(shader);
            canvas.drawCircle(cx, cy, radius, imagePaint);
        } else {
            fillPaint.setColor(placeholderColor(seed));
            canvas.drawCircle(cx, cy, radius, fillPaint);
            String initial = initial(name);
            if (!initial.isEmpty() && radius >= 6f) {
                textPaint.setTextSize(radius * 1.05f);
                textPaint.getTextBounds(initial, 0, initial.length(), textBounds);
                canvas.drawText(initial, cx, cy - textBounds.exactCenterY(), textPaint);
            }
        }
        if (ringWidth > 0f) {
            ringPaint.setStrokeWidth(ringWidth);
            ringPaint.setColor(ringColor);
            canvas.drawCircle(cx, cy, radius + ringWidth / 2f, ringPaint);
        }
    }

    static String initial(String name) {
        if (name == null) {
            return "";
        }
        String trimmed = name.trim();
        if (trimmed.isEmpty()) {
            return "";
        }
        int end = trimmed.offsetByCodePoints(0, 1);
        return trimmed.substring(0, end).toUpperCase(java.util.Locale.ROOT);
    }

    static int placeholderColor(String seed) {
        int hash = seed == null ? 0 : seed.hashCode();
        return PLACEHOLDER_COLORS[Math.floorMod(hash, PLACEHOLDER_COLORS.length)];
    }
}
