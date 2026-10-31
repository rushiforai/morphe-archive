package com.google.android.libraries.places.internal;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbnz implements zzbkj {
    private static final Logger zza = Logger.getLogger(zzbnz.class.getName());
    private static final Constructor zzb;
    private static final Method zzc;
    private static final Method zzd;
    private static final RuntimeException zze;
    private static final Object[] zzf;
    private final Object zzg;

    /* JADX WARN: Removed duplicated region for block: B:24:0x0069  */
    static {
        Throwable th2;
        Method method;
        Method method2;
        Method method3;
        Constructor<?> constructor;
        Method method4;
        Class<?> cls;
        try {
            cls = Class.forName("java.util.concurrent.atomic.LongAdder");
            method3 = cls.getMethod("add", Long.TYPE);
            try {
                method4 = cls.getMethod("sum", null);
            } catch (Throwable th3) {
                th2 = th3;
                method2 = null;
                method = method3;
            }
        } catch (Throwable th4) {
            th2 = th4;
            method = null;
            method2 = null;
        }
        try {
            Constructor<?>[] constructors = cls.getConstructors();
            int length = constructors.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    constructor = null;
                    break;
                }
                constructor = constructors[i5];
                if (constructor.getParameterTypes().length == 0) {
                    break;
                } else {
                    i5++;
                }
            }
            th2 = null;
        } catch (Throwable th5) {
            th2 = th5;
            method = method3;
            method2 = method4;
            zza.logp(Level.FINE, "io.grpc.internal.ReflectionLongAdderCounter", "<clinit>", "LongAdder can not be found via reflection, this is normal for JDK7 and below", th2);
            method3 = method;
            constructor = null;
            method4 = method2;
            if (th2 == null) {
                zzb = null;
                zzc = null;
                zzd = null;
                zze = new RuntimeException(th2);
            }
            zzf = new Object[]{1L};
        }
        if (th2 == null || constructor == null) {
            zzb = null;
            zzc = null;
            zzd = null;
            zze = new RuntimeException(th2);
        } else {
            zzb = constructor;
            zzc = method3;
            zzd = method4;
            zze = null;
        }
        zzf = new Object[]{1L};
    }

    public zzbnz() {
        RuntimeException runtimeException = zze;
        if (runtimeException != null) {
            throw runtimeException;
        }
        try {
            this.zzg = zzb.newInstance(null);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException(e3);
        } catch (InstantiationException e11) {
            throw new RuntimeException(e11);
        } catch (InvocationTargetException e12) {
            throw new RuntimeException(e12);
        }
    }

    public static boolean zzb() {
        return zze == null;
    }

    @Override // com.google.android.libraries.places.internal.zzbkj
    public final void zza(long j11) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            zzc.invoke(this.zzg, zzf);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException(e3);
        } catch (InvocationTargetException e11) {
            throw new RuntimeException(e11);
        }
    }
}
