package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Yh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1370Yh {
    public static byte[] A06;
    public final float A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final String A04;
    public final List<byte[]> A05;

    static {
        A02();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1370Yh A00(C1084Mk c1084Mk) throws L9 {
        try {
            c1084Mk.A0g(4);
            int iA0I = (c1084Mk.A0I() & 3) + 1;
            if (iA0I == 3) {
                throw new IllegalStateException();
            }
            ArrayList arrayList = new ArrayList();
            int iA0I2 = c1084Mk.A0I() & 31;
            for (int i5 = 0; i5 < iA0I2; i5++) {
                arrayList.add(A03(c1084Mk));
            }
            int iA0I3 = c1084Mk.A0I();
            for (int i11 = 0; i11 < iA0I3; i11++) {
                arrayList.add(A03(c1084Mk));
            }
            int i12 = -1;
            int i13 = -1;
            float f11 = 1.0f;
            String strA01 = null;
            if (iA0I2 > 0) {
                ZD zdA09 = ZE.A09((byte[]) arrayList.get(0), iA0I, ((byte[]) arrayList.get(0)).length);
                i12 = zdA09.A0A;
                i13 = zdA09.A03;
                f11 = zdA09.A00;
                strA01 = Lv.A01(zdA09.A08, zdA09.A01, zdA09.A04);
            }
            return new C1370Yh(arrayList, iA0I, i12, i13, f11, strA01);
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw L9.A01(A01(0, 24, 92), e3);
        }
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 106);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A06 = new byte[]{11, 56, 56, 53, 56, -26, 54, 39, 56, 57, 47, 52, 45, -26, 7, 28, 9, -26, 41, 53, 52, 44, 47, 45};
    }

    public C1370Yh(List<byte[]> initializationData, int i5, int i11, int i12, float f11, String str) {
        this.A05 = initializationData;
        this.A02 = i5;
        this.A03 = i11;
        this.A01 = i12;
        this.A00 = f11;
        this.A04 = str;
    }

    public static byte[] A03(C1084Mk c1084Mk) {
        int iA0M = c1084Mk.A0M();
        int offset = c1084Mk.A09();
        c1084Mk.A0g(iA0M);
        return Lv.A07(c1084Mk.A0l(), offset, iA0M);
    }
}
