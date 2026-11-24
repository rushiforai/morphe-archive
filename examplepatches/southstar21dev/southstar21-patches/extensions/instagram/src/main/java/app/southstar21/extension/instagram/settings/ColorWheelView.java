package app.southstar21.extension.instagram.settings;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.SweepGradient;
import android.view.MotionEvent;
import android.view.View;

/**
 * An HSV color wheel: hue around the circle, saturation from the white middle out to the rim.
 * Brightness is picked with a {@link BrightnessBar} under it.
 */
final class ColorWheelView extends View {

    interface Listener {
        /** @param fromUser false when set from code */
        void onColorChanged(int color, boolean fromUser);
    }

    private final float density;
    private final Paint hues = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint whites = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint shade = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumbFill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint thumbRing = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float[] hsv = {0f, 0f, 1f};
    private float cx, cy, radius;
    private Listener listener;
    private BrightnessBar bar;

    ColorWheelView(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        thumbRing.setStyle(Paint.Style.STROKE);
        thumbRing.setStrokeWidth(3 * density);
        thumbRing.setColor(Color.WHITE);
        thumbRing.setShadowLayer(3 * density, 0, density, 0x66000000);
        setLayerType(LAYER_TYPE_SOFTWARE, null); // for the thumb's shadow
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    /** Links the brightness bar, which then follows the wheel's hue and saturation. */
    void attach(BrightnessBar bar) {
        this.bar = bar;
        bar.wheel = this;
        bar.invalidate();
    }

    int getColor() {
        return Color.HSVToColor(hsv);
    }

    void setColor(int color) {
        Color.colorToHSV(color, hsv);
        changed(false);
    }

    private void changed(boolean fromUser) {
        invalidate();
        if (bar != null) bar.invalidate();
        if (listener != null) listener.onColorChanged(getColor(), fromUser);
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        // Square, as wide as it may be but no more than 260dp.
        int size = Math.min(MeasureSpec.getSize(widthSpec), Math.round(260 * density));
        setMeasuredDimension(MeasureSpec.getSize(widthSpec), size);
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        cx = w / 2f;
        cy = h / 2f;
        radius = Math.min(w, h) / 2f - 12 * density;
        if (radius <= 0) return;
        // Clockwise from 3 o'clock, matching the angle measured in onTouchEvent.
        hues.setShader(new SweepGradient(cx, cy, new int[]{
                0xFFFF0000, 0xFFFFFF00, 0xFF00FF00, 0xFF00FFFF, 0xFF0000FF, 0xFFFF00FF, 0xFFFF0000}, null));
        whites.setShader(new RadialGradient(cx, cy, radius, Color.WHITE, 0x00FFFFFF, Shader.TileMode.CLAMP));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (radius <= 0) return;
        canvas.drawCircle(cx, cy, radius, hues);
        canvas.drawCircle(cx, cy, radius, whites);
        shade.setColor(Color.argb(Math.round((1f - hsv[2]) * 255), 0, 0, 0));
        canvas.drawCircle(cx, cy, radius, shade);

        double angle = Math.toRadians(hsv[0]);
        float x = cx + (float) Math.cos(angle) * hsv[1] * radius;
        float y = cy + (float) Math.sin(angle) * hsv[1] * radius;
        float r = 11 * density;
        thumbFill.setColor(getColor());
        canvas.drawCircle(x, y, r, thumbFill);
        canvas.drawCircle(x, y, r, thumbRing);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (radius <= 0) return false;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                // Keep the sheet or a scroller from taking the drag.
                getParent().requestDisallowInterceptTouchEvent(true);
                // fall through
            case MotionEvent.ACTION_MOVE: {
                float dx = event.getX() - cx, dy = event.getY() - cy;
                float hue = (float) Math.toDegrees(Math.atan2(dy, dx));
                hsv[0] = (hue + 360f) % 360f;
                hsv[1] = Math.min(1f, (float) Math.hypot(dx, dy) / radius);
                // Picking a color on a black wheel would show nothing: bring the light back up.
                if (hsv[2] < 0.15f) hsv[2] = 1f;
                changed(true);
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                getParent().requestDisallowInterceptTouchEvent(false);
                return true;
            default:
                return true;
        }
    }

    /** A bar from black to the wheel's color at full brightness. */
    static final class BrightnessBar extends View {
        private final float density;
        private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbFill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbRing = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float[] scratch = new float[3];
        private ColorWheelView wheel;

        BrightnessBar(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            thumbRing.setStyle(Paint.Style.STROKE);
            thumbRing.setStrokeWidth(3 * density);
            thumbRing.setColor(Color.WHITE);
            thumbRing.setShadowLayer(3 * density, 0, density, 0x66000000);
            setLayerType(LAYER_TYPE_SOFTWARE, null);
        }

        private float inset() {
            return 14 * density;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (wheel == null) return;
            float inset = inset(), h = getHeight(), mid = h / 2f, half = 7 * density;
            float left = inset, right = getWidth() - inset;
            scratch[0] = wheel.hsv[0];
            scratch[1] = wheel.hsv[1];
            scratch[2] = 1f;
            track.setShader(new LinearGradient(left, 0, right, 0, Color.BLACK, Color.HSVToColor(scratch),
                    Shader.TileMode.CLAMP));
            canvas.drawRoundRect(left, mid - half, right, mid + half, half, half, track);
            float x = left + (right - left) * wheel.hsv[2];
            float r = 11 * density;
            thumbFill.setColor(wheel.getColor());
            canvas.drawCircle(x, mid, r, thumbFill);
            canvas.drawCircle(x, mid, r, thumbRing);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (wheel == null) return false;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) getParent().requestDisallowInterceptTouchEvent(true);
            if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_MOVE) {
                float inset = inset();
                float f = (event.getX() - inset) / Math.max(1f, getWidth() - 2 * inset);
                wheel.hsv[2] = Math.max(0f, Math.min(1f, f));
                wheel.changed(true);
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                getParent().requestDisallowInterceptTouchEvent(false);
            }
            return true;
        }
    }
}
