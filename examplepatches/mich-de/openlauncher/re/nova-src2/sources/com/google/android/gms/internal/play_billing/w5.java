package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class w5 extends t5 {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ x5 f33646h;

    public w5(x5 x5Var) {
        this.f33646h = x5Var;
    }

    @Override // com.google.android.gms.internal.play_billing.t5
    public final String a() {
        u5 u5Var = (u5) this.f33646h.f33649a.get();
        return u5Var == null ? "Completer object has been garbage collected, future will fail soon" : b.c0.l("tag=[", String.valueOf(u5Var.f33556a), "]");
    }
}
