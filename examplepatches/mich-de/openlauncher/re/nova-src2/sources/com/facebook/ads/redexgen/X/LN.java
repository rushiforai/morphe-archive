package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class LN extends AbstractC1710ep {
    public static byte[] A06;
    public static String[] A07 = {"RwkPFHsv9wotgH8PCqYhpIij5lIi", "drIC7gYxypHASOm9CvVJaHIQeep0", "f0dvIXyq27iv5zRXvkJTu2cqkG", "fzusVvXWPget8SSdASQ7tAMFHi8p37he", "Ar6p", "jDkSEm6Ik6fEWWn08WKTicIvFe3Dtksc", "J7vaKr0jTjoObEFZmlhET1S0K8S4ujA7", "2rimL2d5m8eNJCurq2ysJBza56R6EvG7"};
    public LP A00;
    public EnumC2264nw A01;
    public boolean A02;
    public final C0958Hi A03;
    public final InterfaceC2224nG A04;
    public final AbstractC2607tX A05;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A06 = new byte[]{94, 93, 82, 82, 89, 78};
    }

    static {
        A04();
    }

    public LN(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, AbstractC2607tX abstractC2607tX, C1539c2 c1539c2, AbstractC1711eq abstractC1711eq, EnumC2264nw enumC2264nw) {
        super(c0958Hi, abstractC1711eq, c1539c2);
        this.A04 = interfaceC2224nG;
        this.A05 = abstractC2607tX;
        this.A03 = c0958Hi;
        this.A01 = enumC2264nw;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1710ep
    public final void A0A(Map<String, String> map) {
        String string;
        if (this.A00 != null && !TextUtils.isEmpty(this.A00.A7z())) {
            this.A03.A0F().A3h();
            AbstractC1813gU.A02(this.A00.A05(), AbstractC2401qD.A00(A03(0, 6, 82)));
            this.A04.AC7(this.A00.A7z(), map);
            C0958Hi c0958Hi = this.A03;
            String[] strArr = A07;
            if (strArr[7].charAt(31) != strArr[6].charAt(31)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[0] = "Tkg0tGhzpCvpbpNuTPjRHtf4b45H";
            strArr2[1] = "dBPpzaB1YNfwJk5banXGE19c57tB";
            if (C2203mv.A19(c0958Hi)) {
                if (this.A01 == EnumC2264nw.A08) {
                    string = AdPlacementType.MEDIUM_RECTANGLE.toString();
                } else {
                    string = AdPlacementType.BANNER.toString();
                }
                C2328oz c2328ozA00 = C2328oz.A00(this.A03);
                String placementType = this.A00.A7z();
                c2328ozA00.A0E(string, placementType);
            }
        }
    }

    public final synchronized void A0B() {
        if (!this.A02 && this.A00 != null) {
            this.A02 = true;
            if (!TextUtils.isEmpty(this.A00.A03())) {
                ExecutorC2419qV.A00(new LO(this));
            }
        }
    }

    public final void A0C(LP lp2) {
        this.A00 = lp2;
    }
}
