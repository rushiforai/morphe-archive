package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
final class zzawp extends zzawn {
    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ int zza(Object obj) {
        return ((zzawo) obj).zza();
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ int zzb(Object obj) {
        return ((zzawo) obj).zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ Object zzc(Object obj) {
        zzatu zzatuVar = (zzatu) obj;
        zzawo zzawoVar = zzatuVar.zzc;
        if (zzawoVar != zzawo.zzc()) {
            return zzawoVar;
        }
        zzawo zzawoVarZzf = zzawo.zzf();
        zzatuVar.zzc = zzawoVarZzf;
        return zzawoVarZzf;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ Object zzd(Object obj) {
        return ((zzatu) obj).zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ Object zze(Object obj, Object obj2) {
        if (!zzawo.zzc().equals(obj2)) {
            if (zzawo.zzc().equals(obj)) {
                return zzawo.zze((zzawo) obj, (zzawo) obj2);
            }
            ((zzawo) obj).zzd((zzawo) obj2);
        }
        return obj;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ Object zzf() {
        return zzawo.zzf();
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ Object zzg(Object obj) {
        ((zzawo) obj).zzh();
        return obj;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ void zzh(Object obj, int i5, int i11) {
        ((zzawo) obj).zzj((i5 << 3) | 5, Integer.valueOf(i11));
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ void zzi(Object obj, int i5, long j11) {
        ((zzawo) obj).zzj((i5 << 3) | 1, Long.valueOf(j11));
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ void zzj(Object obj, int i5, Object obj2) {
        ((zzawo) obj).zzj((i5 << 3) | 3, obj2);
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ void zzk(Object obj, int i5, zzask zzaskVar) {
        ((zzawo) obj).zzj((i5 << 3) | 2, zzaskVar);
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* bridge */ /* synthetic */ void zzl(Object obj, int i5, long j11) {
        ((zzawo) obj).zzj(i5 << 3, Long.valueOf(j11));
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final void zzm(Object obj) {
        ((zzatu) obj).zzc.zzh();
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ void zzn(Object obj, Object obj2) {
        ((zzatu) obj).zzc = (zzawo) obj2;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ void zzo(Object obj, Object obj2) {
        ((zzatu) obj).zzc = (zzawo) obj2;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final boolean zzq(zzavs zzavsVar) {
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ void zzr(Object obj, zzasy zzasyVar) throws IOException {
        ((zzawo) obj).zzk(zzasyVar);
    }

    @Override // com.google.android.libraries.places.internal.zzawn
    public final /* synthetic */ void zzs(Object obj, zzasy zzasyVar) throws IOException {
        ((zzawo) obj).zzl(zzasyVar);
    }
}
