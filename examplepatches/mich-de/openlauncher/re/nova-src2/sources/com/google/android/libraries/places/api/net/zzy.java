package com.google.android.libraries.places.api.net;

import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.net.SearchByTextRequest;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzy extends SearchByTextRequest.Builder {
    private a zza;
    private String zzb;
    private LocationBias zzc;
    private LocationRestriction zzd;
    private Integer zze;
    private Double zzf;
    private boolean zzg;
    private List zzh;
    private List zzi;
    private SearchByTextRequest.RankPreference zzj;
    private String zzk;
    private boolean zzl;
    private String zzm;
    private byte zzn;

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final a getCancellationToken() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final String getIncludedType() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final LocationBias getLocationBias() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final LocationRestriction getLocationRestriction() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final Integer getMaxResultCount() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final Double getMinRating() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final List<Place.Field> getPlaceFields() {
        List<Place.Field> list = this.zzh;
        if (list != null) {
            return list;
        }
        throw new IllegalStateException("Property \"placeFields\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final List<Integer> getPriceLevels() {
        List<Integer> list = this.zzi;
        if (list != null) {
            return list;
        }
        throw new IllegalStateException("Property \"priceLevels\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.RankPreference getRankPreference() {
        return this.zzj;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final String getRegionCode() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final String getTextQuery() {
        String str = this.zzm;
        if (str != null) {
            return str;
        }
        throw new IllegalStateException("Property \"textQuery\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final boolean isOpenNow() {
        if ((this.zzn & 1) != 0) {
            return this.zzg;
        }
        throw new IllegalStateException("Property \"openNow\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final boolean isStrictTypeFiltering() {
        if ((this.zzn & 2) != 0) {
            return this.zzl;
        }
        throw new IllegalStateException("Property \"strictTypeFiltering\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setCancellationToken(a aVar) {
        this.zza = aVar;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setIncludedType(String str) {
        this.zzb = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setLocationBias(LocationBias locationBias) {
        this.zzc = locationBias;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setLocationRestriction(LocationRestriction locationRestriction) {
        this.zzd = locationRestriction;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setMaxResultCount(Integer num) {
        this.zze = num;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setMinRating(Double d5) {
        this.zzf = d5;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setOpenNow(boolean z11) {
        this.zzg = z11;
        this.zzn = (byte) (this.zzn | 1);
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setPlaceFields(List<Place.Field> list) {
        if (list == null) {
            throw new NullPointerException("Null placeFields");
        }
        this.zzh = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setPriceLevels(List<Integer> list) {
        if (list == null) {
            throw new NullPointerException("Null priceLevels");
        }
        this.zzi = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setRankPreference(SearchByTextRequest.RankPreference rankPreference) {
        this.zzj = rankPreference;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setRegionCode(String str) {
        this.zzk = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setStrictTypeFiltering(boolean z11) {
        this.zzl = z11;
        this.zzn = (byte) (this.zzn | 2);
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest.Builder setTextQuery(String str) {
        if (str == null) {
            throw new NullPointerException("Null textQuery");
        }
        this.zzm = str;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest.Builder
    public final SearchByTextRequest zza() {
        List list;
        List list2;
        String str;
        if (this.zzn == 3 && (list = this.zzh) != null && (list2 = this.zzi) != null && (str = this.zzm) != null) {
            return new zzaa(this.zza, this.zzb, this.zzc, this.zzd, this.zze, this.zzf, this.zzg, list, list2, this.zzj, this.zzk, this.zzl, str, null);
        }
        StringBuilder sb2 = new StringBuilder();
        if ((this.zzn & 1) == 0) {
            sb2.append(" openNow");
        }
        if (this.zzh == null) {
            sb2.append(" placeFields");
        }
        if (this.zzi == null) {
            sb2.append(" priceLevels");
        }
        if ((this.zzn & 2) == 0) {
            sb2.append(" strictTypeFiltering");
        }
        if (this.zzm == null) {
            sb2.append(" textQuery");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
