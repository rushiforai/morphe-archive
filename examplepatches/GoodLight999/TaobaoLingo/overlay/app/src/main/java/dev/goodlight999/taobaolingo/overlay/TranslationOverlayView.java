package dev.goodlight999.taobaolingo.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/** Touch-through labels; no control blocks underlying Taobao interactions. */
public final class TranslationOverlayView extends View {
    public static final class Label {
        public final Rect bounds;
        public final String text;
        public Label(Rect box, String text) {
            this.bounds = new Rect(box);
            this.text = text;
        }
    }

    private final Paint backdrop = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint ink = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final List<Label> labels = new ArrayList<>();
    private int sourceWidth = 1;
    private int sourceHeight = 1;

    public TranslationOverlayView(Context context) {
        super(context);
        setWillNotDraw(false);
        backdrop.setColor(Color.rgb(255, 251, 242));
        ink.setColor(Color.rgb(23, 24, 25));
        ink.setTextSize(14 * getResources().getDisplayMetrics().scaledDensity);
    }

    public void update(List<Label> next, int width, int height) {
        labels.clear();
        labels.addAll(next);
        sourceWidth = Math.max(1, width);
        sourceHeight = Math.max(1, height);
        invalidate();
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float sx = getWidth() / (float) sourceWidth;
        float sy = getHeight() / (float) sourceHeight;
        float dp = getResources().getDisplayMetrics().density;
        for (Label label : labels) {
            Rect b = label.bounds;
            float left = Math.max(0, b.left * sx);
            float top = Math.max(0, b.top * sy);
            float width = Math.max(105 * dp, b.width() * sx + 8 * dp);
            width = Math.min(width, getWidth() - left);
            if (width < 25 * dp) continue;
            int textWidth = Math.max(12, (int) (width - 12 * dp));
            StaticLayout layout = StaticLayout.Builder
                    .obtain(label.text, 0, label.text.length(), ink, textWidth)
                    .setAlignment(Layout.Alignment.ALIGN_NORMAL)
                    .setIncludePad(false)
                    .setMaxLines(3)
                    .setEllipsize(TextUtils.TruncateAt.END)
                    .build();
            float height = Math.max(22 * dp, layout.getHeight() + 9 * dp);
            if (top + height > getHeight()) top = Math.max(0, getHeight() - height);
            canvas.drawRoundRect(new RectF(left, top, left + width, top + height),
                    3 * dp, 3 * dp, backdrop);
            canvas.save();
            canvas.translate(left + 6 * dp, top + 4 * dp);
            layout.draw(canvas);
            canvas.restore();
        }
    }
}
