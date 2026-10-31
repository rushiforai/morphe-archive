package com.facebook.ads.redexgen.X;

import android.app.Activity;

/* renamed from: com.facebook.ads.redexgen.X.pE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2341pE {
    public static final C2341pE A04 = new C2341pE(new GD(), new GC());
    public final InterfaceC2340pD A02;
    public final InterfaceC2415qR A03;
    public boolean A01 = true;
    public long A00 = -1;

    public C2341pE(InterfaceC2415qR interfaceC2415qR, InterfaceC2340pD interfaceC2340pD) {
        this.A03 = interfaceC2415qR;
        this.A02 = interfaceC2340pD;
    }

    public static C2341pE A00() {
        return A04;
    }

    public final synchronized void A01() {
        this.A01 = false;
        this.A00 = this.A03.A6M();
    }

    public final synchronized void A02() {
        this.A00 = -1L;
    }

    public final boolean A03() {
        Activity lastResumedActivity = this.A02.A8y();
        boolean z11 = true;
        if (lastResumedActivity != null) {
            return true;
        }
        synchronized (C2341pE.class) {
            if (this.A01) {
                return true;
            }
            if (this.A00 >= 0 && this.A03.A6M() - this.A00 >= 1000) {
                z11 = false;
            }
            return z11;
        }
    }
}
