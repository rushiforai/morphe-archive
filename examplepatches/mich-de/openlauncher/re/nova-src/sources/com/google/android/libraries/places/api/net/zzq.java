package com.google.android.libraries.places.api.net;

import com.google.android.libraries.places.api.net.FindCurrentPlaceRequest;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
final class zzq extends FindCurrentPlaceRequest.Builder {
    private List zza;
    private a zzb;

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest.Builder
    public final a getCancellationToken() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest.Builder
    public final FindCurrentPlaceRequest.Builder setCancellationToken(a aVar) {
        this.zzb = aVar;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest.Builder
    public final FindCurrentPlaceRequest.Builder zza(List list) {
        if (list == null) {
            throw new NullPointerException("Null placeFields");
        }
        this.zza = list;
        return this;
    }

    @Override // com.google.android.libraries.places.api.net.FindCurrentPlaceRequest.Builder
    public final FindCurrentPlaceRequest zzb() {
        List list = this.zza;
        if (list != null) {
            return new zzs(list, this.zzb, null);
        }
        throw new IllegalStateException("Missing required properties: placeFields");
    }
}
