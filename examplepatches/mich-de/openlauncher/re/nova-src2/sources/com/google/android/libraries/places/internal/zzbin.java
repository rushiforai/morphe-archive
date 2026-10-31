package com.google.android.libraries.places.internal;

import java.io.InputStream;

/* loaded from: classes3.dex */
abstract class zzbin implements zzbfr {
    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("delegate", zza());
        return zzmmVarZzb.toString();
    }

    public abstract zzbfr zza();

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final zzaye zzam() {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzg(zzbjj zzbjjVar) {
        zza().zzg(zzbjjVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzh(zzbdo zzbdoVar) {
        zza().zzh(zzbdoVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzj() {
        zza().zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzk(zzazn zzaznVar) {
        zza().zzk(zzaznVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzl(zzazq zzazqVar) {
        zza().zzl(zzazqVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzm(int i5) {
        zza().zzm(i5);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public final void zzn(int i5) {
        zza().zzn(i5);
    }

    @Override // com.google.android.libraries.places.internal.zzbfr
    public void zzo(zzbft zzbftVar) {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final boolean zzp() {
        return zza().zzp();
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzr() {
        zza().zzr();
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzt() {
        zza().zzt();
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzu(int i5) {
        zza().zzu(2);
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzv(zzazc zzazcVar) {
        zza().zzv(zzazcVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbqp
    public final void zzw(InputStream inputStream) {
        zza().zzw(inputStream);
    }
}
