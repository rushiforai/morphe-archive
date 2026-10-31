package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.facebook.ads.AdOptionsView;
import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdLayout;
import com.facebook.ads.NativeAdOptionsViewPosition;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2040kE {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{30, 26, 25, 45, 60, 49, 61, 54, 59, 61, 22, 61, 44, 47, 55, 42, 51, 56, 58, 45, 46, 45, 58, 58, 45, 44, 9, 44, 7, 56, 60, 33, 39, 38, 59, 30, 33, 45, 63, 24, 39, 59, 33, 60, 33, 39, 38, 114, 104, 58, 45, 47, 33, 59, 60, 45, 58, 45, 44, 104, 62, 33, 45, 63, 104, 33, 59, 104, 38, 39, 60, 104, 41, 104, 30, 33, 45, 63, 15, 58, 39, 61, 56, 100, 104, 59, 35, 33, 56, 56, 33, 38, 47, 104, 33, 38, 34, 45, 43, 60, 33, 39, 38};
    }

    public static int A00(NativeAdOptionsViewPosition nativeAdOptionsViewPosition) {
        switch (nativeAdOptionsViewPosition) {
            case TOP_LEFT:
                return 8388659;
            case BOTTOM_RIGHT:
                return 8388693;
            case BOTTOM_LEFT:
                return 8388691;
            default:
                return 8388661;
        }
    }

    public static void A03(View view, NativeAdBase nativeAdBase, GT gt2, NativeAdOptionsViewPosition nativeAdOptionsViewPosition) {
        if (!(view instanceof ViewGroup)) {
            Log.w(A01(0, 17, 44), A01(17, 86, 60));
            return;
        }
        if (gt2.A1p()) {
            return;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        NativeAdLayout nativeAdLayout = view instanceof NativeAdLayout ? (NativeAdLayout) view : null;
        View overlay = new AdOptionsView(view.getContext(), nativeAdBase, nativeAdLayout);
        int gravity = A00(nativeAdOptionsViewPosition);
        if (viewGroup instanceof FrameLayout) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
            layoutParams.gravity = gravity;
            viewGroup.addView(overlay, layoutParams);
        } else {
            FrameLayout frameLayout = new FrameLayout(view.getContext());
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-2, -2);
            layoutParams2.gravity = gravity;
            frameLayout.addView(overlay, layoutParams2);
            viewGroup.addView(frameLayout, new ViewGroup.LayoutParams(-1, -1));
        }
    }
}
