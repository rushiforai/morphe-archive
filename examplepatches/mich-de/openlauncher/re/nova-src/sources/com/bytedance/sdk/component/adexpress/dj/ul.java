package com.bytedance.sdk.component.adexpress.dj;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.bytedance.sdk.component.utils.wwx;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Locale;

/* loaded from: classes2.dex */
public class ul {
    private static float dj(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    public static float sya(Context context, float f11) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
        }
        return f11 * dj(context);
    }

    public static int ycx(float f11, float f12, float f13, float f14) {
        return (((int) ((f11 * 255.0f) + 0.5f)) << 24) | (((int) ((f12 * 255.0f) + 0.5f)) << 16) | (((int) ((f13 * 255.0f) + 0.5f)) << 8) | ((int) ((f14 * 255.0f) + 0.5f));
    }

    public static int zb(Context context, float f11) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
        }
        float fDj = dj(context);
        if (fDj <= 0.0f) {
            fDj = 1.0f;
        }
        return (int) ((f11 / fDj) + 0.5f);
    }

    public static float ycx(Context context, float f11) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
        }
        return (f11 * dj(context)) + 0.5f;
    }

    public static String sya(Context context) {
        String language = b.f42142b;
        try {
            Locale locale = wwx.zb(context).getConfiguration().getLocales().get(0);
            language = locale.getLanguage();
            if (locale.getCountry().equals("TW")) {
                language = "zhHant";
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "aO0/kAayXNOJRsQ=", "XOs5uQKybtKBTdI=", Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        return ycx(language);
    }

    public static int zb(Context context) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
        }
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getRealMetrics(displayMetrics);
        return displayMetrics.heightPixels;
    }

    public static int ycx(Context context) {
        if (context == null) {
            context = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
        }
        return context.getResources().getDisplayMetrics().widthPixels;
    }

    private static String ycx(String str) {
        str.getClass();
        switch (str) {
            case "ar":
                return "aa";
            case "ja":
                return "japan";
            case "ko":
                return "korea";
            case "ms":
                return "my";
            case "zh":
                return "cn";
            default:
                return str;
        }
    }
}
