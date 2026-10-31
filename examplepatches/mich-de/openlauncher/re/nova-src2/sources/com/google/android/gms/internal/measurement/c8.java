package com.google.android.gms.internal.measurement;

import android.os.Bundle;

/* loaded from: classes.dex */
public final class c8 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Long f32428e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Long f32429f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f32430g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ String f32431h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Bundle f32432i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f32433j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f32434k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ i8 f32435l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c8(i8 i8Var, Long l9, Long l11, String str, String str2, Bundle bundle, boolean z11, boolean z12) {
        super(i8Var, true);
        this.f32428e = l9;
        this.f32429f = l11;
        this.f32430g = str;
        this.f32431h = str2;
        this.f32432i = bundle;
        this.f32433j = z11;
        this.f32434k = z12;
        this.f32435l = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        Long l9 = this.f32428e;
        long jLongValue = l9 == null ? this.f32460a : l9.longValue();
        long j11 = this.f32429f == null ? this.f32461b : 0L;
        d7 d7VarL = this.f32435l.l();
        sg.w.h(d7VarL);
        d7VarL.logEventWithElapsedTime(this.f32430g, this.f32431h, this.f32432i, this.f32433j, this.f32434k, jLongValue, j11);
    }
}
