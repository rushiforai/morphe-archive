package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbsn implements zzbra {
    private final zzbwb zza;
    private int zzb;
    private int zzc;

    public zzbsn(zzbwb zzbwbVar, int i5) {
        this.zza = zzbwbVar;
        this.zzb = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzbra
    public final int zza() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.internal.zzbra
    public final int zzb() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzbra
    public final void zzc(byte b11) {
        this.zza.zzm(b11);
        this.zzb--;
        this.zzc++;
    }

    @Override // com.google.android.libraries.places.internal.zzbra
    public final void zzd(byte[] bArr, int i5, int i11) {
        this.zza.zzl(bArr, i5, i11);
        this.zzb -= i11;
        this.zzc += i11;
    }

    public final zzbwb zze() {
        return this.zza;
    }
}
