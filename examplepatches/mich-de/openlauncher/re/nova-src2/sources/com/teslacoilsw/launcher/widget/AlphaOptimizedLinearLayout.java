package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;

/* loaded from: classes4.dex */
public class AlphaOptimizedLinearLayout extends LinearLayout {
    public AlphaOptimizedLinearLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }
}
