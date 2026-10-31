package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class zzbtf {
    private final Class zza;
    private final String zzb;
    private final Class[] zzc;

    public zzbtf(Class cls, String str, Class... clsArr) {
        this.zza = cls;
        this.zzb = str;
        this.zzc = clsArr;
    }

    private final Method zzd(Class cls) throws NoSuchMethodException, SecurityException {
        Class cls2;
        Method methodZze = zze(cls, this.zzb, this.zzc);
        if (methodZze == null || (cls2 = this.zza) == null || cls2.isAssignableFrom(methodZze.getReturnType())) {
            return methodZze;
        }
        return null;
    }

    private static Method zze(Class cls, String str, Class[] clsArr) throws NoSuchMethodException, SecurityException {
        if (cls == null) {
            return null;
        }
        try {
            if ((cls.getModifiers() & 1) == 0) {
                return zze(cls.getSuperclass(), str, clsArr);
            }
            Method method = cls.getMethod(str, clsArr);
            try {
                if (1 != (method.getModifiers() & 1)) {
                    return null;
                }
            } catch (NoSuchMethodException unused) {
            }
            return method;
        } catch (NoSuchMethodException unused2) {
            return null;
        }
    }

    public final Object zza(Object obj, Object... objArr) throws NoSuchMethodException, SecurityException {
        try {
            Method methodZzd = zzd(obj.getClass());
            if (methodZzd == null) {
                return null;
            }
            try {
                return methodZzd.invoke(obj, objArr);
            } catch (IllegalAccessException unused) {
                return null;
            }
        } catch (InvocationTargetException e3) {
            Throwable targetException = e3.getTargetException();
            if (targetException instanceof RuntimeException) {
                throw ((RuntimeException) targetException);
            }
            AssertionError assertionError = new AssertionError("Unexpected exception");
            assertionError.initCause(targetException);
            throw assertionError;
        }
    }

    public final Object zzb(Object obj, Object... objArr) throws NoSuchMethodException, SecurityException {
        try {
            Method methodZzd = zzd(obj.getClass());
            if (methodZzd != null) {
                try {
                    return methodZzd.invoke(obj, objArr);
                } catch (IllegalAccessException e3) {
                    AssertionError assertionError = new AssertionError("Unexpectedly could not call: ".concat(methodZzd.toString()));
                    assertionError.initCause(e3);
                    throw assertionError;
                }
            }
            throw new AssertionError("Method " + this.zzb + " not supported for object " + String.valueOf(obj));
        } catch (InvocationTargetException e11) {
            Throwable targetException = e11.getTargetException();
            if (targetException instanceof RuntimeException) {
                throw ((RuntimeException) targetException);
            }
            AssertionError assertionError2 = new AssertionError("Unexpected exception");
            assertionError2.initCause(targetException);
            throw assertionError2;
        }
    }

    public final boolean zzc(Object obj) {
        return zzd(obj.getClass()) != null;
    }
}
