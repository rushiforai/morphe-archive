package app.onlynazril.extension.tiktok.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

/** The selected-option mark, drawn with round ends like the row chevron and the back arrow. */
public final class CheckView extends View {
    /** Kept public so the dialog can size the mark's slot to the mark. */
    public static final float SIZE_DP = 26f;
    private static final float STROKE_DP = 2.4f;

    private static final float VIEWPORT = 24f;
    private static final float START_X = 4.5f;
    private static final float START_Y = 12.5f;
    private static final float KNEE_X = 9.5f;
    private static final float KNEE_Y = 17.5f;
    private static final float END_X = 19.5f;
    private static final float END_Y = 6.5f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();

    public CheckView(Context context) {
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
        path.moveTo(START_X * scale, START_Y * scale);
        path.lineTo(KNEE_X * scale, KNEE_Y * scale);
        path.lineTo(END_X * scale, END_Y * scale);
        paint.setStrokeWidth(Tokens.dpFloat(getContext(), STROKE_DP));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        paint.setColor(isEnabled() ? Tokens.ACCENT : Tokens.TEXT_DISABLED);
        canvas.drawPath(path, paint);
    }
}
