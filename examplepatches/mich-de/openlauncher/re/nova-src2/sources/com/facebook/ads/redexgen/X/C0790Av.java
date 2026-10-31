package com.facebook.ads.redexgen.X;

import android.widget.TextView;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* renamed from: com.facebook.ads.redexgen.X.Av, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0790Av extends TextView implements InterfaceC1663e3 {
    public static byte[] A02;
    public static final int A03;
    public C0799Be A00;
    public final AbstractC2172mQ<C5V> A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A02 = new byte[]{-51, -40, -38, 12, -30, -51, -40, -38, 12, -59, -59, -49, -59, -59};
    }

    static {
        A04();
        A03 = (int) (AbstractC2385px.A02 * 6.0f);
    }

    public C0790Av(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A01 = new C0791Aw(this);
        AbstractC2426qc.A0W(this, AbstractC2426qc.A06(855638016, A03));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String A02(long j11) {
        if (j11 <= 0) {
            return A01(9, 5, 53);
        }
        long minutes = TimeUnit.MILLISECONDS.toMinutes(j11);
        long minutes2 = TimeUnit.MILLISECONDS.toSeconds(j11 % 60000);
        return String.format(Locale.US, A01(0, 9, 72), Long.valueOf(minutes), Long.valueOf(minutes2));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ABd(C0799Be c0799Be) {
        this.A00 = c0799Be;
        if (this.A00 != null) {
            this.A00.getEventBus().A05(this.A01);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        this.A00 = c0799Be;
        if (this.A00 != null) {
            this.A00.getEventBus().A06(this.A01);
        }
    }
}
