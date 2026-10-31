package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzayv {
    private zzayj zza = zzayj.zza;
    private int zzb;
    private boolean zzc;

    public final zzayv zza(zzayj zzayjVar) {
        zzmt.zzc(zzayjVar, "callOptions cannot be null");
        this.zza = zzayjVar;
        return this;
    }

    public final zzayv zzb(boolean z11) {
        this.zzc = z11;
        return this;
    }

    public final zzayv zzc(int i5) {
        this.zzb = i5;
        return this;
    }

    public final zzayw zzd() {
        return new zzayw(this.zza, this.zzb, this.zzc);
    }
}
