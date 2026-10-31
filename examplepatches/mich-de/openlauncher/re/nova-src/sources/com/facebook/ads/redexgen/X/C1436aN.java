package com.facebook.ads.redexgen.X;

import android.os.Parcel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.aN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1436aN {
    public static String[] A0B = {"TuWJi2cYsoT9dLii3npux0sZAy1jwC08", "eBFWvkTBVMtxqTmj6jG5SyAgPlI", "inierKVZuj4rSUavhHrLi14WvYj", "EQCV1o2WFIzNzDZKwXuuyyerWBD2I41v", "B7gJvdb5AbzKTDl5rGb812n4c7p", "tWnRqg1Vt6gw8C8JiPUc47txRTHcpVPV", "BpxNItbcjJjc0HwOpOMsLISsyRB4GAZw", "tza1ufjZfaVgjTRhu6xOUN"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final List<C1435aM> A06;
    public final boolean A07;
    public final boolean A08;
    public final boolean A09;
    public final boolean A0A;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 24 out of bounds for length 23
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1436aN A02(C1084Mk c1084Mk) {
        long jA0Q = c1084Mk.A0Q();
        boolean z11 = (c1084Mk.A0I() & 128) != 0;
        boolean z12 = false;
        boolean z13 = false;
        ArrayList arrayList = new ArrayList();
        int iA0M = 0;
        int iA0I = 0;
        int iA0I2 = 0;
        boolean z14 = false;
        long j11 = -9223372036854775807L;
        if (!z11) {
            int iA0I3 = c1084Mk.A0I();
            z12 = (iA0I3 & 128) != 0;
            z13 = (iA0I3 & 64) != 0;
            int i5 = iA0I3 & 32;
            if (A0B[2].length() == 27) {
                A0B[6] = "yPbBo5TlAYvVAZsTQtkRlLZD09kTQCIb";
                boolean z15 = i5 != 0;
                jA0Q = z13 ? c1084Mk.A0Q() : -9223372036854775807L;
                if (!z13) {
                    int iA0I4 = c1084Mk.A0I();
                    arrayList = new ArrayList(iA0I4);
                    for (int i11 = 0; i11 < iA0I4; i11++) {
                        arrayList.add(new C1435aM(c1084Mk.A0I(), c1084Mk.A0Q(), null));
                    }
                }
                if (z15) {
                    long jA0I = c1084Mk.A0I();
                    z14 = (128 & jA0I) != 0;
                    long jA0Q2 = 1000 * (((1 & jA0I) << 32) | c1084Mk.A0Q());
                    String[] strArr = A0B;
                    if (strArr[4].length() == strArr[1].length()) {
                        A0B[6] = "3XRcy1Vew1SlJt9fmQEfcYY2rwVcqbzh";
                        j11 = jA0Q2 / 90;
                    }
                }
                iA0M = c1084Mk.A0M();
                iA0I = c1084Mk.A0I();
                iA0I2 = c1084Mk.A0I();
            }
            throw new RuntimeException();
        }
        if (A0B[7].length() != 22) {
            throw new RuntimeException();
        }
        A0B[6] = "giHFEu5da3Ixfww9pGn6bENrbqC0BS1p";
        return new C1436aN(jA0Q, z11, z12, z13, arrayList, jA0Q, z14, j11, iA0M, iA0I, iA0I2);
    }

    public C1436aN(long j11, boolean z11, boolean z12, boolean z13, List<C1435aM> list, long j12, boolean z14, long j13, int i5, int i11, int i12) {
        this.A04 = j11;
        this.A0A = z11;
        this.A08 = z12;
        this.A09 = z13;
        this.A06 = Collections.unmodifiableList(list);
        this.A05 = j12;
        this.A07 = z14;
        this.A03 = j13;
        this.A02 = i5;
        this.A00 = i11;
        this.A01 = i12;
    }

    public C1436aN(Parcel parcel) {
        this.A04 = parcel.readLong();
        this.A0A = parcel.readByte() == 1;
        this.A08 = parcel.readByte() == 1;
        this.A09 = parcel.readByte() == 1;
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(C1435aM.A00(parcel));
        }
        this.A06 = Collections.unmodifiableList(arrayList);
        this.A05 = parcel.readLong();
        int componentSpliceListLength = parcel.readByte();
        this.A07 = componentSpliceListLength == 1;
        this.A03 = parcel.readLong();
        int componentSpliceListLength2 = parcel.readInt();
        this.A02 = componentSpliceListLength2;
        int componentSpliceListLength3 = parcel.readInt();
        this.A00 = componentSpliceListLength3;
        int componentSpliceListLength4 = parcel.readInt();
        this.A01 = componentSpliceListLength4;
    }

    public static C1436aN A00(Parcel parcel) {
        return new C1436aN(parcel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04(Parcel parcel) {
        parcel.writeLong(this.A04);
        parcel.writeByte(this.A0A ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A08 ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A09 ? (byte) 1 : (byte) 0);
        int size = this.A06.size();
        parcel.writeInt(size);
        for (int i5 = 0; i5 < size; i5++) {
            this.A06.get(i5).A02(parcel);
        }
        parcel.writeLong(this.A05);
        parcel.writeByte(this.A07 ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.A03);
        parcel.writeInt(this.A02);
        parcel.writeInt(this.A00);
        parcel.writeInt(this.A01);
    }
}
