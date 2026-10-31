package com.google.android.libraries.places.api.model;

import b.c0;

/* loaded from: classes3.dex */
abstract class zzae extends Review {
    private final String zza;
    private final String zzb;
    private final String zzc;
    private final String zzd;
    private final String zze;
    private final Double zzf;
    private final AuthorAttribution zzg;
    private final String zzh;
    private final String zzi;

    public zzae(String str, String str2, String str3, String str4, String str5, Double d5, AuthorAttribution authorAttribution, String str6, String str7) {
        this.zza = str;
        this.zzb = str2;
        this.zzc = str3;
        this.zzd = str4;
        this.zze = str5;
        this.zzf = d5;
        if (authorAttribution == null) {
            throw new NullPointerException("Null authorAttribution");
        }
        this.zzg = authorAttribution;
        if (str6 == null) {
            throw new NullPointerException("Null attribution");
        }
        this.zzh = str6;
        this.zzi = str7;
    }

    public final boolean equals(Object obj) {
        String str;
        if (obj == this) {
            return true;
        }
        if (obj instanceof Review) {
            Review review = (Review) obj;
            String str2 = this.zza;
            if (str2 != null ? str2.equals(review.getRelativePublishTimeDescription()) : review.getRelativePublishTimeDescription() == null) {
                String str3 = this.zzb;
                if (str3 != null ? str3.equals(review.getText()) : review.getText() == null) {
                    String str4 = this.zzc;
                    if (str4 != null ? str4.equals(review.getTextLanguageCode()) : review.getTextLanguageCode() == null) {
                        String str5 = this.zzd;
                        if (str5 != null ? str5.equals(review.getOriginalText()) : review.getOriginalText() == null) {
                            String str6 = this.zze;
                            if (str6 != null ? str6.equals(review.getOriginalTextLanguageCode()) : review.getOriginalTextLanguageCode() == null) {
                                if (this.zzf.equals(review.getRating()) && this.zzg.equals(review.getAuthorAttribution()) && this.zzh.equals(review.getAttribution()) && ((str = this.zzi) != null ? str.equals(review.getPublishTime()) : review.getPublishTime() == null)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getAttribution() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final AuthorAttribution getAuthorAttribution() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getOriginalText() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getOriginalTextLanguageCode() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getPublishTime() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final Double getRating() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getRelativePublishTimeDescription() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getText() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.Review
    public final String getTextLanguageCode() {
        return this.zzc;
    }

    public final int hashCode() {
        String str = this.zza;
        int iHashCode = str == null ? 0 : str.hashCode();
        String str2 = this.zzb;
        int iHashCode2 = str2 == null ? 0 : str2.hashCode();
        int i5 = iHashCode ^ 1000003;
        String str3 = this.zzc;
        int iHashCode3 = ((((i5 * 1000003) ^ iHashCode2) * 1000003) ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        String str4 = this.zzd;
        int iHashCode4 = (iHashCode3 ^ (str4 == null ? 0 : str4.hashCode())) * 1000003;
        String str5 = this.zze;
        int iHashCode5 = (((((((iHashCode4 ^ (str5 == null ? 0 : str5.hashCode())) * 1000003) ^ this.zzf.hashCode()) * 1000003) ^ this.zzg.hashCode()) * 1000003) ^ this.zzh.hashCode()) * 1000003;
        String str6 = this.zzi;
        return iHashCode5 ^ (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        String string = this.zzg.toString();
        StringBuilder sb2 = new StringBuilder("Review{relativePublishTimeDescription=");
        sb2.append(this.zza);
        sb2.append(", text=");
        sb2.append(this.zzb);
        sb2.append(", textLanguageCode=");
        sb2.append(this.zzc);
        sb2.append(", originalText=");
        sb2.append(this.zzd);
        sb2.append(", originalTextLanguageCode=");
        sb2.append(this.zze);
        sb2.append(", rating=");
        sb2.append(this.zzf);
        sb2.append(", authorAttribution=");
        sb2.append(string);
        sb2.append(", attribution=");
        sb2.append(this.zzh);
        sb2.append(", publishTime=");
        return c0.q(sb2, this.zzi, "}");
    }
}
