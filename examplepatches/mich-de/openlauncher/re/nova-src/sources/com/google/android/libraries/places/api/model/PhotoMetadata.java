package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.internal.zzmt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public abstract class PhotoMetadata implements Parcelable {

    public static abstract class Builder {
        @RecentlyNonNull
        public PhotoMetadata build() {
            PhotoMetadata photoMetadataZzc = zzc();
            int width = photoMetadataZzc.getWidth();
            zzmt.zzq(width >= 0, "Width must not be < 0, but was: %s.", width);
            int height = photoMetadataZzc.getHeight();
            zzmt.zzq(height >= 0, "Height must not be < 0, but was: %s.", height);
            zzmt.zzp(!photoMetadataZzc.zzb().isEmpty(), "PhotoReference must not be null or empty.");
            return photoMetadataZzc;
        }

        @RecentlyNonNull
        public abstract String getAttributions();

        @RecentlyNullable
        public abstract AuthorAttributions getAuthorAttributions();

        public abstract int getHeight();

        public abstract int getWidth();

        @RecentlyNonNull
        public abstract Builder setAttributions(@RecentlyNonNull String str);

        @RecentlyNonNull
        public abstract Builder setAuthorAttributions(AuthorAttributions authorAttributions);

        @RecentlyNonNull
        public abstract Builder setHeight(int i5);

        @RecentlyNonNull
        public abstract Builder setWidth(int i5);

        @RecentlyNonNull
        public abstract Builder zza(String str);

        public abstract PhotoMetadata zzc();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str) {
        zzu zzuVar = new zzu();
        zzuVar.zzb(str);
        zzuVar.setWidth(0);
        zzuVar.setHeight(0);
        zzuVar.setAttributions(b.f42142b);
        return zzuVar;
    }

    @RecentlyNonNull
    public abstract String getAttributions();

    @RecentlyNullable
    public abstract AuthorAttributions getAuthorAttributions();

    public abstract int getHeight();

    public abstract int getWidth();

    @RecentlyNullable
    public abstract String zza();

    @RecentlyNonNull
    public abstract String zzb();
}
