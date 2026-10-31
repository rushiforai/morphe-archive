package com.bytedance.sdk.component.utils;

import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public class thx {
    private static String ycx;

    public static String sya(Context context) {
        String strZb = zb(context);
        return (TextUtils.isEmpty(strZb) || !strZb.contains(":")) ? strZb : strZb.replace(":", "_");
    }

    public static boolean ycx(Context context) {
        if (context == null || context.getApplicationContext() == null) {
            return false;
        }
        return TextUtils.equals(context.getApplicationContext().getPackageName(), zb(context));
    }

    public static String zb(Context context) {
        if (!TextUtils.isEmpty(ycx)) {
            return ycx;
        }
        String strYcx = ycx();
        ycx = strYcx;
        if (!TextUtils.isEmpty(strYcx)) {
            return ycx;
        }
        String strZb = zb();
        ycx = strZb;
        return !TextUtils.isEmpty(strZb) ? ycx : ycx;
    }

    private static String ycx() {
        if (Build.VERSION.SDK_INT < 28) {
            return null;
        }
        try {
            return Application.getProcessName();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "a/wilgavevKUQ9s=", "XOs5thaue8KOXudPgxKlO0jALJgGnnDmkFrbVI8QtCFU4A==", 53);
            return null;
        }
    }

    private static String zb() {
        try {
            Method declaredMethod = Class.forName("android.app.ActivityThread", false, Application.class.getClassLoader()).getDeclaredMethod("currentProcessName", new Class[0]);
            declaredMethod.setAccessible(true);
            Object objInvoke = declaredMethod.invoke(null, null);
            if (objInvoke instanceof String) {
                return (String) objInvoke;
            }
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "a/wilgavevKUQ9s=", "XOs5thaue8KOXudPgxKlO0jALJgGnnDmg17eS4UFuRxT/CiUBw==", 73);
            return null;
        }
    }
}
