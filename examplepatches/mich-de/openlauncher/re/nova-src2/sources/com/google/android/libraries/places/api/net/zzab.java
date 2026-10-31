package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
final class zzab extends SearchByTextResponse {
    private final List zza;

    public zzab(List list) {
        if (list == null) {
            throw new NullPointerException("Null places");
        }
        this.zza = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof SearchByTextResponse) {
            return this.zza.equals(((SearchByTextResponse) obj).getPlaces());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.SearchByTextResponse
    public final List<Place> getPlaces() {
        return this.zza;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("SearchByTextResponse{places=", this.zza.toString(), "}");
    }
}
