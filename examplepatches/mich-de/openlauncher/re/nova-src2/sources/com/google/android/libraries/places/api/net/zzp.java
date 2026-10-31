package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import java.util.List;

/* loaded from: classes3.dex */
final class zzp extends FindAutocompletePredictionsResponse {
    private final List zza;

    public zzp(List list) {
        if (list == null) {
            throw new NullPointerException("Null autocompletePredictions");
        }
        this.zza = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof FindAutocompletePredictionsResponse) {
            return this.zza.equals(((FindAutocompletePredictionsResponse) obj).getAutocompletePredictions());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse
    public final List<AutocompletePrediction> getAutocompletePredictions() {
        return this.zza;
    }

    public final int hashCode() {
        return this.zza.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.l("FindAutocompletePredictionsResponse{autocompletePredictions=", this.zza.toString(), "}");
    }
}
