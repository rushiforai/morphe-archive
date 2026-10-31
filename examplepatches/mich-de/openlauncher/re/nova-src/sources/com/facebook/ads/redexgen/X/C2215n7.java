package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.n7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2215n7 {
    public static String[] A04 = {"VLi8WrXKJp9LAfXNm4uZETrUUakGZ0WJ", "E0EVlIE69utJBkpy2DAhge3Hway87PLR", "qesF58zlzdTn3lZrcRPwRcXAd51VIYsw", "DEhD", "3RGnWFLj1o7mNylLhDHkdliNsrvaqEmP", "q3CsqlllThy2l0WXj26QCfAwDyJHO8xz", "YGqlmSv0HhFp83FTVTLuq2K4C5WSoxDU", "sGX8UiLG8Isc3yhet7ELjp1Y4Ecy5PZh"};
    public EnumC2212n4 A01 = EnumC2212n4.A02;
    public EnumC2213n5 A02 = EnumC2213n5.A07;
    public EnumC2214n6 A03 = EnumC2214n6.A02;
    public EnumC2211n3 A00 = EnumC2211n3.A02;

    public final void A00() {
        this.A00 = EnumC2211n3.A03;
    }

    public final void A01() {
        this.A02 = EnumC2213n5.A05;
    }

    public final void A02() {
        this.A02 = EnumC2213n5.A06;
    }

    public final void A03() {
        this.A03 = EnumC2214n6.A03;
    }

    public final boolean A04() {
        if (this.A02 != EnumC2213n5.A07 && this.A02 != EnumC2213n5.A03) {
            EnumC2213n5 enumC2213n5 = this.A02;
            if (A04[4].charAt(28) != 'q') {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[7] = "MUDNUnKN31103IrO48BPEmRZSZgb6Srw";
            strArr[2] = "6QfhYTpMJgBL3pE6aQQCkQeTlukRlAkO";
            if (enumC2213n5 != EnumC2213n5.A06) {
                return false;
            }
        }
        return true;
    }

    public final boolean A05() {
        return this.A02 == EnumC2213n5.A07 || this.A02 == EnumC2213n5.A03;
    }

    public final boolean A06() {
        return this.A03 == EnumC2214n6.A03;
    }

    public final boolean A07() {
        return this.A00 == EnumC2211n3.A03;
    }
}
