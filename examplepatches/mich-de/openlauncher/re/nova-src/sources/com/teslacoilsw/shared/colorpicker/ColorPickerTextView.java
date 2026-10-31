package com.teslacoilsw.shared.colorpicker;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.TextView;
import g10.f;
import o9.u2;

/* loaded from: classes4.dex */
public class ColorPickerTextView extends TextView {

    /* renamed from: a, reason: collision with root package name */
    public final f f46511a;

    public ColorPickerTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80155d);
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, (int) ((context.getResources().getDisplayMetrics().density * 32.0f) + 0.5f));
        typedArrayObtainStyledAttributes.recycle();
        f fVar = new f(context, -16777216, 0.0f, 0, 28);
        this.f46511a = fVar;
        fVar.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
        setCompoundDrawables(null, fVar, null, null);
        fVar.b(-65536);
    }
}
