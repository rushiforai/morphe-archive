package com.facebook.ads.redexgen.X;

import android.animation.ObjectAnimator;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.tv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2631tv implements Runnable {
    public static byte[] A01;
    public final /* synthetic */ C06976p A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 67);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-60, -49, -45, -53, -60};
    }

    public RunnableC2631tv(C06976p c06976p) {
        this.A00 = c06976p;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        String strA00 = A00(0, 5, 32);
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0V.A0F().AM2();
            ObjectAnimator.ofFloat(this.A00.A0R, strA00, 1.0f, 0.0f).setDuration(100L).start();
            ObjectAnimator.ofFloat(this.A00.A0Q, strA00, 1.0f, 0.0f).setDuration(100L).start();
            ObjectAnimator duration = ObjectAnimator.ofFloat(((AbstractC2624to) this.A00).A09, strA00, 1.0f, 0.0f).setDuration(100L);
            duration.addListener(new C2630tu(this));
            duration.start();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
