package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class K7 extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public final /* synthetic */ K6 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 19);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{109, -114, -100, -99, -101, -104, -94, 73, -96, -118, -100, 73, -105, -104, -99, 73, -116, -118, -107, -107, -114, -115, 87, -46, -50, -51, 1, -16, -11, -15, -6, -17, -15, -38, -15, 0, 3, -5, -2, -9, -22, 0, 6, -79, -11, -6, -11, -1, -72, 5, -79, -12, -14, -3, -3, -79, -11, -10, 4, 5, 3, 0, 10, -71, -70, -79, -9, 0, 3, -79, -46, -11, -79, -32, -13, -5, -10, -12, 5, -65, -79, -27, -7, -6, 4, -79, -2, -14, 10, -79, -3, -10, -14, -11, -79, 5, 0, -79, -3, -10, -14, -4, -6, -1, -8, -79, -2, -10, -2, 0, 3, 10, -65, -79, -31, -3, -10, -14, 4, -10, -67, -79, -14, -3, 8, -14, 10, 4, -79, -12, -14, -3, -3, -79, -11, -10, 4, 5, 3, 0, 10, -71, -70, -79, 8, -7, -10, -1, -79, 10, 0, 6, -79, -11, 0, -1, -72, 5, -79, -1, -10, -10, -11, -79, 5, -7, -6, 4, -79, -46, -11, -79, -32, -13, -5, -10, -12, 5, -79, -14, -1, 10, -79, -2, 0, 3, -10, -65, -34, -19, -26};
    }

    public K7(K6 k62) {
        this.A00 = k62;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A02.A0F().A3r();
        if (this.A00.A00.A7P() == EnumC1787g4.A04) {
            return;
        }
        if (!BuildConfigApi.isDebug()) {
            this.A00.A02.A08().ACp(A00(188, 3, 106), AbstractC2126lf.A0Y, new C2127lg(A00(0, 23, 22)));
        }
        Log.e(A00(23, 17, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), A00(40, 148, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        this.A00.A08();
    }
}
