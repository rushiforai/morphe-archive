package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzbbi {
    private final List zza;
    private final zzaye zzb;
    private final Object zzc;

    public /* synthetic */ zzbbi(List list, zzaye zzayeVar, Object obj, zzbbh zzbbhVar) {
        zzmt.zzc(list, "addresses");
        this.zza = Collections.unmodifiableList(new ArrayList(list));
        zzmt.zzc(zzayeVar, "attributes");
        this.zzb = zzayeVar;
        this.zzc = obj;
    }

    public static zzbbg zzb() {
        return new zzbbg();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbbi)) {
            return false;
        }
        zzbbi zzbbiVar = (zzbbi) obj;
        return zzmo.zza(this.zza, zzbbiVar.zza) && zzmo.zza(this.zzb, zzbbiVar.zzb) && zzmo.zza(this.zzc, zzbbiVar.zzc);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zza, this.zzb, this.zzc});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("addresses", this.zza);
        zzmmVarZzb.zzd("attributes", this.zzb);
        zzmmVarZzb.zzd("loadBalancingPolicyConfig", this.zzc);
        return zzmmVarZzb.toString();
    }

    public final zzaye zza() {
        return this.zzb;
    }

    public final zzbbg zzc() {
        zzbbg zzbbgVar = new zzbbg();
        zzbbgVar.zza(this.zza);
        zzbbgVar.zzb(this.zzb);
        zzbbgVar.zzc(this.zzc);
        return zzbbgVar;
    }

    public final Object zzd() {
        return this.zzc;
    }

    public final List zze() {
        return this.zza;
    }
}
