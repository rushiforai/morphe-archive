package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.view.Display;
import android.view.Surface;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Xt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1357Xt {
    public static byte[] A0H;
    public static String[] A0I = {"BzLKQQ", "guNn4XOOW", "b9w3CcJrwRYV3Oz", "wd8Hk9qLNJn0OjQYML8X63zOsnNqMpnw", "umQHBaYWHJZxZCc03wqCrfWuD9SSkSxi", "H3jhFFtl3PzCs87aHmgD041Jj37jQndb", "mikd7C", "WcCovW5StnGUjNK"};
    public float A00;
    public float A01;
    public float A02;
    public float A03;
    public int A04;
    public long A05;
    public long A06;
    public long A07;
    public long A08;
    public long A09;
    public long A0A;
    public long A0B;
    public Surface A0C;
    public boolean A0D;
    public final XX A0E = new XX();
    public final InterfaceC1356Xr A0F;
    public final Xs A0G;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0H, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 41;
            if (A0I[1].length() == 30) {
                throw new RuntimeException();
            }
            A0I[1] = "UKxZjkR03Jhkaya7oCbDQ8QeVY7uj";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        byte[] bArr = {35, 24, 23, 20, 26, 19, 86, 2, 25, 86, 7, 3, 19, 4, 15, 86, 18, 31, 5, 6, 26, 23, 15, 86, 4, 19, 16, 4, 19, 5, 30, 86, 4, 23, 2, 19, 33, 30, 19, 18, 24, 49, 5, 22, 26, 18, 37, 18, 27, 18, 22, 4, 18, 63, 18, 27, 7, 18, 5};
        String[] strArr = A0I;
        if (strArr[0].length() != strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0I;
        strArr2[7] = "FoorzRSe6KZh8Hr";
        strArr2[2] = "jbAKEo2D1cc5L0i";
        A0H = bArr;
    }

    static {
        A06();
    }

    public C1357Xt(Context context) {
        this.A0F = A01(context);
        this.A0G = this.A0F != null ? Xs.A00() : null;
        this.A0A = -9223372036854775807L;
        this.A0B = -9223372036854775807L;
        this.A00 = -1.0f;
        this.A01 = 1.0f;
        this.A04 = 0;
    }

    public static long A00(long j11, long j12, long j13) {
        long j14;
        long vsyncCount = j13 * ((j11 - j12) / j13);
        long j15 = j12 + vsyncCount;
        if (j11 <= j15) {
            j14 = j15 - j13;
        } else {
            j14 = j15;
            j15 += j13;
        }
        return j15 - j11 < j11 - j14 ? j15 : j14;
    }

    public static InterfaceC1356Xr A01(Context context) {
        QM qmA01 = null;
        if (context == null) {
            return null;
        }
        Context applicationContext = context.getApplicationContext();
        if (N1.A02 >= 17) {
            qmA01 = QM.A01(applicationContext);
        }
        if (qmA01 == null) {
            return QQ.A00(applicationContext);
        }
        return qmA01;
    }

    private void A03() {
        if (N1.A02 < 30 || this.A0C == null || this.A04 == Integer.MIN_VALUE || this.A03 == 0.0f) {
            return;
        }
        this.A03 = 0.0f;
        C1354Xp.A02(this.A0C, 0.0f);
    }

    private void A04() {
        this.A05 = 0L;
        this.A06 = -1L;
        this.A08 = -1L;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0084  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A05() {
        float f11;
        if (N1.A02 < 30 || this.A0C == null) {
            return;
        }
        float fA00 = this.A0E.A06() ? this.A0E.A00() : this.A00;
        float candidateFrameRate = this.A02;
        if (fA00 == candidateFrameRate) {
            return;
        }
        boolean z11 = true;
        if (fA00 != -1.0f) {
            float f12 = this.A02;
            if (A0I[5].charAt(23) == 'O') {
                throw new RuntimeException();
            }
            String[] strArr = A0I;
            strArr[7] = "eyz1CaOdqZIe0D4";
            strArr[2] = "8Zi8iCi2C1YNOse";
            if (f12 != -1.0f) {
                if (this.A0E.A06() && this.A0E.A03() >= 5000000000L) {
                    f11 = 0.02f;
                } else {
                    f11 = 1.0f;
                }
                float candidateFrameRate2 = this.A02;
                if (Math.abs(fA00 - candidateFrameRate2) < f11) {
                    z11 = false;
                }
            } else if (fA00 != -1.0f) {
                z11 = true;
            } else if (this.A0E.A01() < 30) {
                z11 = false;
            }
        }
        if (z11) {
            this.A02 = fA00;
            A09(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(Display display) {
        if (display != null) {
            double defaultDisplayRefreshRate = display.getRefreshRate();
            this.A0A = (long) (1.0E9d / defaultDisplayRefreshRate);
            this.A0B = (this.A0A * 80) / 100;
        } else {
            MV.A07(A02(36, 23, 94), A02(0, 36, 95));
            this.A0A = -9223372036854775807L;
            this.A0B = -9223372036854775807L;
        }
    }

    private void A09(boolean z11) {
        if (N1.A02 < 30 || this.A0C == null || this.A04 == Integer.MIN_VALUE) {
            return;
        }
        float f11 = 0.0f;
        if (this.A0D && this.A02 != -1.0f) {
            float f12 = this.A02;
            float surfacePlaybackFrameRate = this.A01;
            f11 = f12 * surfacePlaybackFrameRate;
        }
        if (!z11) {
            float surfacePlaybackFrameRate2 = this.A03;
            if (surfacePlaybackFrameRate2 == f11) {
                return;
            }
        }
        this.A03 = f11;
        C1354Xp.A02(this.A0C, f11);
    }

    public static boolean A0A(long j11, long j12) {
        return Math.abs(j11 - j12) <= 20000000;
    }

    public final long A0B(long j11) {
        long j12 = j11;
        if (this.A06 != -1 && this.A0E.A06()) {
            long jA02 = this.A0E.A02();
            long frameDurationNs = this.A07;
            long j13 = this.A05;
            long adjustedReleaseTimeNs = this.A06;
            long frameDurationNs2 = frameDurationNs + ((long) (((j13 - adjustedReleaseTimeNs) * jA02) / this.A01));
            if (A0A(j12, frameDurationNs2)) {
                j12 = frameDurationNs2;
            } else {
                A04();
            }
        }
        long adjustedReleaseTimeNs2 = this.A05;
        this.A08 = adjustedReleaseTimeNs2;
        this.A09 = j12;
        if (this.A0G == null || this.A0A == -9223372036854775807L) {
            return j12;
        }
        long j14 = this.A0G.A04;
        if (j14 == -9223372036854775807L) {
            return j12;
        }
        long sampledVsyncTimeNs = A00(j12, j14, this.A0A);
        long adjustedReleaseTimeNs3 = this.A0B;
        return sampledVsyncTimeNs - adjustedReleaseTimeNs3;
    }

    public final void A0C() {
        A04();
    }

    public final void A0D() {
        this.A0D = true;
        A04();
        if (this.A0F != null) {
            ((Xs) AbstractC1062Ln.A01(this.A0G)).A06();
            this.A0F.AIl(new InterfaceC1355Xq() { // from class: com.facebook.ads.redexgen.X.QX
                @Override // com.facebook.ads.redexgen.X.InterfaceC1355Xq
                public final void AEe(Display display) {
                    this.A00.A07(display);
                }
            });
        }
        A09(false);
        String[] strArr = A0I;
        if (strArr[4].charAt(3) != strArr[3].charAt(3)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0I;
        strArr2[0] = "wtXM97";
        strArr2[6] = "MWrhmJ";
    }

    public final void A0E() {
        this.A0D = false;
        if (this.A0F != null) {
            this.A0F.ALq();
            Xs xs2 = this.A0G;
            if (A0I[5].charAt(23) == 'O') {
                throw new RuntimeException();
            }
            A0I[1] = "5eJpeM";
            ((Xs) AbstractC1062Ln.A01(xs2)).A07();
        }
        A03();
    }

    public final void A0F(float f11) {
        this.A00 = f11;
        this.A0E.A04();
        A05();
    }

    public final void A0G(long j11) {
        if (this.A08 != -1) {
            this.A06 = this.A08;
            this.A07 = this.A09;
        }
        this.A05++;
        this.A0E.A05(1000 * j11);
        A05();
    }
}
