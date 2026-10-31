package com.android.launcher3;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;

/* loaded from: classes2.dex */
public class AlphaDisableableButton extends Button {
    public AlphaDisableableButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.widget.TextView, android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        if (z11) {
            setAlpha(1.0f);
        } else {
            setAlpha(0.4f);
        }
    }
}
