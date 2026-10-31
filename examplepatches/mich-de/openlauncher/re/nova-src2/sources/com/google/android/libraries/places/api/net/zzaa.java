package com.google.android.libraries.places.api.net;

import b.c0;
import b.c9;
import b.u4;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.net.SearchByTextRequest;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzaa extends SearchByTextRequest {
    private final a zza;
    private final String zzb;
    private final LocationBias zzc;
    private final LocationRestriction zzd;
    private final Integer zze;
    private final Double zzf;
    private final boolean zzg;
    private final List zzh;
    private final List zzi;
    private final SearchByTextRequest.RankPreference zzj;
    private final String zzk;
    private final boolean zzl;
    private final String zzm;

    public /* synthetic */ zzaa(a aVar, String str, LocationBias locationBias, LocationRestriction locationRestriction, Integer num, Double d5, boolean z11, List list, List list2, SearchByTextRequest.RankPreference rankPreference, String str2, boolean z12, String str3, zzz zzzVar) {
        this.zza = aVar;
        this.zzb = str;
        this.zzc = locationBias;
        this.zzd = locationRestriction;
        this.zze = num;
        this.zzf = d5;
        this.zzg = z11;
        this.zzh = list;
        this.zzi = list2;
        this.zzj = rankPreference;
        this.zzk = str2;
        this.zzl = z12;
        this.zzm = str3;
    }

    public final boolean equals(Object obj) {
        SearchByTextRequest.RankPreference rankPreference;
        String str;
        if (obj == this) {
            return true;
        }
        if (obj instanceof SearchByTextRequest) {
            SearchByTextRequest searchByTextRequest = (SearchByTextRequest) obj;
            a aVar = this.zza;
            if (aVar != null ? aVar.equals(searchByTextRequest.getCancellationToken()) : searchByTextRequest.getCancellationToken() == null) {
                String str2 = this.zzb;
                if (str2 != null ? str2.equals(searchByTextRequest.getIncludedType()) : searchByTextRequest.getIncludedType() == null) {
                    LocationBias locationBias = this.zzc;
                    if (locationBias != null ? locationBias.equals(searchByTextRequest.getLocationBias()) : searchByTextRequest.getLocationBias() == null) {
                        LocationRestriction locationRestriction = this.zzd;
                        if (locationRestriction != null ? locationRestriction.equals(searchByTextRequest.getLocationRestriction()) : searchByTextRequest.getLocationRestriction() == null) {
                            Integer num = this.zze;
                            if (num != null ? num.equals(searchByTextRequest.getMaxResultCount()) : searchByTextRequest.getMaxResultCount() == null) {
                                Double d5 = this.zzf;
                                if (d5 != null ? d5.equals(searchByTextRequest.getMinRating()) : searchByTextRequest.getMinRating() == null) {
                                    if (this.zzg == searchByTextRequest.isOpenNow() && this.zzh.equals(searchByTextRequest.getPlaceFields()) && this.zzi.equals(searchByTextRequest.getPriceLevels()) && ((rankPreference = this.zzj) != null ? rankPreference.equals(searchByTextRequest.getRankPreference()) : searchByTextRequest.getRankPreference() == null) && ((str = this.zzk) != null ? str.equals(searchByTextRequest.getRegionCode()) : searchByTextRequest.getRegionCode() == null) && this.zzl == searchByTextRequest.isStrictTypeFiltering() && this.zzm.equals(searchByTextRequest.getTextQuery())) {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final String getIncludedType() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final LocationBias getLocationBias() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final LocationRestriction getLocationRestriction() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final Integer getMaxResultCount() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final Double getMinRating() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final List<Place.Field> getPlaceFields() {
        return this.zzh;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final List<Integer> getPriceLevels() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final SearchByTextRequest.RankPreference getRankPreference() {
        return this.zzj;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final String getRegionCode() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final String getTextQuery() {
        return this.zzm;
    }

    public final int hashCode() {
        a aVar = this.zza;
        int iHashCode = aVar == null ? 0 : aVar.hashCode();
        String str = this.zzb;
        int iHashCode2 = str == null ? 0 : str.hashCode();
        int i5 = iHashCode ^ 1000003;
        LocationBias locationBias = this.zzc;
        int iHashCode3 = ((((i5 * 1000003) ^ iHashCode2) * 1000003) ^ (locationBias == null ? 0 : locationBias.hashCode())) * 1000003;
        LocationRestriction locationRestriction = this.zzd;
        int iHashCode4 = (iHashCode3 ^ (locationRestriction == null ? 0 : locationRestriction.hashCode())) * 1000003;
        Integer num = this.zze;
        int iHashCode5 = (iHashCode4 ^ (num == null ? 0 : num.hashCode())) * 1000003;
        Double d5 = this.zzf;
        int iHashCode6 = (((((((iHashCode5 ^ (d5 == null ? 0 : d5.hashCode())) * 1000003) ^ (true != this.zzg ? 1237 : 1231)) * 1000003) ^ this.zzh.hashCode()) * 1000003) ^ this.zzi.hashCode()) * 1000003;
        SearchByTextRequest.RankPreference rankPreference = this.zzj;
        int iHashCode7 = (iHashCode6 ^ (rankPreference == null ? 0 : rankPreference.hashCode())) * 1000003;
        String str2 = this.zzk;
        return ((((iHashCode7 ^ (str2 != null ? str2.hashCode() : 0)) * 1000003) ^ (true != this.zzl ? 1237 : 1231)) * 1000003) ^ this.zzm.hashCode();
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final boolean isOpenNow() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextRequest
    public final boolean isStrictTypeFiltering() {
        return this.zzl;
    }

    public final String toString() {
        SearchByTextRequest.RankPreference rankPreference = this.zzj;
        List list = this.zzi;
        List list2 = this.zzh;
        LocationRestriction locationRestriction = this.zzd;
        LocationBias locationBias = this.zzc;
        String strValueOf = String.valueOf(this.zza);
        String strValueOf2 = String.valueOf(locationBias);
        String strValueOf3 = String.valueOf(locationRestriction);
        String string = list2.toString();
        String string2 = list.toString();
        String strValueOf4 = String.valueOf(rankPreference);
        StringBuilder sbK = u4.k("SearchByTextRequest{cancellationToken=", strValueOf, ", includedType=");
        c0.D(sbK, this.zzb, ", locationBias=", strValueOf2, ", locationRestriction=");
        sbK.append(strValueOf3);
        sbK.append(", maxResultCount=");
        sbK.append(this.zze);
        sbK.append(", minRating=");
        sbK.append(this.zzf);
        sbK.append(", openNow=");
        c9.s(", placeFields=", string, ", priceLevels=", sbK, this.zzg);
        c0.D(sbK, string2, ", rankPreference=", strValueOf4, ", regionCode=");
        sbK.append(this.zzk);
        sbK.append(", strictTypeFiltering=");
        sbK.append(this.zzl);
        sbK.append(", textQuery=");
        return c0.q(sbK, this.zzm, "}");
    }
}
