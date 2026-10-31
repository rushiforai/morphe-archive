package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzbba {
    private final List zza;
    private final zzaye zzb;
    private final Object[][] zzc;

    public /* synthetic */ zzbba(List list, zzaye zzayeVar, Object[][] objArr, zzbaz zzbazVar) {
        zzmt.zzc(list, "addresses are not set");
        this.zza = list;
        zzmt.zzc(zzayeVar, "attrs");
        this.zzb = zzayeVar;
        zzmt.zzc(objArr, "customOptions");
        this.zzc = objArr;
    }

    public static zzbax zzb() {
        return new zzbax();
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("addrs", this.zza);
        zzmmVarZzb.zzd("attrs", this.zzb);
        zzmmVarZzb.zzd("customOptions", Arrays.deepToString(this.zzc));
        return zzmmVarZzb.toString();
    }

    public final zzaye zza() {
        return this.zzb;
    }

    public final List zzc() {
        return this.zza;
    }
}
