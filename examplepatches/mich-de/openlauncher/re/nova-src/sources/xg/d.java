package xg;

import android.os.Build;
import android.os.Process;
import android.os.WorkSource;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import sg.w;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f95838a;

    /* renamed from: b, reason: collision with root package name */
    public static final Method f95839b;

    /* renamed from: c, reason: collision with root package name */
    public static final Method f95840c;

    /* renamed from: d, reason: collision with root package name */
    public static final Method f95841d;

    /* renamed from: e, reason: collision with root package name */
    public static Boolean f95842e;

    static {
        Method method;
        Method method2;
        Method method3;
        Method method4;
        Class cls = Integer.TYPE;
        Process.myUid();
        try {
            method = WorkSource.class.getMethod("add", cls);
        } catch (Exception unused) {
            method = null;
        }
        f95838a = method;
        try {
            method2 = WorkSource.class.getMethod("add", cls, String.class);
        } catch (Exception unused2) {
            method2 = null;
        }
        f95839b = method2;
        try {
            method3 = WorkSource.class.getMethod("size", null);
        } catch (Exception unused3) {
            method3 = null;
        }
        f95840c = method3;
        try {
            WorkSource.class.getMethod("get", cls);
        } catch (Exception unused4) {
        }
        try {
            WorkSource.class.getMethod("getName", cls);
        } catch (Exception unused5) {
        }
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                WorkSource.class.getMethod("createWorkChain", null);
            } catch (Exception e3) {
                Log.w("WorkSourceUtil", "Missing WorkChain API createWorkChain", e3);
            }
        }
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                Class.forName("android.os.WorkSource$WorkChain").getMethod("addNode", cls, String.class);
            } catch (Exception e11) {
                Log.w("WorkSourceUtil", "Missing WorkChain class", e11);
            }
        }
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                method4 = WorkSource.class.getMethod("isEmpty", null);
                try {
                    method4.setAccessible(true);
                } catch (Exception unused6) {
                }
            } catch (Exception unused7) {
            }
        } else {
            method4 = null;
        }
        f95841d = method4;
        f95842e = null;
    }

    public static void a(WorkSource workSource, int i5, String str) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Method method = f95839b;
        if (method != null) {
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            try {
                method.invoke(workSource, Integer.valueOf(i5), str);
                return;
            } catch (Exception e3) {
                Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource", e3);
                return;
            }
        }
        Method method2 = f95838a;
        if (method2 != null) {
            try {
                method2.invoke(workSource, Integer.valueOf(i5));
            } catch (Exception e11) {
                Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource", e11);
            }
        }
    }

    public static boolean b(WorkSource workSource) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        int iIntValue;
        Method method = f95841d;
        if (method != null) {
            try {
                Object objInvoke = method.invoke(workSource, null);
                w.h(objInvoke);
                return ((Boolean) objInvoke).booleanValue();
            } catch (Exception e3) {
                Log.e("WorkSourceUtil", "Unable to check WorkSource emptiness", e3);
            }
        }
        Method method2 = f95840c;
        if (method2 != null) {
            try {
                Object objInvoke2 = method2.invoke(workSource, null);
                w.h(objInvoke2);
                iIntValue = ((Integer) objInvoke2).intValue();
            } catch (Exception e11) {
                Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource", e11);
            }
        } else {
            iIntValue = 0;
        }
        return iIntValue == 0;
    }
}
