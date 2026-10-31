package com.google.android.gms.internal.measurement;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class db extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AtomicBoolean f32464a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f32465b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cl.m1 f32466c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d2 f32467d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Executor f32468e;

    public db(AtomicBoolean atomicBoolean, Context context, cl.m1 m1Var, d2 d2Var, Executor executor) {
        this.f32464a = atomicBoolean;
        this.f32465b = context;
        this.f32466c = m1Var;
        this.f32467d = d2Var;
        this.f32468e = executor;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (this.f32464a.compareAndSet(false, true)) {
            try {
                this.f32465b.unregisterReceiver(this);
            } catch (IllegalArgumentException e3) {
                Log.w("DirectBootUtils", "Failed to unregister receiver", e3);
            }
            cl.m1 m1Var = this.f32466c;
            d2 d2Var = this.f32467d;
            Executor executor = this.f32468e;
            cl.p1 p1Var = new cl.p1();
            p1Var.f20059h = new cl.n1(p1Var, d2Var);
            executor.execute(p1Var);
            m1Var.p(p1Var);
        }
    }
}
