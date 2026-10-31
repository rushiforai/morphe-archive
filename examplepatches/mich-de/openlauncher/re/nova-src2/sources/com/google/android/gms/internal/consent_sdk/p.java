package com.google.android.gms.internal.consent_sdk;

import android.util.Log;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final com.google.android.gms.internal.measurement.v6 f32206a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f32207b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicReference f32208c = new AtomicReference();

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f32209d = new AtomicReference();

    public p(com.google.android.gms.internal.measurement.v6 v6Var, Executor executor) {
        this.f32206a = v6Var;
        this.f32207b = executor;
    }

    public final void a() {
        q qVar = (q) this.f32208c.get();
        if (qVar == null) {
            Log.e("UserMessagingPlatform", "Failed to load and cache a form due to null consent form resources.");
            return;
        }
        e eVar = (e) this.f32206a.zzb();
        eVar.a(qVar);
        m mVarC = eVar.c().c();
        mVarC.f32145m = true;
        i0.f32098a.post(new n(0, this, mVarC));
    }
}
