package com.vungle.ads.internal.executor;

import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Future {

    /* renamed from: b, reason: collision with root package name */
    public static final String f46815b = "b";

    /* renamed from: a, reason: collision with root package name */
    public final Future f46816a;

    public b(Future future) {
        this.f46816a = future;
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        Future future = this.f46816a;
        if (future != null) {
            return future.cancel(z11);
        }
        return false;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        try {
            Future future = this.f46816a;
            if (future != null) {
                return future.get();
            }
            return null;
        } catch (InterruptedException unused) {
            boolean z11 = u.f47714a;
            String TAG = f46815b;
            Intrinsics.f(TAG, "TAG");
            t.c(TAG, "future.get() Interrupted on Thread " + Thread.currentThread().getName());
            Thread.currentThread().interrupt();
            return null;
        } catch (ExecutionException e3) {
            boolean z12 = u.f47714a;
            String TAG2 = f46815b;
            Intrinsics.f(TAG2, "TAG");
            t.a(TAG2, "error on execution", e3);
            return null;
        }
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        Future future = this.f46816a;
        if (future != null) {
            return future.isCancelled();
        }
        return false;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        Future future = this.f46816a;
        if (future != null) {
            return future.isDone();
        }
        return false;
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit unit) {
        Intrinsics.g(unit, "unit");
        try {
            Future future = this.f46816a;
            if (future != null) {
                return future.get(j11, unit);
            }
            return null;
        } catch (InterruptedException unused) {
            boolean z11 = u.f47714a;
            String TAG = f46815b;
            Intrinsics.f(TAG, "TAG");
            t.c(TAG, "future.get() Interrupted on Thread " + Thread.currentThread().getName());
            Thread.currentThread().interrupt();
            return null;
        } catch (ExecutionException e3) {
            boolean z12 = u.f47714a;
            String TAG2 = f46815b;
            Intrinsics.f(TAG2, "TAG");
            t.a(TAG2, "error on execution", e3);
            return null;
        } catch (TimeoutException e11) {
            boolean z13 = u.f47714a;
            String TAG3 = f46815b;
            Intrinsics.f(TAG3, "TAG");
            t.a(TAG3, "error on timeout", e11);
            t.c(TAG3, "future.get() Timeout on Thread " + Thread.currentThread().getName());
            return null;
        }
    }
}
