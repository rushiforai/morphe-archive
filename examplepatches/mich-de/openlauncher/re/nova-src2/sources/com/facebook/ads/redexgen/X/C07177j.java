package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7j, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07177j extends LA {
    public static byte[] A00 = null;
    public static final long serialVersionUID = 5751287062553772012L;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{-123, -124, -111, -111, -120, -107};
    }

    public C07177j(List<C1735fE> list) {
        super(list);
    }

    public static C07177j A00(JSONObject jSONObject, C0958Hi c0958Hi) {
        C07177j c07177j = new C07177j(LA.A07(jSONObject, c0958Hi, new L0()));
        c07177j.A3B(jSONObject);
        c07177j.A23(A01(0, 6, 27));
        return c07177j;
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
