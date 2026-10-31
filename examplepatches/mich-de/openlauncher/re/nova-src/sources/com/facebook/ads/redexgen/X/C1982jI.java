package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.jI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1982jI {
    public static byte[] A00;
    public static final C1982jI A01;

    static {
        A01();
        A01 = new C1982jI();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{53, 57, 56, 34, 51, 46, 34};
    }

    public final ImageView A02(C0958Hi c0958Hi, int i5) {
        C1h.A09(c0958Hi, A00(0, 7, 47));
        if (i5 == 1) {
            return C1974jA.A01.A02(c0958Hi);
        }
        return C1974jA.A01.A02(c0958Hi);
    }
}
