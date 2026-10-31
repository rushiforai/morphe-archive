package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Timeline;

/* renamed from: com.facebook.ads.redexgen.X.Wi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1323Wi {
    public InterfaceC1322Wh A00;
    public InterfaceC1333Ws A01;

    public abstract boolean A0Y();

    public abstract C1324Wj A0b(InterfaceC1153Pe[] interfaceC1153PeArr, RY ry2, C1202Rk c1202Rk, Timeline timeline) throws AnonymousClass96;

    public abstract void A0c(Object obj);

    public final InterfaceC1333Ws A00() {
        return (InterfaceC1333Ws) AbstractC1062Ln.A02(this.A01);
    }

    public final void A01() {
        if (this.A00 != null) {
            this.A00.AHM();
        }
    }

    public final void A02(InterfaceC1322Wh interfaceC1322Wh, InterfaceC1333Ws interfaceC1333Ws) {
        this.A00 = interfaceC1322Wh;
        this.A01 = interfaceC1333Ws;
    }
}
