package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.bJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1494bJ {
    public static byte[] A0B;
    public static String[] A0C = {"HGPuB8qmuxBgpGTqkkjvYzrCDskUp", "sF6fS75l2Cff0tziaX", "Zza04ks", "dNGMYSaiVbuE60ePOHja3XP4IlV", "q5npa5t", "wgntkRyUJ0qfijEJi4TyzmgID1", "fepOHmymjACox7eFs8FhQnXrtP3Evpqq", "KxtJjVrZLWzYUfpgJdwgfb5Z4AGZ"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public long A05;
    public long A06;
    public long A07;
    public long A08;
    public final int[] A09 = new int[255];
    public final C1084Mk A0A = new C1084Mk(255);

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 20);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0B = new byte[]{34, 57, 36, 34, 39, 39, 56, 37, 35, 50, 51, 119, 53, 62, 35, 119, 36, 35, 37, 50, 54, 58, 119, 37, 50, 33, 62, 36, 62, 56, 57};
    }

    static {
        A01();
    }

    public final void A02() {
        this.A03 = 0;
        this.A04 = 0;
        this.A05 = 0L;
        this.A08 = 0L;
        this.A07 = 0L;
        this.A06 = 0L;
        this.A02 = 0;
        this.A01 = 0;
        this.A00 = 0;
    }

    public final boolean A03(Q9 q92) throws IOException {
        return A04(q92, -1L);
    }

    public final boolean A04(Q9 q92, long j11) throws IOException {
        AbstractC1062Ln.A07(q92.A9Q() == q92.A9L());
        this.A0A.A0d(4);
        while (true) {
            if (j11 != -1 && q92.A9Q() + 4 >= j11) {
                break;
            }
            byte[] bArrA0l = this.A0A.A0l();
            if (A0C[1].length() == 18) {
                A0C[0] = "talPG6FYcHiBUTQzt0zzTBAf7LU39";
                if (!AbstractC1385Yx.A04(q92, bArrA0l, 0, 4, true)) {
                    break;
                }
                this.A0A.A0f(0);
                if (this.A0A.A0Q() == 1332176723) {
                    q92.AK3();
                    return true;
                }
                q92.ALL(1);
            } else {
                throw new RuntimeException();
            }
        }
        do {
            if (j11 != -1 && q92.A9Q() >= j11) {
                break;
            }
        } while (q92.ALI(1) != -1);
        return false;
    }

    /* JADX WARN: Incorrect condition in loop: B:18:0x0090 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A05(Q9 q92, boolean z11) throws IOException {
        A02();
        this.A0A.A0d(27);
        if (!AbstractC1385Yx.A04(q92, this.A0A.A0l(), 0, 27, z11) || this.A0A.A0Q() != 1332176723) {
            return false;
        }
        this.A03 = this.A0A.A0I();
        if (this.A03 != 0) {
            if (z11) {
                return false;
            }
            throw L9.A00(A00(0, 31, 67));
        }
        this.A04 = this.A0A.A0I();
        this.A05 = this.A0A.A0N();
        this.A08 = this.A0A.A0O();
        this.A07 = this.A0A.A0O();
        this.A06 = this.A0A.A0O();
        this.A02 = this.A0A.A0I();
        this.A01 = this.A02 + 27;
        this.A0A.A0d(this.A02);
        if (!AbstractC1385Yx.A04(q92, this.A0A.A0l(), 0, this.A02, z11)) {
            return false;
        }
        for (int i5 = 0; i5 < i; i5++) {
            int[] iArr = this.A09;
            int i11 = this.A0A.A0I();
            iArr[i5] = i11;
            int i12 = this.A00;
            int i13 = this.A09[i5];
            this.A00 = i12 + i13;
        }
        return true;
    }
}
