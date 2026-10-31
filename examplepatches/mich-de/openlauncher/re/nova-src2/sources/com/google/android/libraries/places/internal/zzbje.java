package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.Set;

/* loaded from: classes3.dex */
final class zzbje {
    final int zza;
    final long zzb;
    final Set zzc;

    public zzbje(int i5, long j11, Set set) {
        this.zza = i5;
        this.zzb = j11;
        this.zzc = zzob.zzj(set);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && zzbje.class == obj.getClass()) {
            zzbje zzbjeVar = (zzbje) obj;
            if (this.zza == zzbjeVar.zza && this.zzb == zzbjeVar.zzb && zzmo.zza(this.zzc, zzbjeVar.zzc)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.zza), Long.valueOf(this.zzb), this.zzc});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzb("maxAttempts", this.zza);
        zzmmVarZzb.zzc("hedgingDelayNanos", this.zzb);
        zzmmVarZzb.zzd("nonFatalStatusCodes", this.zzc);
        return zzmmVarZzb.toString();
    }
}
