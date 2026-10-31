package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import org.json.JSONException;

/* loaded from: assets/audience_network/classes.dex */
public class H4 implements InterfaceC1404Zq {
    public static byte[] A02;
    public final /* synthetic */ C0957Hh A00;
    public final /* synthetic */ InterfaceC1421a7 A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-120, -121, -125, -106, -105, -108, -121, -127, -123, -111, -112, -120, -117, -119};
    }

    public H4(InterfaceC1421a7 interfaceC1421a7, C0957Hh c0957Hh) {
        this.A01 = interfaceC1421a7;
        this.A00 = c0957Hh;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1404Zq
    public final void A5I() {
        try {
            C2203mv.A0T(this.A00).A3A(this.A01.A8J().optJSONObject(A00(0, 14, 2)));
        } catch (JSONException e3) {
            this.A00.A08().A4j(e3);
        }
    }
}
