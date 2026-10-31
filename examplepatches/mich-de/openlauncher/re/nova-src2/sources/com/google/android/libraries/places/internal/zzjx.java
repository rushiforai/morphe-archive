package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzjx extends zzka {
    private String zza;
    private int zzb;
    private byte zzc;
    private int zzd;

    public final zzka zza(String str) {
        if (str == null) {
            throw new NullPointerException("Null packageName");
        }
        this.zza = str;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzka
    public final zzka zzb(int i5) {
        this.zzb = i5;
        this.zzc = (byte) 1;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzka
    public final zzkb zzc() {
        String str;
        int i5;
        if (this.zzc == 1 && (str = this.zza) != null && (i5 = this.zzd) != 0) {
            return new zzjz(str, this.zzb, i5, null);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zza == null) {
            sb2.append(" packageName");
        }
        if (this.zzc == 0) {
            sb2.append(" versionCode");
        }
        if (this.zzd == 0) {
            sb2.append(" requestSource");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }

    @Override // com.google.android.libraries.places.internal.zzka
    public final zzka zzd(int i5) {
        this.zzd = i5;
        return this;
    }
}
