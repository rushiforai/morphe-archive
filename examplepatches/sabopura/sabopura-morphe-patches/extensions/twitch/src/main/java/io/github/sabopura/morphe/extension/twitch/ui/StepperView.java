package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.PathInterpolator;

import java.util.function.IntConsumer;
import java.util.function.IntFunction;

/**
 * Bencho's Drag stepper: tap for one step, or hold and drag to sweep through the whole range, so the
 * coarse move never costs the fine one. The pressed end sinks and the rail appears while sweeping.
 */
final class StepperView extends View {
    private static final int WAKE_MS = 260;
    private static final float[] POP = {.24f, 1.34f, .38f, 1f};
    private static final float SIDE_DP = 48, FACE_DP = 46, TARGET_DP = 48;

    private final int min, max, mark;
    private final IntFunction<String> format;
    private final IntConsumer onChange;
    private final float density;
    private final Paint pill = new Paint(Paint.ANTI_ALIAS_FLAG), rail = new Paint(Paint.ANTI_ALIAS_FLAG),
            stroke = new Paint(Paint.ANTI_ALIAS_FLAG), label = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Path minus = Icons.path(Icons.Kind.MINUS), plus = Icons.path(Icons.Kind.PLUS), shaped = new Path();
    private final Matrix matrix = new Matrix();
    /** The pill grows with the font so a large text size is never cut; the touch target is never under 48 dp. */
    private final int face, height;

    private int value;
    private String shownText;
    private int dir;
    private boolean sweeping, stepped, armed;
    private float downX;
    private int fromValue;
    private final Runnable wake = () -> {
        if (!armed || dir == 0) return;
        sweeping = true;
        animateState();
        invalidate();
    };

    StepperView(Context context, Ui ui, int min, int max, int value, int mark, IntFunction<String> format, IntConsumer onChange) {
        super(context);
        this.min = min;
        this.max = max;
        this.value = Math.max(min, Math.min(max, value));
        this.mark = mark;
        this.format = format;
        this.onChange = onChange;
        density = context.getResources().getDisplayMetrics().density;
        pill.setColor(ui.dark ? 0x1AFFFFFF : 0x12000000);
        rail.setColor(ui.accent & 0x33FFFFFF);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeCap(Paint.Cap.ROUND);
        stroke.setStrokeWidth(2 * density * 16 / 24f);
        stroke.setColor(ui.text);
        label.setColor(ui.text);
        label.setTextAlign(Paint.Align.CENTER);
        label.setFakeBoldText(true);
        label.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 20, context.getResources().getDisplayMetrics()));
        face = Math.max(Math.round(FACE_DP * density), (int) Math.ceil(label.descent() - label.ascent() + 12 * density));
        height = Math.max(Math.round(TARGET_DP * density), face);
        setFocusable(true);
        setClickable(true);
        setCameraDistance(320 * density);
        spoken(false);
    }

    private void spoken(boolean announce) {
        shownText = format.apply(value);
        Ui.setSpokenState(this, shownText, announce);
    }

    /** Moves to {@code next} and says so; false when it is already there. */
    private boolean set(int next, boolean announce) {
        next = Math.max(min, Math.min(max, next));
        if (next == value) return false;
        value = next;
        onChange.accept(value);
        spoken(announce);
        invalidate();
        return true;
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        setMeasuredDimension(MeasureSpec.getSize(widthSpec), height);
    }

    private void animateState() {
        float scaleX = sweeping ? 1.06f : dir == 0 ? 1f : .99f;
        float scaleY = dir == 0 || sweeping ? 1f : .99f;
        float rotation = sweeping ? 0 : dir * 4f;
        PathInterpolator curve = new PathInterpolator(POP[0], POP[1], POP[2], POP[3]);
        animate().scaleX(scaleX).scaleY(scaleY).rotationY(rotation)
                .setDuration(!sweeping && dir != 0 ? 160 : 420).setInterpolator(curve);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float h = face, top = (getHeight() - h) / 2f, side = SIDE_DP * density, w = getWidth();
        rect.set(0, top, w, top + h);
        canvas.drawRoundRect(rect, h / 2, h / 2, pill);
        if (sweeping) {
            float fraction = (value - min) / (float) Math.max(1, max - min);
            rect.set(0, top, w * fraction, top + h);
            canvas.drawRoundRect(rect, h / 2, h / 2, rail);
        }
        float size = 16 * density, inset = (side - size) / 2, cy = getHeight() / 2f;
        icon(canvas, minus, inset, cy - size / 2, size);
        icon(canvas, plus, w - side + inset, cy - size / 2, size);
        float baseline = cy - (label.descent() + label.ascent()) / 2;
        canvas.drawText(shownText, w / 2, baseline, label);
    }

    private void icon(Canvas canvas, Path path, float left, float top, float size) {
        float scale = size / 24f;
        matrix.setScale(scale, scale);
        matrix.postTranslate(left, top);
        path.transform(matrix, shaped);
        canvas.drawPath(shaped, stroke);
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!isEnabled()) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                float side = SIDE_DP * density;
                dir = e.getX() < side ? -1 : e.getX() > getWidth() - side ? 1 : 0;
                if (dir == 0) return false;
                getParent().requestDisallowInterceptTouchEvent(true);
                downX = e.getX();
                fromValue = value;
                sweeping = false;
                stepped = false;
                armed = true;
                postDelayed(wake, WAKE_MS);
                animateState();
                invalidate();
                return true;
            }
            case MotionEvent.ACTION_MOVE:
                if (!sweeping) return true;
                int next = Math.max(min, Math.min(max, Math.round(fromValue + (e.getX() - downX) / getWidth() * (max - min))));
                if (next != value) {
                    if (PortMath.landedOn(value, next, mark)) performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    set(next, false);
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL: {
                armed = false;
                removeCallbacks(wake);
                boolean tapped = !sweeping && !stepped && e.getActionMasked() == MotionEvent.ACTION_UP;
                boolean swept = sweeping;
                if (tapped) {
                    stepped = true;
                    set(value + dir, true);
                }
                sweeping = false;
                dir = 0;
                animateState();
                invalidate();
                if (swept) spoken(true);
                if (tapped) performClick();
                return true;
            }
            default:
                return true;
        }
    }

    /** Left and right step it; up and down stay free to move the focus. */
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        int direction = PortMath.keyStep(keyCode);
        if (direction != 0 && isEnabled()) {
            set(value + direction, true);
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    protected void onDetachedFromWindow() {
        armed = false;
        removeCallbacks(wake);
        super.onDetachedFromWindow();
    }

    @Override
    public CharSequence getAccessibilityClassName() {
        return "android.widget.SeekBar";
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        Ui.describeSlider(this, info, AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT, min, max, value, shownText);
    }

    @Override
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        if (isEnabled()) {
            int step = PortMath.actionStep(action);
            float to = step != 0 ? value + step : Ui.progressArgument(action, arguments);
            if (!Float.isNaN(to)) {
                set(Math.round(to), true);
                return true;
            }
        }
        return super.performAccessibilityAction(action, arguments);
    }
}
