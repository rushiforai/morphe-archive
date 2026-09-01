package defpackage;

import android.app.AppOpsManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.os.Bundle;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mj8 {
    public static String d;
    public static lj8 g;
    public final Context a;
    public final NotificationManager b;
    public static final Object c = new Object();
    public static HashSet e = new HashSet();
    public static final Object f = new Object();

    public mj8(Context context) {
        this.a = context;
        this.b = (NotificationManager) context.getSystemService("notification");
    }

    public final boolean a() {
        Method method;
        Integer num;
        if (Build.VERSION.SDK_INT >= 24) {
            return o6.a(this.b);
        }
        Context context = this.a;
        AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService("appops");
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        String packageName = context.getApplicationContext().getPackageName();
        int i = applicationInfo.uid;
        try {
            Class<?> cls = Class.forName(AppOpsManager.class.getName());
            Class<?> cls2 = Integer.TYPE;
            method = cls.getMethod("checkOpNoThrow", cls2, cls2, String.class);
            num = (Integer) cls.getDeclaredField("OP_POST_NOTIFICATION").get(Integer.class);
            num.getClass();
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException | NoSuchMethodException | RuntimeException | InvocationTargetException unused) {
        }
        return ((Integer) method.invoke(appOpsManager, num, Integer.valueOf(i), packageName)).intValue() == 0;
    }

    public final void b(int i, Notification notification) {
        Bundle bundle = notification.extras;
        if (bundle == null || !bundle.getBoolean("android.support.useSideChannel")) {
            this.b.notify(null, i, notification);
            return;
        }
        ij8 ij8Var = new ij8(this.a.getPackageName(), i, notification);
        synchronized (f) {
            try {
                lj8 lj8Var = g;
                if (lj8Var == null) {
                    lj8Var = new lj8(this.a.getApplicationContext());
                    g = lj8Var;
                }
                lj8Var.b.obtainMessage(0, ij8Var).sendToTarget();
            } catch (Throwable th) {
                throw th;
            }
        }
        this.b.cancel(null, i);
    }
}
