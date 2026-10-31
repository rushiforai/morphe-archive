package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2270o2 implements View.OnClickListener {
    public static byte[] A02;
    public final /* synthetic */ ViewOnClickListenerC0884El A00;
    public final /* synthetic */ C2250ng A01;

    static {
        A01();
    }

    public ViewOnClickListenerC2270o2(C2250ng c2250ng, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A01 = c2250ng;
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{102, 114, 99, 93, 103, 108, 102, 93, 97, 99, 112, 102};
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            String url = this.A01.A03;
            if (url != null) {
                ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A00;
                viewOnClickListenerC0884El.A0F();
                viewOnClickListenerC0884El.setClickUrl(url);
            }
            this.A00.A0E(A00(0, 12, 12));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
