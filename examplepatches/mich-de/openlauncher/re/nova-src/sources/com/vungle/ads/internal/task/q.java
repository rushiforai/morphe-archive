package com.vungle.ads.internal.task;

import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public WeakReference f47547a;

    public q(WeakReference runner) {
        Intrinsics.g(runner, "runner");
        this.f47547a = runner;
    }

    @Override // java.lang.Runnable
    public final void run() {
        r rVar = (r) this.f47547a.get();
        if (rVar != null) {
            rVar.a();
        }
    }
}
