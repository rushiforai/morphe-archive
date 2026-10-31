package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.internal.api.AudienceNetworkRemoteServiceApi;
import com.facebook.ads.internal.util.process.ProcessUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.q1, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2389q1 {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 73);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{46, 118, 110, 115, 109, 101, 34, 37, 56, 35, 48, 37, 36, 100, 39, 47, 62, 43, 100, 41, 37, 39};
    }

    public static boolean A02(Uri uri) {
        if (uri == null) {
            return false;
        }
        String host = uri.getHost();
        String path = uri.getPath();
        return A00(6, 16, 3).equals(host) && path != null && path.startsWith(A00(0, 6, 72));
    }

    public static boolean A03(C0958Hi c0958Hi, Uri uri) {
        return C2337p8.A04() != null && ProcessUtils.isRemoteRenderingProcess() && A02(uri) && A04(c0958Hi, uri);
    }

    public static boolean A04(C0958Hi c0958Hi, Uri uri) {
        AudienceNetworkRemoteServiceApi.HorizonWorldUrlLauncher launcher = C2337p8.A04();
        if (launcher != null) {
            return launcher.launchUrl(c0958Hi, uri);
        }
        return false;
    }
}
