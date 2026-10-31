package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbvr {
    public static final /* synthetic */ int zza = 0;
    private static final zzbvp zzb;

    static {
        Object obj;
        Class<?> cls;
        zzbvp zzbvpVar;
        try {
            cls = Class.forName("io.perfmark.impl.SecretPerfMarkImpl$PerfMarkImpl");
            obj = null;
        } catch (Throwable th2) {
            obj = th2;
            cls = null;
        }
        if (cls != null) {
            try {
                zzbvpVar = (zzbvp) cls.asSubclass(zzbvp.class).getConstructor(zzbvs.class).newInstance(zzbvp.zza);
            } catch (Throwable th3) {
                obj = th3;
            }
        } else {
            zzbvpVar = null;
        }
        if (zzbvpVar != null) {
            zzb = zzbvpVar;
        } else {
            zzb = new zzbvp(zzbvp.zza);
        }
        if (obj != null) {
            try {
                if (Boolean.getBoolean("io.perfmark.PerfMark.debug")) {
                    Class<?> cls2 = Class.forName("java.util.logging.Logger");
                    Object objInvoke = cls2.getMethod("getLogger", String.class).invoke(null, zzbvr.class.getName());
                    Class<?> cls3 = Class.forName("java.util.logging.Level");
                    cls2.getMethod("log", cls3, String.class, Throwable.class).invoke(objInvoke, cls3.getField("FINE").get(null), "Error during PerfMark.<clinit>", obj);
                }
            } catch (Throwable unused) {
            }
        }
    }

    private zzbvr() {
    }

    public static zzbvq zza() {
        return zzbvp.zzb;
    }

    public static zzbvs zzb(String str) {
        return zzbvp.zza;
    }

    public static zzbvs zzc(String str, long j11) {
        return zzbvp.zza;
    }
}
