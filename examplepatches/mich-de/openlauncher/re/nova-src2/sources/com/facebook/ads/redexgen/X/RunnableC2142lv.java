package com.facebook.ads.redexgen.X;

import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.lv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2142lv implements Runnable {
    public final /* synthetic */ C7O A00;
    public final /* synthetic */ C2141lu A01;

    public RunnableC2142lv(C7O c7o, C2141lu c2141lu) {
        this.A00 = c7o;
        this.A01 = c2141lu;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A1Z(this.A01.A01);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
