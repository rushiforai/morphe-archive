package com.google.android.gms.internal.measurement;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public abstract class dh {

    /* renamed from: a, reason: collision with root package name */
    public static final vk.b0 f32478a;

    static {
        ch chVar;
        try {
            SystemClock.elapsedRealtimeNanos();
            chVar = new ch(0);
        } catch (Throwable unused) {
            SystemClock.elapsedRealtime();
            chVar = new ch(1);
        }
        f32478a = chVar;
    }
}
