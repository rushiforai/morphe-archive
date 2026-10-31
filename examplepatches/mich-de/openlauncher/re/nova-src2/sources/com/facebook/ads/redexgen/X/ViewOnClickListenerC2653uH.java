package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2653uH implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"l4N2Kcxoefptdq", b.f42142b, "xCyGfauY8Cv8y6z1j6nB0", "I2vrbV9C0ptJWrRodxY1O", "AmZ6eVz7znw", "py", "GJkVNgHUEop", "nCT0hemhHj6ffYmr5ag1r7dDnEHHnadR"};
    public final /* synthetic */ C06906i A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        if (A02[7].charAt(24) != 'n') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[2] = "onCZLFvGkKiXvi8omTZne";
        strArr[3] = "abRPxd6rYbi4uG3hrN9CP";
        A01 = new byte[]{70, 66, 78, 72, 74};
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2653uH(C06906i c06906i) {
        this.A00 = c06906i;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.getCtaButton().A0E(A00(0, 5, 74));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            if (A02[0].length() == 28) {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[6] = "DOCXsrSX8m5";
            strArr[1] = b.f42142b;
        }
    }
}
