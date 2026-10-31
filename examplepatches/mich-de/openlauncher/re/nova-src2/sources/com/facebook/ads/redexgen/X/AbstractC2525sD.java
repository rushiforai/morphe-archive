package com.facebook.ads.redexgen.X;

import android.view.View;
import com.facebook.ads.NativeAdLayout;

/* renamed from: com.facebook.ads.redexgen.X.sD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2525sD {
    public static String[] A00 = {"Mh7OQPY25mJ4xZdJdnJU4lIWxnSb2W80", "uMvQGqYS2R9kLiwAhxbB5gyg9uPLoFmG", "JD8RnvPxGeaTxsc34jN0O6vhnDfoaLvm", "v", "yiVoJ6", "bh6EDcFJy1WMlrC6ew5uNV", "HsXTYL", "k"};
    public static final int A01 = (int) (AbstractC2385px.A02 * 200.0f);
    public static final int A03 = (int) (AbstractC2385px.A02 * 200.0f);
    public static final int A02 = (int) (AbstractC2385px.A02 * 50.0f);

    public static EnumC1722f1 A00(NativeAdLayout nativeAdLayout) {
        if (nativeAdLayout == null) {
            return EnumC1722f1.A05;
        }
        if (A03(nativeAdLayout)) {
            return EnumC1722f1.A06;
        }
        return EnumC1722f1.A04;
    }

    public static AbstractC2524sC A01(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, View view) {
        if (view == null) {
            return null;
        }
        int h5 = view.getWidth();
        int w10 = view.getHeight();
        if (h5 >= A01 && w10 >= A01) {
            return new FC(c0958Hi, interfaceC2224nG, str);
        }
        if (h5 < A03 || w10 < A02) {
            return null;
        }
        return new FD(c0958Hi, interfaceC2224nG, str);
    }

    public static FE A02(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, C1756fZ c1756fZ, InterfaceC2460rA interfaceC2460rA, InterfaceC2459r9 interfaceC2459r9) {
        return new FE(c0958Hi, interfaceC2224nG, str, c1756fZ, interfaceC2460rA, interfaceC2459r9);
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0010  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A03(NativeAdLayout nativeAdLayout) {
        int h5 = nativeAdLayout.getWidth();
        int height = nativeAdLayout.getHeight();
        int w10 = A01;
        if (h5 >= w10) {
            int w11 = A01;
            if (height < w11) {
                int w12 = A03;
                if (h5 >= w12) {
                    int i5 = A02;
                    if (A00[5].length() != 22) {
                        throw new RuntimeException();
                    }
                    A00[5] = "hhrIY4o6fKEkU42z4UVpb3";
                    if (height < i5) {
                    }
                }
                return true;
            }
        }
        return false;
    }
}
