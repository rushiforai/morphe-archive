package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.e7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1667e7 {
    public static byte[] A0V;
    public static String[] A0W = {"CNW8uQwJK", "6Hk6Q2vWLsdusv9B44NMGeheYytPD5NJ", "6E8NDelRXI5gw1kg3KUx4q3ivzTvhhTL", "ZjydJJ6bPML2iabWeztXE7Wx", "GFiGlJkqxkVd1xCWEJa2gUKMyWl5cPPd", "vTfColNhMTcD9KiBdKSfst9tt8SccEWm", "wjZWolD5xHVGDgAyEauoDZuBzrtHhQqJ", "EptiUqty2vHcl9g"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final int A09;
    public final long A0A;
    public final long A0B;
    public final long A0C;
    public final long A0D;
    public final long A0E;
    public final long A0F;
    public final C1665e5 A0G;
    public final C1666e6 A0H;
    public final String A0I;
    public final String A0J;
    public final String A0K;
    public final String A0L;
    public final String A0M;
    public final String A0N;
    public final String A0O;
    public final Map<String, String> A0P;
    public final boolean A0Q;
    public final boolean A0R;
    public final boolean A0S;
    public final boolean A0T;
    public final boolean A0U;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0V, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
            if (A0W[4].charAt(1) != 'F') {
                throw new RuntimeException();
            }
            A0W[4] = "AFp2eXAuxRsvaGoV4w54vO9wfi1ysfK0";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0V = new byte[]{115, AbstractJsonLexerKt.TC_INVALID};
    }

    static {
        A01();
    }

    public C1667e7() {
        this(A00(0, 0, 40), -1L, false, -1, -1, -1, -1, false, false, -1, -1L, new C1666e6(), false, -1, -1, -1L, -1L, -1, null, -1, null, null, C1665e5.A02, -1, false, A00(0, 0, 40), A00(0, 0, 40), A00(0, 0, 40), null, -1L, -1L);
    }

    public C1667e7(C1667e7 c1667e7) {
        this(c1667e7, c1667e7.A0M);
    }

    public C1667e7(C1667e7 c1667e7, String str) {
        this(c1667e7.A0L, c1667e7.A0A, c1667e7.A0S, c1667e7.A08, c1667e7.A07, c1667e7.A00, c1667e7.A09, c1667e7.A0U, c1667e7.A0R, c1667e7.A05, c1667e7.A0C, c1667e7.A0H, c1667e7.A0T, c1667e7.A06, c1667e7.A02, c1667e7.A0E, c1667e7.A0B, c1667e7.A01, c1667e7.A0P, c1667e7.A04, c1667e7.A0J, c1667e7.A0I, c1667e7.A0G, c1667e7.A03, c1667e7.A0Q, c1667e7.A0N, c1667e7.A0K, c1667e7.A0O, str, -1L, -1L);
    }

    public C1667e7(String str, long j11, boolean z11, int i5, int i11, int i12, int i13, boolean z12, boolean z13, int i14, long j12, C1666e6 c1666e6, boolean z14, int i15, int i16, long j13, long j14, int i17, Map<String, String> map, int i18, String str2, String str3, C1665e5 c1665e5, int i19, boolean z15, String str4, String str5, String str6, String str7, long j15, long j16) {
        this.A0P = new HashMap();
        this.A0L = str;
        this.A0A = j11;
        this.A0S = z11;
        this.A08 = i5;
        this.A07 = i11;
        this.A00 = i12;
        this.A09 = i13;
        this.A0U = z12;
        this.A0R = z13;
        this.A05 = i14;
        this.A0C = j12;
        this.A0H = c1666e6;
        this.A0T = z14;
        this.A06 = i15;
        this.A02 = i16;
        this.A0E = j13;
        this.A0B = j14;
        this.A01 = i17;
        this.A04 = i18;
        this.A0I = str3;
        this.A0J = str2;
        if (map != null) {
            this.A0P.putAll(map);
        }
        this.A0G = c1665e5;
        this.A03 = i19;
        this.A0Q = z15;
        this.A0N = str4;
        this.A0K = str5;
        this.A0O = str6;
        this.A0M = str7;
        this.A0F = j15;
        this.A0D = j16;
    }

    public final String toString() {
        StringBuilder sbAppend = new StringBuilder().append(this.A0L);
        String strA00 = A00(0, 2, 81);
        return sbAppend.append(strA00).append(this.A0A).append(strA00).append(this.A0S).append(strA00).append(this.A08).append(strA00).append(this.A07).append(strA00).append(this.A00).append(strA00).append(this.A09).append(strA00).append(this.A0U).append(strA00).append(this.A0R).append(strA00).append(this.A05).append(strA00).append(this.A0E).append(strA00).append(this.A0B).append(strA00).append(this.A01).append(strA00).append(this.A04).append(strA00).append(this.A06).append(strA00).append(this.A02).append(strA00).append(this.A03).append(strA00).append(this.A0Q).append(strA00).append(this.A0N).toString();
    }
}
