package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.MlltFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.TextInformationFrame;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class PH implements InterfaceC1383Yv {
    public static byte[] A0K;
    public static String[] A0L = {"4htp9wQKuxyNfsHEw2q4xJVan2K9SWSs", "h9h3Y", "ncIzQl9bZGhwNHkiXwnd2dN9HoT0D8hr", "MIEY5GizladxFuO8LFxd2mtUm3BxYog0", "wIMYYD5Q8MSgCqvQWUWYRrzWdxQxZfjH", "a9VTiA7kgQO5OeM7micOduBr46AjVnKU", "QiXpONybhoHEJE7NKINdaAs10Y1JUUbc", "vjHJwK3zsTkkYShkelgOo6qgRdbbMVoF"};
    public static final InterfaceC1387Yz A0M;
    public static final InterfaceC1414a0 A0N;
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public Metadata A06;
    public InterfaceC1384Yw A07;
    public ZP A08;
    public ZP A09;
    public PG A0A;
    public boolean A0B;
    public boolean A0C;
    public final int A0D;
    public final long A0E;
    public final C1084Mk A0F;
    public final Z6 A0G;
    public final Z8 A0H;
    public final Z9 A0I;
    public final ZP A0J;

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0K, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 40);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A0K = new byte[]{-46, -28, -32, -15, -30, -25, -28, -29, -97, -13, -18, -18, -97, -20, -32, -19, -8, -97, -31, -8, -13, -28, -14, -83, -101, -109, -116, -107};
    }

    static {
        A0B();
        A0M = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.PJ
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return PH.A0G();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
        A0N = new InterfaceC1414a0() { // from class: com.facebook.ads.redexgen.X.PI
            @Override // com.facebook.ads.redexgen.X.InterfaceC1414a0
            public final boolean A6z(int i5, int i11, int i12, int i13, int i14) {
                return PH.A0C(i5, i11, i12, i13, i14);
            }
        };
    }

    @MetaExoPlayerCustomization
    public PH() {
        this(0);
    }

    @MetaExoPlayerCustomization
    public PH(int i5) {
        this(i5, -9223372036854775807L);
    }

    @MetaExoPlayerCustomization
    public PH(int i5, long j11) {
        this.A0D = (i5 & 2) != 0 ? i5 | 1 : i5;
        this.A0E = j11;
        this.A0F = new C1084Mk(10);
        this.A0I = new Z9();
        this.A0G = new Z6();
        this.A02 = -9223372036854775807L;
        this.A0H = new Z8();
        this.A0J = new QA();
        this.A08 = this.A0J;
    }

    public static int A00(C1084Mk c1084Mk, int i5) {
        if (c1084Mk.A0A() >= i5 + 4) {
            c1084Mk.A0f(i5);
            int iA0C = c1084Mk.A0C();
            if (iA0C == 1483304551 || iA0C == 1231971951) {
                return iA0C;
            }
        }
        if (c1084Mk.A0A() >= 40) {
            c1084Mk.A0f(36);
            return c1084Mk.A0C() == 1447187017 ? 1447187017 : 0;
        }
        return 0;
    }

    @RequiresNonNull
    private int A01(Q9 q92) throws IOException {
        if (this.A01 == 0) {
            try {
                A0F(q92, false);
            } catch (EOFException unused) {
                return -1;
            }
        }
        if (this.A0A == null) {
            this.A0A = A07(q92);
            this.A07.AKP(this.A0A);
            ZP zp2 = this.A08;
            C1029Ke c1029KeA0v = new C1029Ke().A11(this.A0I.A06).A0h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT).A0b(this.A0I.A01).A0m(this.A0I.A03).A0d(this.A0G.A00).A0e(this.A0G.A01).A0v((this.A0D & 8) != 0 ? null : this.A06);
            if (A0L[1].length() == 16) {
                throw new RuntimeException();
            }
            A0L[2] = "AwID86PoqVoKZrEjM8D15y2IWFfRJ8tJ";
            zp2.A7E(c1029KeA0v.A14());
            this.A03 = q92.A9Q();
        } else if (this.A03 != 0) {
            long jA9Q = q92.A9Q();
            if (jA9Q < this.A03) {
                q92.ALL((int) (this.A03 - jA9Q));
            }
        }
        return A02(q92);
    }

    @RequiresNonNull
    private int A02(Q9 q92) throws IOException {
        if (this.A00 == 0) {
            q92.AK3();
            if (A0E(q92)) {
                return -1;
            }
            this.A0F.A0f(0);
            int iA0C = this.A0F.A0C();
            int sampleHeaderData = this.A01;
            if (A0D(iA0C, sampleHeaderData)) {
                int sampleHeaderData2 = ZA.A00(iA0C);
                if (sampleHeaderData2 != -1) {
                    this.A0I.A00(iA0C);
                    if (this.A02 == -9223372036854775807L) {
                        this.A02 = this.A0A.A9u(q92.A9Q());
                        if (this.A0E != -9223372036854775807L) {
                            this.A02 += this.A0E - this.A0A.A9u(0L);
                        }
                    }
                    int sampleHeaderData3 = this.A0I.A02;
                    this.A00 = sampleHeaderData3;
                    if (this.A0A instanceof C8H) {
                        C8H c8h = (C8H) this.A0A;
                        long j11 = this.A04;
                        int sampleHeaderData4 = this.A0I.A04;
                        long jA03 = A03(j11 + sampleHeaderData4);
                        long jA9Q = q92.A9Q();
                        int sampleHeaderData5 = this.A0I.A02;
                        c8h.A01(jA03, jA9Q + sampleHeaderData5);
                        if (this.A0C && c8h.A02(this.A05)) {
                            this.A0C = false;
                            if (A0L[1].length() == 16) {
                                throw new RuntimeException();
                            }
                            String[] strArr = A0L;
                            strArr[3] = "7FBOKtc0B68FoRi3EhAMNX51eyZxdGES";
                            strArr[4] = "Q4axqbsJAlQS6aydPlnbvav83iQxgkTX";
                            this.A08 = this.A09;
                        }
                    }
                }
            }
            q92.ALL(1);
            this.A01 = 0;
            return 0;
        }
        int iAK7 = this.A08.AK7(q92, this.A00, true);
        if (iAK7 == -1) {
            return -1;
        }
        int bytesAppended = this.A00;
        this.A00 = bytesAppended - iAK7;
        int bytesAppended2 = this.A00;
        if (bytesAppended2 > 0) {
            return 0;
        }
        this.A08.AKC(A03(this.A04), 1, this.A0I.A02, 0, null);
        long j12 = this.A04;
        int bytesAppended3 = this.A0I.A04;
        this.A04 = j12 + bytesAppended3;
        this.A00 = 0;
        return 0;
    }

    private long A03(long j11) {
        return this.A02 + ((1000000 * j11) / this.A0I.A03);
    }

    public static long A04(Metadata metadata) {
        if (metadata != null) {
            int iA02 = metadata.A02();
            for (int i5 = 0; i5 < iA02; i5++) {
                Metadata.Entry entryA03 = metadata.A03(i5);
                if ((entryA03 instanceof TextInformationFrame) && ((Id3Frame) ((TextInformationFrame) entryA03)).A00.equals(A09(24, 4, 31))) {
                    return N1.A0O(Long.parseLong(((TextInformationFrame) entryA03).A02.get(0)));
                }
            }
            return -9223372036854775807L;
        }
        return -9223372036854775807L;
    }

    private C8I A05(Q9 q92, boolean z11) throws IOException {
        q92.AI6(this.A0F.A0l(), 0, 4);
        this.A0F.A0f(0);
        this.A0I.A00(this.A0F.A0C());
        return new C8I(q92.A90(), q92.A9Q(), this.A0I, z11);
    }

    public static C8G A06(Metadata metadata, long j11) {
        if (metadata != null) {
            int iA02 = metadata.A02();
            String[] strArr = A0L;
            if (strArr[3].charAt(27) == strArr[4].charAt(27)) {
                A0L[0] = "PL90Nzq4Cp6ail5aCSf1a0DTgrKn0Rhm";
                for (int i5 = 0; i5 < iA02; i5++) {
                    Metadata.Entry entryA03 = metadata.A03(i5);
                    String[] strArr2 = A0L;
                    String str = strArr2[5];
                    String str2 = strArr2[6];
                    int i11 = str.charAt(10);
                    int length = str2.charAt(10);
                    if (i11 != length) {
                        A0L[0] = "qoCxvN47s15e10JDePka34bnqGKOacbN";
                        if (entryA03 instanceof MlltFrame) {
                            return C8G.A01(j11, (MlltFrame) entryA03, A04(metadata));
                        }
                    }
                }
                return null;
            }
            throw new RuntimeException();
        }
        return null;
    }

    private PG A07(Q9 q92) throws IOException {
        long durationUs;
        PG pgA08 = A08(q92);
        PG seekFrameSeeker = A06(this.A06, q92.A9Q());
        if (this.A0B) {
            return new C8F();
        }
        PG c8h = null;
        if ((this.A0D & 4) != 0) {
            long jA8K = -1;
            if (seekFrameSeeker != null) {
                durationUs = seekFrameSeeker.A8U();
                jA8K = seekFrameSeeker.A8K();
            } else if (pgA08 != null) {
                durationUs = pgA08.A8U();
                jA8K = pgA08.A8K();
            } else {
                durationUs = A04(this.A06);
            }
            c8h = new C8H(durationUs, q92.A9Q(), jA8K);
        } else if (seekFrameSeeker != null) {
            c8h = seekFrameSeeker;
        } else if (pgA08 != null) {
            c8h = pgA08;
        }
        boolean z11 = true;
        if (c8h == null || (!c8h.ABR() && (this.A0D & 1) != 0)) {
            if ((this.A0D & 2) == 0) {
                z11 = false;
            }
            return A05(q92, z11);
        }
        return c8h;
    }

    private PG A08(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(this.A0I.A02);
        q92.AI6(c1084Mk.A0l(), 0, this.A0I.A02);
        int i5 = 21;
        if ((this.A0I.A05 & 1) != 0) {
            if (this.A0I.A01 != 1) {
                i5 = 36;
            }
        } else if (this.A0I.A01 == 1) {
            i5 = 13;
        }
        int iA00 = A00(c1084Mk, i5);
        if (iA00 == 1483304551 || iA00 == 1231971951) {
            C8D c8dA01 = C8D.A01(q92.A90(), q92.A9Q(), this.A0I, c1084Mk);
            if (c8dA01 != null && !this.A0G.A03()) {
                q92.AK3();
                q92.A4X(i5 + 141);
                C1084Mk frame = this.A0F;
                q92.AI6(frame.A0l(), 0, 3);
                C1084Mk frame2 = this.A0F;
                frame2.A0f(0);
                Z6 z62 = this.A0G;
                C1084Mk frame3 = this.A0F;
                z62.A04(frame3.A0K());
            }
            q92.ALL(this.A0I.A02);
            if (c8dA01 != null && !c8dA01.ABR() && iA00 == 1231971951) {
                return A05(q92, false);
            }
            return c8dA01;
        }
        if (iA00 == 1447187017) {
            C8E c8eA00 = C8E.A00(q92.A90(), q92.A9Q(), this.A0I, c1084Mk);
            q92.ALL(this.A0I.A02);
            return c8eA00;
        }
        q92.AK3();
        return null;
    }

    @EnsuresNonNull
    private void A0A() {
        AbstractC1062Ln.A02(this.A09);
    }

    public static /* synthetic */ boolean A0C(int i5, int i11, int i12, int i13, int i14) {
        return (i11 == 67 && i12 == 79 && i13 == 77 && (i14 == 77 || i5 == 2)) || (i11 == 77 && i12 == 76 && i13 == 76 && (i14 == 84 || i5 == 2));
    }

    public static boolean A0D(int i5, long j11) {
        return ((long) ((-128000) & i5)) == ((-128000) & j11);
    }

    private boolean A0E(Q9 q92) throws IOException {
        if (this.A0A != null) {
            long jA8K = this.A0A.A8K();
            if (jA8K != -1) {
                long dataEndPosition = q92.A9L();
                if (dataEndPosition > jA8K - 4) {
                    return true;
                }
            }
        }
        try {
            return !q92.AI7(this.A0F.A0l(), 0, 4, true);
        } catch (EOFException unused) {
            return true;
        }
    }

    private boolean A0F(Q9 q92, boolean z11) throws IOException {
        int i5 = 0;
        int i11 = 0;
        int iA9L = 0;
        int searchedBytes = 0;
        int headerData = z11 ? SQLiteDatabase.OPEN_NOMUTEX : SQLiteDatabase.OPEN_SHAREDCACHE;
        q92.AK3();
        if (q92.A9Q() == 0) {
            int validFrameCount = this.A0D;
            int validFrameCount2 = (validFrameCount & 8) == 0 ? 1 : 0;
            this.A06 = this.A0H.A00(q92, validFrameCount2 != 0 ? null : A0N);
            if (this.A06 != null) {
                this.A0G.A05(this.A06);
            }
            iA9L = (int) q92.A9L();
            if (!z11) {
                q92.ALL(iA9L);
            }
        }
        while (true) {
            if (A0E(q92)) {
                if (i5 <= 0) {
                    throw new EOFException();
                }
            } else {
                this.A0F.A0f(0);
                int iA0C = this.A0F.A0C();
                if (i11 == 0 || A0D(iA0C, i11)) {
                    int iA00 = ZA.A00(iA0C);
                    if (A0L[7].charAt(2) == 117) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A0L;
                    strArr[5] = "KgGD0rSdhSypmG7EMxnTmlmP8iEF2wAy";
                    strArr[6] = "UrFKevQYk8rXLiwKBhRaZheAhX388l7i";
                    if (iA00 != -1) {
                        i5++;
                        if (i5 == 1) {
                            this.A0I.A00(iA0C);
                            i11 = iA0C;
                        } else if (i5 == 4) {
                            break;
                        }
                        int validFrameCount3 = iA00 - 4;
                        q92.A4X(validFrameCount3);
                    }
                }
                int candidateSynchronizedHeaderData = searchedBytes + 1;
                if (searchedBytes == headerData) {
                    if (z11) {
                        return false;
                    }
                    throw L9.A01(A09(0, 24, 87), null);
                }
                i5 = 0;
                i11 = 0;
                if (z11) {
                    q92.AK3();
                    int validFrameCount4 = iA9L + candidateSynchronizedHeaderData;
                    q92.A4X(validFrameCount4);
                } else {
                    q92.ALL(1);
                }
                searchedBytes = candidateSynchronizedHeaderData;
            }
        }
        if (z11) {
            q92.ALL(iA9L + searchedBytes);
        } else {
            q92.AK3();
        }
        this.A01 = i11;
        return true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A0G() {
        return new InterfaceC1383Yv[]{new PH()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A07 = interfaceC1384Yw;
        this.A09 = this.A07.ALm(0, 1);
        this.A08 = this.A09;
        this.A07.A6x();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        A0A();
        int iA01 = A01(q92);
        if (iA01 == -1 && (this.A0A instanceof C8H)) {
            long jA03 = A03(this.A04);
            long durationUs = this.A0A.A8U();
            if (durationUs != jA03) {
                ((C8H) this.A0A).A00(jA03);
                this.A07.AKP(this.A0A);
            }
        }
        return iA01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        this.A01 = 0;
        this.A02 = -9223372036854775807L;
        this.A04 = 0L;
        this.A00 = 0;
        this.A05 = j12;
        if ((this.A0A instanceof C8H) && !((C8H) this.A0A).A02(j12)) {
            this.A0C = true;
            this.A08 = this.A0J;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        return A0F(q92, true);
    }
}
