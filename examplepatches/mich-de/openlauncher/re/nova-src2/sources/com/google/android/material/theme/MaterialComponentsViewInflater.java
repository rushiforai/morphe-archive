package com.google.android.material.theme;

import android.content.Context;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatButton;
import androidx.appcompat.widget.AppCompatTextView;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.checkbox.b;
import fk.s;
import m.j0;
import r.l;
import r.n;
import r.w;
import xj.a;

/* loaded from: classes3.dex */
public class MaterialComponentsViewInflater extends j0 {
    @Override // m.j0
    public final l a(Context context, AttributeSet attributeSet) {
        return new s(context, attributeSet);
    }

    @Override // m.j0
    public final AppCompatButton b(Context context, AttributeSet attributeSet) {
        return new MaterialButton(context, attributeSet);
    }

    @Override // m.j0
    public final n c(Context context, AttributeSet attributeSet) {
        return new b(context, attributeSet);
    }

    @Override // m.j0
    public final w d(Context context, AttributeSet attributeSet) {
        return new a(context, attributeSet);
    }

    @Override // m.j0
    public final AppCompatTextView e(Context context, AttributeSet attributeSet) {
        return new gk.a(context, attributeSet, 16842884);
    }
}
