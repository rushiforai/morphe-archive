package app.xposed.extension;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

/** X's switch: a solid pill track, blue when on, with a white knob that slides across. */
final class Toggle extends View {
    private final Ui ui;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF track = new RectF();
    private boolean checked;
    /** 0 = off, 1 = on; animated between. */
    private float position;

    Toggle(Context context, Ui ui, boolean checked) {
        super(context);
        this.ui = ui;
        this.checked = checked;
        this.position = checked ? 1 : 0;
    }

    boolean isChecked() {
        return checked;
    }

    void toggle() {
        checked = !checked;
        ValueAnimator a = ValueAnimator.ofFloat(position, checked ? 1 : 0);
        a.setDuration(150);
        a.addUpdateListener(v -> {
            position = (float) v.getAnimatedValue();
            invalidate();
        });
        a.start();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(ui.dp(46), ui.dp(28));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float h = getHeight(), r = h / 2;
        int off = ui.dark ? 0xFF3E4144 : 0xFFCFD9DE;
        paint.setColor(blend(off, Ui.ACCENT, position));
        track.set(0, 0, getWidth(), h);
        canvas.drawRoundRect(track, r, r, paint);
        float inset = ui.dp(2), knob = r - inset;
        float x = inset + knob + position * (getWidth() - 2 * (inset + knob));
        paint.setColor(Color.WHITE);
        canvas.drawCircle(x, r, knob, paint);
    }

    private static int blend(int from, int to, float t) {
        return Color.argb(
                Math.round(Color.alpha(from) + (Color.alpha(to) - Color.alpha(from)) * t),
                Math.round(Color.red(from) + (Color.red(to) - Color.red(from)) * t),
                Math.round(Color.green(from) + (Color.green(to) - Color.green(from)) * t),
                Math.round(Color.blue(from) + (Color.blue(to) - Color.blue(from)) * t));
    }
}
