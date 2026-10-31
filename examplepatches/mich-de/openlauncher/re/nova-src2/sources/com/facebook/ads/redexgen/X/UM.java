package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public final class UM implements InterfaceC1018Jt {
    public int A00;
    public long A01;
    public long A02;
    public Object A03;
    public Object A04;
    public boolean A05;
    public VN A06 = VN.A08;
    public static String[] A07 = {"ItkeaFWe", "6WrAg6mcAWGGzBTROw7zDRZDD", "Wwao0SLW56a29WTNGp8", "gT", "teHmZwDwoCq4FS69CeBPRJPaC2EVPwIf", "aR9jBsCZ", "MoKyYvb2Zous5roum4h7scGWjPpV56", "sJ6adnpeEW7MCvJCPyuVOyRgq"};
    public static final String A0D = N1.A0h(0);
    public static final String A0A = N1.A0h(1);
    public static final String A0C = N1.A0h(2);
    public static final String A0B = N1.A0h(3);
    public static final String A09 = N1.A0h(4);
    public static final InterfaceC1017Js<UM> A08 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.UN
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return UM.A01(bundle);
        }
    };

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static UM A01(Bundle bundle) {
        int i5 = bundle.getInt(A0D, 0);
        long j11 = bundle.getLong(A0A, -9223372036854775807L);
        long j12 = bundle.getLong(A0C, 0L);
        boolean z11 = bundle.getBoolean(A0B, false);
        Bundle bundle2 = bundle.getBundle(A09);
        VN vn2 = bundle2 != null ? (VN) VN.A09.A7F(bundle2) : VN.A08;
        UM um2 = new UM();
        um2.A0G(null, null, i5, j11, j12, vn2, z11);
        return um2;
    }

    public final int A03() {
        return this.A06.A00;
    }

    public final int A04(int i5) {
        return this.A06.A07(i5).A00;
    }

    public final int A05(int i5) {
        return this.A06.A07(i5).A04();
    }

    public final int A06(int i5, int i11) {
        return this.A06.A07(i5).A05(i11);
    }

    public final int A07(long j11) {
        return this.A06.A05(j11, this.A01);
    }

    public final int A08(long j11) {
        return this.A06.A06(j11, this.A01);
    }

    public final long A09() {
        return this.A06.A02;
    }

    public final long A0A() {
        return this.A01;
    }

    public final long A0B() {
        return N1.A0P(this.A02);
    }

    public final long A0C() {
        return this.A02;
    }

    public final long A0D(int i5) {
        return this.A06.A07(i5).A03;
    }

    public final long A0E(int i5, int i11) {
        VO voA07 = this.A06.A07(i5);
        if (voA07.A00 != -1) {
            return voA07.A06[i11];
        }
        return -9223372036854775807L;
    }

    public final UM A0F(Object obj, Object obj2, int i5, long j11, long j12) {
        return A0G(obj, obj2, i5, j11, j12, VN.A08, false);
    }

    public final UM A0G(Object obj, Object obj2, int i5, long j11, long j12, VN vn2, boolean z11) {
        this.A03 = obj;
        this.A04 = obj2;
        this.A00 = i5;
        this.A01 = j11;
        this.A02 = j12;
        this.A06 = vn2;
        this.A05 = z11;
        return this;
    }

    public final boolean A0H(int i5) {
        return !this.A06.A07(i5).A07();
    }

    @MetaExoPlayerCustomization
    public final boolean A0I(int i5, int i11) {
        VO vo2 = this.A06.A05[i5];
        if (vo2.A00 != -1) {
            int i12 = vo2.A05[i11];
            String[] strArr = A07;
            if (strArr[5].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A07[2] = "Yvo2wLmR2r8OIZXUYlP";
            if (i12 != 0) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (A07[2].length() != 19) {
            throw new RuntimeException();
        }
        A07[6] = "hST1TXBrmO9yZIniBEaiaCVgYsZxXf";
        if (obj == null || !getClass().equals(obj.getClass())) {
            return false;
        }
        UM um2 = (UM) obj;
        if (N1.A1E(this.A03, um2.A03) && N1.A1E(this.A04, um2.A04) && this.A00 == um2.A00 && this.A01 == um2.A01) {
            long j11 = this.A02;
            if (A07[4].charAt(11) != '4') {
                A07[1] = "csM5FhKFs8XgaJtUutSMYjOc1";
                if (j11 == um2.A02) {
                    boolean z11 = this.A05;
                    boolean z12 = um2.A05;
                    if (A07[2].length() != 19) {
                        throw new RuntimeException();
                    }
                    A07[4] = "WuW3YLMz4cH4rfaQ7XUgW07gMnzYnWkW";
                    if (z11 == z12 && N1.A1E(this.A06, um2.A06)) {
                        return true;
                    }
                }
            } else {
                A07[2] = "abUE0hdqLPAw0DMnYJb";
                if (j11 == um2.A02) {
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((((((((((((7 * 31) + (this.A03 == null ? 0 : this.A03.hashCode())) * 31) + (this.A04 != null ? this.A04.hashCode() : 0)) * 31) + this.A00) * 31) + ((int) (this.A01 ^ (this.A01 >>> 32)))) * 31) + ((int) (this.A02 ^ (this.A02 >>> 32)))) * 31) + (this.A05 ? 1 : 0)) * 31) + this.A06.hashCode();
    }
}
