package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.vC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2710vC implements View.OnClickListener {
    public static byte[] A01;
    public final /* synthetic */ ET A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{71, 66, 66, 67, 82, 71, 79, 74, 85};
    }

    public ViewOnClickListenerC2710vC(ET et2) {
        this.A00 = et2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (!this.A00.A0M) {
                this.A00.A0K.A02(A00(0, 9, 31));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
