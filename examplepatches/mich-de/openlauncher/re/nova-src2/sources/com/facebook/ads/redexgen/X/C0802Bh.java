package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Bh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0802Bh extends AbstractRunnableC2319oq {
    public static String[] A04 = {"pUIboC8CwdUMtM1tPR8iEtPz8p", "ladzvmq", "gZiIZXhhpFNWaRiPv", "vQtAVDGFp8M", "7j30UYRlUEXcM4Kd2wK", "XchzO9Mtzl1GyvdPdWlZd1J0iwZmFx3H", "VTwPVxpRcW0", "YPnzN72MuP4y3lnuBhqZ0NoSyY"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ C0799Be A02;
    public final /* synthetic */ EnumC1549cC A03;

    public C0802Bh(C0799Be c0799Be, EnumC1549cC enumC1549cC, int i5, int i11) {
        this.A02 = c0799Be;
        this.A03 = enumC1549cC;
        this.A00 = i5;
        this.A01 = i11;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (this.A03 == EnumC1549cC.A07) {
            this.A02.A0N(EnumC2231nN.A1C);
            this.A02.A0B.A0F().A46();
            this.A02.A0C.A02(C0799Be.A0K);
            return;
        }
        if (this.A03 == EnumC1549cC.A03) {
            this.A02.A0N(EnumC2231nN.A17);
            this.A02.A04 = true;
            this.A02.A0C.A02(C0799Be.A0I);
            this.A02.A0M(this.A00);
            return;
        }
        EnumC1549cC enumC1549cC = this.A03;
        EnumC1549cC enumC1549cC2 = EnumC1549cC.A06;
        String[] strArr = A04;
        if (strArr[0].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        A04[5] = "Wlqb3PCyph61UkVVxo7ng7VZa1hYfmo4";
        if (enumC1549cC == enumC1549cC2) {
            this.A02.A0N(EnumC2231nN.A16);
            this.A02.A0B.A0F().A3y();
            this.A02.A04 = true;
            this.A02.A08.removeCallbacksAndMessages(null);
            this.A02.A0C.A02(new C5Y(this.A01, this.A01));
            this.A02.A0M(this.A01);
            return;
        }
        if (this.A03 == EnumC1549cC.A0A) {
            if (C2203mv.A1z(this.A02.A0B)) {
                this.A02.A0B.A0B().AHm();
            }
            this.A02.A0N(EnumC2231nN.A1A);
            this.A02.A0B.A0F().A4G();
            this.A02.A0C.A02(C0799Be.A0J);
            this.A02.A08.removeCallbacksAndMessages(null);
            this.A02.A0J();
            return;
        }
        if (this.A03 == EnumC1549cC.A05) {
            this.A02.A0N(EnumC2231nN.A19);
            this.A02.A0B.A0F().A42();
            C2171mP c2171mP = this.A02.A0C;
            final int i5 = this.A00;
            c2171mP.A02(new BN(i5) { // from class: com.facebook.ads.redexgen.X.5W
            });
            this.A02.A08.removeCallbacksAndMessages(null);
            this.A02.A0M(this.A00);
            return;
        }
        if (this.A03 == EnumC1549cC.A04) {
            this.A02.A0N(EnumC2231nN.A18);
            this.A02.A0B.A0F().A3z();
            this.A02.A0C.A02(C0799Be.A0M);
            this.A02.A08.removeCallbacksAndMessages(null);
            return;
        }
        if (this.A03 == EnumC1549cC.A09) {
            this.A02.A0N(EnumC2231nN.A16);
            this.A02.A0B.A0F().A4B();
            this.A02.A04 = true;
            this.A02.A08.removeCallbacksAndMessages(null);
            this.A02.A0C.A02(new C5Y(this.A00, this.A01));
            this.A02.A0M(this.A00);
        }
    }
}
