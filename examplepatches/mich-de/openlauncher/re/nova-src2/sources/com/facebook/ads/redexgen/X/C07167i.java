package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07167i extends LA implements Serializable {
    public static byte[] A00 = null;
    public static final long serialVersionUID = 5751287062553772011L;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{72, 79, 85, 68, 83, 82, 85, 72, 85, 72, 64, 77};
    }

    public C07167i(List<C1735fE> list) {
        super(list);
    }

    public static C07167i A00(JSONObject jSONObject, C0958Hi c0958Hi) {
        C07167i c07167i = new C07167i(LA.A07(jSONObject, c0958Hi, new C1047Ky()));
        c07167i.A3B(jSONObject);
        c07167i.A23(A01(0, 12, 67));
        return c07167i;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1L() {
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1M() {
        return 0;
    }
}
