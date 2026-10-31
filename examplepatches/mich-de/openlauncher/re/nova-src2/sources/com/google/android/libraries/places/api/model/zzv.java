package com.google.android.libraries.places.api.model;

import b.c0;

/* loaded from: classes3.dex */
abstract class zzv extends PhotoMetadata {
    private final String zza;
    private final int zzb;
    private final int zzc;
    private final String zzd;
    private final String zze;
    private final AuthorAttributions zzf;

    public zzv(String str, int i5, int i11, String str2, String str3, AuthorAttributions authorAttributions) {
        if (str == null) {
            throw new NullPointerException("Null attributions");
        }
        this.zza = str;
        this.zzb = i5;
        this.zzc = i11;
        if (str2 == null) {
            throw new NullPointerException("Null photoReference");
        }
        this.zzd = str2;
        this.zze = str3;
        this.zzf = authorAttributions;
    }

    public final boolean equals(Object obj) {
        String str;
        AuthorAttributions authorAttributions;
        if (obj == this) {
            return true;
        }
        if (obj instanceof PhotoMetadata) {
            PhotoMetadata photoMetadata = (PhotoMetadata) obj;
            if (this.zza.equals(photoMetadata.getAttributions()) && this.zzb == photoMetadata.getHeight() && this.zzc == photoMetadata.getWidth() && this.zzd.equals(photoMetadata.zzb()) && ((str = this.zze) != null ? str.equals(photoMetadata.zza()) : photoMetadata.zza() == null) && ((authorAttributions = this.zzf) != null ? authorAttributions.equals(photoMetadata.getAuthorAttributions()) : photoMetadata.getAuthorAttributions() == null)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public String getAttributions() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public AuthorAttributions getAuthorAttributions() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public int getHeight() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public int getWidth() {
        return this.zzc;
    }

    public final int hashCode() {
        int iHashCode = ((((((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb) * 1000003) ^ this.zzc) * 1000003) ^ this.zzd.hashCode();
        String str = this.zze;
        int iHashCode2 = ((iHashCode * 1000003) ^ (str == null ? 0 : str.hashCode())) * 1000003;
        AuthorAttributions authorAttributions = this.zzf;
        return iHashCode2 ^ (authorAttributions != null ? authorAttributions.hashCode() : 0);
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.zzf);
        StringBuilder sb2 = new StringBuilder("PhotoMetadata{attributions=");
        sb2.append(this.zza);
        sb2.append(", height=");
        sb2.append(this.zzb);
        sb2.append(", width=");
        sb2.append(this.zzc);
        sb2.append(", photoReference=");
        sb2.append(this.zzd);
        sb2.append(", name=");
        return c0.s(sb2, this.zze, ", authorAttributions=", strValueOf, "}");
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public final String zza() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.model.PhotoMetadata
    public final String zzb() {
        return this.zzd;
    }
}
