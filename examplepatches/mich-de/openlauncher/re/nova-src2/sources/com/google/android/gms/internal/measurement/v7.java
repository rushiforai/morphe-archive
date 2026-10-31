package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class v7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f33137e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ String f33138f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ i8 f33139g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v7(i8 i8Var, String str, int i5) {
        super(i8Var, true);
        this.f33137e = i5;
        switch (i5) {
            case 1:
                this.f33138f = str;
                Objects.requireNonNull(i8Var);
                this.f33139g = i8Var;
                super(i8Var, true);
                break;
            default:
                this.f33138f = str;
                Objects.requireNonNull(i8Var);
                this.f33139g = i8Var;
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f33137e) {
            case 0:
                d7 d7Var = this.f33139g.f32648g;
                sg.w.h(d7Var);
                d7Var.beginAdUnitExposure(this.f33138f, this.f32461b);
                break;
            default:
                d7 d7Var2 = this.f33139g.f32648g;
                sg.w.h(d7Var2);
                d7Var2.endAdUnitExposure(this.f33138f, this.f32461b);
                break;
        }
    }
}
