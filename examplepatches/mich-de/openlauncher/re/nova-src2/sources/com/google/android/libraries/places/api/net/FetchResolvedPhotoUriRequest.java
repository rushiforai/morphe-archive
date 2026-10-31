package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.PhotoMetadata;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zzmt;
import fi.a;

/* loaded from: classes3.dex */
public abstract class FetchResolvedPhotoUriRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public FetchResolvedPhotoUriRequest build() {
            PhotoMetadata photoMetadataZza = zza();
            Integer maxWidth = getMaxWidth();
            Integer maxHeight = getMaxHeight();
            zzmt.zzf(photoMetadataZza.zza() != null, "To construct the FetchResolvedPhotoUriRequest, the provided PhotoMetadata must be fetched from Places API (New). You must first call initializeWithNewPlacesApiEnabled to initialize the PlaceClient and retrieve the PhotoMetadata. Once you have the PhotoMetadata, you must pass it into the FetchResolvedPhotoUriRequest.");
            if (maxWidth != null) {
                zzmt.zzj(maxWidth.intValue() > 0, "Max width must not be < 1, but was: %s.", maxWidth);
                zzmt.zzk(maxWidth.intValue() <= 4800, "Max width must not be > %s, but was: %s.", 4800, maxWidth);
            }
            if (maxHeight != null) {
                zzmt.zzj(maxHeight.intValue() > 0, "Max height must not be < 1, but was: %s.", maxHeight);
                zzmt.zzk(maxHeight.intValue() <= 4800, "Max height must not be > %s, but was: %s.", 4800, maxHeight);
            }
            if (maxWidth == null && maxHeight == null) {
                int width = photoMetadataZza.getWidth();
                if (width > 0) {
                    setMaxWidth(Integer.valueOf(Math.min(4800, width)));
                }
                int height = photoMetadataZza.getHeight();
                if (height > 0) {
                    setMaxHeight(Integer.valueOf(Math.min(4800, height)));
                }
            }
            zzmt.zzp((getMaxWidth() == null && getMaxHeight() == null) ? false : true, "Must include max width or max height in the request.");
            return zzc();
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNullable
        public abstract Integer getMaxHeight();

        @RecentlyNullable
        public abstract Integer getMaxWidth();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        @RecentlyNonNull
        public abstract Builder setMaxHeight(Integer num);

        @RecentlyNonNull
        public abstract Builder setMaxWidth(Integer num);

        public abstract PhotoMetadata zza();

        public abstract FetchResolvedPhotoUriRequest zzc();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull PhotoMetadata photoMetadata) {
        zzi zziVar = new zzi();
        zziVar.zzb(photoMetadata);
        return zziVar;
    }

    @RecentlyNonNull
    public static FetchResolvedPhotoUriRequest newInstance(@RecentlyNonNull PhotoMetadata photoMetadata) {
        return builder(photoMetadata).build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNullable
    public abstract Integer getMaxHeight();

    @RecentlyNullable
    public abstract Integer getMaxWidth();

    @RecentlyNonNull
    public abstract PhotoMetadata getPhotoMetadata();
}
