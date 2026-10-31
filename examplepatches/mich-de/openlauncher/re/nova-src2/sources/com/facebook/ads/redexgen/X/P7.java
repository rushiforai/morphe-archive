package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.util.Pair;
import android.util.SparseArray;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.extractor.metadata.emsg.EventMessage;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class P7 implements InterfaceC1383Yv {
    public static byte[] A0e;
    public static String[] A0f = {"sO39cWCOFCUi2", "3J13aAXeHBslCaHm4OiPxJcF4UiPBDWP", "7JGaZC3prhWZ5I2IpDwO5CcmXcw6ZOCb", "9P68A5ff2eKCf", "o9carFUVPOdFKZpiuc1", "inzJrXFaWAK4fUb0mTW", "qp89PgUGoSE", b.f42142b};
    public static final InterfaceC1387Yz A0g;
    public static final VC A0h;
    public static final byte[] A0i;
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public long A07;
    public long A08;
    public long A09;
    public long A0A;
    public long A0B;
    public long A0C;
    public SparseArray<C1468at> A0D;
    public C1084Mk A0E;
    public InterfaceC1384Yw A0F;
    public C1468at A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public ZP[] A0K;
    public ZP[] A0L;
    public final int A0M;
    public final DrmInitData A0N;
    public final C1084Mk A0O;
    public final C1084Mk A0P;
    public final C1084Mk A0Q;
    public final C1084Mk A0R;
    public final C1084Mk A0S;
    public final C1092Ms A0T;
    public final ZP A0U;
    public final C1400Zm A0V;
    public final C1485bA A0W;
    public final ArrayDeque<PF> A0X;
    public final ArrayDeque<C1467as> A0Y;
    public final List<VC> A0Z;
    public final boolean A0a;
    public final boolean A0b;
    public final boolean A0c;
    public final byte[] A0d;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static int A00(C1468at c1468at, int i5, long j11, int i11, C1084Mk c1084Mk, int i12) {
        int i13 = i12;
        long j12 = j11;
        c1084Mk.A0f(8);
        int iA02 = AbstractC1455ag.A02(c1084Mk.A0C());
        C1485bA c1485bA = c1468at.A05;
        C1487bC c1487bC = c1468at.A07;
        C1462an c1462an = c1487bC.A06;
        c1487bC.A0C[i5] = c1084Mk.A0L();
        c1487bC.A0E[i5] = c1487bC.A04;
        if ((iA02 & 1) != 0) {
            long[] jArr = c1487bC.A0E;
            jArr[i5] = jArr[i5] + c1084Mk.A0C();
        }
        boolean z11 = (iA02 & 4) != 0;
        int iA0L = c1462an.A01;
        if (z11) {
            iA0L = c1084Mk.A0L();
        }
        boolean z12 = (iA02 & 256) != 0;
        boolean z13 = (iA02 & EventBridgeChannel.QUEUE_CAPACITY) != 0;
        boolean z14 = (iA02 & 1024) != 0;
        boolean z15 = (iA02 & 2048) != 0;
        long j13 = 0;
        if (c1485bA.A08 != null && c1485bA.A08.length == 1 && c1485bA.A08[0] == 0) {
            j13 = c1485bA.A09[0];
        }
        int[] iArr = c1487bC.A0B;
        long[] jArr2 = c1487bC.A0D;
        boolean[] zArr = c1487bC.A0G;
        boolean z16 = c1485bA.A03 == 2 && (i11 & 1) != 0;
        int i14 = i13 + c1487bC.A0C[i5];
        long j14 = c1485bA.A06;
        if (i5 > 0) {
            j12 = c1487bC.A05;
        }
        while (i13 < i14) {
            int iA0L2 = z12 ? c1084Mk.A0L() : c1462an.A00;
            int iA0L3 = z13 ? c1084Mk.A0L() : c1462an.A03;
            int iA0C = (i13 == 0 && z11) ? iA0L : z14 ? c1084Mk.A0C() : c1462an.A01;
            if (A0f[1].charAt(30) == 'd') {
                throw new RuntimeException();
            }
            String[] strArr = A0f;
            strArr[6] = "7ekXoexQQmy";
            strArr[5] = "InaD67iDP2cJ4lebIla";
            jArr2[i13] = N1.A0U(((z15 ? c1084Mk.A0C() : 0) + j12) - j13, 1000000L, j14);
            zArr[i13] = ((iA0C >> 16) & 1) == 0 && (!z16 || i13 == 0);
            iArr[i13] = iA0L3;
            j12 += iA0L2;
            i13++;
        }
        c1487bC.A05 = j12;
        return i14;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static Pair<Long, QJ> A04(C1084Mk c1084Mk, long j11) throws L9 {
        long jA0R;
        long jA0R2;
        c1084Mk.A0f(8);
        int iA03 = AbstractC1455ag.A03(c1084Mk.A0C());
        c1084Mk.A0g(4);
        long jA0Q = c1084Mk.A0Q();
        if (iA03 == 0) {
            jA0R = c1084Mk.A0Q();
            jA0R2 = j11 + c1084Mk.A0Q();
        } else {
            jA0R = c1084Mk.A0R();
            jA0R2 = j11 + c1084Mk.A0R();
        }
        long jA0U = N1.A0U(jA0R, 1000000L, jA0Q);
        c1084Mk.A0g(2);
        int iA0M = c1084Mk.A0M();
        int[] iArr = new int[iA0M];
        long[] jArr = new long[iA0M];
        long[] jArr2 = new long[iA0M];
        long[] jArr3 = new long[iA0M];
        long jA0U2 = jA0U;
        for (int i5 = 0; i5 < iA0M; i5++) {
            int iA0C = c1084Mk.A0C();
            if ((Integer.MIN_VALUE & iA0C) != 0) {
                throw new L9(A0B(634, 28, 9));
            }
            long jA0Q2 = c1084Mk.A0Q();
            iArr[i5] = Integer.MAX_VALUE & iA0C;
            jArr[i5] = jA0R2;
            jArr3[i5] = jA0U2;
            jA0R += jA0Q2;
            jA0U2 = N1.A0U(jA0R, 1000000L, jA0Q);
            jArr2[i5] = jA0U2 - jArr3[i5];
            c1084Mk.A0g(4);
            jA0R2 += iArr[i5];
        }
        return Pair.create(Long.valueOf(jA0U), new QJ(iArr, jArr, jArr2, jArr3));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1468at A09(C1084Mk c1084Mk, SparseArray<C1468at> sparseArray, boolean z11) {
        c1084Mk.A0f(8);
        int iA02 = AbstractC1455ag.A02(c1084Mk.A0C());
        C1468at c1468atA08 = A08(sparseArray, c1084Mk.A0C(), z11);
        if (c1468atA08 == null) {
            String[] strArr = A0f;
            if (strArr[6].length() == strArr[5].length()) {
                throw new RuntimeException();
            }
            A0f[4] = "fC";
            return null;
        }
        int i5 = iA02 & 1;
        if (A0f[2].charAt(15) == 'A') {
            throw new RuntimeException();
        }
        A0f[2] = "nHd2GKC6avBKXDLVsIU0TahN3dA1C9n2";
        if (i5 != 0) {
            long jA0R = c1084Mk.A0R();
            c1468atA08.A07.A04 = jA0R;
            c1468atA08.A07.A03 = jA0R;
        }
        C1462an c1462an = c1468atA08.A04;
        c1468atA08.A07.A06 = new C1462an((iA02 & 2) != 0 ? c1084Mk.A0L() - 1 : c1462an.A02, (iA02 & 8) != 0 ? c1084Mk.A0L() : c1462an.A00, (iA02 & 16) != 0 ? c1084Mk.A0L() : c1462an.A03, (iA02 & 32) != 0 ? c1084Mk.A0L() : c1462an.A01);
        return c1468atA08;
    }

    public static String A0B(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0e, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 90);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0E() {
        A0e = new byte[]{-51, -63, -89, -38, -43, -45, -122, -39, -49, -32, -53, -122, -46, -53, -39, -39, -122, -38, -50, -57, -44, -122, -50, -53, -57, -54, -53, -40, -122, -46, -53, -44, -51, -38, -50, -122, -114, -37, -44, -39, -37, -42, -42, -43, -40, -38, -53, -54, -113, -108, -40, 1, 7, 5, 12, -77, -10, 2, 8, 1, 7, -77, -4, 1, -77, 6, -11, -6, 3, -77, -76, -48, -77, -60, -77, -69, 8, 1, 6, 8, 3, 3, 2, 5, 7, -8, -9, -68, -63, -49, -8, -2, -4, 3, -86, -19, -7, -1, -8, -2, -86, -13, -8, -86, -3, -15, -6, -18, -86, -85, -57, -86, -69, -86, -78, -1, -8, -3, -1, -6, -6, -7, -4, -2, -17, -18, -77, -72, 28, 72, 55, 61, 67, 59, 68, 74, 59, 58, 35, 70, 10, 27, 78, 74, 72, 55, 57, 74, 69, 72, -32, -2, 5, 6, 9, 0, 5, -2, -73, 5, -4, -2, -8, 11, 0, 13, -4, -73, 6, -3, -3, 10, -4, 11, -73, 11, 6, -73, 10, -8, 4, 7, 3, -4, -73, -5, -8, 11, -8, -59, -71, -34, -26, -47, -36, -39, -44, -112, -66, -79, -68, -112, -36, -43, -34, -41, -28, -40, -46, -21, -25, -20, -90, -25, -6, -11, -13, -90, -22, -21, -20, -17, -12, -21, -7, -90, -21, -2, -6, -21, -12, -22, -21, -22, -90, -25, -6, -11, -13, -90, -7, -17, 0, -21, -90, -82, -5, -12, -7, -5, -10, -10, -11, -8, -6, -21, -22, -81, -76, 36, 61, 57, 62, -8, 57, 76, 71, 69, -8, 79, 65, 76, 64, -8, 68, 61, 70, 63, 76, 64, -8, 22, -8, 10, 9, 12, 15, 12, 16, 11, 14, 12, 15, -8, 0, 77, 70, 75, 77, 72, 72, 71, 74, 76, 61, 60, 1, 6, 32, 57, 66, 59, 72, 60, -12, 65, 61, 71, 65, 53, 72, 55, 60, 14, -12, -6, 17, 17, 30, 16, 31, -53, 31, 26, -53, 16, 25, 14, 29, 36, 27, 31, 20, 26, 25, -53, 15, 12, 31, 12, -53, 34, 12, 30, -53, 25, 16, 18, 12, 31, 20, 33, 16, -39, -19, 4, 4, 17, 3, 18, -66, 18, 13, -66, 3, 12, 2, -66, 13, 4, -66, 11, 2, -1, 18, -66, 21, -1, 17, -66, 12, 3, 5, -1, 18, 7, 20, 3, -52, -73, -34, -51, -38, -38, -47, -52, -47, -42, -49, -120, -68, -38, -55, -53, -45, -83, -42, -53, -38, -31, -40, -36, -47, -41, -42, -86, -41, -32, -120, -40, -55, -38, -55, -43, -51, -36, -51, -38, -37, -120, -47, -37, -120, -35, -42, -37, -35, -40, -40, -41, -38, -36, -51, -52, -106, -32, -8, -10, -3, -3, -14, -15, -83, -3, 0, 0, -11, -83, -18, 1, -4, -6, -83, -75, -13, -18, -10, -7, -14, -15, -83, 1, -4, -83, -14, 5, 1, -1, -18, -16, 1, -83, 2, 2, -10, -15, -74, -13, 11, 9, 16, 16, 9, 14, 7, -64, 1, 20, 15, 13, -64, 23, 9, 20, 8, -64, 12, 5, 14, 7, 20, 8, -64, -34, -64, -46, -47, -44, -41, -44, -40, -45, -42, -44, -41, -64, -56, 21, 14, 19, 21, 16, 16, 15, 18, 20, 5, 4, -55, -50, -27, -3, -5, 2, 2, -5, 0, -7, -78, 7, 0, 5, 7, 2, 2, 1, 4, 6, -9, -10, -78, -9, -1, 5, -7, -78, 8, -9, 4, 5, -5, 1, 0, -52, -78, -37, -12, -21, -2, -10, -21, -23, -6, -21, -22, -90, -13, -11, -11, -4, -90, -24, -11, -2, -76, -5, 20, 11, 30, 22, 11, 9, 26, 11, 10, -58, 25, 7, 15, 21, -58, 11, 20, 26, 24, 31, -58, 9, 21, 27, 20, 26, -32, -58, -72, -47, -53, -60, -47, -57, -49, -56, -57, -125, -52, -47, -57, -52, -43, -56, -58, -41, -125, -43, -56, -55, -56, -43, -56, -47, -58, -56, -28, -17, 0, -9, -17, -16, -6, -13, -82, -6, -13, -4, -11, 2, -10, -82, -14, -13, 1, -15, 0, -9, -2, 2, -9, -3, -4, -82, -9, -4, -82, 1, -11, -2, -14, -82, -12, -3, 3, -4, -14, -82, -74, 3, -4, 1, 3, -2, -2, -3, 0, 2, -13, -14, -73, 53, 68, 68, 64, 61, 55, 53, 72, 61, 67, 66, 3, 76, 1, 57, 65, 71, 59, 6, 21, 21, 17, 14, 8, 6, 25, 14, 20, 19, -44, 29, -46, 18, 21, -39, -46, 27, 25, 25, -6, -19, -24, -23, -13, -77, -20, -23, -6, -25, -1, -14, -19, -18, -8, -72, -10, -7, -67};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0164  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0I(C1084Mk c1084Mk, Uri uri) {
        String str;
        String str2;
        long jA05;
        long jA0U;
        long jA0Q;
        if (this.A0L == null || this.A0L.length == 0) {
            return;
        }
        c1084Mk.A0f(8);
        int iA03 = AbstractC1455ag.A03(c1084Mk.A0C());
        long jA0U2 = -9223372036854775807L;
        switch (iA03) {
            case 0:
                str = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                str2 = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                long jA0Q2 = c1084Mk.A0Q();
                jA0U2 = N1.A0U(c1084Mk.A0Q(), 1000000L, jA0Q2);
                jA05 = this.A0C != -9223372036854775807L ? this.A0C + jA0U2 : -9223372036854775807L;
                jA0U = N1.A0U(c1084Mk.A0Q(), 1000L, jA0Q2);
                jA0Q = c1084Mk.A0Q();
                break;
            case 1:
                long jA0Q3 = c1084Mk.A0Q();
                jA05 = N1.A0U(c1084Mk.A0R(), 1000000L, jA0Q3);
                jA0U = N1.A0U(c1084Mk.A0Q(), 1000L, jA0Q3);
                jA0Q = c1084Mk.A0Q();
                str = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                str2 = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                break;
            default:
                MV.A07(A0B(128, 22, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), A0B(550, 35, 56) + iA03);
                return;
        }
        byte[] bArr = new byte[c1084Mk.A07()];
        c1084Mk.A0k(bArr, 0, c1084Mk.A07());
        int i5 = 0;
        C1084Mk c1084Mk2 = new C1084Mk(this.A0V.A01(new EventMessage(str, str2, jA0U, jA0Q, bArr)));
        int iA07 = c1084Mk2.A07();
        ZP[] zpArr = this.A0L;
        int length = zpArr.length;
        int i11 = 0;
        while (i11 < length) {
            ZP zp2 = zpArr[i11];
            c1084Mk2.A0f(i5);
            zp2.ALz(uri);
            zp2.AK9(c1084Mk2, iA07);
            i11++;
            i5 = 0;
        }
        if (jA05 == -9223372036854775807L) {
            this.A0Y.addLast(new C1467as(jA0U2, iA07));
            this.A03 += iA07;
            return;
        }
        C1092Ms c1092Ms = this.A0T;
        if (A0f[1].charAt(30) == 'd') {
            throw new RuntimeException();
        }
        String[] strArr = A0f;
        strArr[6] = "uaMSplb4u0m";
        strArr[5] = "HaGtuqQyLFEkuZ0tf4T";
        if (c1092Ms != null) {
            jA05 = this.A0T.A05(jA05);
        }
        if (this.A0b) {
            long j11 = this.A0A;
            String[] strArr2 = A0f;
            if (strArr2[3].length() != strArr2[0].length()) {
                A0f[4] = "tNv1kdHelC6xYU53lDYUVckkyBjgFP";
                if (j11 != -9223372036854775807L) {
                    jA05 = this.A0A;
                }
            } else {
                String[] strArr3 = A0f;
                strArr3[3] = "xakMNbTBAGyrm";
                strArr3[0] = "M4LbGO3NwDTbj";
                if (j11 != -9223372036854775807L) {
                }
            }
        }
        for (ZP zp3 : this.A0L) {
            zp3.AKC(jA05, 1, iA07, 0, null);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0J(C1084Mk c1084Mk, C1084Mk c1084Mk2, String str, C1487bC c1487bC) throws L9 {
        c1084Mk.A0f(8);
        int iA0C = c1084Mk.A0C();
        if (c1084Mk.A0C() != 1936025959) {
            return;
        }
        if (AbstractC1455ag.A03(iA0C) == 1) {
            c1084Mk.A0g(4);
        }
        if (c1084Mk.A0C() != 1) {
            throw new L9(A0B(50, 39, 57));
        }
        c1084Mk2.A0f(8);
        int iA0C2 = c1084Mk2.A0C();
        if (c1084Mk2.A0C() != 1936025959) {
            return;
        }
        int iA03 = AbstractC1455ag.A03(iA0C2);
        if (iA03 == 1) {
            if (c1084Mk2.A0Q() == 0) {
                throw new L9(A0B(662, 55, 52));
            }
        } else if (iA03 >= 2) {
            c1084Mk2.A0g(4);
        }
        if (c1084Mk2.A0Q() != 1) {
            throw new L9(A0B(89, 39, 48));
        }
        c1084Mk2.A0g(1);
        int iA0I = c1084Mk2.A0I();
        int i5 = (iA0I & 240) >> 4;
        int i11 = iA0I & 15;
        boolean z11 = c1084Mk2.A0I() == 1;
        if (z11) {
            int iA0I2 = c1084Mk2.A0I();
            byte[] bArr = new byte[16];
            c1084Mk2.A0k(bArr, 0, bArr.length);
            byte[] bArr2 = null;
            if (iA0I2 == 0) {
                int iA0I3 = c1084Mk2.A0I();
                bArr2 = new byte[iA0I3];
                c1084Mk2.A0k(bArr2, 0, iA0I3);
                if (A0f[1].charAt(30) == 'd') {
                    throw new RuntimeException();
                }
                A0f[4] = "YdJdxJABJdh7NTrpeOaKq84AE";
            }
            c1487bC.A08 = true;
            c1487bC.A07 = new C1486bB(z11, str, iA0I2, bArr, i5, i11, bArr2);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A0R(PF pf2) throws L9 {
        AbstractC1062Ln.A0A(this.A0W == null, A0B(585, 20, 44));
        DrmInitData drmInitDataA05 = A05(pf2.A02);
        PF pf3 = (PF) AbstractC1062Ln.A01(pf2.A02(1836475768));
        SparseArray<C1462an> sparseArray = new SparseArray<>();
        long jA01 = -9223372036854775807L;
        int size = pf3.A02.size();
        for (int i5 = 0; i5 < size; i5++) {
            PE pe2 = pf3.A02.get(i5);
            if (((AbstractC1455ag) pe2).A00 == 1953654136) {
                Pair<Integer, C1462an> pairA03 = A03(pe2.A00);
                sparseArray.put(((Integer) pairA03.first).intValue(), (C1462an) pairA03.second);
            } else {
                int i11 = ((AbstractC1455ag) pe2).A00;
                if (A0f[7].length() == 31) {
                    throw new RuntimeException();
                }
                String[] strArr = A0f;
                strArr[6] = "fQX4JDEh8CS";
                strArr[5] = "Ov1Rr2UIae6mGCP9QAH";
                if (i11 == 1835362404) {
                    jA01 = A01(pe2.A00);
                }
            }
        }
        SparseArray sparseArray2 = new SparseArray();
        int size2 = pf2.A01.size();
        for (int i12 = 0; i12 < size2; i12++) {
            PF pf4 = pf2.A01.get(i12);
            if (((AbstractC1455ag) pf4).A00 == 1953653099) {
                C1485bA c1485bAA0A = A0A(AbstractC1461am.A0J(pf4, pf2.A03(1836476516), jA01, drmInitDataA05, (this.A0M & 16) != 0, false));
                if (c1485bAA0A != null) {
                    sparseArray2.put(c1485bAA0A.A00, c1485bAA0A);
                }
            }
        }
        int size3 = sparseArray2.size();
        if (this.A0D.size() != 0) {
            AbstractC1062Ln.A08(this.A0D.size() == size3);
            for (int i13 = 0; i13 < size3; i13++) {
                C1485bA c1485bA = (C1485bA) sparseArray2.valueAt(i13);
                this.A0D.get(c1485bA.A00).A08(c1485bA, A06(sparseArray, c1485bA.A00));
            }
            return;
        }
        for (int i14 = 0; i14 < size3; i14++) {
            C1485bA c1485bA2 = (C1485bA) sparseArray2.valueAt(i14);
            C1468at c1468at = new C1468at(this.A0F.ALm(i14, c1485bA2.A03));
            c1468at.A08(c1485bA2, A06(sparseArray, c1485bA2.A00));
            this.A0D.put(c1485bA2.A00, c1468at);
            this.A08 = Math.max(this.A08, c1485bA2.A04);
        }
        A0D();
        this.A0F.A6x();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0T(PF pf2, SparseArray<C1468at> sparseArray, int i5, byte[] bArr, boolean z11) throws L9 {
        C1468at c1468atA09 = A09(pf2.A03(1952868452).A00, sparseArray, z11);
        if (c1468atA09 == null) {
            return;
        }
        C1487bC c1487bC = c1468atA09.A07;
        long jA02 = c1487bC.A05;
        c1468atA09.A05();
        if (pf2.A03(1952867444) != null) {
            int i11 = i5 & 2;
            if (A0f[1].charAt(30) == 'd') {
                throw new RuntimeException();
            }
            A0f[1] = "uRSWbeSjKMEIQgyI5DdsOQiwalwAUF0L";
            if (i11 == 0) {
                PE peA03 = pf2.A03(1952867444);
                if (A0f[1].charAt(30) == 'd') {
                    throw new RuntimeException();
                }
                A0f[7] = "f0B6k98tpHqAKr9nqIJq26FbSaXaG";
                jA02 = A02(peA03.A00);
            }
        }
        A0U(pf2, c1468atA09, jA02, i5);
        C1486bB c1486bBA00 = c1468atA09.A05.A00(c1487bC.A06.A02);
        PE peA032 = pf2.A03(1935763834);
        if (peA032 != null) {
            A0W(c1486bBA00, peA032.A00, c1487bC);
        }
        PE peA033 = pf2.A03(1935763823);
        if (peA033 != null) {
            A0K(peA033.A00, c1487bC);
        }
        PE peA034 = pf2.A03(1936027235);
        if (peA034 != null) {
            A0L(peA034.A00, c1487bC);
        }
        PE peA035 = pf2.A03(1935828848);
        PE peA036 = pf2.A03(1936158820);
        if (peA035 != null && peA036 != null) {
            A0J(peA035.A00, peA036.A00, c1486bBA00 != null ? c1486bBA00.A02 : null, c1487bC);
        }
        int size = pf2.A02.size();
        for (int i12 = 0; i12 < size; i12++) {
            PE pe2 = pf2.A02.get(i12);
            if (((AbstractC1455ag) pe2).A00 == 1970628964) {
                A0M(pe2.A00, c1487bC, bArr);
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0W(C1486bB c1486bB, C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        int i5 = c1486bB.A00;
        c1084Mk.A0f(8);
        if ((AbstractC1455ag.A02(c1084Mk.A0C()) & 1) == 1) {
            c1084Mk.A0g(8);
        }
        int iA0I = c1084Mk.A0I();
        int iA0L = c1084Mk.A0L();
        if (iA0L != c1487bC.A00) {
            throw new L9(A0B(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, 17, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) + iA0L + A0B(0, 2, 71) + c1487bC.A00);
        }
        int i11 = 0;
        if (iA0I == 0) {
            boolean[] zArr = c1487bC.A0F;
            for (int i12 = 0; i12 < iA0L; i12++) {
                int iA0I2 = c1084Mk.A0I();
                i11 += iA0I2;
                zArr[i12] = iA0I2 > i5;
            }
        } else {
            i11 = 0 + (iA0I * iA0L);
            Arrays.fill(c1487bC.A0F, 0, iA0L, iA0I > i5);
        }
        c1487bC.A02(i11);
    }

    static {
        A0E();
        A0g = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.PB
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return P7.A0b();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
        A0i = new byte[]{-94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12};
        A0h = new C1029Ke().A11(A0B(717, 18, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)).A14();
    }

    public P7() {
        this(0);
    }

    public P7(int i5) {
        this(i5, null);
    }

    public P7(int i5, C1092Ms c1092Ms) {
        this(i5, c1092Ms, null, null);
    }

    public P7(int i5, C1092Ms c1092Ms, C1485bA c1485bA, DrmInitData drmInitData) {
        this(i5, c1092Ms, c1485bA, drmInitData, Collections.emptyList());
    }

    public P7(int i5, C1092Ms c1092Ms, C1485bA c1485bA, DrmInitData drmInitData, List<VC> list) {
        this(i5, c1092Ms, c1485bA, drmInitData, list, null, false, false, false);
    }

    public P7(int i5, C1092Ms c1092Ms, C1485bA c1485bA, DrmInitData drmInitData, List<VC> list, ZP zp2, boolean z11, boolean z12, boolean z13) {
        this.A0A = -9223372036854775807L;
        this.A0M = (c1485bA != null ? 8 : 0) | i5;
        this.A0T = c1092Ms;
        this.A0W = c1485bA;
        this.A0N = drmInitData;
        this.A0Z = Collections.unmodifiableList(list);
        this.A0U = zp2;
        this.A0c = z11;
        this.A0b = z12;
        this.A0a = z13;
        this.A0V = new C1400Zm();
        this.A0O = new C1084Mk(16);
        this.A0R = new C1084Mk(ZE.A03);
        this.A0Q = new C1084Mk(5);
        this.A0P = new C1084Mk();
        this.A0d = new byte[16];
        this.A0S = new C1084Mk(this.A0d);
        this.A0X = new ArrayDeque<>();
        this.A0Y = new ArrayDeque<>();
        this.A0D = new SparseArray<>();
        this.A08 = -9223372036854775807L;
        this.A0B = -9223372036854775807L;
        this.A0C = -9223372036854775807L;
        A0C();
    }

    public static long A01(C1084Mk c1084Mk) {
        c1084Mk.A0f(8);
        int fullAtom = c1084Mk.A0C();
        return AbstractC1455ag.A03(fullAtom) == 0 ? c1084Mk.A0Q() : c1084Mk.A0R();
    }

    public static long A02(C1084Mk c1084Mk) {
        c1084Mk.A0f(8);
        int fullAtom = c1084Mk.A0C();
        int version = AbstractC1455ag.A03(fullAtom);
        return version == 1 ? c1084Mk.A0R() : c1084Mk.A0Q();
    }

    public static Pair<Integer, C1462an> A03(C1084Mk c1084Mk) {
        c1084Mk.A0f(12);
        int defaultSampleDescriptionIndex = c1084Mk.A0C();
        int trackId = c1084Mk.A0L();
        int defaultSampleFlags = c1084Mk.A0L();
        int defaultSampleSize = c1084Mk.A0L();
        int defaultSampleDuration = c1084Mk.A0C();
        return Pair.create(Integer.valueOf(defaultSampleDescriptionIndex), new C1462an(trackId - 1, defaultSampleFlags, defaultSampleSize, defaultSampleDuration));
    }

    public static DrmInitData A05(List<PE> list) {
        ArrayList arrayList = null;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            PE pe2 = list.get(i5);
            int leafChildrenSize = ((AbstractC1455ag) pe2).A00;
            if (leafChildrenSize == 1886614376) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                byte[] bArr = pe2.A00.A00;
                UUID uuidA02 = AbstractC1478b3.A02(bArr);
                if (uuidA02 == null) {
                    String strA0B = A0B(128, 22, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
                    int leafChildrenSize2 = A0f[7].length();
                    if (leafChildrenSize2 == 31) {
                        throw new RuntimeException();
                    }
                    A0f[1] = "lUOMyA0IdltJAYAt2Kxw3ZV9qw5fH3Ns";
                    MV.A07(strA0B, A0B(455, 42, 51));
                } else {
                    arrayList.add(new DrmInitData.SchemeData(uuidA02, A0B(766, 9, 47), bArr));
                }
            }
        }
        if (arrayList == null) {
            return null;
        }
        return new DrmInitData(arrayList);
    }

    private C1462an A06(SparseArray<C1462an> sparseArray, int i5) {
        if (sparseArray.size() == 1) {
            return sparseArray.valueAt(0);
        }
        return (C1462an) AbstractC1062Ln.A01(sparseArray.get(i5));
    }

    public static C1468at A07(SparseArray<C1468at> sparseArray) {
        C1468at c1468at = null;
        long j11 = Long.MAX_VALUE;
        int size = sparseArray.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1468at c1468atValueAt = sparseArray.valueAt(i5);
            int i11 = c1468atValueAt.A02;
            int i12 = c1468atValueAt.A07.A01;
            if (A0f[2].charAt(15) == 'A') {
                throw new RuntimeException();
            }
            A0f[4] = "qad58z6";
            if (i11 != i12) {
                long nextTrackRunOffset = c1468atValueAt.A07.A0E[c1468atValueAt.A02];
                if (nextTrackRunOffset < j11) {
                    c1468at = c1468atValueAt;
                    j11 = nextTrackRunOffset;
                }
            }
        }
        return c1468at;
    }

    public static C1468at A08(SparseArray<C1468at> sparseArray, int i5, boolean z11) {
        if (sparseArray.size() == 1 && !z11) {
            C1468at c1468atValueAt = sparseArray.valueAt(0);
            if (A0f[4].length() == 12) {
                throw new RuntimeException();
            }
            A0f[7] = "YVo7s93wer1GpxY";
            return c1468atValueAt;
        }
        return sparseArray.get(i5);
    }

    private final C1485bA A0A(C1485bA c1485bA) {
        return c1485bA;
    }

    private void A0C() {
        this.A02 = 0;
        this.A00 = 0;
    }

    /* JADX WARN: Incorrect condition in loop: B:17:0x005d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0D() {
        if (this.A0L == null) {
            this.A0L = new ZP[2];
            int i5 = 0;
            if (this.A0U != null) {
                this.A0L[0] = this.A0U;
                i5 = 0 + 1;
            }
            int emsgTrackOutputCount = this.A0M;
            if ((emsgTrackOutputCount & 4) != 0) {
                this.A0L[i5] = this.A0F.ALm(this.A0D.size(), 5);
                i5++;
            }
            this.A0L = (ZP[]) Arrays.copyOf(this.A0L, i5);
            for (ZP zp2 : this.A0L) {
                zp2.A7E(A0h);
            }
        }
        if (this.A0K == null) {
            this.A0K = new ZP[this.A0Z.size()];
            for (int i11 = 0; i11 < i; i11++) {
                InterfaceC1384Yw interfaceC1384Yw = this.A0F;
                int i12 = this.A0D.size();
                ZP output = interfaceC1384Yw.ALm(i12 + 1 + i11, 3);
                output.A7E(this.A0Z.get(i11));
                this.A0K[i11] = output;
            }
        }
    }

    private void A0F(long j11) {
        while (!this.A0Y.isEmpty()) {
            C1467as c1467asRemoveFirst = this.A0Y.removeFirst();
            this.A03 -= c1467asRemoveFirst.A00;
            long jA05 = j11 + c1467asRemoveFirst.A01;
            if (this.A0T != null) {
                jA05 = this.A0T.A05(jA05);
            }
            for (ZP zp2 : this.A0L) {
                zp2.AKC(jA05, 1, c1467asRemoveFirst.A00, this.A03, null);
            }
        }
    }

    private void A0G(long j11) throws L9 {
        while (!this.A0X.isEmpty() && this.A0X.peek().A00 == j11) {
            A0P(this.A0X.pop());
        }
        A0C();
    }

    public static void A0H(C1084Mk c1084Mk, int i5, C1487bC c1487bC) throws L9 {
        c1084Mk.A0f(i5 + 8);
        int fullAtom = c1084Mk.A0C();
        int flags = AbstractC1455ag.A02(fullAtom);
        int fullAtom2 = flags & 1;
        if (fullAtom2 == 0) {
            int fullAtom3 = flags & 2;
            boolean z11 = fullAtom3 != 0;
            int sampleCount = c1084Mk.A0L();
            int fullAtom4 = c1487bC.A00;
            if (sampleCount == fullAtom4) {
                Arrays.fill(c1487bC.A0F, 0, sampleCount, z11);
                int fullAtom5 = c1084Mk.A07();
                c1487bC.A02(fullAtom5);
                c1487bC.A04(c1084Mk);
                return;
            }
            StringBuilder sbAppend = new StringBuilder().append(A0B(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, 17, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)).append(sampleCount).append(A0B(0, 2, 71));
            int fullAtom6 = c1487bC.A00;
            throw new L9(sbAppend.append(fullAtom6).toString());
        }
        throw new L9(A0B(399, 56, 14));
    }

    public static void A0K(C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        c1084Mk.A0f(8);
        int flags = c1084Mk.A0C();
        int fullAtom = AbstractC1455ag.A02(flags) & 1;
        if (fullAtom == 1) {
            c1084Mk.A0g(8);
        }
        int iA0L = c1084Mk.A0L();
        if (iA0L == 1) {
            int entryCount = AbstractC1455ag.A03(flags);
            c1487bC.A03 += entryCount == 0 ? c1084Mk.A0Q() : c1084Mk.A0R();
            return;
        }
        throw new L9(A0B(605, 29, 76) + iA0L);
    }

    public static void A0L(C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        A0H(c1084Mk, 0, c1487bC);
    }

    public static void A0M(C1084Mk c1084Mk, C1487bC c1487bC, byte[] bArr) throws L9 {
        c1084Mk.A0f(8);
        c1084Mk.A0k(bArr, 0, 16);
        if (!Arrays.equals(bArr, A0i)) {
            return;
        }
        A0H(c1084Mk, 16, c1487bC);
    }

    private void A0N(Q9 q92) throws IOException {
        int i5 = ((int) this.A07) - this.A00;
        if (this.A0E != null) {
            q92.readFully(this.A0E.A00, 8, i5);
            A0V(new PE(this.A01, this.A0E), q92);
        } else {
            q92.ALL(i5);
        }
        A0G(q92.A9Q());
    }

    private void A0O(Q9 q92) throws IOException {
        C1468at c1468atValueAt = null;
        long j11 = Long.MAX_VALUE;
        int size = this.A0D.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1468at nextTrackBundle = this.A0D.valueAt(i5);
            C1487bC c1487bC = nextTrackBundle.A07;
            if (c1487bC.A0A) {
                long nextDataOffset = c1487bC.A03;
                if (nextDataOffset < j11) {
                    j11 = c1487bC.A03;
                    c1468atValueAt = this.A0D.valueAt(i5);
                }
            }
        }
        if (c1468atValueAt == null) {
            this.A02 = 3;
            return;
        }
        int trackBundlesSize = (int) (j11 - q92.A9Q());
        if (A0f[7].length() == 31) {
            throw new RuntimeException();
        }
        String[] strArr = A0f;
        strArr[6] = "WaEfqTf7lJ3";
        strArr[5] = "i667FprRZ32RzmMbwXp";
        if (trackBundlesSize >= 0) {
            q92.ALL(trackBundlesSize);
            c1468atValueAt.A07.A05(q92);
            return;
        }
        throw new L9(A0B(325, 39, 81));
    }

    private void A0P(PF pf2) throws L9 {
        if (((AbstractC1455ag) pf2).A00 == 1836019574) {
            A0R(pf2);
        } else if (((AbstractC1455ag) pf2).A00 == 1836019558) {
            A0Q(pf2);
        } else {
            if (this.A0X.isEmpty()) {
                return;
            }
            this.A0X.peek().A04(pf2);
        }
    }

    private void A0Q(PF pf2) throws L9 {
        A0S(pf2, this.A0D, this.A0M, this.A0d, this.A0c);
        DrmInitData drmInitDataA05 = this.A0N != null ? null : A05(pf2.A02);
        if (drmInitDataA05 != null) {
            int i5 = this.A0D.size();
            for (int trackCount = 0; trackCount < i5; trackCount++) {
                this.A0D.valueAt(trackCount).A07(drmInitDataA05);
            }
        }
        if (this.A0B != -9223372036854775807L) {
            int size = this.A0D.size();
            for (int i11 = 0; i11 < size; i11++) {
                this.A0D.valueAt(i11).A06(this.A0B);
            }
            this.A0B = -9223372036854775807L;
        }
    }

    public static void A0S(PF pf2, SparseArray<C1468at> sparseArray, int i5, byte[] bArr, boolean z11) throws L9 {
        int size = pf2.A01.size();
        for (int i11 = 0; i11 < size; i11++) {
            PF child = pf2.A01.get(i11);
            int i12 = ((AbstractC1455ag) child).A00;
            if (i12 == 1953653094) {
                boolean z12 = true;
                if (size <= 1 || !z11) {
                    z12 = false;
                }
                A0T(child, sparseArray, i5, bArr, z12);
            }
        }
    }

    public static void A0U(PF pf2, C1468at c1468at, long j11, int i5) {
        int i11 = 0;
        int i12 = 0;
        List<PE> list = pf2.A02;
        int size = list.size();
        for (int i13 = 0; i13 < size; i13++) {
            PE pe2 = list.get(i13);
            if (((AbstractC1455ag) pe2).A00 == 1953658222) {
                C1084Mk trunData = pe2.A00;
                trunData.A0f(12);
                int iA0L = trunData.A0L();
                if (iA0L > 0) {
                    i12 += iA0L;
                    i11++;
                }
            }
        }
        c1468at.A02 = 0;
        c1468at.A00 = 0;
        c1468at.A01 = 0;
        c1468at.A07.A03(i11, i12);
        int i14 = 0;
        int trunStartPosition = 0;
        for (int i15 = 0; i15 < size; i15++) {
            PE pe3 = list.get(i15);
            if (((AbstractC1455ag) pe3).A00 == 1953658222) {
                trunStartPosition = A00(c1468at, i14, j11, i5, pe3.A00, trunStartPosition);
                i14++;
            }
        }
    }

    private void A0V(PE pe2, Q9 q92) throws L9 {
        if (!this.A0X.isEmpty()) {
            this.A0X.peek().A05(pe2);
            return;
        }
        if (((AbstractC1455ag) pe2).A00 == 1936286840) {
            Pair<Long, QJ> pairA04 = A04(pe2.A00, q92.A9Q());
            this.A0C = ((Long) pairA04.first).longValue();
            this.A0F.AKP((ZK) pairA04.second);
            this.A0H = true;
            return;
        }
        if (((AbstractC1455ag) pe2).A00 != 1701671783) {
            return;
        }
        Uri uriAA2 = q92.AA2();
        if (A0f[1].charAt(30) == 'd') {
            throw new RuntimeException();
        }
        A0f[2] = "EoUeegSjtsb9A8KxNI9aHg5JKd4u1HQf";
        if (uriAA2 == null) {
            return;
        }
        A0I(pe2.A00, uriAA2);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0065  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0X(int i5) {
        if (i5 != 1836019574 && i5 != 1953653099 && i5 != 1835297121 && i5 != 1835626086 && i5 != 1937007212) {
            String[] strArr = A0f;
            if (strArr[3].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A0f[4] = "qWu6Abm6zk5quImHXptRALDqTyy37";
            if (i5 != 1836019558 && i5 != 1953653094) {
                String[] strArr2 = A0f;
                if (strArr2[3].length() != strArr2[0].length()) {
                    String[] strArr3 = A0f;
                    strArr3[6] = "OYxmD55PyL2";
                    strArr3[5] = "3gtT7uOFI9qfp6Jo1gk";
                    if (i5 != 1836475768) {
                        if (i5 != 1701082227) {
                            return false;
                        }
                    }
                } else {
                    A0f[7] = "87MBvorHkhCKG";
                    if (i5 != 1836475768) {
                    }
                }
            }
        }
        return true;
    }

    public static boolean A0Y(int i5) {
        if (i5 != 1751411826) {
            String[] strArr = A0f;
            if (strArr[6].length() == strArr[5].length()) {
                throw new RuntimeException();
            }
            A0f[7] = "K2";
            if (i5 != 1835296868 && i5 != 1836476516 && i5 != 1936286840 && i5 != 1937011556 && i5 != 1952867444 && i5 != 1952868452 && i5 != 1953196132 && i5 != 1953654136 && i5 != 1953658222 && i5 != 1886614376 && i5 != 1935763834 && i5 != 1935763823 && i5 != 1936027235 && i5 != 1970628964 && i5 != 1935828848) {
                if (A0f[4].length() == 12) {
                    throw new RuntimeException();
                }
                A0f[2] = "DRbPOE4BxMlpEg4M5HTO53suvI6PJn0X";
                if (i5 != 1936158820 && i5 != 1701606260 && i5 != 1835362404) {
                    if (A0f[1].charAt(30) == 'd') {
                        throw new RuntimeException();
                    }
                    A0f[4] = "xNtFSaBpX";
                    if (i5 != 1701671783) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:54:0x0164, code lost:
    
        if (r2 <= 2147483647L) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0166, code lost:
    
        r10.A0E = null;
        r10.A02 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0174, code lost:
    
        if (r2 <= 2147483647L) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01a6, code lost:
    
        throw new com.facebook.ads.redexgen.X.L9(A0B(497, 53, 70));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A0Z(Q9 q92) throws IOException {
        if (this.A00 == 0) {
            if (!q92.AIe(this.A0O.A00, 0, 8, true)) {
                return false;
            }
            this.A00 = 8;
            this.A0O.A0f(0);
            this.A07 = this.A0O.A0Q();
            this.A01 = this.A0O.A0C();
        }
        if (this.A07 == 1) {
            q92.readFully(this.A0O.A00, 8, 8);
            int headerBytesRemaining = this.A00;
            this.A00 = headerBytesRemaining + 8;
            this.A07 = this.A0O.A0R();
        } else if (this.A07 == 0) {
            long jA90 = q92.A90();
            if (jA90 == -1 && !this.A0X.isEmpty()) {
                jA90 = this.A0X.peek().A00;
            }
            if (jA90 != -1) {
                long jA9Q = jA90 - q92.A9Q();
                int trackCount = this.A00;
                this.A07 = jA9Q + trackCount;
            }
        }
        if (this.A07 >= this.A00) {
            long jA9Q2 = q92.A9Q() - this.A00;
            if (this.A01 == 1836019558) {
                int size = this.A0D.size();
                for (int i5 = 0; i5 < size; i5++) {
                    C1487bC c1487bC = this.A0D.valueAt(i5).A07;
                    c1487bC.A02 = jA9Q2;
                    c1487bC.A03 = jA9Q2;
                    c1487bC.A04 = jA9Q2;
                }
            }
            if (this.A01 == 1835295092) {
                this.A0G = null;
                this.A09 = this.A07 + jA9Q2;
                if (!this.A0H) {
                    this.A0F.AKP(new Q4(this.A08, jA9Q2));
                    this.A0H = true;
                }
                this.A02 = 2;
                return true;
            }
            if (A0X(this.A01)) {
                long jA9Q3 = (q92.A9Q() + this.A07) - 8;
                this.A0X.push(new PF(this.A01, jA9Q3));
                if (this.A07 == this.A00) {
                    A0G(jA9Q3);
                } else {
                    A0C();
                }
            } else {
                boolean zA0Y = A0Y(this.A01);
                if (A0f[1].charAt(30) == 'd') {
                    throw new RuntimeException();
                }
                A0f[1] = "hrLZm5FpUWCpT39dZzGMKaH9dkN9S7nn";
                if (zA0Y) {
                    if (this.A00 != 8) {
                        throw new L9(A0B(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 51, 44));
                    }
                    if (this.A07 <= 2147483647L) {
                        this.A0E = new C1084Mk((int) this.A07);
                        System.arraycopy(this.A0O.A00, 0, this.A0E.A00, 0, 8);
                        this.A02 = 1;
                    } else {
                        throw new L9(A0B(259, 49, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                    }
                } else {
                    long j11 = this.A07;
                    if (A0f[4].length() != 12) {
                        String[] strArr = A0f;
                        strArr[6] = "Lwsd8y3M8LN";
                        strArr[5] = "zHh03ckJ34YfC3HKKJy";
                    } else {
                        A0f[4] = "M6Si5l9hcx2phtj9yknPYJvsei6oWWR5";
                    }
                }
            }
            return true;
        }
        throw new L9(A0B(2, 48, 12));
    }

    /* JADX WARN: Multi-variable type inference failed */
    private boolean A0a(Q9 q92) throws IOException {
        int iAK7;
        int i5 = 4;
        int i11 = 1;
        int i12 = 0;
        if (this.A02 == 3) {
            C1468at c1468at = this.A0G;
            String[] strArr = A0f;
            if (strArr[3].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A0f[7] = "59HqU3sUJrIiXa";
            if (c1468at == null) {
                C1468at c1468atA07 = A07(this.A0D);
                if (c1468atA07 == null) {
                    int iA9Q = (int) (this.A09 - q92.A9Q());
                    if (iA9Q >= 0) {
                        q92.ALL(iA9Q);
                        A0C();
                        return false;
                    }
                    throw new L9(A0B(364, 35, 68));
                }
                int iA9Q2 = (int) (c1468atA07.A07.A0E[c1468atA07.A02] - q92.A9Q());
                if (iA9Q2 < 0) {
                    MV.A07(A0B(128, 22, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), A0B(PerAppFeatureCatalog.MAX_TOOLS, 40, 61));
                    iA9Q2 = 0;
                }
                q92.ALL(iA9Q2);
                this.A0G = c1468atA07;
            }
            this.A06 = this.A0G.A07.A0B[this.A0G.A01];
            if (this.A0G.A01 < this.A0G.A03) {
                q92.ALL(this.A06);
                this.A0G.A02();
                if (!this.A0G.A09()) {
                    this.A0G = null;
                }
                this.A02 = 3;
                return true;
            }
            if (this.A0G.A05.A02 == 1) {
                this.A06 -= 8;
                q92.ALL(8);
            }
            this.A04 = this.A0G.A04();
            this.A06 += this.A04;
            this.A02 = 4;
            this.A05 = 0;
        }
        C1487bC c1487bC = this.A0G.A07;
        C1485bA c1485bA = this.A0G.A05;
        ZP zp2 = this.A0G.A06;
        int i13 = this.A0G.A01;
        long jA00 = c1487bC.A00(i13);
        if (this.A0T != null) {
            jA00 = this.A0T.A05(jA00);
        }
        if (c1485bA.A01 != 0) {
            byte[] bArr = this.A0Q.A00;
            bArr[0] = 0;
            bArr[1] = 0;
            bArr[2] = 0;
            int i14 = c1485bA.A01 + 1;
            int i15 = 4 - c1485bA.A01;
            while (this.A04 < this.A06) {
                if (this.A05 == 0) {
                    q92.readFully(bArr, i15, i14);
                    this.A0Q.A0f(i12);
                    int iA0C = this.A0Q.A0C();
                    if (iA0C >= i11) {
                        this.A05 = iA0C - 1;
                        this.A0R.A0f(i12);
                        zp2.AK9(this.A0R, i5);
                        zp2.AK9(this.A0Q, i11);
                        this.A0J = this.A0K.length > 0 && ZE.A0I(c1485bA.A07.A0W, bArr[i5]);
                        this.A04 += 5;
                        this.A06 += i15;
                        i11 = 1;
                    } else {
                        throw new L9(A0B(190, 18, 22));
                    }
                } else {
                    if (this.A0J) {
                        this.A0P.A0d(this.A05);
                        q92.readFully(this.A0P.A00, i12, this.A05);
                        zp2.AK9(this.A0P, this.A05);
                        iAK7 = this.A05;
                        int iA02 = ZE.A02(this.A0P.A00, this.A0P.A0A());
                        this.A0P.A0f(A0B(756, 10, 42).equals(c1485bA.A07.A0W) ? 1 : 0);
                        this.A0P.A0e(iA02);
                        AbstractC1515be.A03(jA00, this.A0P, this.A0K);
                    } else {
                        iAK7 = zp2.AK7(q92, this.A05, false);
                    }
                    this.A04 += iAK7;
                    this.A05 -= iAK7;
                    i5 = 4;
                    i11 = 1;
                    i12 = 0;
                }
            }
        } else {
            if (this.A0I) {
                AbstractC1369Yg.A07(this.A06, this.A0S);
                int iA0A = this.A0S.A0A();
                zp2.AK9(this.A0S, iA0A);
                this.A06 += iA0A;
                this.A04 += iA0A;
                this.A0I = false;
            }
            while (this.A04 < this.A06) {
                this.A04 += zp2.AK7(q92, this.A06 - this.A04, false);
            }
        }
        boolean z11 = c1487bC.A0G[i13];
        ZN zn2 = null;
        C1486bB c1486bBA00 = this.A0G.A00();
        boolean z12 = z11;
        if (c1486bBA00 != null) {
            boolean z13 = (z11 ? 1 : 0) | AbstractJsonLexerKt.INVALID;
            zn2 = c1486bBA00.A01;
            z12 = z13;
        }
        int i16 = z12;
        if (this.A0G != null) {
            i16 = z12;
            if (this.A0G.A05 != null) {
                i16 = z12;
                if (this.A0G.A05.A07 != null) {
                    i16 = z12;
                    if (this.A0G.A05.A07.A0W == A0B(735, 21, 75)) {
                        i16 = (z12 ? 1 : 0) | true;
                    }
                }
            }
        }
        long j11 = jA00;
        zp2.AKC(jA00, i16, this.A06, 0, zn2);
        this.A0A = j11;
        A0F(j11);
        if (!this.A0G.A09()) {
            this.A0G = null;
        }
        this.A02 = 3;
        return true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A0b() {
        return new InterfaceC1383Yv[]{new P7()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A0F = interfaceC1384Yw;
        if (this.A0W != null) {
            C1468at c1468at = new C1468at(interfaceC1384Yw.ALm(0, this.A0W.A03));
            c1468at.A08(this.A0W, new C1462an(0, 0, 0, 0));
            this.A0D.put(0, c1468at);
            A0D();
            this.A0F.A6x();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        while (true) {
            switch (this.A02) {
                case 0:
                    if (!A0Z(q92)) {
                        return -1;
                    }
                    break;
                case 1:
                    A0N(q92);
                    break;
                case 2:
                    A0O(q92);
                    break;
                default:
                    if (!A0a(q92)) {
                        break;
                    } else {
                        return 0;
                    }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        int size = this.A0D.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A0D.valueAt(i5).A05();
        }
        this.A0Y.clear();
        this.A03 = 0;
        this.A0B = j12;
        this.A0X.clear();
        this.A0I = false;
        A0C();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        return AbstractC1483b8.A01(q92);
    }
}
