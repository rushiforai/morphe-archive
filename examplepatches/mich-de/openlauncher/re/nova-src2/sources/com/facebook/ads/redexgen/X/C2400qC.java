package com.facebook.ads.redexgen.X;

import java.io.Closeable;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.qC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2400qC implements Closeable {
    public C2399qB A00;
    public boolean A01;
    public final C2398qA A02;
    public final Runnable A03;

    public C2400qC(long j11, Runnable runnable) {
        this.A02 = new C2398qA(j11);
        this.A02.A02();
        this.A03 = runnable;
        this.A01 = false;
    }

    private final synchronized void A03() {
        if (this.A00 == null && !this.A01) {
            this.A00 = new C2399qB(this);
        }
    }

    public final C2398qA A04() {
        return this.A02;
    }

    public final synchronized void A05() {
        if (this.A01) {
            return;
        }
        if (this.A00 == null) {
            this.A00 = new C2399qB(this);
        }
        this.A00.A00();
    }

    public final synchronized void A06() {
        if (this.A02.A05() && !this.A01) {
            A03();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        C2399qB executing;
        synchronized (this) {
            this.A01 = true;
            executing = this.A00;
        }
        if (executing != null) {
            executing.close();
        }
    }
}
