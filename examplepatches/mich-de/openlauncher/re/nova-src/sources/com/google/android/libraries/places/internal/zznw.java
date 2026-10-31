package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
final class zznw extends zznx {
    final transient int zza;
    final transient int zzb;
    final /* synthetic */ zznx zzc;

    public zznw(zznx zznxVar, int i5, int i11) {
        this.zzc = zznxVar;
        this.zza = i5;
        this.zzb = i11;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        zzmt.zza(i5, this.zzb, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        return this.zzc.get(i5 + this.zza);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzb() {
        return this.zzc.zzc() + this.zza + this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final int zzc() {
        return this.zzc.zzc() + this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final boolean zzf() {
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zznt
    public final Object[] zzg() {
        return this.zzc.zzg();
    }

    @Override // com.google.android.libraries.places.internal.zznx, java.util.List
    /* renamed from: zzh */
    public final zznx subList(int i5, int i11) {
        zzmt.zzn(i5, i11, this.zzb);
        int i12 = this.zza;
        return this.zzc.subList(i5 + i12, i11 + i12);
    }
}
