package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class Z7 {
    public static byte[] A09;
    public static String[] A0A = {"zOmLVw1wOYNuCJ1TjwgbMqsIM5Xd7opF", "DAw4BH5fWJuC1obpY7F4FxSeogTwBsQZ", "aXYxY1", "iTPUJszOkDlZsEWmywTZiXhhhCUznJst", "Q6aDniWoDlm9yDNpt2RsHRUKhb3wqfmT", "PKWa1tqjowvfh4JX3", "gayczC2P77oJFgKeJRxvyPW3YGaeKHSf", "4UIRzKxl0gqc5LO5mrecLRijl69UlOly"};
    public final float A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final String A07;
    public final List<byte[]> A08;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 30 out of bounds for length 30
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static Z7 A00(C1084Mk c1084Mk) throws L9 {
        try {
            c1084Mk.A0g(21);
            int iA0I = c1084Mk.A0I() & 3;
            int iA0I2 = c1084Mk.A0I();
            int i5 = 0;
            int iA09 = c1084Mk.A09();
            for (int i11 = 0; i11 < iA0I2; i11++) {
                c1084Mk.A0g(1);
                int iA0M = c1084Mk.A0M();
                for (int i12 = 0; i12 < iA0M; i12++) {
                    int iA0M2 = c1084Mk.A0M();
                    i5 += iA0M2 + 4;
                    c1084Mk.A0g(iA0M2);
                }
            }
            c1084Mk.A0f(iA09);
            byte[] bArr = new byte[i5];
            int i13 = 0;
            int i14 = -1;
            int i15 = -1;
            int i16 = -1;
            int i17 = -1;
            int i18 = -1;
            float f11 = 1.0f;
            String strA03 = null;
            for (int i19 = 0; i19 < iA0I2; i19++) {
                int iA0I3 = c1084Mk.A0I() & 63;
                int iA0M3 = c1084Mk.A0M();
                for (int i21 = 0; i21 < iA0M3; i21++) {
                    int iA0M4 = c1084Mk.A0M();
                    System.arraycopy(ZE.A03, 0, bArr, i13, ZE.A03.length);
                    int length = i13 + ZE.A03.length;
                    System.arraycopy(c1084Mk.A0l(), c1084Mk.A09(), bArr, length, iA0M4);
                    if (iA0I3 == 33 && i21 == 0) {
                        ZB zbA05 = ZE.A05(bArr, length, length + iA0M4);
                        i14 = zbA05.A0A;
                        i15 = zbA05.A08;
                        i16 = zbA05.A02;
                        i17 = zbA05.A01;
                        i18 = zbA05.A03;
                        f11 = zbA05.A00;
                        strA03 = Lv.A03(zbA05.A07, zbA05.A0B, zbA05.A06, zbA05.A05, zbA05.A0C, zbA05.A04);
                    }
                    i13 = length + iA0M4;
                    c1084Mk.A0g(iA0M4);
                }
            }
            return new Z7(i5 == 0 ? Collections.emptyList() : Collections.singletonList(bArr), iA0I + 1, i14, i15, f11, strA03, i16, i17, i18);
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw L9.A01(A01(0, 25, 39), e3);
        }
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0A;
            if (strArr[1].charAt(30) == strArr[0].charAt(30)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0A;
            strArr2[6] = "OWGNzODCc3sXotxEe2bKsTodwr07GUPT";
            strArr2[7] = "ajyXzdpkreABZpkMDEnWCkAnbIcU3asn";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 24);
            i13++;
        }
    }

    public static void A02() {
        A09 = new byte[]{-124, -79, -79, -82, -79, 95, -81, -96, -79, -78, -88, -83, -90, 95, -121, -124, -107, -126, 95, -94, -82, -83, -91, -88, -90};
    }

    static {
        A02();
    }

    public Z7(List<byte[]> initializationData, int i5, int i11, int i12, float f11, String str, int i13, int i14, int i15) {
        this.A08 = initializationData;
        this.A05 = i5;
        this.A06 = i11;
        this.A04 = i12;
        this.A00 = f11;
        this.A07 = str;
        this.A02 = i13;
        this.A01 = i14;
        this.A03 = i15;
    }
}
