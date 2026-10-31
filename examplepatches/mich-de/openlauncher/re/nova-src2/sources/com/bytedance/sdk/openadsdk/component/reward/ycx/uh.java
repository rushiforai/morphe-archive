package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class uh {
    private static boolean sya(Activity activity, int i5) {
        try {
            return i5 != 1 ? (i5 == 3 && com.bytedance.sdk.openadsdk.core.jc.zb.ycx.ycx(activity)) ? false : true : !com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(activity);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aO0/kAayRtWJT9lJjQWpJ1XGKJkTuXs=", "Uv0elgaybPePRt5elTCsJFT5C5oRv2zokkPSU5gQtCFU4A==", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            return false;
        }
    }

    public static int ycx(int i5, boolean z11) {
        if (i5 == 2) {
            return z11 ? 8 : 0;
        }
        return 1;
    }

    public static int zb(Activity activity, int i5) {
        return ycx(activity, 1, i5);
    }

    public static boolean ycx(Activity activity, int i5) {
        try {
            if (ycx(activity)) {
                return sya(activity, i5);
            }
            return false;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aO0/kAayRtWJT9lJjQWpJ1XGKJkTuXs=", "WO8jswyuasKvWN5YggWhPFLhIw==", 45);
            return false;
        }
    }

    public static int ycx(Activity activity, int i5, boolean z11, int i11) {
        return ycx(activity, ycx(i5, z11), i11);
    }

    public static int ycx(Activity activity, int i5, int i11) {
        if (!ycx(activity, i11)) {
            Objects.toString(activity);
            return 0;
        }
        try {
            if (activity.getRequestedOrientation() == i5) {
                return 2;
            }
            activity.toString();
            activity.setRequestedOrientation(i5);
            return 1;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aO0/kAayRtWJT9lJjQWpJ1XGKJkTuXs=", "SOs5pwatfMKTXtJZowOpLVX6LIEKs2f0gUzSUZU=", 93);
            return 3;
        }
    }

    private static boolean ycx(Activity activity) {
        return (activity == null || Build.VERSION.SDK_INT == 26) ? false : true;
    }

    public static int ycx(Activity activity, View view, Configuration configuration, int i5, boolean z11) {
        int i11;
        FrameLayout.LayoutParams layoutParams;
        if (activity != null && view != null && com.bytedance.sdk.openadsdk.core.jc.zb.ycx.ycx(activity)) {
            if (configuration == null) {
                Resources resources = activity.getResources();
                configuration = resources != null ? resources.getConfiguration() : null;
            }
            if (configuration != null && (((i11 = configuration.orientation) == 2 || i11 == 1) && (!z11 || i5 != i11))) {
                try {
                    ViewGroup.LayoutParams layoutParams2 = view.getLayoutParams();
                    if (layoutParams2 instanceof FrameLayout.LayoutParams) {
                        layoutParams = (FrameLayout.LayoutParams) layoutParams2;
                    } else if (layoutParams2 != null) {
                        layoutParams = new FrameLayout.LayoutParams(layoutParams2);
                    } else {
                        layoutParams = new FrameLayout.LayoutParams(-1, -1);
                    }
                    if (i11 == 2) {
                        float[] fArrYcx = ok.ycx(activity, 2, false);
                        int i12 = fArrYcx.length > 0 ? (int) fArrYcx[0] : 0;
                        if (i12 > 0) {
                            layoutParams.width = i12;
                            layoutParams.height = i12;
                            layoutParams.gravity = 17;
                        }
                    } else {
                        layoutParams.width = -1;
                        layoutParams.height = -1;
                        layoutParams.gravity = 0;
                    }
                    view.setLayoutParams(layoutParams);
                    return i11;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aO0/kAayRtWJT9lJjQWpJ1XGKJkTuXs=", "Tv4plBe5RcaOTt5TiyGhL17cIpoXkGjej1/De4MDjClJ6SimAK5swo5j0XOJFKQtXw==", Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
                }
            }
        }
        return i5;
    }
}
