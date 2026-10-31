package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.Arrays;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.7v, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07297v extends MH {
    public static byte[] A02;
    public static String[] A03 = {"OXbCEMjwdPN5xvU2NT0kKgep5UeL1Sqr", "SX0ygsPxRN6KiRybC8JMsMv996SDI", "L77PzfY5dGd9ppcaJeqEYdg5mL", "qaE4mxmFDXDzve4pMTR5s0xQhV", "rrEUCxltihDw1phZ7LTyezPpJ6vgfWBl", "FdpTQfSalwXKw6iuOYHl49ZbqEAaQDuv", "IFg4N7XoM6S2Rxr", "IzcF2xeWDVSzXIhxKqlgaOjlVHZ1W1Z3"};
    public Map<String, String> A00;
    public final Uri A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 16);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {58, 63, 56, 61};
        if (A03[5].charAt(30) != 'u') {
            throw new RuntimeException();
        }
        A03[5] = "82m81CO1d0OwjHPL38rD7xdABiLQ6kup";
        A02 = bArr;
    }

    static {
        A01();
    }

    public C07297v(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, Uri uri, Map<String, String> mExtraData) {
        super(c0958Hi, interfaceC2224nG, str, null, true, true);
        this.A01 = uri;
        this.A00 = mExtraData;
    }

    @Override // com.facebook.ads.redexgen.X.MH
    public final EnumC1698ec A0J() {
        Uri uriA0O = A0O();
        if (this.A00 != null && uriA0O != null) {
            new C2618ti(this.A00).A03(((AbstractC1701ef) this).A01, uriA0O.toString());
        }
        Map<String, String> map = this.A00;
        if (A03[5].charAt(30) != 'u') {
            throw new RuntimeException();
        }
        A03[6] = "7umG1RvFX2i";
        A0L(map, null);
        return EnumC1698ec.A08;
    }

    public final Uri A0O() {
        String uri = this.A01.getQueryParameter(A00(0, 4, 70));
        if (uri == null) {
            uri = A00(0, 0, 20);
        }
        return AbstractC2351pP.A00(uri);
    }
}
