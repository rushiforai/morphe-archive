package app.onlynazril.extension.tiktok.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;

/**
 * The magnifier in the app bar.
 *
 * Drawn like the arrow and the chevron, with round ends and no font, so an imported face cannot
 * change its shape.
 */
public final class SearchIconView extends View {
    private static final float SIZE_DP = 20f;
    private static final float STROKE_DP = 2f;

    /** Logical 24x24 grid: a circle and a handle. */
    private static final float VIEWPORT = 24f;
    private static final float CENTER_X = 10.5f;
    private static final float CENTER_Y = 10.5f;
    private static final float RADIUS = 6.4f;
    private static final float HANDLE_X = 15.4f;
    private static final float HANDLE_Y = 15.4f;
    private static final float HANDLE_END_X = 19.6f;
    private static final float HANDLE_END_Y = 19.6f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    public SearchIconView(Context context) {
        super(context);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
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
    protected void onDraw(Canvas canvas) {
        paint.setColor(isEnabled() ? Tokens.TEXT_PRIMARY : Tokens.TEXT_DISABLED);
        paint.setStrokeWidth(Tokens.dpFloat(getContext(), STROKE_DP));
        float scale = Math.min(getWidth(), getHeight()) / VIEWPORT;
        canvas.drawCircle(CENTER_X * scale, CENTER_Y * scale, RADIUS * scale, paint);
        canvas.drawLine(
                HANDLE_X * scale,
                HANDLE_Y * scale,
                HANDLE_END_X * scale,
                HANDLE_END_Y * scale,
                paint);
    }
}
