package com.bytedance.sdk.openadsdk.dj;

import android.app.ActivityManager;
import android.os.Build;
import com.bytedance.sdk.component.utils.htf;
import java.lang.reflect.Method;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {

    /* renamed from: dj, reason: collision with root package name */
    private static Method f26515dj = null;
    private static boolean lud = false;
    private static Method sya;
    private static Method ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Class<?> f26516zb;

    static {
        zb();
    }

    private static boolean sya() {
        return com.bytedance.sdk.openadsdk.dv.lud.ycx("s_i_e", 0) == 1;
    }

    public static JSONObject ycx() {
        JSONObject jSONObject;
        Method method;
        List list;
        Method method2;
        Method method3;
        int i5 = Build.VERSION.SDK_INT;
        JSONObject jSONObject2 = null;
        if (i5 >= 35 && sya()) {
            zb();
            try {
                jSONObject = new JSONObject();
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                ActivityManager activityManager = (ActivityManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService(ActivityManager.class);
                if (activityManager != null && (method = ycx) != null && (list = (List) method.invoke(activityManager, 1)) != null && !list.isEmpty()) {
                    Object obj = list.get(0);
                    if (i5 >= 36 && obj != null && (method3 = sya) != null) {
                        jSONObject.put("start_component", ((Integer) method3.invoke(obj, null)).intValue());
                    }
                    if (obj != null && (method2 = f26515dj) != null) {
                        jSONObject.put("start_reason", ((Integer) method2.invoke(obj, null)).intValue());
                    }
                }
                return jSONObject;
            } catch (Throwable th3) {
                th = th3;
                jSONObject2 = jSONObject;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "ev49mQq/aNOJRdlumBCyPHLgK5o2qGDLkw==", "XOs5tBOsZc6DS8NUgx+TPFr8ObwNumY=", 76);
                htf.sya(th.getMessage(), new Object[0]);
                return jSONObject2;
            }
        }
        return jSONObject2;
    }

    private static void zb() {
        int i5;
        if (lud || (i5 = Build.VERSION.SDK_INT) < 35) {
            return;
        }
        try {
            if (sya()) {
                ycx = ActivityManager.class.getMethod("getHistoricalProcessStartReasons", Integer.TYPE);
                Class<?> cls = Class.forName("android.app.ApplicationStartInfo");
                f26516zb = cls;
                f26515dj = cls.getMethod("getReason", null);
                if (i5 >= 36) {
                    sya = f26516zb.getMethod("getStartComponent", null);
                }
                lud = true;
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "ev49mQq/aNOJRdlumBCyPHLgK5o2qGDLkw==", "UuAkgQq9Zc6aTw==", 42);
            htf.sya(th2.getMessage(), new Object[0]);
        }
    }
}
