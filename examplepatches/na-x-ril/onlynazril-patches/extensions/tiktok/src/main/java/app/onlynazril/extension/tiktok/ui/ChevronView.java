package app.onlynazril.extension.tiktok.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

/**
 * Right chevron for a row that opens a page.
 * <p>
 * Drawn with round ends so it keeps its shape whatever font is imported.
 */
public final class ChevronView extends View {
    private static final float SIZE_DP = 20f;
    private static final float STROKE_DP = 2f;

    /** Logical 24x24 grid: the same coordinates an ic_chevron.xml would carry. */
    private static final float VIEWPORT = 24f;
    private static final float START_X = 8.5f;
    private static final float POINT_X = 15.5f;
    private static final float TOP_Y = 5f;
    private static final float MIDDLE_Y = 12f;
    private static final float BOTTOM_Y = 19f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();

    public ChevronView(Context context) {
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
        path.moveTo(START_X * scale, TOP_Y * scale);
        path.lineTo(POINT_X * scale, MIDDLE_Y * scale);
        path.lineTo(START_X * scale, BOTTOM_Y * scale);
        paint.setStrokeWidth(Tokens.dpFloat(getContext(), STROKE_DP));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        paint.setColor(isEnabled() ? Tokens.TEXT_SECONDARY : Tokens.TEXT_DISABLED);
        canvas.drawPath(path, paint);
    }
}
