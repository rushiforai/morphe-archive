package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.EditText;

/* loaded from: classes.dex */
public class AlphaOptimizedEditText extends EditText {
    public AlphaOptimizedEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }
}
