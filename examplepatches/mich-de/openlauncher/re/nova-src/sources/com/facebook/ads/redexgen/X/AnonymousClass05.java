package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.05, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AnonymousClass05 extends AnonymousClass07 {
    public static byte[] A00;
    public static String[] A01 = {"1v0pRZ4EZ2w", "vjP8jl5DzLDUdEkDIAXYqQdV2z2R6N9O", "XMQGLFY74Gi", "z5jlm0j8OFUT6MOfmnqz3pd5aKZTgkVU", "p7ZAfPZCP4ENy7MV30eHXsUvVBKZnXfa", "0V1midOWZRjkD1zVAF0zrX3VnEBgMPfa", "4mTJ1FPV9ndJNSa2yue4dOltog8", "GOTolrBuVVz8uV1jXLOAAvl8Hvpw"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 50);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{-38, -50, 100, 100, 100, -61, -5, -17, -16, -6, -59, -84, -65, -80, -80, -81, -68, -50, -51, -47, -46, -60, -57, -42, -19, -17, -30, -29, -26, -11, -22, -36, -25, -40, -23, -40, -21, -26, -23, 31, 29, 32, 25, 14, 12, 31, 16, 15};
    }

    static {
        A04();
    }

    public static final <T, A extends Appendable> A A00(Iterable<? extends T> iterable, A a11, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, int i5, CharSequence charSequence4, InterfaceC05610m<? super T, ? extends CharSequence> interfaceC05610m) throws IOException {
        C1h.A09(iterable, A01(5, 6, 85));
        C1h.A09(a11, A01(11, 6, 24));
        C1h.A09(charSequence, A01(30, 9, 69));
        C1h.A09(charSequence2, A01(24, 6, 75));
        C1h.A09(charSequence3, A01(17, 7, 44));
        C1h.A09(charSequence4, A01(39, 9, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        a11.append(charSequence2);
        int i11 = 0;
        for (T t6 : iterable) {
            i11++;
            if (i11 > 1) {
                a11.append(charSequence);
            }
            if (i5 >= 0 && i11 > i5) {
                break;
            }
            C1Z.A0A(a11, t6, interfaceC05610m);
        }
        if (i5 >= 0 && i11 > i5) {
            a11.append(charSequence4);
        }
        a11.append(charSequence3);
        return a11;
    }

    public static final <T> String A02(Iterable<? extends T> iterable, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, int i5, CharSequence charSequence4, InterfaceC05610m<? super T, ? extends CharSequence> interfaceC05610m) {
        C1h.A09(iterable, A01(5, 6, 85));
        C1h.A09(charSequence, A01(30, 9, 69));
        C1h.A09(charSequence2, A01(24, 6, 75));
        C1h.A09(charSequence3, A01(17, 7, 44));
        C1h.A09(charSequence4, A01(39, 9, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        return ((StringBuilder) A00(iterable, new StringBuilder(), charSequence, charSequence2, charSequence3, i5, charSequence4, interfaceC05610m)).toString();
    }

    public static /* synthetic */ String A03(Iterable iterable, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, int i5, CharSequence charSequence4, InterfaceC05610m interfaceC05610m, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            charSequence = A01(0, 2, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        }
        int i12 = i11 & 2;
        String strA01 = A01(0, 0, 27);
        if (i12 != 0) {
            charSequence2 = strA01;
        }
        if ((i11 & 4) != 0) {
            charSequence3 = strA01;
        }
        if ((i11 & 8) != 0) {
            i5 = -1;
        }
        if ((i11 & 16) != 0) {
            charSequence4 = A01(2, 3, 4);
        }
        if ((i11 & 32) != 0) {
            interfaceC05610m = null;
        }
        if (A01[1].charAt(0) == 'Y') {
            throw new RuntimeException();
        }
        A01[3] = "CLjae6322Y65QZcxw1xHxIHFcH92cReV";
        return A02(iterable, charSequence, charSequence2, charSequence3, i5, charSequence4, interfaceC05610m);
    }
}
