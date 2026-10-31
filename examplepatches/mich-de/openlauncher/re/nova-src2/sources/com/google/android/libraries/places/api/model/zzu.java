package com.google.android.libraries.places.api.model;

import com.google.android.libraries.places.api.model.PhotoMetadata;

/* loaded from: classes3.dex */
final class zzu extends PhotoMetadata.Builder {
    private String zza;
    private int zzb;
    private int zzc;
    private String zzd;
    private String zze;
    private AuthorAttributions zzf;
    private byte zzg;

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final String getAttributions() {
        String str = this.zza;
        if (str != null) {
            return str;
        }
        throw new IllegalStateException("Property \"attributions\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final AuthorAttributions getAuthorAttributions() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final int getHeight() {
        if ((this.zzg & 1) != 0) {
            return this.zzb;
        }
        throw new IllegalStateException("Property \"height\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final int getWidth() {
        if ((this.zzg & 2) != 0) {
            return this.zzc;
        }
        throw new IllegalStateException("Property \"width\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata.Builder setAttributions(String str) {
        if (str == null) {
            throw new NullPointerException("Null attributions");
        }
        this.zza = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata.Builder setAuthorAttributions(AuthorAttributions authorAttributions) {
        this.zzf = authorAttributions;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata.Builder setHeight(int i5) {
        this.zzb = i5;
        this.zzg = (byte) (this.zzg | 1);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata.Builder setWidth(int i5) {
        this.zzc = i5;
        this.zzg = (byte) (this.zzg | 2);
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata.Builder zza(String str) {
        this.zze = str;
        return this;
    }

    public final PhotoMetadata.Builder zzb(String str) {
        if (str == null) {
            throw new NullPointerException("Null photoReference");
        }
        this.zzd = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata.Builder
    public final PhotoMetadata zzc() {
        String str;
        String str2;
        if (this.zzg == 3 && (str = this.zza) != null && (str2 = this.zzd) != null) {
            return new zzbi(str, this.zzb, this.zzc, str2, this.zze, this.zzf);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zza == null) {
            sb2.append(" attributions");
        }
        if ((this.zzg & 1) == 0) {
            sb2.append(" height");
        }
        if ((this.zzg & 2) == 0) {
            sb2.append(" width");
        }
        if (this.zzd == null) {
            sb2.append(" photoReference");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
