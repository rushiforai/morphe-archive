package com.facebook.litho;

import android.content.Context;
import android.widget.FrameLayout;

/** Stands in for Litho's host view, whose name Redex keeps. */
public class ComponentHost extends FrameLayout {
    public ComponentHost(Context context) {
        super(context);
    }
}
