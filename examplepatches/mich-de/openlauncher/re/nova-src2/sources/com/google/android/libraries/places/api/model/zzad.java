package com.google.android.libraries.places.api.model;

import com.google.android.libraries.places.api.model.Review;

/* loaded from: classes3.dex */
final class zzad extends Review.Builder {
    private String zza;
    private String zzb;
    private String zzc;
    private String zzd;
    private String zze;
    private Double zzf;
    private AuthorAttribution zzg;
    private String zzh;
    private String zzi;

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getOriginalText() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getOriginalTextLanguageCode() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getPublishTime() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getRelativePublishTimeDescription() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getText() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final String getTextLanguageCode() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setOriginalText(String str) {
        this.zzd = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setOriginalTextLanguageCode(String str) {
        this.zze = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setPublishTime(String str) {
        this.zzi = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setRelativePublishTimeDescription(String str) {
        this.zza = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setText(String str) {
        this.zzb = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder setTextLanguageCode(String str) {
        this.zzc = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder zza(String str) {
        this.zzh = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review.Builder zzb(AuthorAttribution authorAttribution) {
        if (authorAttribution == null) {
            throw new NullPointerException("Null authorAttribution");
        }
        this.zzg = authorAttribution;
        return this;
    }

    public final Review.Builder zzc(Double d5) {
        if (d5 == null) {
            throw new NullPointerException("Null rating");
        }
        this.zzf = d5;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Review.Builder
    public final Review zzd() {
        AuthorAttribution authorAttribution;
        String str;
        Double d5 = this.zzf;
        if (d5 != null && (authorAttribution = this.zzg) != null && (str = this.zzh) != null) {
            return new zzbs(this.zza, this.zzb, this.zzc, this.zzd, this.zze, d5, authorAttribution, str, this.zzi);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zzf == null) {
            sb2.append(" rating");
        }
        if (this.zzg == null) {
            sb2.append(" authorAttribution");
        }
        if (this.zzh == null) {
            sb2.append(" attribution");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
