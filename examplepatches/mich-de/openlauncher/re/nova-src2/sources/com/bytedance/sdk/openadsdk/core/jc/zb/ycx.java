package com.bytedance.sdk.openadsdk.core.jc.zb;

import android.app.Activity;
import android.content.Context;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public final class ycx {
    public static boolean sya(Activity activity) {
        try {
            if (dc.ycx(activity)) {
                return (ycx() & 2) != 0;
            }
            return false;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "f/cjlA61avGJT8BomBisOw==", "SOYigA+4TMmBSNtYoBCyL17dLocGuWfhj1j2TZw+sC1V", 55);
            return false;
        }
    }

    private static boolean ycx(int i5) {
        return i5 >= 0 && (i5 & (-8)) == 0;
    }

    public static boolean zb(Activity activity) {
        try {
            if (dc.ycx(activity)) {
                return (ycx() & 1) != 0;
            }
            return false;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "f/cjlA61avGJT8BomBisOw==", "SOYigA+4TMmBSNtYoBCyL17dLocGuWfhj1jlWJsQsix9+yGZML97woVE", 42);
            return false;
        }
    }

    public static boolean ycx(Activity activity) {
        try {
            if (dc.ycx(activity)) {
                return (ycx() & 4) != 0;
            }
            return false;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "f/cjlA61avGJT8BomBisOw==", "SOYigA+4TMmBSNtYoBCyL17dLocGuWfhj1j7XIIVqSZc3iySBg==", 29);
            return false;
        }
    }

    public static int zb() {
        try {
            return lud.ycx("min_edge_bounding_box", 0);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "f/cjlA61avGJT8BomBisOw==", "XOs5uAqyTMOHT/VSmR+kIVXpD5obj2rCjk8=", 98);
            return 0;
        }
    }

    public static int ycx() {
        int iZb = zb();
        if (ycx(iZb)) {
            return iZb;
        }
        return 0;
    }

    public static float zb(Context context) {
        return dc.sya(context, dc.xkz(context));
    }

    public static float[] ycx(Context context, int i5, int i11) {
        float fYcx = ycx(context);
        float fZb = zb(context);
        if ((i11 == 1) != (fYcx > fZb)) {
            float f11 = fYcx + fZb;
            fZb = f11 - fZb;
            fYcx = f11 - fZb;
        }
        if (i11 == 1) {
            fYcx -= i5;
        } else {
            fZb -= i5;
        }
        return new float[]{fZb, fYcx};
    }

    public static float ycx(Context context) {
        return dc.sya(context, dc.ry(context));
    }
}
