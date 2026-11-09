package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;

/**
 * A single vector icon painted by {@link Icons.IconDrawable}. Sized by the caller in dp
 * (>= 24 dp for touch targets, larger for the player controls).
 */
public final class IconView extends View {

    private final Icons.IconDrawable drawable;

    public IconView(Context context, int icon, int color) {
        super(context);
        drawable = new Icons.IconDrawable(icon, color);
        // Icons are decoration: the clickable parent carries the label.
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    public void setIcon(int icon) {
        drawable.setIcon(icon);
        invalidate();
    }

    public void setIconColor(int color) {
        drawable.setColor(color);
        invalidate();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        drawable.setBounds(0, 0, getWidth(), getHeight());
        drawable.draw(canvas);
    }
}
