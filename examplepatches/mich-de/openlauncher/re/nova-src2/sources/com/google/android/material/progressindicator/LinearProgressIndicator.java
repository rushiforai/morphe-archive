package com.google.android.material.progressindicator;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import bj.a;
import java.util.WeakHashMap;
import tj.i;
import wj.c;
import wj.d;
import wj.j;
import wj.n;
import wj.o;
import wj.p;
import wj.r;
import wj.s;

/* loaded from: classes3.dex */
public class LinearProgressIndicator extends c {
    public LinearProgressIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969534, 2132083989);
        s sVar = (s) this.f94402a;
        o oVar = new o(sVar);
        oVar.f94465b = 300.0f;
        Context context2 = getContext();
        setIndeterminateDrawable(new n(context2, sVar, oVar, sVar.f94488h == 0 ? new p(sVar) : new r(context2, sVar)));
        setProgressDrawable(new j(getContext(), sVar, oVar));
    }

    @Override // wj.c
    public final d b(Context context, AttributeSet attributeSet) {
        s sVar = new s(context, attributeSet, 2130969534, 2132083989);
        i.a(context, attributeSet, 2130969534, 2132083989);
        int[] iArr = a.f17928q;
        i.b(context, attributeSet, iArr, 2130969534, 2132083989, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, 2130969534, 2132083989);
        sVar.f94488h = typedArrayObtainStyledAttributes.getInt(0, 1);
        int i5 = typedArrayObtainStyledAttributes.getInt(1, 0);
        sVar.f94489i = i5;
        sVar.f94491k = Math.min(typedArrayObtainStyledAttributes.getDimensionPixelSize(2, 0), sVar.f94413a);
        typedArrayObtainStyledAttributes.recycle();
        sVar.a();
        sVar.f94490j = i5 == 1;
        return sVar;
    }

    @Override // wj.c
    public final void f(int i5) {
        d dVar = this.f94402a;
        if (dVar != null && ((s) dVar).f94488h == 0 && isIndeterminate()) {
            return;
        }
        super.f(i5);
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        d dVar = this.f94402a;
        s sVar = (s) dVar;
        boolean z12 = true;
        if (((s) dVar).f94489i != 1) {
            WeakHashMap weakHashMap = a1.f250a;
            if ((getLayoutDirection() != 1 || ((s) dVar).f94489i != 2) && (getLayoutDirection() != 0 || ((s) dVar).f94489i != 3)) {
                z12 = false;
            }
        }
        sVar.f94490j = z12;
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        int paddingRight = i5 - (getPaddingRight() + getPaddingLeft());
        int paddingBottom = i11 - (getPaddingBottom() + getPaddingTop());
        n nVarC = c();
        if (nVarC != null) {
            nVarC.setBounds(0, 0, paddingRight, paddingBottom);
        }
        j jVarD = d();
        if (jVarD != null) {
            jVarD.setBounds(0, 0, paddingRight, paddingBottom);
        }
    }
}
