package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class MF extends AbstractC1701ef {
    public static byte[] A01;
    public static final String A02;
    public final Uri A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{88, 115, 123, 126, 119, 118, 50, -122, -127, 50, -127, -126, 119, -128, 50, 126, 123, -128, 125, 50, -121, -124, 126, 76, 50};
    }

    static {
        A01();
        A02 = MF.class.getSimpleName();
    }

    public MF(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, Uri uri) {
        super(c0958Hi, interfaceC2224nG, str);
        this.A00 = uri;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1701ef
    public final EnumC1698ec A0G(String str) {
        try {
            C2347pK.A0E(new C2347pK(), this.A01, this.A00, this.A03);
        } catch (Exception unused) {
            String str2 = A00(0, 25, 17) + this.A00.toString();
        }
        return EnumC1698ec.A08;
    }
}
