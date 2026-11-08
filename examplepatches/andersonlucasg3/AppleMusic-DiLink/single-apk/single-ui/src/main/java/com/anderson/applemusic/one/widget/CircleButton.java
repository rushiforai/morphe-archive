package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Circular icon control: transport buttons (prev 60 / play 80 / next 60), close,
 * search/account shortcuts and the mini player play/pause. The disc is fixed to its
 * {@code sizeDp} footprint so wrapping parents never inflate it; the ring is painted only
 * on D-pad focus.
 */
public final class CircleButton extends FrameLayout {

    private final IconView icon;
    private final View ring;
    private final int sizePx;

    public CircleButton(Context context, int iconId, float sizeDp, int fill, int iconColor,
                        float iconSizeDp) {
        super(context);
        sizePx = Tokens.dp(sizeDp);

        ring = new View(context);
        ring.setBackground(Shapes.circle(0x00000000, Tokens.ACCENT, 2f));
        addView(ring, new FrameLayout.LayoutParams(sizePx, sizePx));

        icon = new IconView(context, iconId, iconColor);
        FrameLayout.LayoutParams iconParams = new FrameLayout.LayoutParams(
                Tokens.dp(iconSizeDp), Tokens.dp(iconSizeDp), Gravity.CENTER);
        addView(icon, iconParams);

        setMinimumWidth(sizePx);
        setMinimumHeight(sizePx);
        Focus.circle(this, fill, ring);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (getMeasuredWidth() < sizePx || getMeasuredHeight() < sizePx) {
            setMeasuredDimension(Math.max(sizePx, getMeasuredWidth()),
                    Math.max(sizePx, getMeasuredHeight()));
        }
    }

    /** Layout params matching the disc, for parents that expect wrap_content. */
    public LinearLayout.LayoutParams layoutParams() {
        return new LinearLayout.LayoutParams(sizePx, sizePx);
    }

    public void setIcon(int iconId) {
        icon.setIcon(iconId);
    }

    public void setIconColor(int color) {
        icon.setIconColor(color);
    }
}
