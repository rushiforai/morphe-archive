package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final /* synthetic */ class f2 implements uk.b, uk.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c3 f32073a;

    @Override // uk.b
    public void a() {
        c3 c3Var = this.f32073a;
        synchronized (c3Var.f32009e) {
            c3Var.f32012h = false;
        }
    }

    @Override // uk.a
    public void e(ex.a aVar) {
        c3 c3Var = this.f32073a;
        synchronized (c3Var.f32009e) {
            c3Var.f32012h = false;
        }
    }
}
