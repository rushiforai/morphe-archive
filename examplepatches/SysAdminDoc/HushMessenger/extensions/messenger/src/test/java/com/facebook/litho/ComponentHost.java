package com.facebook.litho;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

/**
 * Stands in for Litho's view, which places what it holds itself rather than by margins. It lays out like a chat's: the
 * first child fills it, and any other is a small button anchored near its bottom.
 */
public class ComponentHost extends ViewGroup {
    public ComponentHost(Context context) {
        super(context);
    }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        int width = MeasureSpec.getSize(widthSpec), height = MeasureSpec.getSize(heightSpec);
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            child.measure(MeasureSpec.makeMeasureSpec(i == 0 ? width : 100, MeasureSpec.EXACTLY),
                MeasureSpec.makeMeasureSpec(i == 0 ? height : 50, MeasureSpec.EXACTLY));
        }
        setMeasuredDimension(width, height);
    }

    @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int width = right - left, height = bottom - top;
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (i == 0) child.layout(0, 0, width, height);
            else child.layout(width / 2 - 50, height - 60, width / 2 + 50, height - 10);
        }
    }
}
