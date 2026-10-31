package com.google.android.gms.internal.play_billing;

import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class x5 implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f33649a;

    /* renamed from: b, reason: collision with root package name */
    public final w5 f33650b = new w5(this);

    public x5(u5 u5Var) {
        this.f33649a = new WeakReference(u5Var);
    }

    @Override // com.google.android.gms.internal.play_billing.n1
    public final void c(Runnable runnable, Executor executor) {
        this.f33650b.c(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        u5 u5Var = (u5) this.f33649a.get();
        boolean zCancel = this.f33650b.cancel(z11);
        if (!zCancel || u5Var == null) {
            return zCancel;
        }
        u5Var.f33556a = null;
        u5Var.f33557b = null;
        u5Var.f33558c.i(null);
        return true;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.f33650b.get();
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f33650b.f33544a instanceof c2;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.f33650b.isDone();
    }

    public final String toString() {
        return this.f33650b.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        return this.f33650b.get(j11, timeUnit);
    }
}
