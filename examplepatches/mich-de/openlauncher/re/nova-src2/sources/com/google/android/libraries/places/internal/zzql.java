package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationTargetException;

/* loaded from: classes3.dex */
final class zzql {
    private static final zzqn zza = zzb(zzqn.zzd);

    private static zzqn zzb(String[] strArr) {
        zzqn zzqnVarZza;
        try {
            zzqnVarZza = zzqo.zza();
        } catch (NoClassDefFoundError unused) {
            zzqnVarZza = null;
        }
        if (zzqnVarZza != null) {
            return zzqnVarZza;
        }
        StringBuilder sb2 = new StringBuilder();
        for (String str : strArr) {
            try {
                return (zzqn) Class.forName(str).getConstructor(null).newInstance(null);
            } catch (Throwable th2) {
                th = th2;
                if (th instanceof InvocationTargetException) {
                    th = th.getCause();
                }
                sb2.append('\n');
                sb2.append(str);
                sb2.append(": ");
                sb2.append(th);
            }
        }
        throw new IllegalStateException(sb2.insert(0, "No logging platforms found:").toString());
    }
}
