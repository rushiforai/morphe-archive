package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.uZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2671uZ implements View.OnClickListener {
    public static byte[] A01;
    public final /* synthetic */ C2673ub A00;

    static {
        A01();
    }

    public ViewOnClickListenerC2671uZ(C2673ub c2673ub) {
        this.A00 = c2673ub;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{45, 57, 55, -8, 48, 43, 45, 47, 44, 57, 57, 53, -8, 43, 46, 61, -8, 51, 56, 62, 47, 60, 61, 62, 51, 62, 51, 43, 54, -8, 48, 51, 56, 51, 61, 50, 41, 43, 45, 62, 51, 64, 51, 62, 67};
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A07.A0F().ABl();
            this.A00.A09.A5C(A00(0, 45, 92));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
