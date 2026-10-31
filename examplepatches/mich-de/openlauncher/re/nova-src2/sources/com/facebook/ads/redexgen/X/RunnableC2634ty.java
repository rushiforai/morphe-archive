package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ty, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2634ty implements Runnable {
    public final /* synthetic */ C2635tz A00;

    public RunnableC2634ty(C2635tz c2635tz) {
        this.A00 = c2635tz;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A03.getVisibility() != 0) {
                return;
            }
            this.A00.A07(8);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
