package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* loaded from: assets/audience_network/classes.dex */
public final class H5<T> implements InterfaceC2189mh<T> {
    public static byte[] A06;
    public C2181mZ A00;
    public C2181mZ A01;
    public List<H5<T>.RecordFileBasedFetch> A02 = new ArrayList();
    public boolean A03;
    public final C2180mY A04;
    public final C2196mo A05;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{-28, 2, 15, -63, 16, 15, 13, 26, -63, 5, 6, 13, 6, 21, 6, -63, 4, 22, 19, 20, 16, 19, 20, -63, 17, 16, 10, 15, 21, 10, 15, 8, -63, 2, 21, -63, 21, 9, 6, -63, 5, 2, 21, 2, 3, 2, 20, 6, -63, 20, 21, 2, 19, 21, -38, 12, 9, 10, 6, 9, -73, 7, 6, 10, 0, 11, 0, 6, 5, -73, 0, 10, -73, -8, 11, -73, -65, -68, -5, -61, -68, -5, -64, -61, -73, -8, 5, -5, -73, 9, -4, -6, 6, 9, -5, -73, -3, 0, 3, -4, -73, 10, -4, 8, 12, -4, 5, -6, -4, -73, 10, 11, -8, 9, 11, 10, -73, -8, 11, -73, -65, -68, -5, -61, -68, -5, -64, -47, -73, -5, -8, 11, -8, -73, -1, -8, 10, -73, 7, 9, 6, -7, -8, -7, 3, 16, -73, -7, -4, -4, 5, -73, 3, 6, 10, 11, -78, -28, -31, -30, -34, -31, -113, -33, -34, -30, -40, -29, -40, -34, -35, -113, -40, -30, -113, -48, -29, -113, -105, -108, -45, -101, -108, -45, -104, -101, -113, -47, -28, -29, -113, -31, -44, -46, -34, -31, -45, -113, -43, -40, -37, -44, -113, -30, -44, -32, -28, -44, -35, -46, -44, -113, -34, -35, -37, -24, -113, -41, -48, -30, -113, -43, -40, -37, -44, -113, -108, -45, -87, -113, -45, -48, -29, -48, -113, -41, -48, -30, -113, -33, -31, -34, -47, -48, -47, -37, -24, -113, -47, -44, -44, -35, -113, -37, -34, -30, -29, -27, 0, 8, 11, 4, 3, -65, 19, 14, -65, 0, 3, 3, -65, 3, 0, 19, 0, -65, 19, 14, -65, 11, 14, 6, -72, -45, -37, -34, -41, -42, -110, -26, -31, -110, -43, -34, -41, -45, -28, -110, -42, -45, -26, -45, -44, -45, -27, -41, -9, 18, 26, 29, 22, 21, -47, 37, 32, -47, 23, 22, 37, 20, 25, -47, 21, 18, 37, 18, -47, 23, 35, 32, 30, -47, 29, 32, 24, 34, 61, 69, 72, 65, 64, -4, 80, 75, -4, 67, 65, 80, -4, 78, 65, 63, 75, 78, 64, -4, 63, 75, 81, 74, 80, 5, 32, 40, 43, 36, 35, -33, 51, 46, -33, 52, 47, 35, 32, 51, 36, -33, 37, 40, 43, 36, -33, 50, 36, 48, 52, 36, 45, 34, 36, 43, 62, 60, 72, 75, 61, 31, 66, 69, 62, 27, 58, 76, 62, 61, 43, 62, 60, 72, 75, 61, 29, 58, 77, 58, 59, 58, 76, 62, -7, 60, 69, 72, 76, 62, 61, -8, 11, 9, 21, 24, 10, -20, 15, 18, 11, -24, 7, 25, 11, 10, -8, 11, 9, 21, 24, 10, -22, 7, 26, 7, 8, 7, 25, 11, -58, 15, 25, -58, 9, 18, 21, 25, 11, 10, -24, 1, -2, 1, 2, 10, 1, -77, -27, -8, -10, 2, 5, -9, -39, -4, -1, -8, -43, -12, 6, -8, -9, -27, -8, -10, 2, 5, -9, -41, -12, 7, -12, -11, -12, 6, -8, -77, -7, -8, 7, -10, -5, 11, 29, 26, 27, 23, 26, 5, 2, 21, 2};
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Incorrect inner types in method signature: (Lcom/facebook/ads/redexgen/X/H5<TT;>.RecordFileBasedFetch;)Z */
    public synchronized boolean A06(H6 h62) {
        if (!this.A02.remove(h62)) {
            return false;
        }
        if (h62.A76() > 0 && h62.A01().A02.A05(h62.A01().A01).equals(this.A01)) {
            this.A01 = h62.A00().A02;
        }
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    public H5(C2186me c2186me, InterfaceC2194mm interfaceC2194mm) throws IOException {
        this.A05 = new C2196mo(c2186me.A04(A00(515, 4, 63)), interfaceC2194mm);
        this.A04 = new C2180mY(new File(c2186me.A05(), A00(509, 6, 70)));
        this.A00 = this.A04.A03();
        A05(interfaceC2194mm);
        this.A01 = this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    private void A02(int i5, int i11) throws IOException {
        this.A00 = new C2181mZ(i5, i11);
        this.A04.A04(this.A00);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H6 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T>$RecordFileBasedFetch */
    /* JADX WARN: Incorrect inner types in method signature: (Lcom/facebook/ads/redexgen/X/H5<TT;>.RecordFileBasedFetch;)V */
    public synchronized void A03(H6 h62) throws C2198mq {
        if (!this.A03) {
            if (A06(h62)) {
                if (h62.A76() == 0) {
                    return;
                }
                if (this.A00.A04(h62.A00().A02) == 0) {
                    try {
                        Iterator<C2193ml> it = h62.A00.iterator();
                        while (it.hasNext()) {
                            if (it.next().A00 == this.A05.A07() && this.A05.A0D()) {
                                A02(this.A05.A06(), 0);
                            } else {
                                A02(this.A05.A06(), h62.A00().A00);
                                break;
                            }
                        }
                        if (this.A01.A04(this.A00) < 0) {
                            this.A01 = this.A00;
                        }
                        return;
                    } catch (IOException e3) {
                        throw new C2198mq(A00(361, 30, 93), e3);
                    }
                }
                throw new C2198mq(A00(0, 54, 63));
            }
            throw new C2198mq(A00(466, 43, 49));
        }
        throw new C2198mq(A00(427, 39, 68));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    /* JADX WARN: Incorrect condition in loop: B:7:0x0066 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A05(InterfaceC2194mm interfaceC2194mm) throws IOException {
        C2181mZ c2181mZ = new C2181mZ(this.A05.A06(), 0);
        C2181mZ recordSequenceStart = this.A00;
        if (c2181mZ.A04(recordSequenceStart) > 0) {
            Locale locale = Locale.US;
            C2181mZ recordSequenceStart2 = this.A00;
            Integer numValueOf = Integer.valueOf(recordSequenceStart2.A02());
            C2181mZ recordSequenceStart3 = this.A00;
            interfaceC2194mm.AJu(String.format(locale, A00(54, 102, 53), numValueOf, Integer.valueOf(recordSequenceStart3.A03()), Integer.valueOf(c2181mZ.A02()), Integer.valueOf(c2181mZ.A03())));
            this.A00 = c2181mZ;
            return;
        }
        while (iA02 < recordSequenceStart.A02()) {
            if (this.A05.A0D()) {
                c2181mZ = new C2181mZ(this.A05.A06(), 0);
            } else {
                Locale locale2 = Locale.US;
                C2181mZ recordSequenceStart4 = this.A00;
                Integer numValueOf2 = Integer.valueOf(recordSequenceStart4.A02());
                C2181mZ recordSequenceStart5 = this.A00;
                interfaceC2194mm.AJu(String.format(locale2, A00(156, 101, 13), numValueOf2, Integer.valueOf(recordSequenceStart5.A03()), Integer.valueOf(c2181mZ.A02())));
                C2181mZ recordSequenceStart6 = new C2181mZ(this.A05.A06(), this.A05.A07());
                this.A00 = recordSequenceStart6;
                C2180mY c2180mY = this.A04;
                C2181mZ recordSequenceStart7 = this.A00;
                c2180mY.A04(recordSequenceStart7);
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H6 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T>$RecordFileBasedFetch */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2189mh
    public final synchronized InterfaceC2188mg A75(byte[] bArr, int[] iArr) throws C2198mq {
        H5<T>.RecordFileBasedFetch h62;
        if (!this.A03) {
            int i5 = 0;
            int i11 = 0;
            try {
                ArrayList arrayList = new ArrayList();
                boolean mayHaveMoreData = true;
                while (true) {
                    C2184mc c2184mcA0A = this.A05.A0A(this.A01.A02(), this.A01.A03(), bArr, i5, iArr, i11);
                    int iA00 = c2184mcA0A.A01().A00();
                    int storageOffset = c2184mcA0A.A01().A01();
                    int i12 = iA00 - storageOffset;
                    int storageOffset2 = c2184mcA0A.A01().A02();
                    i5 += storageOffset2;
                    i11 += i12;
                    if (c2184mcA0A.A01().A03() == EnumC2182ma.A02) {
                        arrayList.add(c2184mcA0A);
                    }
                    if (c2184mcA0A.A01().A03() == EnumC2182ma.A03) {
                        break;
                    }
                    if (c2184mcA0A.A01().A03() == EnumC2182ma.A04) {
                        int countsOffset = this.A05.A06();
                        int storageOffset3 = this.A05.A08();
                        int countsOffset2 = countsOffset + storageOffset3;
                        int storageOffset4 = this.A01.A02();
                        if (countsOffset2 == storageOffset4 + 1) {
                            mayHaveMoreData = false;
                            break;
                        }
                        int storageOffset5 = this.A01.A02();
                        this.A01 = new C2181mZ(storageOffset5 + 1, 0);
                    } else {
                        this.A01 = this.A01.A05(i12);
                    }
                }
                h62 = new H6(this, arrayList, mayHaveMoreData);
                this.A02.add(h62);
                if (!arrayList.isEmpty()) {
                    C2181mZ c2181mZ = h62.A01().A02;
                    int storageOffset6 = h62.A01().A01;
                    this.A01 = c2181mZ.A05(storageOffset6);
                }
            } catch (IOException e3) {
                throw new C2198mq(A00(306, 29, 79), e3);
            }
        } else {
            throw new C2198mq(A00(391, 36, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        }
        return h62;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2189mh
    public final synchronized int A9V() throws C2198mq {
        int iA09;
        if (!this.A03) {
            try {
                iA09 = this.A05.A09();
                int iA02 = this.A00.A02();
                int count = this.A05.A06();
                if (iA02 == count) {
                    int count2 = this.A00.A03();
                    iA09 -= count2;
                }
            } catch (IOException e3) {
                throw new C2198mq(A00(335, 26, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), e3);
            }
        } else {
            throw new C2198mq(A00(427, 39, 68));
        }
        return iA09;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2189mh
    public final synchronized void ALa(byte[] bArr) throws C2198mq {
        if (!this.A03) {
            try {
                this.A05.A0C(bArr);
            } catch (IOException e3) {
                throw new C2198mq(A00(257, 25, 61), e3);
            }
        } else {
            throw new C2198mq(A00(427, 39, 68));
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2189mh
    public final synchronized void clear() throws C2198mq {
        try {
            this.A05.A0B();
            A02(this.A05.A06(), 0);
            this.A02.clear();
        } catch (IOException e3) {
            throw new C2198mq(A00(282, 24, 16), e3);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.H5 != com.facebook.ads.internal.eventstorage.record.RecordFileBasedRecordDatabase<T> */
    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() throws IOException {
        if (this.A03) {
            return;
        }
        this.A03 = true;
        this.A02.clear();
        this.A04.close();
        this.A05.close();
    }
}
