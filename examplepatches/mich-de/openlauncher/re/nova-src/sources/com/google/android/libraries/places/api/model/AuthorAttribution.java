package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.internal.zzmt;

/* loaded from: classes3.dex */
public abstract class AuthorAttribution implements Parcelable {

    public static abstract class Builder {
        @RecentlyNonNull
        public AuthorAttribution build() {
            zzmt.zzf(!zzb().getName().isEmpty(), "Name must not be empty.");
            return zzb();
        }

        @RecentlyNullable
        public abstract String getPhotoUri();

        @RecentlyNullable
        public abstract String getUri();

        @RecentlyNonNull
        public abstract Builder setPhotoUri(String str);

        @RecentlyNonNull
        public abstract Builder setUri(String str);

        public abstract AuthorAttribution zzb();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str) {
        zzd zzdVar = new zzd();
        zzdVar.zza(str);
        return zzdVar;
    }

    @RecentlyNonNull
    public abstract String getName();

    @RecentlyNullable
    public abstract String getPhotoUri();

    @RecentlyNullable
    public abstract String getUri();
}
