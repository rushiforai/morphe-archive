package com.google.android.libraries.places.internal;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzbae {
    public final String zza;
    public final zzbac zzb;
    public final long zzc;
    public final zzbau zzd;
    public final zzbau zze;

    public /* synthetic */ zzbae(String str, zzbac zzbacVar, long j11, zzbau zzbauVar, zzbau zzbauVar2, zzbad zzbadVar) {
        this.zza = str;
        zzmt.zzc(zzbacVar, "severity");
        this.zzb = zzbacVar;
        this.zzc = j11;
        this.zzd = null;
        this.zze = zzbauVar2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zzbae) {
            zzbae zzbaeVar = (zzbae) obj;
            if (zzmo.zza(this.zza, zzbaeVar.zza) && zzmo.zza(this.zzb, zzbaeVar.zzb) && this.zzc == zzbaeVar.zzc && zzmo.zza(null, null) && zzmo.zza(this.zze, zzbaeVar.zze)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zza, this.zzb, Long.valueOf(this.zzc), null, this.zze});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, this.zza);
        zzmmVarZzb.zzd("severity", this.zzb);
        zzmmVarZzb.zzc("timestampNanos", this.zzc);
        zzmmVarZzb.zzd("channelRef", null);
        zzmmVarZzb.zzd("subchannelRef", this.zze);
        return zzmmVarZzb.toString();
    }
}
