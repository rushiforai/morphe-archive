package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Nw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1122Nw implements InterfaceC1602d3 {
    public static String[] A06 = {"DHB0POcPulic", "MmhVBmvLGTSAZOkR6rxXtA", "LuLWJ4grSGFWkIPrirGcW9gmkc", b.f42142b, "rwUzpbX9RfbTCC", "HTgeiwQw48de", "C6i9nNWVCFzdPdraWB8iBbfITiLjcqTl", b.f42142b};
    public int A00;
    public int A01;
    public boolean A02;
    public boolean A03;
    public final C1084Mk A04 = new C1084Mk(32);
    public final InterfaceC1593cu A05;

    public C1122Nw(InterfaceC1593cu interfaceC1593cu) {
        this.A05 = interfaceC1593cu;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void A5k(C1084Mk c1084Mk, int i5) {
        boolean z11 = (i5 & 1) != 0;
        int iA09 = -1;
        if (z11) {
            iA09 = c1084Mk.A09() + c1084Mk.A0I();
        }
        boolean payloadUnitStartIndicator = this.A03;
        if (payloadUnitStartIndicator) {
            if (!z11) {
                return;
            }
            this.A03 = false;
            c1084Mk.A0f(iA09);
            this.A00 = 0;
        }
        while (c1084Mk.A07() > 0) {
            int i11 = this.A00;
            if (A06[2].length() != 26) {
                throw new RuntimeException();
            }
            A06[6] = "fZodozjggLqNFu6LL9x0Aapv2nTgyMll";
            if (i11 < 3) {
                if (this.A00 == 0) {
                    int iA0I = c1084Mk.A0I();
                    c1084Mk.A0f(c1084Mk.A09() - 1);
                    if (iA0I == 255) {
                        this.A03 = true;
                        return;
                    }
                }
                int iMin = Math.min(c1084Mk.A07(), 3 - this.A00);
                c1084Mk.A0k(this.A04.A0l(), this.A00, iMin);
                this.A00 += iMin;
                if (this.A00 == 3) {
                    this.A04.A0f(0);
                    this.A04.A0e(3);
                    this.A04.A0g(1);
                    int iA0I2 = this.A04.A0I();
                    int iA0I3 = this.A04.A0I();
                    this.A02 = (iA0I2 & 128) != 0;
                    this.A01 = (((iA0I2 & 15) << 8) | iA0I3) + 3;
                    if (this.A04.A08() < this.A01) {
                        this.A04.A0c(Math.min(4098, Math.max(this.A01, this.A04.A08() * 2)));
                    }
                }
            } else {
                int iMin2 = Math.min(c1084Mk.A07(), this.A01 - this.A00);
                c1084Mk.A0k(this.A04.A0l(), this.A00, iMin2);
                this.A00 += iMin2;
                if (this.A00 == this.A01) {
                    boolean payloadUnitStartIndicator2 = this.A02;
                    if (payloadUnitStartIndicator2) {
                        if (N1.A0I(this.A04.A0l(), 0, this.A01, -1) != 0) {
                            this.A03 = true;
                            return;
                        }
                        this.A04.A0e(this.A01 - 4);
                    } else {
                        this.A04.A0e(this.A01);
                    }
                    this.A04.A0f(0);
                    this.A05.A5j(this.A04);
                    this.A00 = 0;
                } else {
                    continue;
                }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void AAo(C1092Ms c1092Ms, InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        this.A05.AAo(c1092Ms, interfaceC1384Yw, c1601d2);
        this.A03 = true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void AKN() {
        this.A03 = true;
    }
}
