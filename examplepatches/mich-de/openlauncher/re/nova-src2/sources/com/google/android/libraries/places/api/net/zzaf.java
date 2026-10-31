package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
final class zzaf extends SearchNearbyResponse {
    private final List zza;

    public zzaf(List list) {
        if (list == null) {
            throw new NullPointerException("Null places");
        }
        this.zza = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof SearchNearbyResponse) {
            return this.zza.equals(((SearchNearbyResponse) obj).getPlaces());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.SearchNearbyResponse
    public final List<Place> getPlaces() {
        return this.zza;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("SearchNearbyResponse{places=", this.zza.toString(), "}");
    }
}
