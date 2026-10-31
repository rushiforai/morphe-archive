package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.Place;

/* loaded from: classes3.dex */
final class zzh extends FetchPlaceResponse {
    private final Place zza;

    public zzh(Place place) {
        if (place == null) {
            throw new NullPointerException("Null place");
        }
        this.zza = place;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof FetchPlaceResponse) {
            return this.zza.equals(((FetchPlaceResponse) obj).getPlace());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPlaceResponse
    public final Place getPlace() {
        return this.zza;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("FetchPlaceResponse{place=", this.zza.toString(), "}");
    }
}
