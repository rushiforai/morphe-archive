package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzo extends FindAutocompletePredictionsRequest {
    private final String zza;
    private final LocationBias zzb;
    private final LocationRestriction zzc;
    private final LatLng zzd;
    private final List zze;
    private final AutocompleteSessionToken zzf;
    private final TypeFilter zzg;
    private final List zzh;
    private final Integer zzi;
    private final String zzj;
    private final a zzk;

    public /* synthetic */ zzo(String str, LocationBias locationBias, LocationRestriction locationRestriction, LatLng latLng, List list, AutocompleteSessionToken autocompleteSessionToken, TypeFilter typeFilter, List list2, Integer num, String str2, a aVar, zzn zznVar) {
        this.zza = str;
        this.zzb = locationBias;
        this.zzc = locationRestriction;
        this.zzd = latLng;
        this.zze = list;
        this.zzf = autocompleteSessionToken;
        this.zzg = typeFilter;
        this.zzh = list2;
        this.zzi = num;
        this.zzj = str2;
        this.zzk = aVar;
    }

    public final boolean equals(Object obj) {
        AutocompleteSessionToken autocompleteSessionToken;
        TypeFilter typeFilter;
        Integer num;
        String str;
        a aVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof FindAutocompletePredictionsRequest) {
            FindAutocompletePredictionsRequest findAutocompletePredictionsRequest = (FindAutocompletePredictionsRequest) obj;
            String str2 = this.zza;
            if (str2 != null ? str2.equals(findAutocompletePredictionsRequest.getQuery()) : findAutocompletePredictionsRequest.getQuery() == null) {
                LocationBias locationBias = this.zzb;
                if (locationBias != null ? locationBias.equals(findAutocompletePredictionsRequest.getLocationBias()) : findAutocompletePredictionsRequest.getLocationBias() == null) {
                    LocationRestriction locationRestriction = this.zzc;
                    if (locationRestriction != null ? locationRestriction.equals(findAutocompletePredictionsRequest.getLocationRestriction()) : findAutocompletePredictionsRequest.getLocationRestriction() == null) {
                        LatLng latLng = this.zzd;
                        if (latLng != null ? latLng.equals(findAutocompletePredictionsRequest.getOrigin()) : findAutocompletePredictionsRequest.getOrigin() == null) {
                            if (this.zze.equals(findAutocompletePredictionsRequest.getCountries()) && ((autocompleteSessionToken = this.zzf) != null ? autocompleteSessionToken.equals(findAutocompletePredictionsRequest.getSessionToken()) : findAutocompletePredictionsRequest.getSessionToken() == null) && ((typeFilter = this.zzg) != null ? typeFilter.equals(findAutocompletePredictionsRequest.getTypeFilter()) : findAutocompletePredictionsRequest.getTypeFilter() == null) && this.zzh.equals(findAutocompletePredictionsRequest.getTypesFilter()) && ((num = this.zzi) != null ? num.equals(findAutocompletePredictionsRequest.getInputOffset()) : findAutocompletePredictionsRequest.getInputOffset() == null) && ((str = this.zzj) != null ? str.equals(findAutocompletePredictionsRequest.getRegionCode()) : findAutocompletePredictionsRequest.getRegionCode() == null) && ((aVar = this.zzk) != null ? aVar.equals(findAutocompletePredictionsRequest.getCancellationToken()) : findAutocompletePredictionsRequest.getCancellationToken() == null)) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzk;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final List<String> getCountries() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final Integer getInputOffset() {
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final LocationBias getLocationBias() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final LocationRestriction getLocationRestriction() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final LatLng getOrigin() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final String getQuery() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final String getRegionCode() {
        return this.zzj;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final AutocompleteSessionToken getSessionToken() {
        return this.zzf;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    @Deprecated
    public final TypeFilter getTypeFilter() {
        return this.zzg;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest
    public final List<String> getTypesFilter() {
        return this.zzh;
    }

    public final int hashCode() {
        String str = this.zza;
        int iHashCode = str == null ? 0 : str.hashCode();
        LocationBias locationBias = this.zzb;
        int iHashCode2 = locationBias == null ? 0 : locationBias.hashCode();
        int i5 = iHashCode ^ 1000003;
        LocationRestriction locationRestriction = this.zzc;
        int iHashCode3 = ((((i5 * 1000003) ^ iHashCode2) * 1000003) ^ (locationRestriction == null ? 0 : locationRestriction.hashCode())) * 1000003;
        LatLng latLng = this.zzd;
        int iHashCode4 = (((iHashCode3 ^ (latLng == null ? 0 : latLng.hashCode())) * 1000003) ^ this.zze.hashCode()) * 1000003;
        AutocompleteSessionToken autocompleteSessionToken = this.zzf;
        int iHashCode5 = (iHashCode4 ^ (autocompleteSessionToken == null ? 0 : autocompleteSessionToken.hashCode())) * 1000003;
        TypeFilter typeFilter = this.zzg;
        int iHashCode6 = (((iHashCode5 ^ (typeFilter == null ? 0 : typeFilter.hashCode())) * 1000003) ^ this.zzh.hashCode()) * 1000003;
        Integer num = this.zzi;
        int iHashCode7 = (iHashCode6 ^ (num == null ? 0 : num.hashCode())) * 1000003;
        String str2 = this.zzj;
        int iHashCode8 = (iHashCode7 ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        a aVar = this.zzk;
        return iHashCode8 ^ (aVar != null ? aVar.hashCode() : 0);
    }

    public final String toString() {
        a aVar = this.zzk;
        List list = this.zzh;
        TypeFilter typeFilter = this.zzg;
        AutocompleteSessionToken autocompleteSessionToken = this.zzf;
        List list2 = this.zze;
        LatLng latLng = this.zzd;
        LocationRestriction locationRestriction = this.zzc;
        String strValueOf = String.valueOf(this.zzb);
        String strValueOf2 = String.valueOf(locationRestriction);
        String strValueOf3 = String.valueOf(latLng);
        String string = list2.toString();
        String strValueOf4 = String.valueOf(autocompleteSessionToken);
        String strValueOf5 = String.valueOf(typeFilter);
        String string2 = list.toString();
        String strValueOf6 = String.valueOf(aVar);
        StringBuilder sb2 = new StringBuilder("FindAutocompletePredictionsRequest{query=");
        c0.D(sb2, this.zza, ", locationBias=", strValueOf, ", locationRestriction=");
        c0.D(sb2, strValueOf2, ", origin=", strValueOf3, ", countries=");
        c0.D(sb2, string, ", sessionToken=", strValueOf4, ", typeFilter=");
        c0.D(sb2, strValueOf5, ", typesFilter=", string2, ", inputOffset=");
        sb2.append(this.zzi);
        sb2.append(", regionCode=");
        return c0.s(sb2, this.zzj, ", cancellationToken=", strValueOf6, "}");
    }
}
