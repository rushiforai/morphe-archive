package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.6N, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C6N extends BK {
    public static byte[] A01;
    public final /* synthetic */ C2764w4 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-78, -65, -65, -68, -65};
    }

    public C6N(C2764w4 c2764w4) {
        this.A00 = c2764w4;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final void A03(BL bl2) {
        new Handler(Looper.getMainLooper()).post(new RunnableC2762w2(this));
        this.A00.A0B.AHb(A00(0, 5, 60), this.A00.A03());
    }
}
