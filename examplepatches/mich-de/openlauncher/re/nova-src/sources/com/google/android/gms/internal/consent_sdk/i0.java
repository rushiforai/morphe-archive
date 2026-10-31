package com.google.android.gms.internal.consent_sdk;

import android.os.Handler;
import android.os.Looper;

/* loaded from: classes.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Handler f32098a = new Handler(Looper.getMainLooper());

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f32099b = new h0();

    public static void a() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("Method must be call on main thread.");
        }
    }
}
