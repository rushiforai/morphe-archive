package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public class MD extends AbstractRunnableC2319oq {
    public static byte[] A02;
    public final /* synthetic */ C1715eu A00;
    public final /* synthetic */ JSONObject A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 21);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{7, 19, 4, 16, 20, 4, 15, 2, 24, 62, 2, 0, 17, 17, 8, 15, 6};
    }

    public MD(C1715eu c1715eu, JSONObject jSONObject) {
        this.A00 = c1715eu;
        this.A01 = jSONObject;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() throws InterruptedException {
        try {
            this.A00.A05.await();
            synchronized (this.A00.A02) {
                this.A00.A02.A0B(this.A01);
                this.A00.A06.countDown();
            }
        } catch (InterruptedException e3) {
            this.A00.A03.A08().ABz(A00(0, 17, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), AbstractC2126lf.A1B, new C2127lg(e3));
        } catch (JSONException e11) {
            this.A00.A0M();
            this.A00.A03.A08().ABz(A00(0, 17, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), AbstractC2126lf.A1A, new C2127lg(e11));
        }
    }
}
