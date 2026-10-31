package com.teslacoilsw.launcher.icon;

import aa.m;
import aa.n;

/* loaded from: classes4.dex */
public final class b extends m {

    /* renamed from: d, reason: collision with root package name */
    public final NovaClockDrawableWrapper$ClockBitmapInfo f45792d;

    public b(NovaClockDrawableWrapper$ClockBitmapInfo novaClockDrawableWrapper$ClockBitmapInfo, boolean z11) {
        super(novaClockDrawableWrapper$ClockBitmapInfo.f21151a, novaClockDrawableWrapper$ClockBitmapInfo.f21152b, z11);
        this.f45792d = novaClockDrawableWrapper$ClockBitmapInfo;
    }

    @Override // aa.m, android.graphics.drawable.Drawable.ConstantState
    /* renamed from: a */
    public final n newDrawable() {
        c cVar = new c(this.f45792d);
        cVar.j(this.f617c);
        return cVar;
    }
}
