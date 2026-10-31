package com.google.android.libraries.places.api.net;

import b.c0;
import com.google.android.libraries.places.api.model.PhotoMetadata;
import fi.a;

/* loaded from: classes3.dex */
final class zzc extends FetchPhotoRequest {
    private final Integer zza;
    private final Integer zzb;
    private final PhotoMetadata zzc;
    private final a zzd;

    public /* synthetic */ zzc(Integer num, Integer num2, PhotoMetadata photoMetadata, a aVar, zzb zzbVar) {
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
        if (obj instanceof FetchPhotoRequest) {
            FetchPhotoRequest fetchPhotoRequest = (FetchPhotoRequest) obj;
            Integer num = this.zza;
            if (num != null ? num.equals(fetchPhotoRequest.getMaxWidth()) : fetchPhotoRequest.getMaxWidth() == null) {
                Integer num2 = this.zzb;
                if (num2 != null ? num2.equals(fetchPhotoRequest.getMaxHeight()) : fetchPhotoRequest.getMaxHeight() == null) {
                    if (this.zzc.equals(fetchPhotoRequest.getPhotoMetadata()) && ((aVar = this.zzd) != null ? aVar.equals(fetchPhotoRequest.getCancellationToken()) : fetchPhotoRequest.getCancellationToken() == null)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPhotoRequest, com.google.android.libraries.places.internal.zzjt
    public final a getCancellationToken() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPhotoRequest
    public final Integer getMaxHeight() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPhotoRequest
    public final Integer getMaxWidth() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.net.FetchPhotoRequest
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
        StringBuilder sb2 = new StringBuilder("FetchPhotoRequest{maxWidth=");
        sb2.append(this.zza);
        sb2.append(", maxHeight=");
        sb2.append(this.zzb);
        sb2.append(", photoMetadata=");
        sb2.append(string);
        sb2.append(", cancellationToken=");
        return c0.q(sb2, strValueOf, "}");
    }
}
