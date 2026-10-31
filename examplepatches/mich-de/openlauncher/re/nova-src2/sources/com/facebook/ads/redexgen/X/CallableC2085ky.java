package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.net.TrafficStats;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.concurrent.Callable;

/* renamed from: com.facebook.ads.redexgen.X.ky, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2085ky implements Callable<Boolean> {
    public static byte[] A02;
    public static String[] A03 = {"jwTNBF52XqMGgcVEiQTwvXvSBsl43Bcu", "zl9XISU", "9LwyCiCzMXmNgkxTRjX8XUqiNT4UlidW", "Jar4Zz8ck96tLH67JFbLbWmYESMeU49V", "Yd8bjyjazIom6Oxe2tnjIAJyfdSlHwWG", "VgUZ5KaBAYbzt3oMIew8EQ4BA2c", "hXTgBapwd4emagenALPcDOSBW5zmdf3H", "17k"};
    public final C2084kx A00;
    public final /* synthetic */ C2086kz A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A03[1].length() == 32) {
                throw new RuntimeException();
            }
            A03[3] = b.f42142b;
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 48);
            i13++;
        }
    }

    public static void A02() {
        A02 = new byte[]{-20, -16, -28, -22, -24};
    }

    static {
        A02();
    }

    public CallableC2085ky(C2086kz c2086kz, C2084kx c2084kx) {
        this.A01 = c2086kz;
        this.A00 = c2084kx;
    }

    private final Boolean A00() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            TrafficStats.setThreadStatsTag(61453);
            C1618dJ c1618dJ = new C1618dJ(this.A00.A08, this.A00.A07, this.A00.A06, A01(0, 5, 83), this.A00.A02, this.A00.A03);
            c1618dJ.A01 = this.A00.A05;
            c1618dJ.A00 = this.A00.A04;
            if (C2089l2.A06(this.A01.A04)) {
                C2086kz.A0F.put(this.A00.A08, c1618dJ);
            }
            boolean z11 = this.A01.A08;
            boolean zA01 = false;
            if (A03[3].length() != 5) {
                A03[4] = "CZcPy1KhLDdCOlGcBT5xxsnRB32IUDMD";
                if (z11) {
                    zA01 = C2086kz.A03(this.A01.A04.A02()).AJw(c1618dJ, false).A01();
                } else if (this.A01.A03.A0F(this.A00) != null) {
                    zA01 = true;
                }
                l5 l5Var = this.A00.A01;
                if (l5Var != null && l5Var.A02()) {
                    int iA00 = l5Var.A00();
                    int iA01 = l5Var.A01();
                    if (iA00 <= 0 || iA01 <= 0) {
                        if (this.A01.A08) {
                            A04(this.A00.A08, c1618dJ);
                        } else {
                            A03(this.A00.A04, this.A00.A05);
                        }
                    } else if (this.A01.A08) {
                        c1618dJ.A00 = iA00;
                        c1618dJ.A01 = iA01;
                        A04(this.A00.A08, c1618dJ);
                    } else {
                        A03(iA00, iA01);
                    }
                }
                return Boolean.valueOf(zA01);
            }
            throw new RuntimeException();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    private void A03(int i5, int i11) {
        Bitmap bitmapA0G = this.A01.A03.A0G(this.A01.A04, this.A00.A08, i5, i11, this.A00.A02);
        if (bitmapA0G == null) {
            return;
        }
        this.A01.A07.put(this.A00.A08, bitmapA0G);
    }

    private void A04(String str, C1618dJ c1618dJ) {
        Bitmap bitmapA00 = C2086kz.A03(this.A01.A04.A02()).AJw(c1618dJ, true).A00();
        if (bitmapA00 == null) {
            return;
        }
        this.A01.A07.put(str, bitmapA00);
    }

    @Override // java.util.concurrent.Callable
    public final /* bridge */ /* synthetic */ Boolean call() throws Exception {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            return A00();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }
}
