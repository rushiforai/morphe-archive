package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzrq {
    private static final String[] zza = {"com.google.common.flogger.util.StackWalkerStackGetter", "com.google.common.flogger.util.JavaLangAccessStackGetter"};
    private static final zzru zzb;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v8, types: [com.google.android.libraries.places.internal.zzru] */
    static {
        zzrv zzrvVar;
        int i5 = 0;
        while (true) {
            if (i5 >= 2) {
                zzrvVar = new zzrv();
                break;
            }
            zzrvVar = null;
            try {
                zzrvVar = (zzru) Class.forName(zza[i5]).asSubclass(zzru.class).getDeclaredConstructor(null).newInstance(null);
            } catch (Throwable unused) {
            }
            if (zzrvVar != null) {
                break;
            } else {
                i5++;
            }
        }
        zzb = zzrvVar;
    }

    public static StackTraceElement zza(Class cls, int i5) {
        zzrr.zza(cls, "target");
        return zzb.zza(cls, 2);
    }
}
