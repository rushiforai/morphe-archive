package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.webkit.WebView;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.td, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2613td {
    public static byte[] A00;
    public static String[] A01 = {"y0bG", "5JZfgaaWSogkW6CLjfjWUpC4SZDBnyft", "n2Gy4uoDZ6R42oJOJFciNGvUDpuCFsrY", "5ngtkuzSlt3rkDwwAmiTxWGxDtSc3Osy", "THEbbJWzjj3eFDlXZnSzsYrmSmbq8w3u", "z1FkhoLSx5iYuLnsFM", "3teRnM8c4jgHocWnqrQSqB4Xqv7CtSGf", "kWJrKkGk49E8x2kcQZmrso6J6ECpLyYL"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[2].charAt(11) == strArr[3].charAt(11)) {
                throw new RuntimeException();
            }
            A01[0] = "y3Jx6HlNhV60F8H6sy5VNq1urpo6ww";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 46);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{-4, -3, 10, 16, 15, -43, -3, 7, -4, 9, 6, -81, -69, -69, -73, -70, -127, 118, 118, -66, -66, -66, 117, 108, -70, 117, -83, -88, -86, -84, -87, -74, -74, -78, 117, -86, -74, -76, -70, -58, -58, -62, -59, -116, -127, -127, -55, -55, -55, -128, -72, -77, -75, -73, -76, -63, -63, -67, -128, -75, -63, -65, -127};
    }

    static {
        A02();
    }

    public static String A01(String str) {
        return TextUtils.isEmpty(str) ? A00(38, 25, 36) : String.format(Locale.US, A00(11, 27, 25), str);
    }

    public static void A03(WebView webView) {
        webView.loadUrl(A00(0, 11, 109));
        webView.clearCache(true);
    }

    public static void A04(WebView webView) {
        webView.getSettings().setMixedContentMode(0);
    }
}
