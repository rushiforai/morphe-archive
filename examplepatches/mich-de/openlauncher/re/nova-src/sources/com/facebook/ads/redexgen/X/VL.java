package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* loaded from: assets/audience_network/classes.dex */
public final class VL implements InterfaceC1018Jt {
    public Jo A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public static String[] A06 = {"RzYfNoMYcraHdY97o72y5SaeihK1Ztvv", "vjYG0c31y56prRel8vYk8Bpak1PocMUh", "dfxmatFiNvP9hSuL3LPmUKiC9gG3nQht", "JTv6rEt7nFdMJkwWS0x5u0IiQaF5ze30", "vmQpx5ObQbEZCmEzbP9elPWMJRFmrKCr", "uNbuNYUsV0K9GgwPFq3yj1D7AAPzTxzO", "9HMy9JZguRbTXmE2huzWeI0Wqqj6RWZB", "emZZOWdTIcdM1EwrEwZ0sIkDdyRItzd8"};
    public static final VL A07 = new C1014Jp().A05();
    public static final String A0A = N1.A0h(0);
    public static final String A0B = N1.A0h(1);
    public static final String A0D = N1.A0h(2);
    public static final String A09 = N1.A0h(3);
    public static final String A0C = N1.A0h(4);
    public static final InterfaceC1017Js<VL> A08 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.VM
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return VL.A00(bundle);
        }
    };

    public VL(int i5, int i11, int i12, int i13, int i14) {
        this.A02 = i5;
        this.A03 = i11;
        this.A05 = i12;
        this.A01 = i13;
        this.A04 = i14;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00c2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static /* synthetic */ VL A00(Bundle bundle) {
        C1014Jp c1014Jp = new C1014Jp();
        if (bundle.containsKey(A0A)) {
            c1014Jp.A01(bundle.getInt(A0A));
        }
        String str = A0B;
        String[] strArr = A06;
        if (strArr[2].charAt(11) != strArr[5].charAt(11)) {
            throw new RuntimeException();
        }
        A06[0] = "BDJMlDo374UketnZHhjsaAQuXMvBfL8j";
        if (bundle.containsKey(str)) {
            c1014Jp.A02(bundle.getInt(A0B));
        }
        if (bundle.containsKey(A0D)) {
            c1014Jp.A04(bundle.getInt(A0D));
        }
        boolean zContainsKey = bundle.containsKey(A09);
        if (A06[6].charAt(30) != 'Z') {
            throw new RuntimeException();
        }
        A06[0] = "RtwsZfQG04lSbZehVoP0W9xyBqJj0Gzk";
        if (zContainsKey) {
            int i5 = bundle.getInt(A09);
            String[] strArr2 = A06;
            if (strArr2[2].charAt(11) != strArr2[5].charAt(11)) {
                String[] strArr3 = A06;
                strArr3[3] = "mEYys3L0sWZXkXwakusUkC67cz3yqHmi";
                strArr3[7] = "5jsJzopOJGGKQawYRLOazGcM1zbZBInC";
                c1014Jp.A00(i5);
            } else {
                String[] strArr4 = A06;
                strArr4[3] = "1r5tQTpbk4HuOkw9sEh6hX3jRMRONPTe";
                strArr4[7] = "ioWFQBHJAMsirtwz30BvtnrZgqC6cgbZ";
                c1014Jp.A00(i5);
            }
        }
        String str2 = A0C;
        String[] strArr5 = A06;
        if (strArr5[3].charAt(14) == strArr5[7].charAt(14)) {
            A06[0] = "w4sI9LL672mUB7xVTEYvGR6ZeBZDPBEE";
            if (bundle.containsKey(str2)) {
            }
        } else if (bundle.containsKey(str2)) {
            c1014Jp.A03(bundle.getInt(A0C));
        }
        return c1014Jp.A05();
    }

    public final Jo A01() {
        if (this.A00 == null) {
            this.A00 = new Jo(this);
        }
        return this.A00;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        VL vl2 = (VL) obj;
        return this.A02 == vl2.A02 && this.A03 == vl2.A03 && this.A05 == vl2.A05 && this.A01 == vl2.A01 && this.A04 == vl2.A04;
    }

    public final int hashCode() {
        int result = this.A02;
        int result2 = ((((17 * 31) + result) * 31) + this.A03) * 31;
        int result3 = this.A05;
        int result4 = (((result2 + result3) * 31) + this.A01) * 31;
        int result5 = this.A04;
        return result4 + result5;
    }
}
