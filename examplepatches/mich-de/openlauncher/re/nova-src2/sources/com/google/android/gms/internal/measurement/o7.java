package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class o7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f32910e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ String f32911f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f32912g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f32913h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ i8 f32914i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f32915j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o7(i8 i8Var, String str, String str2, Object obj, boolean z11) {
        super(i8Var, true);
        this.f32911f = str;
        this.f32912g = str2;
        this.f32915j = obj;
        this.f32913h = z11;
        Objects.requireNonNull(i8Var);
        this.f32914i = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        switch (this.f32910e) {
            case 0:
                d7 d7Var = this.f32914i.f32648g;
                sg.w.h(d7Var);
                d7Var.setUserProperty(this.f32911f, this.f32912g, new ah.d(this.f32915j), this.f32913h, this.f32460a);
                break;
            default:
                d7 d7Var2 = this.f32914i.f32648g;
                sg.w.h(d7Var2);
                d7Var2.getUserProperties(this.f32911f, this.f32912g, this.f32913h, (a7) this.f32915j);
                break;
        }
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public void b() {
        switch (this.f32910e) {
            case 1:
                ((a7) this.f32915j).G(null);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o7(i8 i8Var, String str, String str2, boolean z11, a7 a7Var) {
        super(i8Var, true);
        this.f32911f = str;
        this.f32912g = str2;
        this.f32913h = z11;
        this.f32915j = a7Var;
        Objects.requireNonNull(i8Var);
        this.f32914i = i8Var;
    }
}
