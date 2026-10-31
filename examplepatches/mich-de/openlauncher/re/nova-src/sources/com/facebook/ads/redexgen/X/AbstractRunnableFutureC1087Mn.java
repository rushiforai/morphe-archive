package com.facebook.ads.redexgen.X;

import java.lang.Exception;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* renamed from: com.facebook.ads.redexgen.X.Mn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractRunnableFutureC1087Mn<R, E extends Exception> implements RunnableFuture<R> {
    public Exception A00;
    public R A01;
    public Thread A02;
    public boolean A03;
    public final C1071Lx A05 = new C1071Lx();
    public final C1071Lx A04 = new C1071Lx();
    public final Object A06 = new Object();

    public abstract R A01() throws Exception;

    public abstract void A03();

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    private R A00() throws ExecutionException {
        if (!this.A03) {
            if (this.A00 == null) {
                return this.A01;
            }
            throw new ExecutionException(this.A00);
        }
        throw new CancellationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    public final void A02() {
        this.A04.A01();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        synchronized (this.A06) {
            if (this.A03 || this.A04.A03()) {
                return false;
            }
            this.A03 = true;
            A03();
            Thread thread = this.A02;
            if (thread != null) {
                if (z11) {
                    thread.interrupt();
                }
            } else {
                this.A05.A04();
                this.A04.A04();
            }
            return true;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.Future
    public final R get() throws ExecutionException, InterruptedException {
        this.A04.A00();
        return A00();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.Future
    public final R get(long j11, TimeUnit timeUnit) throws ExecutionException, InterruptedException, TimeoutException {
        if (this.A04.A05(TimeUnit.MILLISECONDS.convert(j11, timeUnit))) {
            return A00();
        }
        throw new TimeoutException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.A03;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.A04.A03();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<R, E extends java.lang.Exception> */
    @Override // java.util.concurrent.RunnableFuture, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            synchronized (this.A06) {
                try {
                    if (this.A03) {
                        try {
                            return;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    }
                    this.A02 = Thread.currentThread();
                    this.A05.A04();
                    try {
                        try {
                            this.A01 = A01();
                            synchronized (this.A06) {
                                try {
                                    this.A04.A04();
                                    this.A02 = null;
                                    Thread.interrupted();
                                } catch (Throwable th3) {
                                    th = th3;
                                    while (true) {
                                        try {
                                            throw th;
                                        } catch (Throwable th4) {
                                        }
                                    }
                                }
                            }
                        } catch (Exception e3) {
                            this.A00 = e3;
                            synchronized (this.A06) {
                                try {
                                    this.A04.A04();
                                    this.A02 = null;
                                    Thread.interrupted();
                                } finally {
                                    th = th;
                                    while (true) {
                                        try {
                                        } catch (Throwable th5) {
                                            th = th5;
                                        }
                                    }
                                }
                            }
                        }
                    } catch (Throwable th6) {
                        synchronized (this.A06) {
                            this.A04.A04();
                            this.A02 = null;
                            Thread.interrupted();
                            throw th6;
                        }
                    }
                } catch (Throwable th7) {
                    th = th7;
                }
            }
        } catch (Throwable th8) {
            AbstractC2311oi.A00(th8, this);
        }
    }
}
