package com.google.android.libraries.places.api.net;

import android.net.Uri;
import b.c0;

/* loaded from: classes3.dex */
final class zzl extends FetchResolvedPhotoUriResponse {
    private final Uri zza;

    public zzl(Uri uri) {
        this.zza = uri;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FetchResolvedPhotoUriResponse)) {
            return false;
        }
        FetchResolvedPhotoUriResponse fetchResolvedPhotoUriResponse = (FetchResolvedPhotoUriResponse) obj;
        Uri uri = this.zza;
        return uri == null ? fetchResolvedPhotoUriResponse.getUri() == null : uri.equals(fetchResolvedPhotoUriResponse.getUri());
    }

    @Override // com.google.android.libraries.places.api.net.FetchResolvedPhotoUriResponse
    public final Uri getUri() {
        return this.zza;
    }

    public final int hashCode() {
        Uri uri = this.zza;
        return (uri == null ? 0 : uri.hashCode()) ^ 1000003;
    }

    public final String toString() {
        return c0.l("FetchResolvedPhotoUriResponse{uri=", String.valueOf(this.zza), "}");
    }
}
