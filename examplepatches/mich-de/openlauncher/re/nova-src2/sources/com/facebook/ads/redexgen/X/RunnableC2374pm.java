package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2374pm implements Runnable {
    public final /* synthetic */ C2376po A00;

    public RunnableC2374pm(C2376po c2376po) {
        this.A00 = c2376po;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05.removeCallbacks(this.A00.A07);
            this.A00.A03 = false;
            this.A00.A00 = 0L;
            InterfaceC2373pl interfaceC2373pl = this.A00.A02;
            if (interfaceC2373pl != null) {
                interfaceC2373pl.AGc(this.A00.A04);
            }
            this.A00.A06.AHJ();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
