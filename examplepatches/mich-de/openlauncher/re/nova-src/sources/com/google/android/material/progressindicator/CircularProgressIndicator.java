package com.google.android.material.progressindicator;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import bj.a;
import j7.o;
import ps.f0;
import q4.k;
import tj.i;
import wj.c;
import wj.d;
import wj.e;
import wj.g;
import wj.h;
import wj.j;
import wj.n;

/* loaded from: classes3.dex */
public class CircularProgressIndicator extends c {
    public CircularProgressIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130968897, 2132083977);
        h hVar = (h) this.f94402a;
        e eVar = new e(hVar);
        Context context2 = getContext();
        n nVar = new n(context2, hVar, eVar, new g(hVar));
        Resources resources = context2.getResources();
        o oVar = new o();
        ThreadLocal threadLocal = k.f83638a;
        oVar.f69087a = resources.getDrawable(2131231877, null);
        new j7.n(oVar.f69087a.getConstantState());
        nVar.n = oVar;
        setIndeterminateDrawable(nVar);
        setProgressDrawable(new j(getContext(), hVar, eVar));
    }

    @Override // wj.c
    public final d b(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        h hVar = new h(context, attributeSet, 2130968897, 2132083977);
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131166227);
        int dimensionPixelSize2 = context.getResources().getDimensionPixelSize(2131166222);
        i.a(context, attributeSet, 2130968897, 2132083977);
        int[] iArr = a.f17921h;
        i.b(context, attributeSet, iArr, 2130968897, 2132083977, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, 2130968897, 2132083977);
        hVar.f94438h = Math.max(f0.o(context, typedArrayObtainStyledAttributes, 2, dimensionPixelSize), hVar.f94413a * 2);
        hVar.f94439i = f0.o(context, typedArrayObtainStyledAttributes, 1, dimensionPixelSize2);
        hVar.f94440j = typedArrayObtainStyledAttributes.getInt(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        hVar.a();
        return hVar;
    }
}
