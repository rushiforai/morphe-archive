package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.Place;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzs extends FindCurrentPlaceRequest {
    private final List zza;
    private final a zzb;

    public /* synthetic */ zzs(List list, a aVar, zzr zzrVar) {
        this.zza = list;
        this.zzb = aVar;
    }

    public final boolean equals(Object obj) {
        a aVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof FindCurrentPlaceRequest) {
            FindCurrentPlaceRequest findCurrentPlaceRequest = (FindCurrentPlaceRequest) obj;
            if (this.zza.equals(findCurrentPlaceRequest.getPlaceFields()) && ((aVar = this.zzb) != null ? aVar.equals(findCurrentPlaceRequest.getCancellationToken()) : findCurrentPlaceRequest.getCancellationToken() == null)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest
    public final List<Place.Field> getPlaceFields() {
        return this.zza;
    }

    public final int hashCode() {
        int iHashCode = this.zza.hashCode() ^ 1000003;
        a aVar = this.zzb;
        return (iHashCode * 1000003) ^ (aVar == null ? 0 : aVar.hashCode());
    }

    public final String toString() {
        return c0.n("FindCurrentPlaceRequest{placeFields=", this.zza.toString(), ", cancellationToken=", String.valueOf(this.zzb), "}");
    }
}
