package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class CW extends AbstractC1540c3 {
    public static byte[] A01;
    public final /* synthetic */ C06705o A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 21);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{7, 14, 19, 12, 0, 21, 35, 60, 49, 48, 58, 10, 49, 32, 39, 52, 33, 60, 58, 59, 24, 7, 11, 25, 49, 26, 23, 30, 11};
    }

    public CW(C06705o c06705o) {
        this.A00 = c06705o;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (!this.A00.A0B.A07()) {
            this.A00.setImpressionRecordingFlag(this.A00.A0B);
            if (!TextUtils.isEmpty(this.A00.A09) && this.A00.A0D != null && this.A00.A0D != null) {
                Map<String, String> mapA07 = new C2618ti().A05(this.A00.A08).A04(this.A00.A0B).A06(this.A00.A0D.A1b()).A07();
                mapA07.put(A00(0, 6, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), this.A00.A0D.A1c());
                mapA07.put(A00(6, 14, 64), String.valueOf(this.A00.A0D.A1I()));
                if (this.A00.A0E.A0F().AA8() != null) {
                    mapA07.put(A00(20, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), this.A00.A0E.A0F().AA8().name());
                }
                this.A00.A0F.AC7(this.A00.A09, mapA07);
                C1750fT.A07(this.A00.A0D.A33(), this.A00.A0E);
                this.A00.A0E.A0F().A3h();
                AbstractC1813gU.A02(this.A00.A0D.A1Z(), AbstractC2401qD.A00(this.A00.A0D.A1c()));
            }
        }
    }
}
