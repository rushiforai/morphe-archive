package com.facebook.litho;

import android.content.Context;
import android.widget.FrameLayout;

/** Stands in for Litho's mounting view, whose name Redex keeps. Carries the description its helper gives. */
public class BaseMountingView extends FrameLayout {
    public String description = "";

    public BaseMountingView(Context context) {
        super(context);
    }
}
