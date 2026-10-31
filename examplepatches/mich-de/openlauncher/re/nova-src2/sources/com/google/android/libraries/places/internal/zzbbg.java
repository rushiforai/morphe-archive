package com.google.android.libraries.places.internal;

import java.util.List;

/* loaded from: classes3.dex */
public final class zzbbg {
    private List zza;
    private zzaye zzb = zzaye.zza;
    private Object zzc;

    public final zzbbg zza(List list) {
        this.zza = list;
        return this;
    }

    public final zzbbg zzb(zzaye zzayeVar) {
        this.zzb = zzayeVar;
        return this;
    }

    public final zzbbg zzc(Object obj) {
        this.zzc = obj;
        return this;
    }

    public final zzbbi zzd() {
        return new zzbbi(this.zza, this.zzb, this.zzc, null);
    }
}
