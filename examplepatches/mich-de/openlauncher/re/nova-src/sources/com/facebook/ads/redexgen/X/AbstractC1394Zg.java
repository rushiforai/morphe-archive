package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Zg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1394Zg {
    public final ZP A00;

    public abstract boolean A0B(C1084Mk c1084Mk) throws L9;

    public abstract boolean A0C(C1084Mk c1084Mk, long j11) throws L9;

    public AbstractC1394Zg(ZP zp2) {
        this.A00 = zp2;
    }

    public final boolean A00(C1084Mk c1084Mk, long j11) throws L9 {
        return A0B(c1084Mk) && A0C(c1084Mk, j11);
    }
}
