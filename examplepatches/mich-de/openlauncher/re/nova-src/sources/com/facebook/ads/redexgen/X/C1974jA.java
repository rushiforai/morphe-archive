package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.jA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1974jA {
    public static byte[] A00;
    public static final C1974jA A01;

    static {
        A01();
        A01 = new C1974jA();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-34, -22, -23, -17, -32, -13, -17};
    }

    public final ImageView A02(C0958Hi c0958Hi) {
        C1h.A09(c0958Hi, A00(0, 7, 109));
        int screenWidth = Math.min(c0958Hi.getResources().getDisplayMetrics().widthPixels, c0958Hi.getResources().getDisplayMetrics().heightPixels);
        int i5 = (int) (screenWidth * 0.2f);
        int height = (int) (i5 * 1.25f);
        ImageView imageView = new ImageView(c0958Hi);
        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        imageView.setLayoutParams(new C1961ix(i5, height));
        return imageView;
    }
}
