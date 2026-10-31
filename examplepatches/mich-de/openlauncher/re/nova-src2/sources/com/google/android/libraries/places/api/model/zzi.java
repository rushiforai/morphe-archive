package com.google.android.libraries.places.api.model;

/* loaded from: classes3.dex */
final class zzi extends zzbx {
    private int zza;
    private int zzb;
    private byte zzc;

    @Override // com.google.android.libraries.places.api.model.zzbx
    public final zzbx zza(int i5) {
        this.zzb = i5;
        this.zzc = (byte) (this.zzc | 2);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.zzbx
    public final zzbx zzb(int i5) {
        this.zza = i5;
        this.zzc = (byte) (this.zzc | 1);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.zzbx
    public final zzby zzc() {
        if (this.zzc == 3) {
            return new zzau(this.zza, this.zzb);
        }
        StringBuilder sb2 = new StringBuilder();
        if ((this.zzc & 1) == 0) {
            sb2.append(" offset");
        }
        if ((this.zzc & 2) == 0) {
            sb2.append(" length");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
