package com.facebook.ads.androidx.media3.exoplayer.video;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.view.Surface;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.XU;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class DummySurface extends Surface {
    public static int A03;
    public static boolean A04;
    public static byte[] A05;
    public boolean A00;
    public final boolean A01;
    public final XU A02;

    static {
        A04();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A05 = new byte[]{-58, -56, -51, -32, -58, -39, -43, -32, -15, -13, -16, -11, -26, -28, -11, -26, -27, -32, -28, -16, -17, -11, -26, -17, -11, -82, -80, -75, -56, -76, -79, -69, -56, -36, -34, -37, -49, -54, -52, -50, -43, -50, -36, -36, -56, -52, -40, -41, -35, -50, -31, -35, -84, -59, -54, -52, -57, -57, -58, -55, -53, -68, -69, 119, -57, -55, -64, -58, -55, 119, -53, -58, 119, -104, -89, -96, 119, -61, -68, -51, -68, -61, 119, -120, -114, -21, -25, -60, -55, -56, -61, -100, -87, -97, -83, -86, -92, -97, 105, -93, -100, -83, -97, -78, -100, -83, -96, 105, -79, -83, 105, -93, -92, -94, -93, -102, -85, -96, -83, -95, -86, -83, -88, -100, -87, -98, -96, -91, -109, -97, -91, -89, -96, -103};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static synchronized boolean A05(Context context) {
        boolean z11;
        z11 = true;
        if (!A04) {
            A03 = N1.A02 < 24 ? 0 : A00(context);
            A04 = true;
        }
        if (A03 == 0) {
            z11 = false;
        }
        return z11;
    }

    public DummySurface(XU xu2, SurfaceTexture surfaceTexture, boolean z11) {
        super(surfaceTexture);
        this.A02 = xu2;
        this.A01 = z11;
    }

    public static int A00(Context context) {
        String strEglQueryString;
        if (N1.A02 < 26 && (A02(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 7, 4).equals(N1.A05) || A02(85, 6, 101).equals(N1.A06))) {
            return 0;
        }
        if ((N1.A02 < 26 && !context.getPackageManager().hasSystemFeature(A02(91, 36, 13))) || (strEglQueryString = EGL14.eglQueryString(EGL14.eglGetDisplay(0), 12373)) == null || !strEglQueryString.contains(A02(0, 25, 83))) {
            return 0;
        }
        if (strEglQueryString.contains(A02(25, 27, 59))) {
            return 1;
        }
        return 2;
    }

    public static DummySurface A01(Context context, boolean z11) {
        A03();
        AbstractC1062Ln.A08(!z11 || A05(context));
        return new XU().A04(z11 ? A03 : 0);
    }

    public static void A03() {
        if (N1.A02 >= 17) {
        } else {
            throw new UnsupportedOperationException(A02(52, 33, 41));
        }
    }

    @Override // android.view.Surface
    public final void release() {
        super.release();
        synchronized (this.A02) {
            if (!this.A00) {
                this.A02.A05();
                this.A00 = true;
            }
        }
    }
}
