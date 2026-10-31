package com.google.android.libraries.places.api.model;

import b.c0;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
abstract class zzh extends AutocompletePrediction {
    private final String zza;
    private final Integer zzb;
    private final List zzc;
    private final List zzd;
    private final String zze;
    private final String zzf;
    private final String zzg;
    private final List zzh;
    private final List zzi;
    private final List zzj;

    public zzh(String str, Integer num, List list, List list2, String str2, String str3, String str4, List list3, List list4, List list5) {
        if (str == null) {
            throw new NullPointerException("Null placeId");
        }
        this.zza = str;
        this.zzb = num;
        if (list == null) {
            throw new NullPointerException("Null placeTypes");
        }
        this.zzc = list;
        if (list2 == null) {
            throw new NullPointerException("Null types");
        }
        this.zzd = list2;
        if (str2 == null) {
            throw new NullPointerException("Null fullText");
        }
        this.zze = str2;
        if (str3 == null) {
            throw new NullPointerException("Null primaryText");
        }
        this.zzf = str3;
        if (str4 == null) {
            throw new NullPointerException("Null secondaryText");
        }
        this.zzg = str4;
        if (list3 == null) {
            throw new NullPointerException("Null fullTextMatchedSubstrings");
        }
        this.zzh = list3;
        if (list4 == null) {
            throw new NullPointerException("Null primaryTextMatchedSubstrings");
        }
        this.zzi = list4;
        if (list5 == null) {
            throw new NullPointerException("Null secondaryTextMatchedSubstrings");
        }
        this.zzj = list5;
    }

    public final boolean equals(Object obj) {
        Integer num;
        if (obj == this) {
            return true;
        }
        if (obj instanceof AutocompletePrediction) {
            AutocompletePrediction autocompletePrediction = (AutocompletePrediction) obj;
            if (this.zza.equals(autocompletePrediction.getPlaceId()) && ((num = this.zzb) != null ? num.equals(autocompletePrediction.getDistanceMeters()) : autocompletePrediction.getDistanceMeters() == null) && this.zzc.equals(autocompletePrediction.getPlaceTypes()) && this.zzd.equals(autocompletePrediction.getTypes()) && this.zze.equals(autocompletePrediction.zza()) && this.zzf.equals(autocompletePrediction.zzb()) && this.zzg.equals(autocompletePrediction.zzc()) && this.zzh.equals(autocompletePrediction.zzd()) && this.zzi.equals(autocompletePrediction.zze()) && this.zzj.equals(autocompletePrediction.zzf())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public Integer getDistanceMeters() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public String getPlaceId() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    @Deprecated
    public List<Place.Type> getPlaceTypes() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public List<String> getTypes() {
        return this.zzd;
    }

    public final int hashCode() {
        int iHashCode = this.zza.hashCode() ^ 1000003;
        Integer num = this.zzb;
        return (((((((((((((((((iHashCode * 1000003) ^ (num == null ? 0 : num.hashCode())) * 1000003) ^ this.zzc.hashCode()) * 1000003) ^ this.zzd.hashCode()) * 1000003) ^ this.zze.hashCode()) * 1000003) ^ this.zzf.hashCode()) * 1000003) ^ this.zzg.hashCode()) * 1000003) ^ this.zzh.hashCode()) * 1000003) ^ this.zzi.hashCode()) * 1000003) ^ this.zzj.hashCode();
    }

    public final String toString() {
        List list = this.zzj;
        List list2 = this.zzi;
        List list3 = this.zzh;
        List list4 = this.zzd;
        String string = this.zzc.toString();
        String string2 = list4.toString();
        String string3 = list3.toString();
        String string4 = list2.toString();
        String string5 = list.toString();
        StringBuilder sb2 = new StringBuilder("AutocompletePrediction{placeId=");
        sb2.append(this.zza);
        sb2.append(", distanceMeters=");
        sb2.append(this.zzb);
        sb2.append(", placeTypes=");
        sb2.append(string);
        sb2.append(", types=");
        sb2.append(string2);
        sb2.append(", fullText=");
        sb2.append(this.zze);
        sb2.append(", primaryText=");
        sb2.append(this.zzf);
        sb2.append(", secondaryText=");
        c0.D(sb2, this.zzg, ", fullTextMatchedSubstrings=", string3, ", primaryTextMatchedSubstrings=");
        return c0.s(sb2, string4, ", secondaryTextMatchedSubstrings=", string5, "}");
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final String zza() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final String zzb() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final String zzc() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final List zzd() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final List zze() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.model.AutocompletePrediction
    public final List zzf() {
        return this.zzj;
    }
}
