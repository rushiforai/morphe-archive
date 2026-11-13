package dev.utaa.cutlog.extension.editor;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;

/**
 * フレームの描画。プレビューと書き出しで同じコードを使う。大きさは動画の短辺 s を基準にし、
 * 縦長・横長のどちらでも同じ見た目の比率になるようにする。
 */
public final class FramePainter {
    /** 集中線の本数と、揺らぎを変える間隔。 */
    private static final int SPEED_LINE_COUNT = 72;
    private static final long SPEED_LINE_TICK_MS = 80;

    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final RectF rect = new RectF();

    public FramePainter() {
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeCap(Paint.Cap.SQUARE);
        text.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
        text.setColor(Color.WHITE);
    }

    public void draw(Canvas canvas, int width, int height, FrameStyle style, long timeMs) {
        float s = Math.min(width, height);
        switch (style) {
            case SPEED_LINES:
                speedLines(canvas, width, height, s, timeMs);
                break;
            case BORDER:
                border(canvas, width, height, s);
                break;
            case FILM:
                film(canvas, width, height, s);
                break;
            case CAMCORDER:
                camcorder(canvas, width, height, s, timeMs);
                break;
            case CINEMA:
                cinema(canvas, width, height);
                break;
            case NONE:
            default:
                break;
        }
    }

    /** 中心の空いた円の外から、画面の外まで伸びる細い三角形を並べる。 */
    private void speedLines(Canvas canvas, int width, int height, float s, long timeMs) {
        int tick = (int) (Math.max(0, timeMs) / SPEED_LINE_TICK_MS);
        float cx = width / 2f;
        float cy = height / 2f;
        float outer = (float) Math.hypot(width, height);
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(Color.argb(225, 0, 0, 0));
        for (int i = 0; i < SPEED_LINE_COUNT; i++) {
            float jitter = (FrameMath.hash(i, tick) - 0.5f) * 0.6f;
            double angle = (i + jitter) * 2 * Math.PI / SPEED_LINE_COUNT;
            float inner = s * (0.32f + 0.16f * FrameMath.hash(i + 1000, tick));
            float half = s * 0.010f * (0.4f + FrameMath.hash(i + 2000, tick));
            double cos = Math.cos(angle);
            double sin = Math.sin(angle);
            path.reset();
            path.moveTo(cx + (float) (cos * inner), cy + (float) (sin * inner));
            path.lineTo(cx + (float) (cos * outer - sin * half), cy + (float) (sin * outer + cos * half));
            path.lineTo(cx + (float) (cos * outer + sin * half), cy + (float) (sin * outer - cos * half));
            path.close();
            canvas.drawPath(path, fill);
        }
    }

    /** 外側を塗り、内側を角丸にくり抜いた白い枠。 */
    private void border(Canvas canvas, int width, int height, float s) {
        float thickness = s * 0.04f;
        path.reset();
        path.setFillType(Path.FillType.EVEN_ODD);
        path.addRect(0, 0, width, height, Path.Direction.CW);
        rect.set(thickness, thickness, width - thickness, height - thickness);
        path.addRoundRect(rect, s * 0.05f, s * 0.05f, Path.Direction.CW);
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(Color.WHITE);
        canvas.drawPath(path, fill);
        path.setFillType(Path.FillType.WINDING);
    }

    /** 長い辺に沿った黒い帯と、等間隔の送り穴。 */
    private void film(Canvas canvas, int width, int height, float s) {
        boolean landscape = width >= height;
        float band = s * 0.10f;
        float long_ = landscape ? width : height;
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(Color.rgb(16, 16, 16));
        if (landscape) {
            canvas.drawRect(0, 0, width, band, fill);
            canvas.drawRect(0, height - band, width, height, fill);
        } else {
            canvas.drawRect(0, 0, band, height, fill);
            canvas.drawRect(width - band, 0, width, height, fill);
        }
        float holeLong = s * 0.045f;
        float holeShort = s * 0.035f;
        float pitch = s * 0.08f;
        int count = (int) (long_ / pitch) + 1;
        float offset = (long_ - (count - 1) * pitch) / 2f;
        fill.setColor(Color.rgb(210, 205, 195));
        float radius = s * 0.008f;
        for (int i = 0; i < count; i++) {
            float along = offset + i * pitch;
            for (int side = 0; side < 2; side++) {
                float across = side == 0 ? band / 2f : (landscape ? height : width) - band / 2f;
                if (landscape) {
                    rect.set(along - holeLong / 2f, across - holeShort / 2f, along + holeLong / 2f, across + holeShort / 2f);
                } else {
                    rect.set(across - holeShort / 2f, along - holeLong / 2f, across + holeShort / 2f, along + holeLong / 2f);
                }
                canvas.drawRoundRect(rect, radius, radius, fill);
            }
        }
    }

    /** 四隅のカギ括弧、左上の REC、右上の電池、右下のタイムコード。 */
    private void camcorder(Canvas canvas, int width, int height, float s, long timeMs) {
        float inset = s * 0.06f;
        float arm = s * 0.09f;
        stroke.setColor(Color.WHITE);
        stroke.setStrokeWidth(s * 0.008f);
        float[][] corners = {{inset, inset, 1, 1}, {width - inset, inset, -1, 1},
            {inset, height - inset, 1, -1}, {width - inset, height - inset, -1, -1}};
        for (float[] c : corners) {
            canvas.drawLine(c[0], c[1], c[0] + arm * c[2], c[1], stroke);
            canvas.drawLine(c[0], c[1], c[0], c[1] + arm * c[3], stroke);
        }

        float textSize = s * 0.055f;
        text.setTextSize(textSize);
        text.setTextAlign(Paint.Align.LEFT);
        float pad = inset + s * 0.035f;
        float baseline = pad + textSize;
        if (FrameMath.recVisible(timeMs)) {
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(Color.rgb(255, 59, 48));
            canvas.drawCircle(pad + textSize * 0.35f, baseline - textSize * 0.36f, textSize * 0.32f, fill);
        }
        canvas.drawText("REC", pad + textSize * 0.9f, baseline, text);

        // 電池: 枠と 3 本の目盛り。
        float batteryWidth = textSize * 1.6f;
        float batteryHeight = textSize * 0.8f;
        float right = width - pad;
        float top = baseline - textSize * 0.76f;
        rect.set(right - batteryWidth, top, right - textSize * 0.15f, top + batteryHeight);
        stroke.setStrokeWidth(s * 0.005f);
        canvas.drawRect(rect, stroke);
        fill.setColor(Color.WHITE);
        canvas.drawRect(right - textSize * 0.15f, top + batteryHeight * 0.3f, right, top + batteryHeight * 0.7f, fill);
        float cell = (rect.width() - textSize * 0.25f) / 3f;
        for (int i = 0; i < 3; i++) {
            float left = rect.left + textSize * 0.1f + i * (cell + textSize * 0.025f);
            canvas.drawRect(left, rect.top + textSize * 0.1f, left + cell - textSize * 0.05f, rect.bottom - textSize * 0.1f, fill);
        }

        text.setTextAlign(Paint.Align.RIGHT);
        canvas.drawText(FrameMath.timecode(timeMs), width - pad, height - pad, text);
    }

    private void cinema(Canvas canvas, int width, int height) {
        float bar = FrameMath.cinemaBar(width, height);
        if (bar <= 0f) {
            return;
        }
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(Color.BLACK);
        canvas.drawRect(0, 0, width, bar, fill);
        canvas.drawRect(0, height - bar, width, height, fill);
    }
}
