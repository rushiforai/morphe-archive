package com.google.android.libraries.places.internal;

import java.util.Map;

/* loaded from: classes3.dex */
public abstract class zzbbo extends zzbbb {
    private static final zzbcp zza = zzbcp.zza(new zzbbn());

    public final boolean equals(Object obj) {
        return this == obj;
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("policy", zzd());
        zzmmVarZzb.zzb("priority", 5);
        zzmmVarZzb.zze("available", true);
        return zzmmVarZzb.toString();
    }

    public abstract int zzb();

    public zzbcp zzc(Map map) {
        throw null;
    }

    public abstract String zzd();

    public abstract boolean zze();
}
