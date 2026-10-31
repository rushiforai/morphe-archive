package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.9J, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C9J implements TE {
    public static String[] A04 = {"isuZk4LYvPtzcJmYXN55NQD4bjZcpqJn", "6Js", "4Hvb7CdVaEKj9bi8gEJZKIBZaVtBBdMl", "YCKTvsMXz3llo15twFpneIfIj1hgPSnw", "UeqJ4HHO1DLcEUC6RLoigQ09", "r2W4uoxvkTEWcf6mnFycXLGKFVJU", "wE1NNsV0QTEKxapJX1OFponH", "nRXIAIHDX3jmS6ZOUJ00SCHf0iMD"};
    public int A00;
    public NX A01;
    public final ArrayList<InterfaceC1108Ni> A02 = new ArrayList<>(1);
    public final boolean A03;

    @Override // com.facebook.ads.redexgen.X.TE
    public /* synthetic */ Map A9W() {
        return NM.A00(this);
    }

    public C9J(boolean z11) {
        this.A03 = z11;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0D(NX nx2, boolean z11) {
        this.A01 = nx2;
        for (int i5 = 0; i5 < i; i5++) {
            this.A02.get(i5).AHQ(this, nx2, this.A03, z11);
        }
    }

    public final void A0E() {
        NX nx2 = (NX) N1.A0f(this.A01);
        for (int i5 = 0; i5 < this.A00; i5++) {
            this.A02.get(i5).AHP(this, nx2, this.A03);
        }
        this.A01 = null;
    }

    public final void A0F(int i5) {
        NX nx2 = (NX) N1.A0f(this.A01);
        int i11 = 0;
        while (true) {
            int i12 = this.A00;
            String[] strArr = A04;
            String str = strArr[0];
            String str2 = strArr[2];
            int i13 = str.charAt(12);
            if (i13 == str2.charAt(12)) {
                throw new RuntimeException();
            }
            A04[1] = "0wB";
            if (i11 < i12) {
                this.A02.get(i11).AEI(this, nx2, this.A03, i5);
                i11++;
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0003 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0G(NX nx2) {
        for (int i5 = 0; i5 < i; i5++) {
            this.A02.get(i5);
        }
    }

    public final void A0H(NX nx2) {
        A0D(nx2, false);
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
        AbstractC1062Ln.A01(interfaceC1108Ni);
        if (!this.A02.contains(interfaceC1108Ni)) {
            this.A02.add(interfaceC1108Ni);
            this.A00++;
        }
    }
}
