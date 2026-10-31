package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.5Z, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C5Z extends BR {
    public int A00;
    public C1772fp A01;
    public boolean A02;
    public final AbstractC2172mQ<C5Y> A03;
    public final AbstractC2172mQ<C5W> A04;
    public final AbstractC2172mQ<BF> A05;
    public final AbstractC2172mQ<C5V> A06;
    public final AbstractC2172mQ<BA> A07;
    public final AbstractC2172mQ<B8> A08;
    public final AbstractC2172mQ<B7> A09;
    public final AbstractC2172mQ<B2> A0A;
    public final AbstractC2172mQ<B1> A0B;
    public final C0799Be A0C;
    public final BC A0D;
    public final B3 A0E;

    public C5Z(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C0799Be c0799Be, String str) {
        this(c0958Hi, interfaceC2224nG, c0799Be, str, 0, 0, false, null, null);
    }

    public C5Z(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C0799Be c0799Be, String str, int i5, int i11, boolean z11, Bundle bundle, Map<String, String> map) {
        super(c0958Hi, interfaceC2224nG, c0799Be, str, !c0799Be.A0n(), i5, i11, z11, bundle, map, new BQ(c0958Hi, c0799Be));
        this.A0E = new B3() { // from class: com.facebook.ads.redexgen.X.5a
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(B4 b42) {
                this.A00.A0f();
            }
        };
        this.A08 = new C0796Bb(this);
        this.A04 = new C0795Ba(this);
        this.A05 = new BZ(this);
        this.A06 = new BY(this);
        this.A03 = new BX(this);
        this.A07 = new BW(this);
        this.A0A = new BV(this);
        this.A0B = new BU(this);
        this.A09 = new C0798Bd(this);
        this.A0D = new BC() { // from class: com.facebook.ads.redexgen.X.5b
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A00 = this.A00.A0C.getDuration();
            }
        };
        this.A02 = false;
        this.A0C = c0799Be;
        this.A0C.getEventBus().A03(this.A0E, this.A06, this.A08, this.A05, this.A04, this.A03, this.A07, this.A0A, this.A0B, this.A0D, this.A09);
        if (C2203mv.A2x(c0958Hi)) {
            this.A01 = new C1772fp(c0799Be, str, z11, null);
        }
    }

    public C5Z(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C0799Be c0799Be, String str, Bundle bundle, Map<String, String> extraParams) {
        this(c0958Hi, interfaceC2224nG, c0799Be, str, 0, 0, false, bundle, extraParams);
    }

    @Override // com.facebook.ads.redexgen.X.BR
    public final void A0n(EnumC1733fC enumC1733fC, Map<String, String> params) {
        super.A0n(enumC1733fC, params);
        if (this.A01 != null && enumC1733fC == EnumC1733fC.A09) {
            params.putAll(this.A01.A06());
        }
    }

    public final void A0p() {
        C0797Bc c0797Bc = new C0797Bc(this);
        if (this.A0C.A0r()) {
            ExecutorC2419qV.A00(c0797Bc);
        } else {
            this.A0C.getStateHandler().post(c0797Bc);
        }
    }
}
