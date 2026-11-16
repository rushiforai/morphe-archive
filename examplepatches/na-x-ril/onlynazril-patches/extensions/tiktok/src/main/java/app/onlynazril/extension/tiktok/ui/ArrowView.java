package app.onlynazril.extension.tiktok.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

/**
 * Left arrow for the top bar: a shaft and a 45-degree head with round ends.
 * <p>
 * Drawn here so its shape never depends on the imported font.
 */
public final class ArrowView extends View {
    private static final float SIZE_DP = 24f;
    private static final float STROKE_DP = 2f;

    /** Logical 24x24 grid: shaft on the middle line, 45-degree head. */
    private static final float VIEWPORT = 24f;
    private static final float TIP_X = 4.5f;
    private static final float WING_X = 11f;
    private static final float TAIL_X = 20f;
    private static final float TOP_Y = 5.5f;
    private static final float MIDDLE_Y = 12f;
    private static final float BOTTOM_Y = 18.5f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();

    public ArrowView(Context context) {
        super(context);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int size = Tokens.dp(getContext(), SIZE_DP);
        setMeasuredDimension(
                resolveSize(size, widthMeasureSpec),
                resolveSize(size, heightMeasureSpec));
    }

    @Override
    protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        super.onSizeChanged(width, height, oldWidth, oldHeight);
        float scale = Math.min(width, height) / VIEWPORT;
        path.reset();
        path.moveTo(TAIL_X * scale, MIDDLE_Y * scale);
        path.lineTo(TIP_X * scale, MIDDLE_Y * scale);
        path.moveTo(WING_X * scale, TOP_Y * scale);
        path.lineTo(TIP_X * scale, MIDDLE_Y * scale);
        path.lineTo(WING_X * scale, BOTTOM_Y * scale);
        paint.setStrokeWidth(Tokens.dpFloat(getContext(), STROKE_DP));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        paint.setColor(isEnabled() ? Tokens.ACCENT : Tokens.TEXT_DISABLED);
        canvas.drawPath(path, paint);
    }
}
