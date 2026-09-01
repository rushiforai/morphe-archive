package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.os.Process;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class h2a {
    public static final String a = d87.k("ProcessUtils");

    public static final boolean a(Context context, r32 r32Var) {
        String strO;
        Object next;
        Object objInvoke;
        context.getClass();
        r32Var.getClass();
        if (Build.VERSION.SDK_INT >= 28) {
            strO = uy.o();
        } else {
            strO = null;
            try {
                Method declaredMethod = Class.forName("android.app.ActivityThread", false, m7f.class.getClassLoader()).getDeclaredMethod("currentProcessName", null);
                declaredMethod.setAccessible(true);
                objInvoke = declaredMethod.invoke(null, null);
                objInvoke.getClass();
            } catch (Throwable th) {
                d87.h().e(a, "Unable to check ActivityThread for processName", th);
            }
            if (objInvoke instanceof String) {
                strO = (String) objInvoke;
            } else {
                int iMyPid = Process.myPid();
                Object systemService = context.getSystemService("activity");
                systemService.getClass();
                List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) systemService).getRunningAppProcesses();
                if (runningAppProcesses != null) {
                    Iterator<T> it2 = runningAppProcesses.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            next = null;
                            break;
                        }
                        next = it2.next();
                        if (((ActivityManager.RunningAppProcessInfo) next).pid == iMyPid) {
                            break;
                        }
                    }
                    ActivityManager.RunningAppProcessInfo runningAppProcessInfo = (ActivityManager.RunningAppProcessInfo) next;
                    if (runningAppProcessInfo != null) {
                        strO = runningAppProcessInfo.processName;
                    }
                }
            }
        }
        return g76.L(strO, context.getApplicationInfo().processName);
    }
}
