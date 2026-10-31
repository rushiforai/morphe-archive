package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.PhotoMetadata;
import fi.a;

/* loaded from: classes3.dex */
final class zzk extends FetchResolvedPhotoUriRequest {
    private final Integer zza;
    private final Integer zzb;
    private final PhotoMetadata zzc;
    private final a zzd;

    public /* synthetic */ zzk(Integer num, Integer num2, PhotoMetadata photoMetadata, a aVar, zzj zzjVar) {
        this.zza = num;
        this.zzb = num2;
        this.zzc = photoMetadata;
        this.zzd = aVar;
    }

    public final boolean equals(Object obj) {
        a aVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof FetchResolvedPhotoUriRequest) {
            FetchResolvedPhotoUriRequest fetchResolvedPhotoUriRequest = (FetchResolvedPhotoUriRequest) obj;
            Integer num = this.zza;
            if (num != null ? num.equals(fetchResolvedPhotoUriRequest.getMaxWidth()) : fetchResolvedPhotoUriRequest.getMaxWidth() == null) {
                Integer num2 = this.zzb;
                if (num2 != null ? num2.equals(fetchResolvedPhotoUriRequest.getMaxHeight()) : fetchResolvedPhotoUriRequest.getMaxHeight() == null) {
                    if (this.zzc.equals(fetchResolvedPhotoUriRequest.getPhotoMetadata()) && ((aVar = this.zzd) != null ? aVar.equals(fetchResolvedPhotoUriRequest.getCancellationToken()) : fetchResolvedPhotoUriRequest.getCancellationToken() == null)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FetchResolvedPhotoUriRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.FetchResolvedPhotoUriRequest
    public final Integer getMaxHeight() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FetchResolvedPhotoUriRequest
    public final Integer getMaxWidth() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.FetchResolvedPhotoUriRequest
    public final PhotoMetadata getPhotoMetadata() {
        return this.zzc;
    }

    public final int hashCode() {
        Integer num = this.zza;
        int iHashCode = num == null ? 0 : num.hashCode();
        Integer num2 = this.zzb;
        int iHashCode2 = ((((iHashCode ^ 1000003) * 1000003) ^ (num2 == null ? 0 : num2.hashCode())) * 1000003) ^ this.zzc.hashCode();
        a aVar = this.zzd;
        return (iHashCode2 * 1000003) ^ (aVar != null ? aVar.hashCode() : 0);
    }

    public final String toString() {
        a aVar = this.zzd;
        String string = this.zzc.toString();
        String strValueOf = String.valueOf(aVar);
        StringBuilder sb2 = new StringBuilder("FetchResolvedPhotoUriRequest{maxWidth=");
        sb2.append(this.zza);
        sb2.append(", maxHeight=");
        sb2.append(this.zzb);
        sb2.append(", photoMetadata=");
        sb2.append(string);
        sb2.append(", cancellationToken=");
        return c0.q(sb2, strValueOf, "}");
    }
}
