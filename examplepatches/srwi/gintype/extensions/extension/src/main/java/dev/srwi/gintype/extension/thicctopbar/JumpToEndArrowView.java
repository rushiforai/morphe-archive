package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.widget.FrameLayout;
import android.widget.ImageView;

/**
 * Action button displayed in place of the microphone icon when a past word is selected.
 * Displays a clean Google Material arrow-forward (->) icon and jumps the cursor
 * back to the end of the text field when clicked.
 */
public class JumpToEndArrowView extends FrameLayout {

    public interface OnJumpClickListener {
        void onJumpClicked();
    }

    private final ImageView iconView;
    private float scaleFactor = GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE;
    private OnJumpClickListener jumpListener;

    public JumpToEndArrowView(Context context) {
        super(context);
        setClickable(true);
        setFocusable(true);
        setContentDescription("Jump to end");

        TypedValue outValue = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
            setBackgroundResource(outValue.resourceId);
        }

        iconView = new ImageView(context);
        updateIconColor();

        int sizePx = computeIconSizePx(scaleFactor);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(sizePx, sizePx, Gravity.CENTER);
        addView(iconView, lp);

        setOnClickListener(v -> {
            performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            if (jumpListener != null) {
                jumpListener.onJumpClicked();
            }
        });
    }

    /** Scale the arrow icon size proportionally to the top bar height scale. */
    public void setScaleFactor(float scale) {
        float sanitized = GboardThiccTopBarSettings.sanitizeTopbarScale(scale);
        if (Math.abs(this.scaleFactor - sanitized) < 0.001f) {
            return;
        }
        this.scaleFactor = sanitized;
        int sizePx = computeIconSizePx(sanitized);
        if (iconView.getLayoutParams() != null) {
            iconView.getLayoutParams().width = sizePx;
            iconView.getLayoutParams().height = sizePx;
            iconView.requestLayout();
        }
    }

    private int computeIconSizePx(float scale) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 24f * scale, getResources().getDisplayMetrics());
    }

    public void setOnJumpClickListener(OnJumpClickListener listener) {
        this.jumpListener = listener;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateIconColor();
        post(this::updateIconColor);
    }

    public void updateIconColor() {
        boolean dark = ThiccTopBarGboardReflector.isKeyboardDark(this);
        int accentColor = ThiccTopBarGboardReflector.resolveNormalAccentColor(this, getContext(), dark);
        iconView.setImageDrawable(new ArrowForwardDrawable(accentColor));
    }

    /**
     * Vector drawable rendering the standard Google Material arrow_forward icon.
     */
    private static class ArrowForwardDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        ArrowForwardDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float cx = bounds.exactCenterX();
            float cy = bounds.exactCenterY();
            float size = Math.min(bounds.width(), bounds.height()) * 0.75f;
            float half = size * 0.5f;

            paint.setStrokeWidth(Math.max(2.5f, size * 0.14f));

            // Horizontal arrow shaft
            canvas.drawLine(cx - half, cy, cx + half, cy, paint);

            // Arrow head pointing right (->)
            float head = half * 0.60f;
            canvas.drawLine(cx + half - head, cy - head, cx + half, cy, paint);
            canvas.drawLine(cx + half - head, cy + head, cx + half, cy, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        @SuppressWarnings("deprecation")
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
