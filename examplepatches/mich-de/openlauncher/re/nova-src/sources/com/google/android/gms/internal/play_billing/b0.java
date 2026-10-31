package com.google.android.gms.internal.play_billing;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f33356a;

    static {
        a0 a0Var;
        try {
            SystemClock.elapsedRealtimeNanos();
            a0Var = new a0(0);
        } catch (Throwable unused) {
            SystemClock.elapsedRealtime();
            a0Var = new a0(1);
        }
        f33356a = a0Var;
    }
}
