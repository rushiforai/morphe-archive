package com.teslacoilsw.launcher.icon;

import aa.n;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.ColorFilter;
import android.graphics.PorterDuffColorFilter;
import com.android.launcher3.icons.BitmapInfo;
import fz.y;

/* loaded from: classes4.dex */
class NovaClockDrawableWrapper$ClockBitmapInfo extends BitmapInfo {

    /* renamed from: e, reason: collision with root package name */
    public final float f45765e;

    /* renamed from: f, reason: collision with root package name */
    public final int f45766f;

    /* renamed from: g, reason: collision with root package name */
    public final y f45767g;

    /* renamed from: h, reason: collision with root package name */
    public final Bitmap f45768h;

    /* renamed from: i, reason: collision with root package name */
    public final ColorFilter f45769i;

    public NovaClockDrawableWrapper$ClockBitmapInfo(Bitmap bitmap, int i5, float f11, y yVar, Bitmap bitmap2, PorterDuffColorFilter porterDuffColorFilter) {
        super(bitmap, i5);
        this.f45765e = f11;
        this.f45767g = yVar;
        this.f45766f = (int) Math.ceil(bitmap.getWidth() * 0.035f);
        this.f45768h = bitmap2;
        this.f45769i = porterDuffColorFilter;
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final n f(Context context) {
        c cVar = new c(this);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{2130969100});
        float f11 = typedArrayObtainStyledAttributes.getFloat(0, 1.0f);
        typedArrayObtainStyledAttributes.recycle();
        cVar.f632g = f11;
        return cVar;
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final n i(Context context) {
        return f(context);
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final byte[] l() {
        return null;
    }
}
