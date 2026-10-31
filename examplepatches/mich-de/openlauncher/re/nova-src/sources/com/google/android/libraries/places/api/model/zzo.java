package com.google.android.libraries.places.api.model;

/* loaded from: classes3.dex */
final class zzo extends zzcb {
    private int zza;
    private int zzb;
    private byte zzc;

    public final zzcb zza(int i5) {
        this.zza = i5;
        this.zzc = (byte) (this.zzc | 1);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.zzcb
    public final zzcb zzb(int i5) {
        this.zzb = i5;
        this.zzc = (byte) (this.zzc | 2);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.zzcb
    public final LocalTime zzc() {
        if (this.zzc == 3) {
            return new zzbc(this.zza, this.zzb);
        }
        StringBuilder sb2 = new StringBuilder();
        if ((this.zzc & 1) == 0) {
            sb2.append(" hours");
        }
        if ((this.zzc & 2) == 0) {
            sb2.append(" minutes");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
