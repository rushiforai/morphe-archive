package com.android.launcher3.icons;

import aa.n;
import aa.n0;
import aa.p0;
import aa.q0;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;

/* loaded from: classes2.dex */
public class ThemedIconDrawable$ThemedBitmapInfo extends BitmapInfo {

    /* renamed from: e, reason: collision with root package name */
    public final n0 f21155e;

    /* renamed from: f, reason: collision with root package name */
    public final float f21156f;

    /* renamed from: g, reason: collision with root package name */
    public final Bitmap f21157g;

    public ThemedIconDrawable$ThemedBitmapInfo(Bitmap bitmap, int i5, n0 n0Var, float f11, Bitmap bitmap2) {
        super(bitmap, i5);
        this.f21155e = n0Var;
        this.f21156f = f11;
        this.f21157g = bitmap2;
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final n i(Context context) {
        int[] iArrL = q0.l(context);
        q0 q0Var = new q0(new p0(this, iArrL[0], iArrL[1], false));
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{2130969100});
        float f11 = typedArrayObtainStyledAttributes.getFloat(0, 1.0f);
        typedArrayObtainStyledAttributes.recycle();
        q0Var.f632g = f11;
        return q0Var;
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final byte[] l() {
        throw new IllegalStateException();
    }
}
