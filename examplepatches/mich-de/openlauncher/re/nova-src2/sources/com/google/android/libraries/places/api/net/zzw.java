package com.google.android.libraries.places.api.net;

import b.u4;
import com.google.android.libraries.places.api.model.Place;
import fi.a;

/* loaded from: classes3.dex */
final class zzw extends IsOpenRequest {
    private final Place zza;
    private final String zzb;
    private final long zzc;
    private final a zzd;

    public /* synthetic */ zzw(Place place, String str, long j11, a aVar, zzv zzvVar) {
        this.zza = place;
        this.zzb = str;
        this.zzc = j11;
        this.zzd = aVar;
    }

    public final boolean equals(Object obj) {
        a aVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof IsOpenRequest) {
            IsOpenRequest isOpenRequest = (IsOpenRequest) obj;
            Place place = this.zza;
            if (place != null ? place.equals(isOpenRequest.getPlace()) : isOpenRequest.getPlace() == null) {
                String str = this.zzb;
                if (str != null ? str.equals(isOpenRequest.getPlaceId()) : isOpenRequest.getPlaceId() == null) {
                    if (this.zzc == isOpenRequest.getUtcTimeMillis() && ((aVar = this.zzd) != null ? aVar.equals(isOpenRequest.getCancellationToken()) : isOpenRequest.getCancellationToken() == null)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.IsOpenRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.IsOpenRequest
    public final Place getPlace() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.IsOpenRequest
    public final String getPlaceId() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.IsOpenRequest
    public final long getUtcTimeMillis() {
        return this.zzc;
    }

    public final int hashCode() {
        Place place = this.zza;
        int iHashCode = place == null ? 0 : place.hashCode();
        String str = this.zzb;
        int iHashCode2 = str == null ? 0 : str.hashCode();
        int i5 = iHashCode ^ 1000003;
        long j11 = this.zzc;
        a aVar = this.zzd;
        return (((((i5 * 1000003) ^ iHashCode2) * 1000003) ^ ((int) (j11 ^ (j11 >>> 32)))) * 1000003) ^ (aVar != null ? aVar.hashCode() : 0);
    }

    public final String toString() {
        a aVar = this.zzd;
        String strValueOf = String.valueOf(this.zza);
        String strValueOf2 = String.valueOf(aVar);
        StringBuilder sbK = u4.k("IsOpenRequest{place=", strValueOf, ", placeId=");
        sbK.append(this.zzb);
        sbK.append(", utcTimeMillis=");
        sbK.append(this.zzc);
        sbK.append(", cancellationToken=");
        sbK.append(strValueOf2);
        sbK.append("}");
        return sbK.toString();
    }
}
