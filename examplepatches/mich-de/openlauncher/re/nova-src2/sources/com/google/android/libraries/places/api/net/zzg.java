package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.Place;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzg extends FetchPlaceRequest {
    private final String zza;
    private final List zzb;
    private final AutocompleteSessionToken zzc;
    private final a zzd;
    private final String zze;

    public /* synthetic */ zzg(String str, List list, AutocompleteSessionToken autocompleteSessionToken, a aVar, String str2, zzf zzfVar) {
        this.zza = str;
        this.zzb = list;
        this.zzc = autocompleteSessionToken;
        this.zzd = aVar;
        this.zze = str2;
    }

    public final boolean equals(Object obj) {
        AutocompleteSessionToken autocompleteSessionToken;
        a aVar;
        String str;
        if (obj == this) {
            return true;
        }
        if (obj instanceof FetchPlaceRequest) {
            FetchPlaceRequest fetchPlaceRequest = (FetchPlaceRequest) obj;
            if (this.zza.equals(fetchPlaceRequest.getPlaceId()) && this.zzb.equals(fetchPlaceRequest.getPlaceFields()) && ((autocompleteSessionToken = this.zzc) != null ? autocompleteSessionToken.equals(fetchPlaceRequest.getSessionToken()) : fetchPlaceRequest.getSessionToken() == null) && ((aVar = this.zzd) != null ? aVar.equals(fetchPlaceRequest.getCancellationToken()) : fetchPlaceRequest.getCancellationToken() == null) && ((str = this.zze) != null ? str.equals(fetchPlaceRequest.getRegionCode()) : fetchPlaceRequest.getRegionCode() == null)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceRequest
    public final List<Place.Field> getPlaceFields() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceRequest
    public final String getPlaceId() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceRequest
    public final String getRegionCode() {
        return this.zze;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceRequest
    public final AutocompleteSessionToken getSessionToken() {
        return this.zzc;
    }

    public final int hashCode() {
        int iHashCode = ((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb.hashCode();
        AutocompleteSessionToken autocompleteSessionToken = this.zzc;
        int iHashCode2 = ((iHashCode * 1000003) ^ (autocompleteSessionToken == null ? 0 : autocompleteSessionToken.hashCode())) * 1000003;
        a aVar = this.zzd;
        int iHashCode3 = (iHashCode2 ^ (aVar == null ? 0 : aVar.hashCode())) * 1000003;
        String str = this.zze;
        return iHashCode3 ^ (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        a aVar = this.zzd;
        AutocompleteSessionToken autocompleteSessionToken = this.zzc;
        String string = this.zzb.toString();
        String strValueOf = String.valueOf(autocompleteSessionToken);
        String strValueOf2 = String.valueOf(aVar);
        StringBuilder sb2 = new StringBuilder("FetchPlaceRequest{placeId=");
        c0.D(sb2, this.zza, ", placeFields=", string, ", sessionToken=");
        c0.D(sb2, strValueOf, ", cancellationToken=", strValueOf2, ", regionCode=");
        return c0.q(sb2, this.zze, "}");
    }
}
