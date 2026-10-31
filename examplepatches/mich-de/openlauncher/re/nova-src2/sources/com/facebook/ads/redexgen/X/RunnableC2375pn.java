package com.facebook.ads.redexgen.X;

import android.os.SystemClock;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2375pn implements Runnable {
    public final /* synthetic */ C2376po A00;

    public RunnableC2375pn(C2376po c2376po) {
        this.A00 = c2376po;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0I()) {
                long jElapsedRealtime = (this.A00.A04 - this.A00.A00) + (SystemClock.elapsedRealtime() - this.A00.A01);
                InterfaceC2373pl interfaceC2373pl = this.A00.A02;
                if (interfaceC2373pl != null) {
                    interfaceC2373pl.AGc(jElapsedRealtime);
                }
                this.A00.A05.postDelayed(this, 250L);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
