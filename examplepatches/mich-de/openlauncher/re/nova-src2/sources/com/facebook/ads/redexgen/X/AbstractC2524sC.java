package com.facebook.ads.redexgen.X;

import android.widget.FrameLayout;
import com.facebook.ads.AdClosedListener;

/* renamed from: com.facebook.ads.redexgen.X.sC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2524sC extends FrameLayout {
    public static String[] A0E = {"AAeZRN2H16PPhMJrfuA2G4PuGtT4Jjli", "OIhbSlqkB188ZcHiABYu6F5MkKYuApEU", "4dNIifo7dYPF8CZDUdmIVRVLxTf4KjLi", "nNT7Gm4j1GPvPSvjwdusJnzdrzE", "GlaPNPfWvOmZlDbzC", "MG9AH3sD678j7mtR5VZ1R1Wgg0cAPJ", "gwWnxwxKgg1hGV", "MUdeuAMc7brNflaDgveS0ucCfNh"};
    public int A00;
    public AdClosedListener A01;
    public EnumC1821gc A02;
    public C1822gd A03;
    public C1823ge A04;
    public InterfaceC2523sB A05;
    public final C1819ga A06;
    public final C0958Hi A07;
    public final InterfaceC2224nG A08;
    public final InterfaceC2459r9 A09;
    public final InterfaceC2460rA A0A;
    public final String A0B;
    public final C1756fZ A0C;
    public final InterfaceC2526sE A0D;

    public abstract void A0O();

    public abstract void A0P();

    public abstract void A0R(C1823ge c1823ge, EnumC1821gc enumC1821gc);

    public abstract boolean A0S();

    public AbstractC2524sC(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str) {
        this(c0958Hi, interfaceC2224nG, str, null, null, null);
    }

    public AbstractC2524sC(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, C1756fZ c1756fZ, InterfaceC2460rA interfaceC2460rA, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi);
        this.A00 = 0;
        this.A02 = EnumC1821gc.A04;
        this.A04 = null;
        this.A0D = new FF(this);
        this.A07 = c0958Hi;
        this.A08 = interfaceC2224nG;
        this.A0A = interfaceC2460rA;
        this.A09 = interfaceC2459r9;
        this.A0B = str;
        this.A0C = c1756fZ;
        this.A06 = AbstractC1820gb.A00(this.A07.A02());
    }

    public static /* synthetic */ int A02(AbstractC2524sC abstractC2524sC) {
        int i5 = abstractC2524sC.A00;
        abstractC2524sC.A00 = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int A03(AbstractC2524sC abstractC2524sC) {
        int i5 = abstractC2524sC.A00;
        abstractC2524sC.A00 = i5 - 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0E() {
        if (this.A03 != null && this.A03.A0A()) {
            this.A08.ABo(this.A0B, this.A03.A02());
            this.A03.A03();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0F() {
        this.A04 = null;
        if (this.A03 != null) {
            this.A03.A05();
        }
        A0O();
        if (A0E[4].length() != 17) {
            throw new RuntimeException();
        }
        String[] strArr = A0E;
        strArr[6] = "T97PvisYvRSslU";
        strArr[5] = "4m6IDlN75J4PWuz7VqWCz3A27IQvrs";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0G(C1823ge c1823ge) {
        if (this.A03 != null) {
            this.A03.A08(this.A02);
        }
        A0Q(c1823ge, this.A02);
        C1715eu.A01(this.A07).A0L();
        if (A0S()) {
            A0E();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0H(C1823ge c1823ge) {
        this.A04 = c1823ge;
        if (this.A03 != null) {
            this.A03.A09(this.A02, this.A00);
        }
        A0R(c1823ge, this.A02);
    }

    public final void A0M() {
        A0E();
    }

    public final void A0N() {
        this.A03 = new C1822gd(new C2232nO(this.A0B, this.A08));
        if (this.A0A != null) {
            this.A0A.AGF(true);
        }
        if (this.A05 != null) {
            this.A05.ADo();
        }
        A0F();
    }

    public void A0Q(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        if (this.A01 != null) {
            this.A07.A0F().ACJ();
            this.A01.onAdClosed();
        }
    }

    public void setAdReportingCallbackListener(InterfaceC2523sB interfaceC2523sB) {
        this.A05 = interfaceC2523sB;
    }

    public void setOnAdClosedListener(AdClosedListener adClosedListener) {
        this.A01 = adClosedListener;
    }
}
