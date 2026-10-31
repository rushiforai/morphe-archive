package com.google.android.gms.internal.measurement;

import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class fe implements he {

    /* renamed from: d, reason: collision with root package name */
    public static boolean f32537d;

    /* renamed from: a, reason: collision with root package name */
    public final vk.u f32538a;

    /* renamed from: b, reason: collision with root package name */
    public final int f32539b;

    /* renamed from: c, reason: collision with root package name */
    public final sb f32540c;

    public fe(vk.u uVar) {
        sb sbVar = sb.f33056c;
        this.f32538a = uVar;
        this.f32539b = Math.max(5, 10);
        this.f32540c = sbVar;
    }

    @Override // com.google.android.gms.internal.measurement.he
    public final void zza() {
        synchronized (fe.class) {
            try {
                if (!f32537d) {
                    zd zdVar = new zd(this, 3);
                    long j11 = this.f32539b;
                    TimeUnit timeUnit = TimeUnit.MINUTES;
                    cl.e1 e1Var = (cl.e1) this.f32538a.get();
                    ai.e3 e3Var = new ai.e3(this, zdVar, e1Var, j11);
                    cl.j1 j1Var = (cl.j1) e1Var;
                    j1Var.getClass();
                    cl.p1 p1Var = new cl.p1(Executors.callable(e3Var, null));
                    cl.h1 h1Var = new cl.h1(p1Var, j1Var.f20024c.schedule(p1Var, j11, timeUnit));
                    h1Var.b(new zd(h1Var, 1), cl.m0.f20038a);
                    f32537d = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
