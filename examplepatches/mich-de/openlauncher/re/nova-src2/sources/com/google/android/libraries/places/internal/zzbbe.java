package com.google.android.libraries.places.internal;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzbbe {
    private static final zzbbe zza = new zzbbe(null, null, zzbdo.zza, false);
    private final zzbbj zzb;
    private final zzayu zzc = null;
    private final zzbdo zzd;
    private final boolean zze;

    private zzbbe(zzbbj zzbbjVar, zzayu zzayuVar, zzbdo zzbdoVar, boolean z11) {
        this.zzb = zzbbjVar;
        zzmt.zzc(zzbdoVar, "status");
        this.zzd = zzbdoVar;
        this.zze = z11;
    }

    public static zzbbe zza(zzbdo zzbdoVar) {
        zzmt.zzf(!zzbdoVar.zzl(), "drop status shouldn't be OK");
        return new zzbbe(null, null, zzbdoVar, true);
    }

    public static zzbbe zzb(zzbdo zzbdoVar) {
        zzmt.zzf(!zzbdoVar.zzl(), "error status shouldn't be OK");
        return new zzbbe(null, null, zzbdoVar, false);
    }

    public static zzbbe zzc() {
        return zza;
    }

    public static zzbbe zzd(zzbbj zzbbjVar, zzayu zzayuVar) {
        return new zzbbe(zzbbjVar, null, zzbdo.zza, false);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbbe)) {
            return false;
        }
        zzbbe zzbbeVar = (zzbbe) obj;
        return zzmo.zza(this.zzb, zzbbeVar.zzb) && zzmo.zza(this.zzd, zzbbeVar.zzd) && zzmo.zza(null, null) && this.zze == zzbbeVar.zze;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zzb, this.zzd, null, Boolean.valueOf(this.zze)});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("subchannel", this.zzb);
        zzmmVarZzb.zzd("streamTracerFactory", null);
        zzmmVarZzb.zzd("status", this.zzd);
        zzmmVarZzb.zze("drop", this.zze);
        return zzmmVarZzb.toString();
    }

    public final zzbbj zze() {
        return this.zzb;
    }

    public final zzbdo zzf() {
        return this.zzd;
    }

    public final boolean zzg() {
        return this.zze;
    }
}
