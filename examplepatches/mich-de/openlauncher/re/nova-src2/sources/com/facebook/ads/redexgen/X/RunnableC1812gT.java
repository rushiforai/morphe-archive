package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.facebook.ads.AdSDKNotificationListener;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.gT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1812gT implements Runnable {
    public static byte[] A02;
    public static String[] A03 = {b.f42142b, "R2h4cPa", "8K6r33o48istIkLwCuAfGDqRYcEBFJta", "JrgImPTdAC8EkycOMZgSjkdVNJJcyT0z", "UmabyHZVDvNoGZWIzd7OnW5h8PImv1dX", "9OHeUl2dxQ9y3g7sK1669", "ejdw", "orFgTMj4gc7nxjDrulE2T1NaHiTuAbhe"};
    public final /* synthetic */ String A00;
    public final /* synthetic */ List A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 19);
            String[] strArr = A03;
            if (strArr[1].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[2] = "PBcjmF449O2ALurV1e1gxRld5UP64De9";
            strArr2[7] = "bFbD54V4FV2Kx5Uvd678uCerr9Gu9fe1";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-128, -119, 126, -115, -108, -117, -113, -128, AbstractJsonLexerKt.TC_INVALID, 122, 126, -117, -120, -113, -109, -106, -104, -117, -103, -103, -113, -107, -108};
    }

    static {
        A01();
    }

    public RunnableC1812gT(List list, String str) {
        this.A01 = list;
        this.A00 = str;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            for (AdSDKNotificationListener adSDKNotificationListener : this.A01) {
                Bundle data = new Bundle();
                data.putString(A00(0, 13, 8), this.A00);
                adSDKNotificationListener.onAdEvent(A00(13, 10, 19), data);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
