package com.google.android.libraries.places.internal;

import android.content.Context;

/* loaded from: classes3.dex */
final class zzjl implements zzjp {
    private Context zza;
    private zzjs zzb;
    private zzkb zzc;

    private zzjl() {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzjp
    public final /* synthetic */ zzjp zza(zzjs zzjsVar) {
        this.zzb = zzjsVar;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzjp
    public final /* synthetic */ zzjp zzb(zzkb zzkbVar) {
        this.zzc = zzkbVar;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzjp
    public final /* synthetic */ zzjp zzc(Context context) {
        context.getClass();
        this.zza = context;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzjp
    public final zzjq zzd() {
        zzaxx.zzb(this.zza, Context.class);
        zzaxx.zzb(this.zzb, zzjs.class);
        zzaxx.zzb(this.zzc, zzkb.class);
        return new zzjn(this.zza, this.zzb, this.zzc, null);
    }

    public /* synthetic */ zzjl(zzjk zzjkVar) {
    }
}
