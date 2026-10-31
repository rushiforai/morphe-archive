package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: assets/audience_network/classes.dex */
public class I0 extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public final /* synthetic */ C2051kP A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{62, 44, 44, 58, 43, 44};
    }

    public I0(C2051kP c2051kP) {
        this.A00 = c2051kP;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() throws JSONException {
        try {
            JSONArray jSONArray = this.A00.A05.getJSONArray(A00(0, 6, 77));
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                C2049kN assetData = C2049kN.A00(jSONArray.getJSONObject(i5));
                this.A00.A09(assetData.A04, assetData);
            }
            this.A00.A02.A0X(new I2(this), new C2079ks(this.A00.A04, this.A00.A03));
        } catch (JSONException unused) {
            this.A00.A00.post(new I1(this));
        }
    }
}
