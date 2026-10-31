package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ko, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2075ko {
    public static boolean A04;
    public static byte[] A05;
    public static final String A06;
    public final C2076kp A00;
    public final C2077kq A01;
    public final C0957Hh A02;
    public final InterfaceC1421a7 A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 114);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{46, 56, 19, 41, 52, 56, 62, 45, 63};
    }

    static {
        A01();
        A06 = C2075ko.class.getSimpleName();
    }

    public C2075ko(C0957Hh c0957Hh, AH ah2, C2076kp c2076kp, C2077kq c2077kq) {
        this.A02 = c0957Hh;
        this.A03 = ah2.A63(EnumC1407Zt.A06);
        this.A00 = c2076kp;
        this.A01 = c2077kq;
        this.A03.A4R(new C0966Hq(this));
        A02();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void A02() {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (!this.A03.ABM()) {
                this.A02.A05().AB6();
                return;
            }
            String btExtras = this.A03.A8J().optString(A00(0, 9, 62));
            if (!TextUtils.isEmpty(btExtras)) {
                this.A00.A04(this.A02, btExtras);
                if (!A04 || C2203mv.A0h(this.A02)) {
                    A04 = true;
                    this.A01.A07();
                }
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
