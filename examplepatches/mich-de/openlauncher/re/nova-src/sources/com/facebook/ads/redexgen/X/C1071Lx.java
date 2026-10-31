package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Lx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1071Lx {
    public boolean A00;
    public final InterfaceC1069Lu A01;

    public C1071Lx() {
        this(InterfaceC1069Lu.A00);
    }

    public C1071Lx(InterfaceC1069Lu interfaceC1069Lu) {
        this.A01 = interfaceC1069Lu;
    }

    public final synchronized void A00() throws InterruptedException {
        while (!this.A00) {
            wait();
        }
    }

    public final synchronized void A01() {
        boolean z11 = false;
        while (true) {
            boolean wasInterrupted = this.A00;
            if (wasInterrupted) {
                break;
            }
            try {
                wait();
            } catch (InterruptedException unused) {
                z11 = true;
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
    }

    public final synchronized boolean A02() {
        boolean z11;
        z11 = this.A00;
        this.A00 = false;
        return z11;
    }

    public final synchronized boolean A03() {
        return this.A00;
    }

    public final synchronized boolean A04() {
        if (this.A00) {
            return false;
        }
        this.A00 = true;
        notifyAll();
        return true;
    }

    public final synchronized boolean A05(long j11) throws InterruptedException {
        if (j11 <= 0) {
            return this.A00;
        }
        long nowMs = this.A01.A6s();
        long j12 = nowMs + j11;
        if (j12 < nowMs) {
            A00();
        } else {
            while (!this.A00 && nowMs < j12) {
                long endMs = j12 - nowMs;
                wait(endMs);
                nowMs = this.A01.A6s();
            }
        }
        return this.A00;
    }
}
