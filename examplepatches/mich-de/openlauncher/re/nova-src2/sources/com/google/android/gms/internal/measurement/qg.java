package com.google.android.gms.internal.measurement;

import java.io.Closeable;

/* loaded from: classes3.dex */
public final class qg implements Runnable, Closeable {

    /* renamed from: a, reason: collision with root package name */
    public zg f33016a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f33017b = lb.e(Thread.currentThread());

    /* renamed from: c, reason: collision with root package name */
    public boolean f33018c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f33019d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f33020e;

    public qg(zg zgVar, boolean z11) {
        this.f33020e = false;
        this.f33016a = zgVar;
        this.f33020e = z11;
    }

    public final void a(cl.s sVar) {
        if (this.f33018c) {
            throw new IllegalStateException("Span was already closed. Did you attach it to a future after calling Tracer.endSpan()?");
        }
        if (this.f33019d) {
            throw new IllegalStateException("Signal is already attached to future");
        }
        this.f33019d = true;
        sVar.b(this, cl.m0.f20038a);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        zg zgVar = this.f33016a;
        try {
            this.f33016a = null;
            boolean z11 = this.f33019d;
            if (!z11) {
                if (this.f33018c) {
                    throw new IllegalStateException("Span was already closed!");
                }
                this.f33018c = true;
                if (this.f33017b && !z11) {
                    lb.e(Thread.currentThread());
                }
            }
            if (zgVar != null) {
                zgVar.close();
            }
            if (this.f33020e) {
                jg.b(jg.c(), pg.f32968g);
            }
        } catch (Throwable th2) {
            if (zgVar != null) {
                try {
                    zgVar.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
            }
            throw th2;
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z11;
        if (this.f33018c || !(z11 = this.f33019d)) {
            lb.g().post(ae.f32379c);
            return;
        }
        this.f33018c = true;
        if (!this.f33017b || z11) {
            return;
        }
        lb.e(Thread.currentThread());
    }
}
