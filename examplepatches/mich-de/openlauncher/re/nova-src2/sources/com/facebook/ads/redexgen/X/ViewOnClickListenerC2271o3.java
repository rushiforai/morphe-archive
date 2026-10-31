package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2271o3 implements View.OnClickListener {
    public static byte[] A01;
    public final /* synthetic */ ViewOnClickListenerC0884El A00;

    static {
        A01();
    }

    public ViewOnClickListenerC2271o3(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{33, 44, 40, 45, 44, 59};
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A00;
            if (viewOnClickListenerC0884El != null) {
                viewOnClickListenerC0884El.A0E(A00(0, 6, 71));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
