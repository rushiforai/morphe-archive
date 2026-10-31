package com.google.android.libraries.places.internal;

import android.os.Build;
import dalvik.system.VMStack;

/* loaded from: classes3.dex */
public final class zzqs extends zzqn {
    private static final boolean zza = zza.zza();
    private static final boolean zzb;
    private static final zzqm zzc;

    final class zza {
        public static boolean zza() {
            return zzqs.zzt();
        }
    }

    static {
        String str = Build.FINGERPRINT;
        boolean z11 = true;
        if (str != null && !"robolectric".equals(str)) {
            z11 = false;
        }
        zzb = z11;
        zzc = new zzqm() { // from class: com.google.android.libraries.places.internal.zzqs.1
            @Override // com.google.android.libraries.places.internal.zzqm
            public zzpq zza(Class<?> cls, int i5) {
                return zzpq.zza;
            }

            @Override // com.google.android.libraries.places.internal.zzqm
            public String zzb(Class cls) {
                StackTraceElement stackTraceElementZza;
                if (zzqs.zza) {
                    try {
                        if (cls.equals(zzqs.zzp())) {
                            return VMStack.getStackClass2().getName();
                        }
                    } catch (Throwable unused) {
                    }
                }
                if (!zzqs.zzb || (stackTraceElementZza = zzrq.zza(cls, 1)) == null) {
                    return null;
                }
                return stackTraceElementZza.getClassName();
            }
        };
    }

    public static Class<?> zzp() {
        return VMStack.getStackClass2();
    }

    public static String zzq() {
        try {
            return VMStack.getStackClass2().getName();
        } catch (Throwable unused) {
            return null;
        }
    }

    public static boolean zzt() {
        try {
            Class.forName("dalvik.system.VMStack").getMethod("getStackClass2", null);
            return zza.class.getName().equals(zzq());
        } catch (Throwable unused) {
            return false;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzqn
    public zzpw zze(String str) {
        return zzqv.zzb(str);
    }

    @Override // com.google.android.libraries.places.internal.zzqn
    public zzqm zzh() {
        return zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzqn
    public zzrc zzj() {
        return zzqw.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzqn
    public String zzm() {
        return "platform: Android";
    }
}
