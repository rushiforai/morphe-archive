package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.rT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2479rT implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"dEVAdbQ3JOI9a4c3eafK4uZgCR8", "ymvDf94i2A8vhGA1mUADTbxtPZwSGYI", "TtxEF7730Ef1t", "seYdh1g", "6C30avWoWpOreww", "osFOvjPHrfZLP1x47AbYHhCov2gJpzDB", "N", "suZqvQAlLuViropv8"};
    public final /* synthetic */ C2481rV A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A02[5].charAt(27) != 'J') {
                throw new RuntimeException();
            }
            A02[5] = "0jQT3XclxTbtftDDbHPIfulB6AqJIZPn";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 91);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{66, 70, 74, 76, 78};
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2479rT(C2481rV c2481rV) {
        this.A00 = c2481rV;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A07.getCTAButton().A0E(A00(0, 5, 112));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
