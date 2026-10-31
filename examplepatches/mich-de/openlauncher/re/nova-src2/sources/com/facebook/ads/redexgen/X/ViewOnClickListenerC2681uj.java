package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2681uj implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {b.f42142b, "HBnrsW65aYWVvlJTMpWxFuU7z6MV4xxJ", "tXIuQqWBvr", b.f42142b, "VtieTS2CshWtQMI3l6Acm9um24vRFq1J", "25ZZ2FxRZN7AWJhoRaY84f3F1yf7l7BH", "QBWydbCUfoNWyqRHIYB4mtuveM9uMuB5", "ip309lScFF5SkXTTlyumKzm4Zaw9hedS"};
    public final /* synthetic */ C0877Ee A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A02[2].length() == 2) {
                throw new RuntimeException();
            }
            A02[4] = "tqBSefJA8FkovjSgYNKxEGKjBcizSh9O";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 15);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{114, 118, 122, 124, 126};
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2681uj(C0877Ee c0877Ee) {
        this.A00 = c0877Ee;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.getCtaButton().A0E(A00(0, 5, 20));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
