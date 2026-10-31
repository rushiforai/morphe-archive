package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
public final class zzbbc extends zzbbk {
    private final zzbbe zza;

    public zzbbc(zzbbe zzbbeVar) {
        zzmt.zzc(zzbbeVar, "result");
        this.zza = zzbbeVar;
    }

    public final String toString() {
        return c0.l("FixedResultPicker(", this.zza.toString(), ")");
    }

    @Override // com.google.android.libraries.places.internal.zzbbk
    public final zzbbe zza(zzbbf zzbbfVar) {
        return this.zza;
    }
}
