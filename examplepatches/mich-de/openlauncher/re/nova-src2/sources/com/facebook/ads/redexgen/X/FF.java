package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public class FF implements InterfaceC2526sE {
    public static byte[] A01;
    public static String[] A02 = {"nV", "0i4Wqrqqd8V", "SjjlSsHq4luZ", "UY2G1G5tdkkQRCLDawUW8PMELrtkam", "x8YzSsjyce", "sMLSYBAewXVAxhh2DbXf8YHA5QSbjC", "Z41BjwW", "WlPnbv1jMaDivlCQdRIz8mOz1GWjjHLQ"};
    public final /* synthetic */ AbstractC2524sC A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-29, -17, -19, -82, -26, -31, -29, -27, -30, -17, -17, -21, -82, -31, -28, -13, -82, -31, -28, -14, -27, -16, -17, -14, -12, -23, -18, -25, -82, -58, -55, -50, -55, -45, -56, -33, -63, -60, -33, -46, -59, -48, -49, -46, -44, -55, -50, -57, -33, -58, -52, -49, -41};
        String[] strArr = A02;
        if (strArr[4].length() == strArr[1].length()) {
            throw new RuntimeException();
        }
        A02[7] = "41BFLxMtpa8zSeOoPh8lyezFWRN0z1Os";
    }

    static {
        A01();
    }

    public FF(AbstractC2524sC abstractC2524sC) {
        this.A00 = abstractC2524sC;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void A5c() {
        if (this.A00.A09 == null) {
            return;
        }
        this.A00.A09.A5C(A00(0, 53, 17));
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0053  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A5d() {
        this.A00.A0P();
        if (this.A00.A0A != null) {
            this.A00.A0A.AGp(true);
        }
        if (this.A00.A05 != null) {
            InterfaceC2523sB interfaceC2523sB = this.A00.A05;
            String[] strArr = A02;
            if (strArr[4].length() != strArr[1].length()) {
                A02[2] = "wiJwg3n4JCc";
                interfaceC2523sB.ADn();
                this.A00.A0E();
                if (A02[2].length() != 19) {
                    A02[6] = "OhUE2NP";
                    return;
                }
            }
        } else {
            this.A00.A0E();
            if (A02[2].length() != 19) {
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void AAG() {
        if (this.A00.A04 == null) {
            A5d();
            return;
        }
        AbstractC2524sC.A03(this.A00);
        if (this.A00.A04.A02() == null) {
            AbstractC2524sC abstractC2524sC = this.A00;
            if (A02[6].length() != 7) {
                throw new RuntimeException();
            }
            A02[7] = "M7aB9yPR9altU9X1FYnvgfaKEANBwcUB";
            abstractC2524sC.A0F();
        } else {
            this.A00.A0H(this.A00.A04.A02());
        }
        if (C2203mv.A2b(this.A00.A07)) {
            this.A00.performAccessibilityAction(128, null);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void ABX() {
        if (!TextUtils.isEmpty(this.A00.A06.A0I())) {
            C2347pK.A0P(new C2347pK(), this.A00.A07, AbstractC2351pP.A00(this.A00.A06.A0I()), this.A00.A0B);
        }
        if (this.A00.A03 == null) {
            return;
        }
        this.A00.A03.A04();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void ABY() {
        this.A00.A0P();
        if (this.A00.A0A != null) {
            this.A00.A0A.AGp(true);
        }
        if (!TextUtils.isEmpty(this.A00.A06.A0C())) {
            C2347pK.A0P(new C2347pK(), this.A00.A07, AbstractC2351pP.A00(this.A00.A06.A0C()), this.A00.A0B);
        }
        if (this.A00.A03 != null) {
            this.A00.A03.A06();
        }
        this.A00.A0E();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void AFv(EnumC1821gc enumC1821gc) {
        AbstractC2524sC.A02(this.A00);
        this.A00.A02 = enumC1821gc;
        this.A00.A0H(this.A00.A02 == EnumC1821gc.A03 ? this.A00.A06.A0A() : this.A00.A06.A0B());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2526sE
    public final void AG9(C1823ge c1823ge) {
        AbstractC2524sC.A02(this.A00);
        if (this.A00.A03 != null) {
            this.A00.A03.A07(c1823ge.A01());
        }
        List<C1823ge> listA05 = c1823ge.A05();
        if (A02[2].length() == 19) {
            throw new RuntimeException();
        }
        A02[7] = "TiWZaQmdYanhhmDQ1Z6mCdwiNcdolR51";
        if (!listA05.isEmpty()) {
            this.A00.A0H(c1823ge);
        } else {
            this.A00.A0G(c1823ge);
        }
    }
}
