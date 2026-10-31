package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Nf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1105Nf implements InterfaceC1383Yv {
    public static byte[] A0J;
    public static String[] A0K = {"956B0rVWYzAVb", "SbIZ0rKR7y0901w7FjKilC0lpDAn5Ge", "t8G", "vNF9lYBo1SJ7esJl3lcXtDT", "xg2v94Ydxs5", "Z3YFuJb7MJSE20", "zCvxtWnXSA9ynLiwgKA2Pux", "NjtG4AhR1Zqeb6h2S6Fu"};
    public static final InterfaceC1387Yz A0L;
    public int A00;
    public int A01;
    public int A02;
    public InterfaceC1384Yw A03;
    public C1117Nr A04;
    public InterfaceC1602d3 A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public final int A09;
    public final int A0A;
    public final SparseArray<InterfaceC1602d3> A0B;
    public final SparseBooleanArray A0C;
    public final SparseBooleanArray A0D;
    public final SparseIntArray A0E;
    public final C1084Mk A0F;
    public final C1595cw A0G;
    public final InterfaceC1599d0 A0H;
    public final List<C1092Ms> A0I;

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0J, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 26);
            if (A0K[1].length() != 31) {
                throw new RuntimeException();
            }
            A0K[0] = "6bR1fYVTQtlAc";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0G() {
        if (A0K[1].length() != 31) {
            throw new RuntimeException();
        }
        A0K[5] = "wl8EDwynIrkNhP";
        A0J = new byte[]{114, 80, 95, 95, 94, 69, 17, 87, 88, 95, 85, 17, 66, 72, 95, 82, 17, 83, 72, 69, 84, 31, 17, 124, 94, 66, 69, 17, 93, 88, 90, 84, 93, 72, 17, 95, 94, 69, 17, 80, 17, 101, 67, 80, 95, 66, 65, 94, 67, 69, 17, 98, 69, 67, 84, 80, 92, 31};
    }

    static {
        A0G();
        A0L = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Nl
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return C1105Nf.A0M();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
    }

    public C1105Nf() {
        this(0);
    }

    public C1105Nf(int i5) {
        this(1, i5, 112800);
    }

    public C1105Nf(int i5, int i11, int i12) {
        this(i5, new C1092Ms(0L), new OF(i11), i12);
    }

    public C1105Nf(int i5, C1092Ms c1092Ms, InterfaceC1599d0 interfaceC1599d0, int i11) {
        this.A0H = (InterfaceC1599d0) AbstractC1062Ln.A01(interfaceC1599d0);
        this.A0A = i11;
        this.A09 = i5;
        if (i5 == 1 || i5 == 2) {
            this.A0I = Collections.singletonList(c1092Ms);
        } else {
            this.A0I = new ArrayList();
            this.A0I.add(c1092Ms);
        }
        this.A0F = new C1084Mk(new byte[9400], 0);
        this.A0C = new SparseBooleanArray();
        this.A0D = new SparseBooleanArray();
        this.A0B = new SparseArray<>();
        this.A0E = new SparseIntArray();
        this.A0G = new C1595cw(i11);
        this.A03 = InterfaceC1384Yw.A00;
        this.A01 = -1;
        A0F();
    }

    private int A00() throws L9 {
        int iA09 = this.A0F.A09();
        int endOfPacket = this.A0F.A0A();
        int limit = AbstractC1603d4.A00(this.A0F.A0l(), iA09, endOfPacket);
        this.A0F.A0f(limit);
        int syncBytePosition = limit + 188;
        if (syncBytePosition > endOfPacket) {
            int searchStart = this.A00;
            this.A00 = searchStart + (limit - iA09);
            if (this.A09 == 2 && this.A00 > 376) {
                throw L9.A01(A0D(0, 58, 43), null);
            }
        } else {
            this.A00 = 0;
        }
        return syncBytePosition;
    }

    public static /* synthetic */ int A02(C1105Nf c1105Nf) {
        int i5 = c1105Nf.A02;
        c1105Nf.A02 = i5 + 1;
        return i5;
    }

    private void A0F() {
        this.A0C.clear();
        this.A0B.clear();
        SparseArray<InterfaceC1602d3> sparseArrayA5z = this.A0H.A5z();
        int size = sparseArrayA5z.size();
        for (int i5 = 0; i5 < size; i5++) {
            SparseArray<InterfaceC1602d3> sparseArray = this.A0B;
            int initialPayloadReadersSize = sparseArrayA5z.keyAt(i5);
            sparseArray.put(initialPayloadReadersSize, sparseArrayA5z.valueAt(i5));
        }
        this.A0B.put(0, new C1122Nw(new C1107Nh(this)));
        this.A05 = null;
    }

    private void A0H(long j11) {
        if (!this.A06) {
            this.A06 = true;
            if (this.A0G.A08() != -9223372036854775807L) {
                this.A04 = new C1117Nr(this.A0G.A09(), this.A0G.A08(), j11, this.A01, this.A0A);
                this.A03.AKP(this.A04.A09());
            } else {
                this.A03.AKP(new Q4(this.A0G.A08()));
            }
        }
    }

    private boolean A0I(int i5) {
        return this.A09 == 2 || this.A08 || !this.A0D.get(i5, false);
    }

    private boolean A0J(Q9 q92) throws IOException {
        byte[] bArrA0l = this.A0F.A0l();
        if (9400 - this.A0F.A09() < 188) {
            int bytesLeft = this.A0F.A07();
            if (bytesLeft > 0) {
                System.arraycopy(bArrA0l, this.A0F.A09(), bArrA0l, 0, bytesLeft);
            }
            this.A0F.A0j(bArrA0l, bytesLeft);
        }
        while (this.A0F.A07() < 188) {
            int iA0A = this.A0F.A0A();
            int limit = q92.read(bArrA0l, iA0A, 9400 - iA0A);
            if (limit == -1) {
                return false;
            }
            this.A0F.A0e(iA0A + limit);
        }
        return true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A0M() {
        return new InterfaceC1383Yv[]{new C1105Nf()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A03 = interfaceC1384Yw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        InterfaceC1602d3 payloadReader;
        int i5;
        long inputLength = q92.A90();
        if (this.A08) {
            if (((inputLength == -1 || this.A09 == 2) ? false : true) && !this.A0G.A0A()) {
                return this.A0G.A07(q92, zh2, this.A01);
            }
            A0H(inputLength);
            if (this.A07) {
                this.A07 = false;
                AKO(0L, 0L);
                if (q92.A9Q() != 0) {
                    zh2.A00 = 0L;
                    return 1;
                }
            }
            if (this.A04 != null && this.A04.A0B()) {
                return this.A04.A08(q92, zh2);
            }
        }
        if (!A0J(q92)) {
            return -1;
        }
        int endOfPacket = A00();
        int iA0A = this.A0F.A0A();
        if (endOfPacket > iA0A) {
            return 0;
        }
        int pid = this.A0F.A0C();
        if ((8388608 & pid) != 0) {
            this.A0F.A0f(endOfPacket);
            return 0;
        }
        int i11 = 4194304 & pid;
        if (A0K[2].length() == 32) {
            throw new RuntimeException();
        }
        A0K[2] = "UNKMKEU";
        int i12 = 0 | (i11 != 0 ? 1 : 0);
        int i13 = (2096896 & pid) >> 8;
        int tsPacketHeader = (pid & 32) != 0 ? 1 : 0;
        if ((pid & 16) != 0) {
            payloadReader = this.A0B.get(i13);
        } else {
            payloadReader = null;
        }
        if (payloadReader == null) {
            this.A0F.A0f(endOfPacket);
            return 0;
        }
        if (this.A09 != 2) {
            int i14 = pid & 15;
            int i15 = this.A0E.get(i13, i14 - 1);
            this.A0E.put(i13, i14);
            if (i15 == i14) {
                this.A0F.A0f(endOfPacket);
                return 0;
            }
            if (i14 != ((i15 + 1) & 15)) {
                payloadReader.AKN();
            }
        }
        if (tsPacketHeader != 0) {
            int iA0I = this.A0F.A0I();
            if ((this.A0F.A0I() & 64) != 0) {
                i5 = 2;
            } else {
                i5 = 0;
            }
            i12 |= i5;
            this.A0F.A0g(iA0I - 1);
        }
        boolean z11 = this.A08;
        if (A0I(i13)) {
            this.A0F.A0e(endOfPacket);
            payloadReader.A5k(this.A0F, i12);
            this.A0F.A0e(iA0A);
        }
        if (this.A09 != 2 && !z11 && this.A08 && inputLength != -1) {
            this.A07 = true;
        }
        this.A0F.A0f(endOfPacket);
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        AbstractC1062Ln.A08(this.A09 != 2);
        int size = this.A0I.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1092Ms timestampAdjuster = this.A0I.get(i5);
            boolean z11 = timestampAdjuster.A04() == -9223372036854775807L;
            if (!z11) {
                long jA02 = timestampAdjuster.A02();
                z11 = (jA02 == -9223372036854775807L || jA02 == 0 || jA02 == j12) ? false : true;
            }
            if (z11) {
                timestampAdjuster.A07(j12);
            }
        }
        if (j12 != 0 && this.A04 != null) {
            this.A04.A0A(j12);
        }
        this.A0F.A0d(0);
        this.A0E.clear();
        if (A0K[7].length() == 16) {
            throw new RuntimeException();
        }
        A0K[2] = "0BTDs03sCrjzNzUWiGLqTSnwhpE";
        for (int i11 = 0; i11 < this.A0B.size(); i11++) {
            this.A0B.valueAt(i11).AKN();
        }
        this.A00 = 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        byte[] bArrA0l = this.A0F.A0l();
        q92.AI6(bArrA0l, 0, 940);
        for (int i5 = 0; i5 < 188; i5++) {
            boolean isSyncBytePatternCorrect = true;
            int i11 = 0;
            while (true) {
                if (i11 >= 5) {
                    break;
                }
                int startPosCandidate = bArrA0l[(i11 * 188) + i5];
                if (startPosCandidate != 71) {
                    isSyncBytePatternCorrect = false;
                    break;
                }
                i11++;
            }
            if (isSyncBytePatternCorrect) {
                q92.ALL(i5);
                int startPosCandidate2 = A0K[1].length();
                if (startPosCandidate2 != 31) {
                    throw new RuntimeException();
                }
                String[] strArr = A0K;
                strArr[6] = "svTVFQuQE62xyiOn9gZyCok";
                strArr[3] = "B1uo6M0MU71UFPAJDEbaWx6";
                return true;
            }
        }
        return false;
    }
}
