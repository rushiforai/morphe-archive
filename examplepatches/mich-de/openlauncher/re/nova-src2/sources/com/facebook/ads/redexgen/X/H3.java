package com.facebook.ads.redexgen.X;

import java.util.Set;

/* loaded from: assets/audience_network/classes.dex */
public final class H3 implements InterfaceC05992t<C2210n2, C2215n7> {
    public H0 A00;

    @Override // com.facebook.ads.redexgen.X.InterfaceC05992t
    public final /* synthetic */ Set A4a() {
        return AbstractC06012v.A00(this);
    }

    public H3(H0 h02) {
        this.A00 = h02;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2l != com.instagram.common.viewpoint.core.ViewpointData<com.facebook.ads.internal.impressionsecondchannel.model.Impression, com.facebook.ads.internal.impressionsecondchannel.state.ImpressionState> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC05992t
    public final void A70(C05912l<C2210n2, C2215n7> c05912l, C2Z c2z) {
        switch (c2z.AA7(c05912l)) {
            case A03:
            case A05:
                this.A00.A02(c05912l, c2z);
                break;
        }
    }
}
