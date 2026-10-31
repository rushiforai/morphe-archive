package com.google.android.libraries.places.internal;

import b.c0;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzbnr extends zzbbf {
    private final zzayj zza;
    private final zzbcf zzb;
    private final zzbcl zzc;

    public zzbnr(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar) {
        zzmt.zzc(zzbclVar, "method");
        this.zzc = zzbclVar;
        this.zzb = zzbcfVar;
        zzmt.zzc(zzayjVar, "callOptions");
        this.zza = zzayjVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && zzbnr.class == obj.getClass()) {
            zzbnr zzbnrVar = (zzbnr) obj;
            if (zzmo.zza(this.zza, zzbnrVar.zza) && zzmo.zza(this.zzb, zzbnrVar.zzb) && zzmo.zza(this.zzc, zzbnrVar.zzc)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zza, this.zzb, this.zzc});
    }

    public final String toString() {
        zzayj zzayjVar = this.zza;
        zzbcf zzbcfVar = this.zzb;
        String string = this.zzc.toString();
        String string2 = zzbcfVar.toString();
        return c0.q(c0.w("[method=", string, " headers=", string2, " callOptions="), zzayjVar.toString(), "]");
    }

    @Override // com.google.android.libraries.places.internal.zzbbf
    public final zzayj zza() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbbf
    public final zzbcf zzb() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzbbf
    public final zzbcl zzc() {
        return this.zzc;
    }
}
