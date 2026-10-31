package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.PlaceLikelihood;
import java.util.List;

/* loaded from: classes3.dex */
final class zzt extends FindCurrentPlaceResponse {
    private final List zza;

    public zzt(List list) {
        if (list == null) {
            throw new NullPointerException("Null placeLikelihoods");
        }
        this.zza = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof FindCurrentPlaceResponse) {
            return this.zza.equals(((FindCurrentPlaceResponse) obj).getPlaceLikelihoods());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceResponse
    public final List<PlaceLikelihood> getPlaceLikelihoods() {
        return this.zza;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("FindCurrentPlaceResponse{placeLikelihoods=", this.zza.toString(), "}");
    }
}
