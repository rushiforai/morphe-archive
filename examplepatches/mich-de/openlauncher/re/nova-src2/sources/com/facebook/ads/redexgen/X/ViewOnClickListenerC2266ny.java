package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ny, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2266ny implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"7hml", "arsR7CXdrRmnc4H", "v9RyQNN3JZl7Y0taJV5Fev", "xRnkh17xdPvSaHRbGtK03y", "FXZpYnZ60nmw9qUqufJi", "0LFdc8iklo0TjcX", "I9OiAb0WWNOPs74", "XflJtqjiU63qxKFPomwp0hCG69EceAXP"};
    public final /* synthetic */ ViewOnClickListenerC0884El A00;

    public ViewOnClickListenerC2266ny(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A02;
            if (strArr[3].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[0] = "IAq7";
            strArr2[5] = "WIIgsMPXcsBoxg8";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 111);
            i13++;
        }
    }

    public static void A01() {
        A01 = new byte[]{35, 27, 25, 32};
    }

    static {
        A01();
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0E(A00(0, 4, 65));
            this.A00.setVisibility(4);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            String[] strArr = A02;
            if (strArr[1].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            A02[7] = "CJSg3CC5FJteAR8EeJixCkdZ93puZFm3";
        }
    }
}
