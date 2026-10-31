package com.facebook.ads.redexgen.X;

import android.util.Log;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public class HR implements InterfaceC2325ow {
    public static byte[] A01;
    public final /* synthetic */ C0957Hh A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 15);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{68, 64, 67, 119, 102, 107, 103, 108, 97, 103, 76, 103, 118, 117, 109, 112, 105, 15, 52, 63, 34, 42, 63, 57, 46, 63, 62, 122, 63, 40, 40, 53, 40, 116, 121, 104, 123, 105, 114, 69, 105, 114, 115, AbstractJsonLexerKt.TC_INVALID, 118, 126};
    }

    public HR(C0957Hh c0957Hh) {
        this.A00 = c0957Hh;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2325ow
    public final void ABf(int i5, Throwable th2) {
        Log.e(A00(0, 17, 13), A00(17, 17, 85), th2);
        this.A00.A08().ABz(A00(34, 12, 21), i5, new C2127lg(th2));
    }
}
