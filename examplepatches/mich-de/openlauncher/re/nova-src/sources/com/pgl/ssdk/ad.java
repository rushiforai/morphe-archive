package com.pgl.ssdk;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.LocaleList;
import android.provider.Settings;
import java.lang.reflect.Method;
import java.util.TimeZone;

/* loaded from: classes.dex */
public class ad {

    /* renamed from: a, reason: collision with root package name */
    private static double f42260a = -1.0d;

    public static String a() {
        return LocaleList.getDefault().get(0).getLanguage();
    }

    public static String b() {
        String displayName;
        try {
            displayName = TimeZone.getDefault().getDisplayName(false, 0);
        } catch (Throwable unused) {
            displayName = null;
        }
        return displayName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : displayName.trim();
    }

    public static String c() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static String a(Context context) {
        String string;
        try {
            string = Settings.Secure.getString(context.getContentResolver(), "android_id");
        } catch (Throwable unused) {
            string = null;
        }
        return string == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : string.trim();
    }

    public static String b(Context context) {
        int i5;
        double d5 = f42260a;
        double dDoubleValue = 0.0d;
        if (d5 >= 0.0d) {
            i5 = (int) d5;
        } else {
            try {
                Class<?> cls = Class.forName("com.android.internal.os.PowerProfile");
                Object objNewInstance = cls.getConstructor(Context.class).newInstance(context);
                Method declaredMethod = cls.getDeclaredMethod("getAveragePower", String.class);
                declaredMethod.setAccessible(true);
                dDoubleValue = ((Double) declaredMethod.invoke(objNewInstance, "battery.capacity")).doubleValue();
            } catch (Throwable unused) {
            }
            f42260a = dDoubleValue;
            i5 = (int) dDoubleValue;
        }
        return Integer.toString(i5);
    }

    @SuppressLint({"MissingPermission"})
    public static String c(Context context) {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
