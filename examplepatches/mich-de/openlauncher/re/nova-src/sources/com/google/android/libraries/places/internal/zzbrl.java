package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.List;

/* loaded from: classes3.dex */
class zzbrl implements zzbts {
    private final zzbts zza;

    public zzbrl(zzbts zzbtsVar) {
        this.zza = zzbtsVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.zza.close();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public void zza(zzbue zzbueVar) throws IOException {
        this.zza.zza(zzbueVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public void zzb(boolean z11, int i5, int i11) throws IOException {
        this.zza.zzb(z11, i5, i11);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public void zzc(int i5, zzbtp zzbtpVar) throws IOException {
        this.zza.zzc(i5, zzbtpVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final int zzd() {
        return this.zza.zzd();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zze() throws IOException {
        this.zza.zze();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzf(boolean z11, int i5, zzbwb zzbwbVar, int i11) throws IOException {
        this.zza.zzf(z11, i5, zzbwbVar, i11);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzg() throws IOException {
        this.zza.zzg();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzh(int i5, zzbtp zzbtpVar, byte[] bArr) throws IOException {
        this.zza.zzh(0, zzbtpVar, bArr);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzi(zzbue zzbueVar) throws IOException {
        this.zza.zzi(zzbueVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzj(boolean z11, boolean z12, int i5, int i11, List list) throws IOException {
        this.zza.zzj(false, false, i5, 0, list);
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzk(int i5, long j11) throws IOException {
        this.zza.zzk(i5, j11);
    }
}
