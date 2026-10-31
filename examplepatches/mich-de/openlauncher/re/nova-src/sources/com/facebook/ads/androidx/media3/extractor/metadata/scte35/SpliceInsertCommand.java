package com.facebook.ads.androidx.media3.extractor.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1084Mk;
import com.facebook.ads.redexgen.X.C1092Ms;
import com.facebook.ads.redexgen.X.C1431aI;
import com.facebook.ads.redexgen.X.C1432aJ;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class SpliceInsertCommand extends SpliceCommand {
    public static String[] A0D = {"bQjU", "lDOOg9IOKycthmf3moi8TWpc", "mq8taTyObxEnETGJK2snRsGGUnFN", "tHlzPpr4jJ1ZDU", "2ZBX7AdMaENlXNaVwRncxy7CKdlVjwqp", "5mUBmesNVC8eBzYCNPYtJGFmIZEY", "z3qhQV", "J3XiIOF3cceaw5H1"};
    public static final Parcelable.Creator<SpliceInsertCommand> CREATOR = new C1431aI();
    public final int A00;
    public final int A01;
    public final int A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final long A06;
    public final List<C1432aJ> A07;
    public final boolean A08;
    public final boolean A09;
    public final boolean A0A;
    public final boolean A0B;
    public final boolean A0C;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 27 out of bounds for length 20
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public SpliceInsertCommand(long j11, boolean z11, boolean z12, boolean z13, boolean z14, long j12, long j13, List<C1432aJ> list, boolean z15, long j14, int i5, int i11, int i12) {
        this.A06 = j11;
        this.A0B = z11;
        this.A09 = z12;
        this.A0A = z13;
        this.A0C = z14;
        this.A05 = j12;
        this.A04 = j13;
        this.A07 = Collections.unmodifiableList(list);
        this.A08 = z15;
        this.A03 = j14;
        this.A02 = i5;
        this.A00 = i11;
        this.A01 = i12;
    }

    public SpliceInsertCommand(Parcel parcel) {
        this.A06 = parcel.readLong();
        this.A0B = parcel.readByte() == 1;
        this.A09 = parcel.readByte() == 1;
        this.A0A = parcel.readByte() == 1;
        this.A0C = parcel.readByte() == 1;
        this.A05 = parcel.readLong();
        this.A04 = parcel.readLong();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(C1432aJ.A00(parcel));
        }
        this.A07 = Collections.unmodifiableList(arrayList);
        int componentSpliceListSize = parcel.readByte();
        this.A08 = componentSpliceListSize == 1;
        this.A03 = parcel.readLong();
        int componentSpliceListSize2 = parcel.readInt();
        this.A02 = componentSpliceListSize2;
        int componentSpliceListSize3 = parcel.readInt();
        this.A00 = componentSpliceListSize3;
        int componentSpliceListSize4 = parcel.readInt();
        this.A01 = componentSpliceListSize4;
    }

    public /* synthetic */ SpliceInsertCommand(Parcel parcel, C1431aI c1431aI) {
        this(parcel);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static SpliceInsertCommand A00(C1084Mk c1084Mk, long j11, C1092Ms c1092Ms) {
        long jA0Q = c1084Mk.A0Q();
        boolean z11 = (c1084Mk.A0I() & 128) != 0;
        boolean z12 = false;
        boolean outOfNetworkIndicator = false;
        boolean z13 = false;
        long jA00 = -9223372036854775807L;
        List listEmptyList = Collections.emptyList();
        int iA0M = 0;
        int iA0I = 0;
        int iA0I2 = 0;
        boolean z14 = false;
        long jA0Q2 = -9223372036854775807L;
        if (!z11) {
            int iA0I3 = c1084Mk.A0I();
            String[] strArr = A0D;
            if (strArr[6].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A0D[1] = "TYWB5U4XEobqurYG6LzX57FR";
            z12 = (iA0I3 & 128) != 0;
            outOfNetworkIndicator = (iA0I3 & 64) != 0;
            boolean autoReturn = (iA0I3 & 32) != 0;
            z13 = (iA0I3 & 16) != 0;
            if (A0D[3].length() != 17) {
                A0D[1] = "4O0buXygssTTRhmDywTA31Dw";
                if (outOfNetworkIndicator) {
                    if (!z13) {
                        jA00 = TimeSignalCommand.A00(c1084Mk, j11);
                    }
                }
                if (!outOfNetworkIndicator) {
                    int componentCount = c1084Mk.A0I();
                    listEmptyList = new ArrayList(componentCount);
                    for (int i5 = 0; i5 < componentCount; i5++) {
                        int componentTag = c1084Mk.A0I();
                        long jA002 = -9223372036854775807L;
                        if (!z13) {
                            jA002 = TimeSignalCommand.A00(c1084Mk, j11);
                        }
                        listEmptyList.add(new C1432aJ(componentTag, jA002, c1092Ms.A06(jA002), null));
                    }
                }
                if (autoReturn) {
                    long jA0I = c1084Mk.A0I();
                    z14 = (jA0I & 128) != 0;
                    jA0Q2 = (1000 * (((jA0I & 1) << 32) | c1084Mk.A0Q())) / 90;
                }
                iA0M = c1084Mk.A0M();
                iA0I = c1084Mk.A0I();
                iA0I2 = c1084Mk.A0I();
            } else {
                if (outOfNetworkIndicator) {
                }
                if (!outOfNetworkIndicator) {
                }
                if (autoReturn) {
                }
                iA0M = c1084Mk.A0M();
                iA0I = c1084Mk.A0I();
                iA0I2 = c1084Mk.A0I();
            }
        }
        return new SpliceInsertCommand(jA0Q, z11, z12, outOfNetworkIndicator, z13, jA00, c1092Ms.A06(jA00), listEmptyList, z14, jA0Q2, iA0M, iA0I, iA0I2);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.A06);
        parcel.writeByte(this.A0B ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A09 ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A0A ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.A0C ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.A05);
        parcel.writeLong(this.A04);
        int size = this.A07.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            this.A07.get(i11).A01(parcel);
        }
        parcel.writeByte(this.A08 ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.A03);
        parcel.writeInt(this.A02);
        parcel.writeInt(this.A00);
        parcel.writeInt(this.A01);
    }
}
