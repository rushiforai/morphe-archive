package com.pgl.ssdk;

/* loaded from: classes.dex */
public class ax {
    public static String a(String str) {
        try {
            return (String) Class.forName("android.os.SystemProperties").getDeclaredMethod("get", String.class).invoke(null, str);
        } catch (Throwable unused) {
            return null;
        }
    }
}
