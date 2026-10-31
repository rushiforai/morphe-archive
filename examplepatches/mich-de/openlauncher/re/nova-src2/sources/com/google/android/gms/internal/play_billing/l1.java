package com.google.android.gms.internal.play_billing;

import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class l1 implements n1 {

    /* renamed from: b, reason: collision with root package name */
    public static final m1 f33444b = new m1(l1.class);

    /* renamed from: a, reason: collision with root package name */
    public final Object f33445a;

    public l1(Object obj) {
        this.f33445a = obj;
    }

    @Override // com.google.android.gms.internal.play_billing.n1
    public final void c(Runnable runnable, Executor executor) {
        if (executor == null) {
            throw new NullPointerException("Executor was null.");
        }
        try {
            executor.execute(runnable);
        } catch (Exception e3) {
            f33444b.a().logp(Level.SEVERE, "com.google.common.util.concurrent.ImmediateFuture", "addListener", b.c0.m("RuntimeException while executing runnable ", runnable.toString(), " with executor ", String.valueOf(executor)), (Throwable) e3);
        }
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        return false;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.f33445a;
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return false;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return true;
    }

    public final String toString() {
        return a80.m.h(super.toString(), "[status=SUCCESS, result=[", this.f33445a.toString(), "]]");
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        timeUnit.getClass();
        return this.f33445a;
    }
}
