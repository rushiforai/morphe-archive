package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class zznd {
    private static final Object zza;
    private static final Method zzb;
    private static final Method zzc;

    static {
        Object objZzb = zzb();
        zza = objZzb;
        zzb = objZzb == null ? null : zzc("getStackTraceElement", Throwable.class, Integer.TYPE);
        zzc = objZzb != null ? zzd(objZzb) : null;
    }

    public static void zza(Throwable th2) {
        if (th2 instanceof RuntimeException) {
            throw ((RuntimeException) th2);
        }
        if (th2 instanceof Error) {
            throw ((Error) th2);
        }
    }

    private static Object zzb() {
        try {
            return Class.forName("sun.misc.SharedSecrets", false, null).getMethod("getJavaLangAccess", null).invoke(null, null);
        } catch (ThreadDeath e3) {
            throw e3;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static Method zzc(String str, Class... clsArr) throws ThreadDeath {
        try {
            return Class.forName("sun.misc.JavaLangAccess", false, null).getMethod(str, clsArr);
        } catch (ThreadDeath e3) {
            throw e3;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static Method zzd(Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            Method methodZzc = zzc("getStackTraceDepth", Throwable.class);
            if (methodZzc == null) {
                return null;
            }
            methodZzc.invoke(obj, new Throwable());
            return methodZzc;
        } catch (IllegalAccessException | UnsupportedOperationException | InvocationTargetException unused) {
            return null;
        }
    }
}
