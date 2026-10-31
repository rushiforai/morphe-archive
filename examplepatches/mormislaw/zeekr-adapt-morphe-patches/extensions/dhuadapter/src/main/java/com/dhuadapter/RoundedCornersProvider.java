package com.dhuadapter;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/**
 * ViewOutlineProvider that clips the view to a rounded rectangle.
 * Applied to the decor view for rounded-corner effect on DHU.
 */
public class RoundedCornersProvider extends ViewOutlineProvider {

    private final float radiusPx;

    /**
     * @param radiusPx corner radius in pixels (caller converts dp -> px)
     */
    public RoundedCornersProvider(float radiusPx) {
        this.radiusPx = radiusPx;
    }

    @Override
    public void getOutline(View view, Outline outline) {
        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radiusPx);
    }
}
