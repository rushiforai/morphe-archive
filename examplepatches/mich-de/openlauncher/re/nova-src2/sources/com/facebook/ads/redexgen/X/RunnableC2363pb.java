package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2363pb implements Runnable {
    public final /* synthetic */ C2364pc A00;

    public RunnableC2363pb(C2364pc c2364pc) {
        this.A00 = c2364pc;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A03 = true;
            this.A00.A03();
            this.A00.A04(this.A00.A08);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
