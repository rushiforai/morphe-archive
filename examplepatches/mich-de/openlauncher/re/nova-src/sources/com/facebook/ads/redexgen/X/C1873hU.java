package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.webkit.MimeTypeMap;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.hU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1873hU {
    public static byte[] A00;
    public static String[] A01 = {"rf6ngwKh6Z65cM5w2LO1dP8kbWabbmbt", "RCOuNPLdAU1uOvUxfzb8m1arC1B3VaYg", "uVAJujTPk18dS2MgWbbVFWsUDBivspM4", "3J9h1AP2mvxiikBnEMk", "UvtzSP75LkkhxyMrdmibMHe3gBAsOLna", "lWVDlLnUv1rJvKVC2cP3cEG3QwZFPzgL", "0YH65Zd4wQwql9vApJjESbBhLQ1uzNM9", "pxMoskK4qOXBm8RsX3"};

    public /* synthetic */ C1873hU(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 56);
            String[] strArr = A01;
            if (strArr[2].charAt(26) == strArr[1].charAt(26)) {
                throw new RuntimeException();
            }
            A01[4] = "FdbAaPLsWVXYjO1j90H3A2WaCQ7WrIen";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{-55, -43, -44, -38, -53, -44, -38, -59, -53, -44, -55, -43, -54, -49, -44, -51};
    }

    static {
        A05();
    }

    public C1873hU() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String A01(Uri uri) {
        return uri.getQueryParameter(A00(0, 16, 46));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String A02(Uri uri) {
        return MimeTypeMap.getFileExtensionFromUrl(uri.toString());
    }
}
