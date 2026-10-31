package com.google.android.gms.internal.consent_sdk;

import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public final class h0 implements Executor {

    /* renamed from: b, reason: collision with root package name */
    public final ThreadPoolExecutor f32085b;

    /* renamed from: a, reason: collision with root package name */
    public final AtomicInteger f32084a = new AtomicInteger(1);

    /* renamed from: c, reason: collision with root package name */
    public WeakReference f32086c = new WeakReference(null);

    public h0() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 30L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new g0(this));
        this.f32085b = threadPoolExecutor;
        threadPoolExecutor.allowCoreThreadTimeOut(true);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        if (Thread.currentThread() == this.f32086c.get()) {
            runnable.run();
        } else {
            this.f32085b.execute(runnable);
        }
    }
}
