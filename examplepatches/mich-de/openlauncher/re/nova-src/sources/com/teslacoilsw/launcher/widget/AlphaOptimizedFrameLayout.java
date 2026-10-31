package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;

/* loaded from: classes4.dex */
public class AlphaOptimizedFrameLayout extends FrameLayout {
    public AlphaOptimizedFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }
}
