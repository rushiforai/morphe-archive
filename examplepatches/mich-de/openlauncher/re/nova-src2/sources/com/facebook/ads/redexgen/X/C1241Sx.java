package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Sx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1241Sx extends Exception {
    public static byte[] A05;
    public final C1234Sq A00;
    public final C1241Sx A01;
    public final String A02;
    public final String A03;
    public final boolean A04;

    static {
        A05();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 118);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A05 = new byte[]{-49, -61, 4, 37, 35, 47, 36, 37, 50, -32, 41, 46, 41, 52, -32, 38, 33, 41, 44, 37, 36, -6, -32, -15, 18, 16, 28, 17, 18, 31, -51, 22, 27, 22, 33, -51, 19, 14, 22, 25, 18, 17, -25, -51, 8, -24, -73, -85, -14, -2, -4, -67, -11, -16, -14, -12, -15, -2, -2, -6, -67, -16, -13, 2, -67, -16, -3, -13, 1, -2, -8, -13, 7, -67, -4, -12, -13, -8, -16, -62, -67, -12, 7, -2, -1, -5, -16, 8, -12, 1, -67, -4, -12, -13, -8, -16, -14, -2, -13, -12, -14, -67, -36, -12, -13, -8, -16, -46, -2, -13, -12, -14, -31, -12, -3, -13, -12, 1, -12, 1, -18, -5, -14, -12, -20};
    }

    public C1241Sx(VC vc, Throwable th2, boolean z11, int i5) {
        this(A03(23, 22, 55) + i5 + A03(45, 3, 21) + vc, th2, vc.A0W, z11, null, A02(i5), null);
    }

    public C1241Sx(VC vc, Throwable th2, boolean z11, C1234Sq c1234Sq) {
        this(A03(2, 21, 74) + c1234Sq.A03 + A03(0, 2, 45) + vc, th2, vc.A0W, z11, c1234Sq, N1.A02 >= 21 ? A04(th2) : null, null);
    }

    public C1241Sx(String str, Throwable th2, String str2, boolean z11, C1234Sq c1234Sq, String str3, C1241Sx c1241Sx) {
        super(str, th2);
        this.A03 = str2;
        this.A04 = z11;
        this.A00 = c1234Sq;
        this.A02 = str3;
        this.A01 = c1241Sx;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public C1241Sx A00(C1241Sx c1241Sx) {
        return new C1241Sx(getMessage(), getCause(), this.A03, this.A04, this.A00, this.A02, c1241Sx);
    }

    public static String A02(int i5) {
        String strA03 = i5 < 0 ? A03(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 4, 23) : A03(0, 0, 52);
        StringBuilder sb2 = new StringBuilder();
        String sign = A03(48, 73, 25);
        return sb2.append(sign).append(strA03).append(Math.abs(i5)).toString();
    }

    public static String A04(Throwable th2) {
        if (th2 instanceof MediaCodec.CodecException) {
            return ((MediaCodec.CodecException) th2).getDiagnosticInfo();
        }
        return null;
    }
}
