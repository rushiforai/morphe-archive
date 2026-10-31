package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.util.Pair;
import android.util.SparseArray;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.extractor.metadata.emsg.EventMessage;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
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

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class P8 implements InterfaceC1383Yv {
    public static byte[] A0Z;
    public static String[] A0a = {"GbdB0HkZ", "0khtInAcKEtI2jqch13P0eYGNFqXZuOY", "LZWX5ClLrF9P4vMBJaR9y172g", "yBv7loQvMt4jjHqTPWAs07zunhXrUzkj", "CewtKKSLldVQCYe9w4B9cNh5nQWxLZ8o", "bQpieFUvbpbEZwzL6H6u2AIw", "W8JFvx0mOk1lNAB4BQZLslHI", "OaMox1WIHJ4zdqOFJIN2Y0e4jTlHiKgk"};
    public static final InterfaceC1387Yz A0b;
    public static final VC A0c;
    public static final byte[] A0d;
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

    @MetaExoPlayerCustomization
    public long A0A;
    public long A0B;
    public long A0C;
    public C1084Mk A0D;
    public InterfaceC1384Yw A0E;
    public C1471aw A0F;
    public boolean A0G;
    public boolean A0H;
    public ZP[] A0I;
    public ZP[] A0J;
    public final int A0K;
    public final SparseArray<C1471aw> A0L;
    public final C1084Mk A0M;
    public final C1084Mk A0N;
    public final C1084Mk A0O;
    public final C1084Mk A0P;
    public final C1084Mk A0Q;
    public final C1092Ms A0R;
    public final ZP A0S;
    public final C1400Zm A0T;
    public final C1485bA A0U;
    public final ArrayDeque<PF> A0V;
    public final ArrayDeque<C1470av> A0W;
    public final List<VC> A0X;
    public final byte[] A0Y;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static int A01(C1471aw c1471aw, int i5, int i11, C1084Mk c1084Mk, int i12) throws L9 {
        int i13 = i12;
        c1084Mk.A0f(8);
        int iA02 = AbstractC1455ag.A02(c1084Mk.A0C());
        C1485bA c1485bA = c1471aw.A05.A03;
        C1487bC c1487bC = c1471aw.A09;
        C1462an c1462an = (C1462an) N1.A0f(c1487bC.A06);
        c1487bC.A0C[i5] = c1084Mk.A0L();
        c1487bC.A0E[i5] = c1487bC.A04;
        if ((iA02 & 1) != 0) {
            long[] jArr = c1487bC.A0E;
            jArr[i5] = jArr[i5] + c1084Mk.A0C();
        }
        boolean z11 = (iA02 & 4) != 0;
        int iA0C = c1462an.A01;
        if (z11) {
            iA0C = c1084Mk.A0C();
        }
        boolean z12 = (iA02 & 256) != 0;
        boolean z13 = (iA02 & EventBridgeChannel.QUEUE_CAPACITY) != 0;
        boolean z14 = (iA02 & 1024) != 0;
        boolean z15 = (iA02 & 2048) != 0;
        boolean zA0a = A0a(c1485bA);
        String[] strArr = A0a;
        if (strArr[1].charAt(14) != strArr[3].charAt(14)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0a;
        strArr2[5] = "JgC1EGm7Fx9eG8uVateG9Vvp";
        strArr2[0] = "3mrAxl40";
        long j11 = zA0a ? ((long[]) N1.A0f(c1485bA.A09))[0] : 0L;
        int[] iArr = c1487bC.A0B;
        long[] jArr2 = c1487bC.A0D;
        boolean[] zArr = c1487bC.A0G;
        boolean z16 = c1485bA.A03 == 2 && (i11 & 1) != 0;
        int i14 = i13 + c1487bC.A0C[i5];
        long j12 = c1485bA.A06;
        long j13 = c1487bC.A05;
        String[] strArr3 = A0a;
        if (strArr3[5].length() == strArr3[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr4 = A0a;
        strArr4[6] = "rkmmpZ5z24oQPil7tGTxxVdu";
        strArr4[2] = "cA6mphhzChqnYQJizy41QJzcg";
        while (i13 < i14) {
            int iA00 = A00(z12 ? c1084Mk.A0C() : c1462an.A00);
            int iA002 = A00(z13 ? c1084Mk.A0C() : c1462an.A03);
            int iA0C2 = z14 ? c1084Mk.A0C() : (i13 == 0 && z11) ? iA0C : c1462an.A01;
            if (A0a[7].charAt(1) == 'U') {
                throw new RuntimeException();
            }
            String[] strArr5 = A0a;
            strArr5[6] = "Qlew9HE5j9b6KQPLMXRjUeH0";
            strArr5[2] = "OAcLMggQZDA2D6HaTGYPNrVeb";
            jArr2[i13] = N1.A0U(((z15 ? c1084Mk.A0C() : 0) + j13) - j11, 1000000L, j12);
            if (!c1487bC.A09) {
                jArr2[i13] = jArr2[i13] + c1471aw.A05.A02;
            }
            iArr[i13] = iA002;
            zArr[i13] = ((iA0C2 >> 16) & 1) == 0 && (!z16 || i13 == 0);
            j13 += iA00;
            i13++;
        }
        c1487bC.A05 = j13;
        return i14;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static Pair<Long, QJ> A05(C1084Mk c1084Mk, long j11) throws L9 {
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
                throw L9.A01(A0A(756, 28, 51), null);
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
    public static C1471aw A09(C1084Mk c1084Mk, SparseArray<C1471aw> sparseArray, boolean z11) {
        c1084Mk.A0f(8);
        int iA02 = AbstractC1455ag.A02(c1084Mk.A0C());
        C1471aw c1471awValueAt = z11 ? sparseArray.valueAt(0) : sparseArray.get(c1084Mk.A0C());
        if (c1471awValueAt == null) {
            return null;
        }
        if ((iA02 & 1) != 0) {
            long jA0R = c1084Mk.A0R();
            c1471awValueAt.A09.A04 = jA0R;
            c1471awValueAt.A09.A03 = jA0R;
        }
        C1462an c1462an = c1471awValueAt.A04;
        int iA0C = (iA02 & 2) != 0 ? c1084Mk.A0C() - 1 : c1462an.A02;
        int i5 = iA02 & 8;
        String[] strArr = A0a;
        if (strArr[1].charAt(14) != strArr[3].charAt(14)) {
            throw new RuntimeException();
        }
        A0a[7] = "4ZukhBKNeObmYvJktZy4oUTI1PsvK2IF";
        c1471awValueAt.A09.A06 = new C1462an(iA0C, i5 != 0 ? c1084Mk.A0C() : c1462an.A00, (iA02 & 16) != 0 ? c1084Mk.A0C() : c1462an.A03, (iA02 & 32) != 0 ? c1084Mk.A0C() : c1462an.A01);
        return c1471awValueAt;
    }

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0Z, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0a;
            if (strArr[1].charAt(14) != strArr[3].charAt(14)) {
                throw new RuntimeException();
            }
            A0a[7] = "WWc1YgBpXnsK2CwFuCjgo1uYONcck7eP";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 10);
            i13++;
        }
    }

    public static void A0D() {
        A0Z = new byte[]{71, 14, 20, 71, 3, 14, 1, 1, 2, 21, 2, 9, 19, 71, 1, 21, 8, 10, 71, 1, 21, 6, 0, 10, 2, 9, 19, 71, 20, 6, 10, 23, 11, 2, 71, 4, 8, 18, 9, 19, 33, 104, 114, 33, 102, 115, 100, 96, 117, 100, 115, 33, 117, 105, 96, 111, 33, 103, 115, 96, 102, 108, 100, 111, 117, 33, 114, 96, 108, 113, 109, 100, 33, 98, 110, 116, 111, 117, 17, 36, 63, 61, 112, 35, 57, 42, 53, 112, 60, 53, 35, 35, 112, 36, 56, 49, 62, 112, 56, 53, 49, 52, 53, 34, 112, 60, 53, 62, 55, 36, 56, 112, 120, 37, 62, 35, 37, 32, 32, 63, 34, 36, 53, 52, 121, 126, 119, 92, 70, 64, 75, 18, 81, 93, 71, 92, 70, 18, 91, 92, 18, 65, 80, 85, 66, 18, 19, 15, 18, 3, 18, 26, 71, 92, 65, 71, 66, 66, 93, 64, 70, 87, 86, 27, 28, 59, 16, 10, 12, 7, 94, 29, 17, 11, 16, 10, 94, 23, 16, 94, 13, 25, 14, 26, 94, 95, 67, 94, 79, 94, 86, 11, 16, 13, 11, 14, 14, 17, 12, 10, 27, 26, 87, 80, 73, 125, 110, 104, 98, 106, 97, 123, 106, 107, 66, AbstractJsonLexerKt.TC_INVALID, 59, 74, 119, 123, 125, 110, 108, 123, 96, 125, 125, 83, 90, 91, 70, 93, 90, 83, 20, 90, 81, 83, 85, 64, 93, 66, 81, 20, 91, 82, 82, 71, 81, 64, 20, 64, 91, 20, 71, 85, 89, 68, 88, 81, 20, 80, 85, 64, 85, 26, 10, 45, 53, 34, 47, 42, 39, 99, 13, 2, 15, 99, 47, 38, 45, 36, 55, 43, 8, 33, 37, 34, 100, 37, 48, 43, 41, 100, 32, 33, 34, 45, 42, 33, 55, 100, 33, 60, 48, 33, 42, 32, 33, 32, 100, 37, 48, 43, 41, 100, 55, 45, 62, 33, 100, 108, 49, 42, 55, 49, 52, 52, 43, 54, 48, 33, 32, 109, 106, 125, 84, 80, 87, 17, 80, 69, 94, 92, 17, 70, 88, 69, 89, 17, 93, 84, 95, 86, 69, 89, 17, 15, 17, 3, 0, 5, 6, 5, 9, 2, 7, 5, 6, 17, 25, 68, 95, 66, 68, 65, 65, 94, 67, 69, 84, 85, 24, 31, 46, 7, 7, 18, 4, 21, 65, 21, 14, 65, 4, 15, 2, 19, 24, 17, 21, 8, 14, 15, 65, 5, 0, 21, 0, 65, 22, 0, 18, 65, 15, 4, 6, 0, 21, 8, 23, 4, 79, 39, 14, 14, 27, 13, 28, 72, 28, 7, 72, 13, 6, 12, 72, 7, 14, 72, 5, 12, 9, 28, 72, 31, 9, 27, 72, 6, 13, 15, 9, 28, 1, 30, 13, 70, 121, 64, 83, 68, 68, 95, 82, 95, 88, 81, 22, 98, 68, 87, 85, 93, 115, 88, 85, 68, 79, 70, 66, 95, 89, 88, 116, 89, 78, 22, 70, 87, 68, 87, 91, 83, 66, 83, 68, 69, 22, 95, 69, 22, 67, 88, 69, 67, 70, 70, 89, 68, 66, 83, 82, 24, 7, 53, 61, 46, 116, 39, 53, 57, 36, 56, 49, 116, 55, 59, 33, 58, 32, 116, 7, 49, 58, 55, 116, 39, 53, 57, 36, 56, 49, 116, 55, 59, 33, 58, 32, 116, 17, 41, 43, 50, 50, 39, 38, 98, 50, 49, 49, 42, 98, 35, 54, 45, 47, 98, 106, 36, 35, 43, 46, 39, 38, 98, 54, 45, 98, 39, 58, 54, 48, 35, 33, 54, 98, 55, 55, 43, 38, 107, 121, 65, 67, 90, 90, 67, 68, 77, 10, 75, 94, 69, 71, 10, 93, 67, 94, 66, 10, 70, 79, 68, 77, 94, 66, 10, 20, 10, 24, 27, 30, 29, 30, 18, 25, 28, 30, 29, 10, 2, 95, 68, 89, 95, 90, 90, 69, 88, 94, 79, 78, 3, 4, 7, 63, 61, 36, 36, 61, 58, 51, 116, 33, 58, 39, 33, 36, 36, 59, 38, 32, 49, 48, 116, 49, 57, 39, 51, 116, 34, 49, 38, 39, 61, 59, 58, 110, 116, 125, 70, 77, 80, 88, 77, 75, 92, 77, 76, 8, 69, 71, 71, 94, 8, 74, 71, 80, 6, 79, 116, AbstractJsonLexerKt.TC_INVALID, 98, 106, AbstractJsonLexerKt.TC_INVALID, 121, 110, AbstractJsonLexerKt.TC_INVALID, 126, 58, 116, AbstractJsonLexerKt.TC_INVALID, 125, 123, 110, 115, 108, AbstractJsonLexerKt.TC_INVALID, 58, 108, 123, 118, 111, AbstractJsonLexerKt.TC_INVALID, 32, 58, 18, 41, 34, 63, 55, 34, 36, 51, 34, 35, 103, 52, 38, 46, 40, 103, 34, 41, 51, 53, 62, 103, 36, 40, 50, 41, 51, 125, 103, 108, 87, 81, 88, 87, 93, 85, 92, 93, 25, 80, 87, 93, 80, 75, 92, 90, 77, 25, 75, 92, 95, 92, 75, 92, 87, 90, 92, 69, 114, 97, 122, 114, 113, AbstractJsonLexerKt.TC_INVALID, 118, 51, AbstractJsonLexerKt.TC_INVALID, 118, 125, 116, 103, 123, 51, 119, 118, 96, 112, 97, 122, 99, 103, 122, 124, 125, 51, 122, 125, 51, 96, 116, 99, 119, 51, 117, 124, 102, 125, 119, 51, 59, 102, 125, 96, 102, 99, 99, 124, 97, 103, 118, 119, 58, 88, 73, 73, 85, 80, 90, 88, 77, 80, 86, 87, 22, 65, 20, 92, 84, 74, 94, 85, 68, 68, 88, 93, 87, 85, 64, 93, 91, 90, 27, 76, 25, 89, 68, 0, 25, 66, 64, 64, 68, 80, 65, 76, 74, 10, 68, 70, 17, 21, 10, 7, 6, 12, 76, 11, 6, 21, 0, 7, 24, 21, 20, 30, 94, 28, 1, 69};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @MetaExoPlayerCustomization
    private void A0H(C1084Mk c1084Mk, Uri uri) {
        String str;
        String str2;
        long jA05;
        long jA0U;
        long jA0Q;
        if (this.A0J.length == 0) {
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
                long jA0R = c1084Mk.A0R();
                String[] strArr = A0a;
                if (strArr[5].length() == strArr[0].length()) {
                    throw new RuntimeException();
                }
                A0a[7] = "AYhjOe4t3139O6NlaflP6PY1FLDI2Tzg";
                jA05 = N1.A0U(jA0R, 1000000L, jA0Q3);
                jA0U = N1.A0U(c1084Mk.A0Q(), 1000L, jA0Q3);
                jA0Q = c1084Mk.A0Q();
                str = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                str2 = (String) AbstractC1062Ln.A01(c1084Mk.A0U());
                break;
            default:
                MV.A07(A0A(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 22, 5), A0A(645, 35, 94) + iA03);
                return;
        }
        byte[] bArr = new byte[c1084Mk.A07()];
        c1084Mk.A0k(bArr, 0, c1084Mk.A07());
        int i5 = 0;
        C1084Mk c1084Mk2 = new C1084Mk(this.A0T.A01(new EventMessage(str, str2, jA0U, jA0Q, bArr)));
        int iA07 = c1084Mk2.A07();
        ZP[] zpArr = this.A0J;
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
            this.A0W.addLast(new C1470av(jA0U2, true, iA07));
            this.A03 += iA07;
            return;
        }
        if (!this.A0W.isEmpty()) {
            this.A0W.addLast(new C1470av(jA05, false, iA07));
            this.A03 += iA07;
            return;
        }
        if (this.A0R != null) {
            jA05 = this.A0R.A05(jA05);
        }
        if (this.A0A != -9223372036854775807L && !XL.A03(XQ.A1U)) {
            jA05 = this.A0A;
        }
        for (ZP zp3 : this.A0J) {
            zp3.AKC(jA05, 1, iA07, 0, null);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0R(PF pf2, SparseArray<C1471aw> sparseArray, boolean z11, int i5, byte[] bArr) throws L9 {
        C1471aw c1471awA09 = A09(((PE) AbstractC1062Ln.A01(pf2.A03(1952868452))).A00, sparseArray, z11);
        if (c1471awA09 == null) {
            return;
        }
        C1487bC c1487bC = c1471awA09.A09;
        long j11 = c1487bC.A05;
        boolean z12 = c1487bC.A09;
        c1471awA09.A08();
        c1471awA09.A06 = true;
        PE peA03 = pf2.A03(1952867444);
        if (peA03 == null || (i5 & 2) != 0) {
            c1487bC.A05 = j11;
            c1487bC.A09 = z12;
        } else {
            c1487bC.A05 = A03(peA03.A00);
            c1487bC.A09 = true;
        }
        A0S(pf2, c1471awA09, i5);
        C1486bB c1486bBA00 = c1471awA09.A05.A03.A00(((C1462an) AbstractC1062Ln.A01(c1487bC.A06)).A02);
        PE peA032 = pf2.A03(1935763834);
        if (peA032 != null) {
            A0V((C1486bB) AbstractC1062Ln.A01(c1486bBA00), peA032.A00, c1487bC);
        }
        PE peA033 = pf2.A03(1935763823);
        if (peA033 != null) {
            A0I(peA033.A00, c1487bC);
        }
        PE peA034 = pf2.A03(1936027235);
        if (peA034 != null) {
            A0J(peA034.A00, c1487bC);
        }
        A0T(pf2, c1486bBA00 != null ? c1486bBA00.A02 : null, c1487bC);
        int size = pf2.A02.size();
        for (int i11 = 0; i11 < size; i11++) {
            PE pe2 = pf2.A02.get(i11);
            if (((AbstractC1455ag) pe2).A00 == 1970628964) {
                A0K(pe2.A00, c1487bC, bArr);
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0T(PF pf2, String str, C1487bC c1487bC) throws L9 {
        C1084Mk c1084Mk = null;
        C1084Mk c1084Mk2 = null;
        for (int i5 = 0; i5 < pf2.A02.size(); i5++) {
            PE pe2 = pf2.A02.get(i5);
            C1084Mk c1084Mk3 = pe2.A00;
            if (((AbstractC1455ag) pe2).A00 == 1935828848) {
                c1084Mk3.A0f(12);
                if (c1084Mk3.A0C() == 1936025959) {
                    c1084Mk = c1084Mk3;
                }
            } else if (((AbstractC1455ag) pe2).A00 == 1936158820) {
                c1084Mk3.A0f(12);
                if (c1084Mk3.A0C() == 1936025959) {
                    c1084Mk2 = c1084Mk3;
                }
            }
        }
        if (c1084Mk == null || c1084Mk2 == null) {
            return;
        }
        c1084Mk.A0f(8);
        int iA03 = AbstractC1455ag.A03(c1084Mk.A0C());
        if (A0a[4].charAt(12) != 'C') {
            throw new RuntimeException();
        }
        String[] strArr = A0a;
        strArr[1] = "5R7Ccfe8FbRHKeqeCIffVYYlw43uoBMQ";
        strArr[3] = "xPpemHklMEjsRkqDLSx71WJyeIfI1FmL";
        c1084Mk.A0g(4);
        if (iA03 == 1) {
            c1084Mk.A0g(4);
        }
        if (c1084Mk.A0C() != 1) {
            throw L9.A00(A0A(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 39, 56));
        }
        c1084Mk2.A0f(8);
        int iA032 = AbstractC1455ag.A03(c1084Mk2.A0C());
        String[] strArr2 = A0a;
        if (strArr2[1].charAt(14) != strArr2[3].charAt(14)) {
            c1084Mk2.A0g(4);
            if (iA032 == 1) {
                if (c1084Mk2.A0Q() == 0) {
                    throw L9.A00(A0A(784, 55, 25));
                }
            } else if (iA032 >= 2) {
                c1084Mk2.A0g(4);
            }
        } else {
            A0a[4] = "bK6bPeMytAh5CyAIRjPW32w9gwSfGqw8";
            c1084Mk2.A0g(4);
            if (iA032 == 1) {
            }
        }
        if (c1084Mk2.A0Q() != 1) {
            throw L9.A00(A0A(165, 39, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        }
        c1084Mk2.A0g(1);
        int iA0I = c1084Mk2.A0I();
        int i11 = (iA0I & 240) >> 4;
        int i12 = iA0I & 15;
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
            }
            c1487bC.A08 = true;
            c1487bC.A07 = new C1486bB(z11, str, iA0I2, bArr, i11, i12, bArr2);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0V(C1486bB c1486bB, C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        int i5 = c1486bB.A00;
        c1084Mk.A0f(8);
        if ((AbstractC1455ag.A02(c1084Mk.A0C()) & 1) == 1) {
            c1084Mk.A0g(8);
        }
        int iA0I = c1084Mk.A0I();
        int iA0L = c1084Mk.A0L();
        if (iA0L > c1487bC.A00) {
            throw L9.A01(A0A(514, 18, 94) + iA0L + A0A(40, 38, 11) + c1487bC.A00, null);
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
            boolean z11 = iA0I > i5;
            i11 = 0 + (iA0I * iA0L);
            if (A0a[4].charAt(12) != 'C') {
                throw new RuntimeException();
            }
            A0a[7] = "3oPC3Onuzz53KD8lbAoghObbXCXpgcj5";
            Arrays.fill(c1487bC.A0F, 0, iA0L, z11);
        }
        Arrays.fill(c1487bC.A0F, iA0L, c1487bC.A00, false);
        if (i11 > 0) {
            c1487bC.A02(i11);
        }
    }

    static {
        A0D();
        A0b = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.P9
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return P8.A0b();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
        A0d = new byte[]{-94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12};
        A0c = new C1029Ke().A11(A0A(839, 18, 51)).A14();
    }

    public P8() {
        this(0);
    }

    public P8(int i5) {
        this(i5, null);
    }

    public P8(int i5, C1092Ms c1092Ms) {
        this(i5, c1092Ms, null, Collections.emptyList());
    }

    public P8(int i5, C1092Ms c1092Ms, C1485bA c1485bA, List<VC> list) {
        this(i5, c1092Ms, c1485bA, list, null);
    }

    @MetaExoPlayerCustomization
    public P8(int i5, C1092Ms c1092Ms, C1485bA c1485bA, List<VC> list, ZP zp2) {
        this.A0A = -9223372036854775807L;
        this.A0K = i5;
        this.A0R = c1092Ms;
        this.A0U = c1485bA;
        this.A0X = Collections.unmodifiableList(list);
        this.A0S = zp2;
        this.A0T = new C1400Zm();
        this.A0M = new C1084Mk(16);
        this.A0P = new C1084Mk(ZE.A03);
        this.A0O = new C1084Mk(5);
        this.A0N = new C1084Mk();
        this.A0Y = new byte[16];
        this.A0Q = new C1084Mk(this.A0Y);
        this.A0V = new ArrayDeque<>();
        this.A0W = new ArrayDeque<>();
        this.A0L = new SparseArray<>();
        this.A08 = -9223372036854775807L;
        this.A0B = -9223372036854775807L;
        this.A0C = -9223372036854775807L;
        this.A0E = InterfaceC1384Yw.A00;
        this.A0J = new ZP[0];
        this.A0I = new ZP[0];
    }

    public static int A00(int i5) throws L9 {
        if (i5 >= 0) {
            return i5;
        }
        throw L9.A01(A0A(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 27, 16) + i5, null);
    }

    public static long A02(C1084Mk c1084Mk) {
        c1084Mk.A0f(8);
        int fullAtom = c1084Mk.A0C();
        return AbstractC1455ag.A03(fullAtom) == 0 ? c1084Mk.A0Q() : c1084Mk.A0R();
    }

    public static long A03(C1084Mk c1084Mk) {
        c1084Mk.A0f(8);
        int fullAtom = c1084Mk.A0C();
        int version = AbstractC1455ag.A03(fullAtom);
        return version == 1 ? c1084Mk.A0R() : c1084Mk.A0Q();
    }

    public static Pair<Integer, C1462an> A04(C1084Mk c1084Mk) {
        c1084Mk.A0f(12);
        int defaultSampleDescriptionIndex = c1084Mk.A0C();
        int trackId = c1084Mk.A0C();
        int defaultSampleFlags = c1084Mk.A0C();
        int defaultSampleSize = c1084Mk.A0C();
        int defaultSampleDuration = c1084Mk.A0C();
        return Pair.create(Integer.valueOf(defaultSampleDescriptionIndex), new C1462an(trackId - 1, defaultSampleFlags, defaultSampleSize, defaultSampleDuration));
    }

    public static DrmInitData A06(List<PE> list) {
        ArrayList arrayList = null;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            PE pe2 = list.get(i5);
            int leafChildrenSize = ((AbstractC1455ag) pe2).A00;
            if (leafChildrenSize == 1886614376) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                byte[] bArrA0l = pe2.A00.A0l();
                UUID uuidA02 = AbstractC1478b3.A02(bArrA0l);
                if (uuidA02 == null) {
                    MV.A07(A0A(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 22, 5), A0A(550, 42, 72));
                } else {
                    arrayList.add(new DrmInitData.SchemeData(uuidA02, A0A(897, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), bArrA0l));
                }
            }
        }
        if (arrayList == null) {
            return null;
        }
        return new DrmInitData(arrayList);
    }

    private C1462an A07(SparseArray<C1462an> sparseArray, int i5) {
        if (sparseArray.size() == 1) {
            return sparseArray.valueAt(0);
        }
        return (C1462an) AbstractC1062Ln.A01(sparseArray.get(i5));
    }

    public static C1471aw A08(SparseArray<C1471aw> sparseArray) {
        C1471aw c1471aw = null;
        long sampleOffset = Long.MAX_VALUE;
        int size = sparseArray.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1471aw c1471awValueAt = sparseArray.valueAt(i5);
            if ((c1471awValueAt.A06 || c1471awValueAt.A01 != c1471awValueAt.A05.A01) && (!c1471awValueAt.A06 || c1471awValueAt.A02 != c1471awValueAt.A09.A01)) {
                long nextSampleOffset = c1471awValueAt.A05();
                if (nextSampleOffset < sampleOffset) {
                    c1471aw = c1471awValueAt;
                    sampleOffset = nextSampleOffset;
                }
            }
        }
        return c1471aw;
    }

    private void A0B() {
        this.A02 = 0;
        this.A00 = 0;
    }

    /* JADX WARN: Incorrect condition in loop: B:13:0x0054 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0C() {
        int nextExtraTrackId = 100;
        this.A0J = new ZP[2];
        int i5 = 0;
        if (this.A0S != null) {
            int emsgTrackOutputCount = 0 + 1;
            this.A0J[0] = this.A0S;
            i5 = emsgTrackOutputCount;
        }
        int nextExtraTrackId2 = this.A0K;
        if ((nextExtraTrackId2 & 4) != 0) {
            int emsgTrackOutputCount2 = i5 + 1;
            this.A0J[i5] = this.A0E.ALm(100, 5);
            i5 = emsgTrackOutputCount2;
            nextExtraTrackId = 100 + 1;
        }
        this.A0J = (ZP[]) N1.A1I(this.A0J, i5);
        for (ZP zp2 : this.A0J) {
            zp2.A7E(A0c);
        }
        int nextExtraTrackId3 = this.A0X.size();
        this.A0I = new ZP[nextExtraTrackId3];
        int i11 = 0;
        while (i11 < nextExtraTrackId) {
            int i12 = nextExtraTrackId + 1;
            ZP zpALm = this.A0E.ALm(nextExtraTrackId, 3);
            zpALm.A7E(this.A0X.get(i11));
            this.A0I[i11] = zpALm;
            i11++;
            nextExtraTrackId = i12;
        }
    }

    private void A0E(long j11) {
        while (!this.A0W.isEmpty()) {
            ArrayDeque<C1470av> arrayDeque = this.A0W;
            String[] strArr = A0a;
            if (strArr[6].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            A0a[7] = "vcbZdm4BuCEyLByA0jHTn0KQDqKFQQC3";
            C1470av c1470avRemoveFirst = arrayDeque.removeFirst();
            this.A03 -= c1470avRemoveFirst.A00;
            long jA05 = c1470avRemoveFirst.A01;
            if (c1470avRemoveFirst.A02) {
                jA05 += j11;
            }
            if (this.A0R != null) {
                jA05 = this.A0R.A05(jA05);
            }
            for (ZP zp2 : this.A0J) {
                zp2.AKC(jA05, 1, c1470avRemoveFirst.A00, this.A03, null);
            }
        }
    }

    private void A0F(long j11) throws L9 {
        while (!this.A0V.isEmpty() && this.A0V.peek().A00 == j11) {
            A0N(this.A0V.pop());
        }
        A0B();
    }

    public static void A0G(C1084Mk c1084Mk, int i5, C1487bC c1487bC) throws L9 {
        c1084Mk.A0f(i5 + 8);
        int fullAtom = c1084Mk.A0C();
        int flags = AbstractC1455ag.A02(fullAtom);
        int fullAtom2 = flags & 1;
        if (fullAtom2 == 0) {
            int i11 = flags & 2;
            String[] strArr = A0a;
            String str = strArr[6];
            String str2 = strArr[2];
            int flags2 = str.length();
            int fullAtom3 = str2.length();
            if (flags2 != fullAtom3) {
                A0a[4] = "FJEFL3FZhdpiCewiJuk3IXLikQFq3Ola";
                boolean z11 = i11 != 0;
                int sampleCount = c1084Mk.A0L();
                if (sampleCount == 0) {
                    boolean[] zArr = c1487bC.A0F;
                    String[] strArr2 = A0a;
                    String str3 = strArr2[1];
                    String str4 = strArr2[3];
                    int flags3 = str3.charAt(14);
                    int fullAtom4 = str4.charAt(14);
                    if (flags3 == fullAtom4) {
                        A0a[4] = "7rjC7fsI9KwJCJwQh2i0OD7KPvouRdkX";
                        int fullAtom5 = c1487bC.A00;
                        Arrays.fill(zArr, 0, fullAtom5, false);
                        return;
                    }
                } else {
                    int fullAtom6 = c1487bC.A00;
                    if (sampleCount == fullAtom6) {
                        Arrays.fill(c1487bC.A0F, 0, sampleCount, z11);
                        int fullAtom7 = c1084Mk.A07();
                        c1487bC.A02(fullAtom7);
                        c1487bC.A04(c1084Mk);
                        return;
                    }
                    StringBuilder sbAppend = new StringBuilder().append(A0A(532, 18, 94)).append(sampleCount).append(A0A(0, 40, 109));
                    int fullAtom8 = c1487bC.A00;
                    throw L9.A01(sbAppend.append(fullAtom8).toString(), null);
                }
            }
            throw new RuntimeException();
        }
        throw L9.A00(A0A(458, 56, 60));
    }

    public static void A0I(C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        c1084Mk.A0f(8);
        int flags = c1084Mk.A0C();
        int fullAtom = AbstractC1455ag.A02(flags) & 1;
        if (fullAtom == 1) {
            c1084Mk.A0g(8);
        }
        int iA0L = c1084Mk.A0L();
        if (iA0L == 1) {
            int iA03 = AbstractC1455ag.A03(flags);
            long j11 = c1487bC.A03;
            String[] strArr = A0a;
            String str = strArr[6];
            String str2 = strArr[2];
            int fullAtom2 = str.length();
            int entryCount = str2.length();
            if (fullAtom2 == entryCount) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0a;
            strArr2[1] = "biHc1fQLnkoiM6qypOiDjo78xZay44TQ";
            strArr2[3] = "W1tS84fj2Nf0NuqlaagjTD68W6cPz2g7";
            c1487bC.A03 = j11 + (iA03 == 0 ? c1084Mk.A0Q() : c1084Mk.A0R());
            return;
        }
        throw L9.A01(A0A(727, 29, 77) + iA0L, null);
    }

    public static void A0J(C1084Mk c1084Mk, C1487bC c1487bC) throws L9 {
        A0G(c1084Mk, 0, c1487bC);
    }

    public static void A0K(C1084Mk c1084Mk, C1487bC c1487bC, byte[] bArr) throws L9 {
        c1084Mk.A0f(8);
        c1084Mk.A0k(bArr, 0, 16);
        if (!Arrays.equals(bArr, A0d)) {
            return;
        }
        A0G(c1084Mk, 16, c1487bC);
    }

    @MetaExoPlayerCustomization
    private void A0L(Q9 q92) throws IOException {
        int i5 = ((int) this.A07) - this.A00;
        C1084Mk c1084Mk = this.A0D;
        if (c1084Mk != null) {
            q92.readFully(c1084Mk.A0l(), 8, i5);
            A0U(new PE(this.A01, c1084Mk), q92.A9Q(), q92.AA2());
        } else {
            q92.ALL(i5);
        }
        A0F(q92.A9Q());
    }

    private void A0M(Q9 q92) throws IOException {
        C1471aw c1471awValueAt = null;
        long j11 = Long.MAX_VALUE;
        int size = this.A0L.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1471aw c1471awValueAt2 = this.A0L.valueAt(i5);
            String[] strArr = A0a;
            if (strArr[6].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0a;
            strArr2[6] = "B45CYyguc15qhZ5veptBY4BW";
            strArr2[2] = "KOlmrZMESYKxeHHZ758A2mBdi";
            C1487bC c1487bC = c1471awValueAt2.A09;
            if (c1487bC.A0A && c1487bC.A03 < j11) {
                j11 = c1487bC.A03;
                c1471awValueAt = this.A0L.valueAt(i5);
            }
        }
        if (c1471awValueAt == null) {
            this.A02 = 3;
            return;
        }
        int iA9Q = (int) (j11 - q92.A9Q());
        if (iA9Q >= 0) {
            q92.ALL(iA9Q);
            c1471awValueAt.A09.A05(q92);
            return;
        }
        throw L9.A01(A0A(384, 39, 107), null);
    }

    private void A0N(PF pf2) throws L9 {
        if (((AbstractC1455ag) pf2).A00 == 1836019574) {
            A0P(pf2);
        } else if (((AbstractC1455ag) pf2).A00 == 1836019558) {
            A0O(pf2);
        } else {
            if (this.A0V.isEmpty()) {
                return;
            }
            this.A0V.peek().A04(pf2);
        }
    }

    private void A0O(PF pf2) throws L9 {
        A0Q(pf2, this.A0L, this.A0U != null, this.A0K, this.A0Y);
        DrmInitData drmInitDataA06 = A06(pf2.A02);
        if (drmInitDataA06 != null) {
            SparseArray<C1471aw> sparseArray = this.A0L;
            String[] strArr = A0a;
            if (strArr[1].charAt(14) != strArr[3].charAt(14)) {
                throw new RuntimeException();
            }
            A0a[7] = "hcRTGMudGFHKKfZtNWKhzz7c0k3YpzB8";
            int size = sparseArray.size();
            for (int trackCount = 0; trackCount < size; trackCount++) {
                this.A0L.valueAt(trackCount).A0B(drmInitDataA06);
            }
        }
        if (this.A0B != -9223372036854775807L) {
            int size2 = this.A0L.size();
            for (int i5 = 0; i5 < size2; i5++) {
                this.A0L.valueAt(i5).A0A(this.A0B);
            }
            this.A0B = -9223372036854775807L;
        }
    }

    private void A0P(PF pf2) throws L9 {
        AbstractC1062Ln.A0A(this.A0U == null, A0A(680, 20, 34));
        DrmInitData drmInitDataA06 = A06(pf2.A02);
        PF pf3 = (PF) AbstractC1062Ln.A01(pf2.A02(1836475768));
        SparseArray<C1462an> sparseArray = new SparseArray<>();
        long jA02 = -9223372036854775807L;
        int size = pf3.A02.size();
        for (int i5 = 0; i5 < size; i5++) {
            PE pe2 = pf3.A02.get(i5);
            if (((AbstractC1455ag) pe2).A00 == 1953654136) {
                Pair<Integer, C1462an> pairA04 = A04(pe2.A00);
                sparseArray.put(((Integer) pairA04.first).intValue(), (C1462an) pairA04.second);
            } else if (((AbstractC1455ag) pe2).A00 == 1835362404) {
                jA02 = A02(pe2.A00);
            }
        }
        List<C1488bD> listA0O = AbstractC1461am.A0O(pf2, new Z6(), jA02, drmInitDataA06, (this.A0K & 16) != 0, false, new InterfaceC1338Wy() { // from class: com.facebook.ads.redexgen.X.PA
            @Override // com.facebook.ads.redexgen.X.InterfaceC1338Wy
            public final Object A4c(Object obj) {
                return this.A00.A0c((C1485bA) obj);
            }
        });
        int size2 = listA0O.size();
        if (this.A0L.size() == 0) {
            for (int i11 = 0; i11 < size2; i11++) {
                C1488bD c1488bD = listA0O.get(i11);
                C1485bA c1485bA = c1488bD.A03;
                this.A0L.put(c1485bA.A00, new C1471aw(this.A0E.ALm(i11, c1485bA.A03), c1488bD, A07(sparseArray, c1485bA.A00)));
                this.A08 = Math.max(this.A08, c1485bA.A04);
            }
            InterfaceC1384Yw interfaceC1384Yw = this.A0E;
            if (A0a[7].charAt(1) == 'U') {
                throw new RuntimeException();
            }
            String[] strArr = A0a;
            strArr[5] = "OrhQxg08UushiYwVaqK9LvBW";
            strArr[0] = "cRCSDWIC";
            interfaceC1384Yw.A6x();
            return;
        }
        AbstractC1062Ln.A08(this.A0L.size() == size2);
        for (int i12 = 0; i12 < size2; i12++) {
            C1488bD c1488bD2 = listA0O.get(i12);
            C1485bA c1485bA2 = c1488bD2.A03;
            this.A0L.get(c1485bA2.A00).A0C(c1488bD2, A07(sparseArray, c1485bA2.A00));
        }
    }

    public static void A0Q(PF pf2, SparseArray<C1471aw> sparseArray, boolean z11, int i5, byte[] bArr) throws L9 {
        int size = pf2.A01.size();
        for (int i11 = 0; i11 < size; i11++) {
            PF child = pf2.A01.get(i11);
            int i12 = ((AbstractC1455ag) child).A00;
            if (i12 == 1953653094) {
                A0R(child, sparseArray, z11, i5, bArr);
            }
        }
    }

    public static void A0S(PF pf2, C1471aw c1471aw, int i5) throws L9 {
        int i11 = 0;
        int leafChildrenSize = 0;
        List<PE> list = pf2.A02;
        int trunStartPosition = list.size();
        for (int i12 = 0; i12 < trunStartPosition; i12++) {
            PE pe2 = list.get(i12);
            int trunCount = ((AbstractC1455ag) pe2).A00;
            if (trunCount == 1953658222) {
                C1084Mk c1084Mk = pe2.A00;
                c1084Mk.A0f(12);
                int trunCount2 = c1084Mk.A0L();
                if (trunCount2 > 0) {
                    leafChildrenSize += trunCount2;
                    i11++;
                }
            }
        }
        c1471aw.A02 = 0;
        c1471aw.A00 = 0;
        c1471aw.A01 = 0;
        c1471aw.A09.A03(i11, leafChildrenSize);
        int i13 = 0;
        int trunCount3 = 0;
        for (int trunIndex = 0; trunIndex < trunStartPosition; trunIndex++) {
            PE pe3 = list.get(trunIndex);
            int totalSampleCount = ((AbstractC1455ag) pe3).A00;
            if (totalSampleCount == 1953658222) {
                trunCount3 = A01(c1471aw, i13, i5, pe3.A00, trunCount3);
                i13++;
            }
        }
    }

    @MetaExoPlayerCustomization
    private void A0U(PE pe2, long j11, Uri uri) throws L9 {
        if (!this.A0V.isEmpty()) {
            this.A0V.peek().A05(pe2);
            return;
        }
        if (((AbstractC1455ag) pe2).A00 == 1936286840) {
            Pair<Long, QJ> pairA05 = A05(pe2.A00, j11);
            this.A0C = ((Long) pairA05.first).longValue();
            this.A0E.AKP((ZK) pairA05.second);
            this.A0G = true;
            return;
        }
        int i5 = ((AbstractC1455ag) pe2).A00;
        if (A0a[7].charAt(1) == 'U') {
            throw new RuntimeException();
        }
        String[] strArr = A0a;
        strArr[6] = "spdRTJ9gc0V8C8dawfdzzmzq";
        strArr[2] = "7no20bYvIU1AJm1N2ikVgT8N4";
        if (i5 != 1701671783 || uri == null) {
            return;
        }
        A0H(pe2.A00, uri);
    }

    public static boolean A0W(int i5) {
        return i5 == 1836019574 || i5 == 1953653099 || i5 == 1835297121 || i5 == 1835626086 || i5 == 1937007212 || i5 == 1836019558 || i5 == 1953653094 || i5 == 1836475768 || i5 == 1701082227;
    }

    public static boolean A0X(int i5) {
        return i5 == 1751411826 || i5 == 1835296868 || i5 == 1836476516 || i5 == 1936286840 || i5 == 1937011556 || i5 == 1937011827 || i5 == 1668576371 || i5 == 1937011555 || i5 == 1937011578 || i5 == 1937013298 || i5 == 1937007471 || i5 == 1668232756 || i5 == 1937011571 || i5 == 1952867444 || i5 == 1952868452 || i5 == 1953196132 || i5 == 1953654136 || i5 == 1953658222 || i5 == 1886614376 || i5 == 1935763834 || i5 == 1935763823 || i5 == 1936027235 || i5 == 1970628964 || i5 == 1935828848 || i5 == 1936158820 || i5 == 1701606260 || i5 == 1835362404 || i5 == 1701671783;
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x0146, code lost:
    
        if (r9 == 1835295092) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0148, code lost:
    
        r11.A0F = r7;
        r11.A09 = r11.A07 + r2;
        r11.A02 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0152, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x015b, code lost:
    
        if (r9 == 1835295092) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x015e, code lost:
    
        r3 = r11.A01;
        r2 = com.facebook.ads.redexgen.X.P8.A0a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0170, code lost:
    
        if (r2[5].length() == r2[0].length()) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0172, code lost:
    
        com.facebook.ads.redexgen.X.P8.A0a[4] = "0S8elcTiMKARCn8aCrl6ynMdGK5dBFmZ";
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x017d, code lost:
    
        if (A0W(r3) == false) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x017f, code lost:
    
        r5 = (r12.A9Q() + r11.A07) - 8;
        r11.A0V.push(new com.facebook.ads.redexgen.X.PF(r11.A01, r5));
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x019c, code lost:
    
        if (r11.A07 != r11.A00) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x019e, code lost:
    
        A0F(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x01a1, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x01a2, code lost:
    
        A0B();
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01af, code lost:
    
        if (A0X(r11.A01) == false) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x01b3, code lost:
    
        if (r11.A00 != 8) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01b9, code lost:
    
        if (r11.A07 > 2147483647L) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x01bb, code lost:
    
        r2 = new com.facebook.ads.redexgen.X.C1084Mk((int) r11.A07);
        java.lang.System.arraycopy(r11.A0M.A0l(), 0, r2.A0l(), 0, 8);
        r11.A0D = r2;
        r11.A02 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x01d9, code lost:
    
        if (r11.A07 > 2147483647L) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01db, code lost:
    
        r11.A0D = r7;
        r11.A02 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01ee, code lost:
    
        throw com.facebook.ads.redexgen.X.L9.A00(A0A(335, 49, 59));
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01fd, code lost:
    
        throw com.facebook.ads.redexgen.X.L9.A00(A0A(284, 51, 78));
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x020c, code lost:
    
        throw com.facebook.ads.redexgen.X.L9.A00(A0A(592, 53, 32));
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e6 A[PHI: r7
      0x00e6: PHI (r7v6 long) = (r7v3 long), (r7v8 long) binds: [B:44:0x0125, B:32:0x00e4] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x011e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A0Y(Q9 q92) throws IOException {
        long j11;
        C1084Mk c1084Mk;
        C1471aw c1471aw;
        if (this.A00 == 0) {
            if (!q92.AIe(this.A0M.A0l(), 0, 8, true)) {
                return false;
            }
            this.A00 = 8;
            this.A0M.A0f(0);
            this.A07 = this.A0M.A0Q();
            this.A01 = this.A0M.A0C();
        }
        if (this.A07 == 1) {
            String[] strArr = A0a;
            if (strArr[5].length() != strArr[0].length()) {
                String[] strArr2 = A0a;
                strArr2[6] = "L97AowIvDpQgC0hkPj0dio6A";
                strArr2[2] = "EUhYDJsJPeB4gv96eREp9IFRH";
                q92.readFully(this.A0M.A0l(), 8, 8);
                this.A00 += 8;
                this.A07 = this.A0M.A0R();
            }
            throw new RuntimeException();
        }
        if (this.A07 == 0) {
            long jA90 = q92.A90();
            String[] strArr3 = A0a;
            if (strArr3[5].length() != strArr3[0].length()) {
                A0a[4] = "oFzCdTNGbdCLC4HDeTJ6RIXl2bR0JN3V";
                j11 = -1;
                if (jA90 == -1) {
                    if (!this.A0V.isEmpty()) {
                        jA90 = this.A0V.peek().A00;
                    }
                }
                if (A0a[7].charAt(1) == 'U') {
                    A0a[7] = "hvDPlglxAMzPin7EuyvdM91NkccsJCHS";
                    if (jA90 != j11) {
                        this.A07 = (jA90 - q92.A9Q()) + this.A00;
                    }
                } else if (jA90 != j11) {
                }
            } else {
                j11 = -1;
                if (jA90 == -1) {
                }
                if (A0a[7].charAt(1) == 'U') {
                }
            }
            throw new RuntimeException();
        }
        if (this.A07 >= this.A00) {
            long jA9Q = q92.A9Q() - this.A00;
            if ((this.A01 == 1836019558 || this.A01 == 1835295092) && !this.A0G) {
                this.A0E.AKP(new Q4(this.A08, jA9Q));
                this.A0G = true;
            }
            if (this.A01 == 1836019558) {
                int size = this.A0L.size();
                for (int i5 = 0; i5 < size; i5++) {
                    C1487bC c1487bC = this.A0L.valueAt(i5).A09;
                    c1487bC.A02 = jA9Q;
                    c1487bC.A03 = jA9Q;
                    c1487bC.A04 = jA9Q;
                }
            }
            int i11 = this.A01;
            if (A0a[4].charAt(12) != 'C') {
                String[] strArr4 = A0a;
                strArr4[6] = "8ww54Jg8h40uFbR9CTqdgCou";
                strArr4[2] = "mPDqvtOMVaWeBbObt2hQY7V2B";
                c1471aw = null;
                c1084Mk = null;
            } else {
                A0a[4] = "Br05gI1F2f3iCI2EKdJXqy492T7HOV8G";
                c1084Mk = null;
                c1471aw = null;
            }
            throw new RuntimeException();
        }
        throw L9.A00(A0A(78, 48, 90));
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0264 A[LOOP:1: B:74:0x0264->B:78:0x0283, LOOP_START] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x02ad  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x02bb  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x02c5  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02e3  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x02fb  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0303  */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A0Z(Q9 q92) throws IOException {
        C1485bA c1485bA;
        String[] strArr;
        int iAK7;
        int i5;
        C1471aw c1471awA08 = this.A0F;
        Throwable th2 = null;
        if (c1471awA08 == null) {
            c1471awA08 = A08(this.A0L);
            if (c1471awA08 == null) {
                long jA9Q = this.A09 - q92.A9Q();
                if (A0a[7].charAt(1) != 'U') {
                    String[] strArr2 = A0a;
                    strArr2[1] = "6YThtj0zjkxnACqh02LZm3kmqJKQwVS0";
                    strArr2[3] = "IzKrSJZrM0xZqnqBypiUQofEhtOGu3XM";
                    int i11 = (int) jA9Q;
                    if (i11 < 0) {
                        throw L9.A01(A0A(423, 35, 98), null);
                    }
                    q92.ALL(i11);
                    String[] strArr3 = A0a;
                    if (strArr3[1].charAt(14) != strArr3[3].charAt(14)) {
                        A0a[4] = "q4QQK27ktJIkCUU447hWnpzQVULcn1JV";
                        A0B();
                        return false;
                    }
                    String[] strArr4 = A0a;
                    strArr4[5] = "eWTPrtqpTIMIPxnWkrJxSQQe";
                    strArr4[0] = "DV2oCwUs";
                    A0B();
                    return false;
                }
            } else {
                long jA05 = c1471awA08.A05();
                long jA9Q2 = q92.A9Q();
                String[] strArr5 = A0a;
                if (strArr5[6].length() != strArr5[2].length()) {
                    String[] strArr6 = A0a;
                    strArr6[1] = "ck8pvSJlCkvJrLqWxYmfaiz8TCj7tpNF";
                    strArr6[3] = "E9UekiAKQoUHx9qLxlyNsjycirdUZqSs";
                    i5 = (int) (jA05 - jA9Q2);
                    if (i5 < 0) {
                        MV.A07(A0A(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 22, 5), A0A(Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 40, 62));
                        i5 = 0;
                    }
                    q92.ALL(i5);
                    this.A0F = c1471awA08;
                    int i12 = 4;
                    int i13 = 1;
                    if (this.A02 == 3) {
                    }
                    c1485bA = c1471awA08.A05.A03;
                    ZP zp2 = c1471awA08.A08;
                    long jA06 = c1471awA08.A06();
                    if (this.A0R != null) {
                    }
                    if (c1485bA.A01 != 0) {
                    }
                    int iA02 = c1471awA08.A02();
                    ZN zn2 = null;
                    C1486bB c1486bBA07 = c1471awA08.A07();
                    strArr = A0a;
                    if (strArr[5].length() != strArr[0].length()) {
                    }
                    if (!XL.A03(XQ.A1y)) {
                        if (A0A(857, 21, 62).equals(this.A0F.A05.A03.A07.A0W)) {
                        }
                    }
                    long j11 = jA06;
                    zp2.AKC(jA06, iA02, this.A06, 0, zn2);
                    this.A0A = j11;
                    A0E(j11);
                    if (!c1471awA08.A0D()) {
                    }
                    this.A02 = 3;
                    return true;
                }
                A0a[4] = "KCf4uJTxOH1eCu7heXEVBWSuh06XRuT6";
                i5 = (int) (jA05 - jA9Q2);
                if (i5 < 0) {
                }
                q92.ALL(i5);
                this.A0F = c1471awA08;
                int i122 = 4;
                int i132 = 1;
                if (this.A02 == 3) {
                }
                c1485bA = c1471awA08.A05.A03;
                ZP zp22 = c1471awA08.A08;
                long jA062 = c1471awA08.A06();
                if (this.A0R != null) {
                }
                if (c1485bA.A01 != 0) {
                }
                int iA022 = c1471awA08.A02();
                ZN zn22 = null;
                C1486bB c1486bBA072 = c1471awA08.A07();
                strArr = A0a;
                if (strArr[5].length() != strArr[0].length()) {
                }
                if (!XL.A03(XQ.A1y)) {
                }
                long j112 = jA062;
                zp22.AKC(jA062, iA022, this.A06, 0, zn22);
                this.A0A = j112;
                A0E(j112);
                if (!c1471awA08.A0D()) {
                }
                this.A02 = 3;
                return true;
            }
        } else {
            int i1222 = 4;
            int i1322 = 1;
            if (this.A02 == 3) {
                this.A06 = c1471awA08.A03();
                if (c1471awA08.A01 < c1471awA08.A03) {
                    q92.ALL(this.A06);
                    c1471awA08.A09();
                    if (!c1471awA08.A0D()) {
                        this.A0F = null;
                    }
                    this.A02 = 3;
                    return true;
                }
                if (c1471awA08.A05.A03.A02 == 1) {
                    this.A06 -= 8;
                    q92.ALL(8);
                }
                if (A0A(878, 9, 47).equals(c1471awA08.A05.A03.A07.A0W)) {
                    this.A04 = c1471awA08.A04(this.A06, 7);
                    AbstractC1369Yg.A07(this.A06, this.A0Q);
                    c1471awA08.A08.AK9(this.A0Q, 7);
                    this.A04 += 7;
                } else {
                    this.A04 = c1471awA08.A04(this.A06, 0);
                }
                this.A06 += this.A04;
                this.A02 = 4;
                this.A05 = 0;
            }
            c1485bA = c1471awA08.A05.A03;
            ZP zp222 = c1471awA08.A08;
            long jA0622 = c1471awA08.A06();
            if (this.A0R != null) {
                jA0622 = this.A0R.A05(jA0622);
            }
            if (c1485bA.A01 != 0) {
                byte[] bArrA0l = this.A0O.A0l();
                bArrA0l[0] = 0;
                bArrA0l[1] = 0;
                bArrA0l[2] = 0;
                int i14 = c1485bA.A01 + 1;
                int i15 = 4 - c1485bA.A01;
                while (this.A04 < this.A06) {
                    if (this.A05 == 0) {
                        q92.readFully(bArrA0l, i15, i14);
                        this.A0O.A0f(0);
                        int iA0C = this.A0O.A0C();
                        if (iA0C >= i1322) {
                            this.A05 = iA0C - 1;
                            this.A0P.A0f(0);
                            zp222.AK9(this.A0P, i1222);
                            zp222.AK9(this.A0O, i1322);
                            this.A0H = this.A0I.length > 0 && ZE.A0I(c1485bA.A07.A0W, bArrA0l[i1222]);
                            this.A04 += 5;
                            this.A06 += i15;
                            i1322 = 1;
                        } else {
                            throw L9.A01(A0A(266, 18, 73), th2);
                        }
                    } else {
                        if (this.A0H) {
                            this.A0N.A0d(this.A05);
                            q92.readFully(this.A0N.A0l(), 0, this.A05);
                            zp222.AK9(this.A0N, this.A05);
                            iAK7 = this.A05;
                            int iA023 = ZE.A02(this.A0N.A0l(), this.A0N.A0A());
                            C1084Mk c1084Mk = this.A0N;
                            String str = c1485bA.A07.A0W;
                            if (A0a[7].charAt(1) != 'U') {
                                A0a[7] = "BpOg6eE3mtuwVwvHkFgZW8n8uz2LcabH";
                                c1084Mk.A0f(A0A(887, 10, 105).equals(str) ? 1 : 0);
                                this.A0N.A0e(iA023);
                                AbstractC1377Yp.A03(jA0622, this.A0N, this.A0I);
                            }
                        } else {
                            iAK7 = zp222.AK7(q92, this.A05, false);
                        }
                        this.A04 += iAK7;
                        this.A05 -= iAK7;
                        th2 = null;
                        i1222 = 4;
                        i1322 = 1;
                    }
                }
            } else {
                while (true) {
                    int i16 = this.A04;
                    int i17 = this.A06;
                    String[] strArr7 = A0a;
                    if (strArr7[5].length() == strArr7[0].length()) {
                        throw new RuntimeException();
                    }
                    A0a[4] = "c8mxoZGd2Q8WC0fMuOea3yATryiSNNCo";
                    if (i16 >= i17) {
                        break;
                    }
                    this.A04 += zp222.AK7(q92, this.A06 - this.A04, false);
                }
            }
            int iA0222 = c1471awA08.A02();
            ZN zn222 = null;
            C1486bB c1486bBA0722 = c1471awA08.A07();
            strArr = A0a;
            if (strArr[5].length() != strArr[0].length()) {
                String[] strArr8 = A0a;
                strArr8[6] = "Rct8B2KWH9iZIjLt1wKnyeW1";
                strArr8[2] = "QpJHT92kfcsQmPwd7DmOpd4Tp";
                if (c1486bBA0722 != null) {
                    zn222 = c1486bBA0722.A01;
                }
            } else if (c1486bBA0722 != null) {
            }
            if (!XL.A03(XQ.A1y) && this.A0F != null) {
                if (A0A(857, 21, 62).equals(this.A0F.A05.A03.A07.A0W)) {
                    iA0222 |= 1;
                }
            }
            long j1122 = jA0622;
            zp222.AKC(jA0622, iA0222, this.A06, 0, zn222);
            this.A0A = j1122;
            A0E(j1122);
            if (!c1471awA08.A0D()) {
                this.A0F = null;
            }
            this.A02 = 3;
            return true;
        }
        throw new RuntimeException();
    }

    public static boolean A0a(C1485bA c1485bA) {
        if (c1485bA.A08 == null || c1485bA.A08.length != 1 || c1485bA.A09 == null) {
            return false;
        }
        if (c1485bA.A08[0] == 0) {
            return true;
        }
        long j11 = c1485bA.A08[0] + c1485bA.A09[0];
        long j12 = c1485bA.A05;
        if (A0a[7].charAt(1) == 'U') {
            throw new RuntimeException();
        }
        A0a[4] = "0Q88ZbcvQEIxCc32UKwkG70cQi1Rc0cj";
        long editListEndMediaTimeUs = N1.A0U(j11, 1000000L, j12);
        return editListEndMediaTimeUs >= c1485bA.A04;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A0b() {
        return new InterfaceC1383Yv[]{new P7()};
    }

    public final C1485bA A0c(C1485bA c1485bA) {
        return c1485bA;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A0E = interfaceC1384Yw;
        A0B();
        A0C();
        if (this.A0U != null) {
            this.A0L.put(0, new C1471aw(interfaceC1384Yw.ALm(0, this.A0U.A03), new C1488bD(this.A0U, new long[0], new int[0], 0, new long[0], new int[0], 0L), new C1462an(0, 0, 0, 0)));
            this.A0E.A6x();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        while (true) {
            switch (this.A02) {
                case 0:
                    if (!A0Y(q92)) {
                        return -1;
                    }
                    break;
                case 1:
                    A0L(q92);
                    break;
                case 2:
                    A0M(q92);
                    break;
                default:
                    if (!A0Z(q92)) {
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
        int size = this.A0L.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A0L.valueAt(i5).A08();
        }
        this.A0W.clear();
        this.A03 = 0;
        this.A0B = j12;
        this.A0V.clear();
        A0B();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        return AbstractC1483b8.A01(q92);
    }
}
