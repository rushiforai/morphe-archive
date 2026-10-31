package com.vungle.ads.internal.util;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f47698a = new Handler(Looper.getMainLooper());

    public final void a(Runnable runnable, long j11) {
        Intrinsics.g(runnable, "runnable");
        this.f47698a.postAtTime(runnable, SystemClock.uptimeMillis() + j11);
    }
}
