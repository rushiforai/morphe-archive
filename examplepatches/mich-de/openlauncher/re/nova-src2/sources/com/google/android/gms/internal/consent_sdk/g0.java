package com.google.android.gms.internal.consent_sdk;

import java.lang.ref.WeakReference;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public final /* synthetic */ class g0 implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32078a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f32079b;

    public /* synthetic */ g0(h0 h0Var) {
        this.f32078a = 0;
        this.f32079b = h0Var;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        switch (this.f32078a) {
            case 0:
                h0 h0Var = (h0) this.f32079b;
                Thread thread = new Thread(runnable, b.c0.h(h0Var.f32084a.getAndIncrement(), "Google consent worker #"));
                h0Var.f32086c = new WeakReference(thread);
                return thread;
            default:
                Thread thread2 = new Thread(runnable);
                thread2.setName("arch_disk_io_" + ((AtomicInteger) this.f32079b).getAndIncrement());
                return thread2;
        }
    }

    public g0() {
        this.f32078a = 1;
        this.f32079b = new AtomicInteger(0);
    }
}
