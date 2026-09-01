package defpackage;

import android.content.Context;
import android.util.Log;
import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class un3 {
    static {
        new ThreadLocal();
        new bt(10);
    }

    public static int a(Context context) {
        try {
            ClassLoader classLoader = context.getApplicationContext().getClassLoader();
            StringBuilder sb = new StringBuilder("com.google.android.gms.auth.api.fallback".length() + 61);
            sb.append("com.google.android.gms.dynamite.descriptors.com.google.android.gms.auth.api.fallback.ModuleDescriptor");
            Class<?> clsLoadClass = classLoader.loadClass(sb.toString());
            Field declaredField = clsLoadClass.getDeclaredField("MODULE_ID");
            Field declaredField2 = clsLoadClass.getDeclaredField("MODULE_VERSION");
            if (en7.u(declaredField.get(null), "com.google.android.gms.auth.api.fallback")) {
                return declaredField2.getInt(null);
            }
            String strValueOf = String.valueOf(declaredField.get(null));
            StringBuilder sb2 = new StringBuilder(strValueOf.length() + 50 + "com.google.android.gms.auth.api.fallback".length() + 1);
            sb2.append("Module descriptor id '");
            sb2.append(strValueOf);
            sb2.append("' didn't match expected id 'com.google.android.gms.auth.api.fallback'");
            Log.e("DynamiteModule", sb2.toString());
            return 0;
        } catch (ClassNotFoundException unused) {
            StringBuilder sb3 = new StringBuilder("com.google.android.gms.auth.api.fallback".length() + 45);
            sb3.append("Local module descriptor class for com.google.android.gms.auth.api.fallback not found.");
            Log.w("DynamiteModule", sb3.toString());
            return 0;
        } catch (Exception e) {
            Log.e("DynamiteModule", "Failed to load module descriptor class: ".concat(String.valueOf(e.getMessage())));
            return 0;
        }
    }
}
