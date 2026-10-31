package com.google.android.gms.internal.measurement;

import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final /* synthetic */ class tb implements vk.u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33081a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vk.u f33082b;

    public /* synthetic */ tb(vk.u uVar, int i5) {
        this.f33081a = i5;
        this.f33082b = uVar;
    }

    @Override // vk.u
    public final Object get() {
        int i5 = this.f33081a;
        vk.u uVar = this.f33082b;
        switch (i5) {
            case 0:
                Object obj = ob.f32917j;
                return (he) ((vk.k) uVar.get()).c();
            default:
                cl.e1 e1Var = (cl.e1) uVar.get();
                e1Var.getClass();
                y7 y7Var = y7.f33253c;
                TimeUnit timeUnit = TimeUnit.MILLISECONDS;
                cl.p1 p1Var = new cl.p1(y7Var);
                return new cl.h1(p1Var, ((cl.j1) e1Var).f20024c.schedule(p1Var, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, timeUnit));
        }
    }
}
