package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.view.Display;
import android.view.WindowManager;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Xw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1359Xw {
    public static byte[] A0C;
    public long A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public long A06;
    public long A07;
    public boolean A08;
    public final WindowManager A09;
    public final C1358Xu A0A;
    public final Xv A0B;

    static {
        A04();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 26);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0C = new byte[]{93, 80, 74, 73, 85, 88, 64, 112, 110, 105, 99, 104, 112};
    }

    public C1359Xw() {
        this(null);
    }

    public C1359Xw(Context context) {
        if (context != null) {
            this.A09 = (WindowManager) context.getSystemService(A02(7, 6, 29));
        } else {
            this.A09 = null;
        }
        if (this.A09 != null) {
            this.A0A = N1.A02 >= 17 ? A01(context) : null;
            this.A0B = Xv.A00();
        } else {
            this.A0A = null;
            this.A0B = null;
        }
        this.A06 = -9223372036854775807L;
        this.A07 = -9223372036854775807L;
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

    private C1358Xu A01(Context context) {
        DisplayManager displayManager = (DisplayManager) context.getSystemService(A02(0, 7, 35));
        if (displayManager == null) {
            return null;
        }
        return new C1358Xu(this, displayManager);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03() {
        Display defaultDisplay = this.A09.getDefaultDisplay();
        if (defaultDisplay != null) {
            this.A06 = (long) (1.0E9d / defaultDisplay.getRefreshRate());
            this.A07 = (this.A06 * 80) / 100;
        }
    }

    private boolean A06(long j11, long j12) {
        long j13 = j11 - this.A04;
        long elapsedFrameTimeNs = this.A05;
        return Math.abs((j12 - elapsedFrameTimeNs) - j13) > 20000000;
    }

    public final long A07(long j11, long j12) {
        long j13 = 1000 * j11;
        long j14 = j13;
        long j15 = j12;
        if (this.A08) {
            if (j11 != this.A02) {
                this.A01++;
                this.A00 = this.A03;
            }
            if (this.A01 >= 6) {
                long j16 = this.A00 + ((j13 - this.A04) / this.A01);
                if (!A06(j16, j12)) {
                    j15 = (this.A05 + j16) - this.A04;
                    j14 = j16;
                } else {
                    this.A08 = false;
                }
            } else if (A06(j13, j12)) {
                this.A08 = false;
            }
        }
        if (!this.A08) {
            this.A04 = j13;
            this.A05 = j12;
            this.A01 = 0L;
            this.A08 = true;
        }
        this.A02 = j11;
        this.A03 = j14;
        if (this.A0B == null || this.A06 == -9223372036854775807L) {
            return j15;
        }
        long j17 = this.A0B.A04;
        if (j17 == -9223372036854775807L) {
            return j15;
        }
        return A00(j15, j17, this.A06) - this.A07;
    }

    public final void A08() {
        if (this.A09 != null) {
            if (this.A0A != null) {
                this.A0A.A01();
            }
            this.A0B.A07();
        }
    }

    public final void A09() {
        this.A08 = false;
        if (this.A09 != null) {
            this.A0B.A06();
            if (this.A0A != null) {
                this.A0A.A00();
            }
            A03();
        }
    }
}
