package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zznx;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class FetchPlaceRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public FetchPlaceRequest build() {
            zza(zznx.zzj(zzc().getPlaceFields()));
            return zzc();
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNullable
        public abstract String getRegionCode();

        @RecentlyNullable
        public abstract AutocompleteSessionToken getSessionToken();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        @RecentlyNonNull
        public abstract Builder setRegionCode(String str);

        @RecentlyNonNull
        public abstract Builder setSessionToken(AutocompleteSessionToken autocompleteSessionToken);

        public abstract Builder zza(List list);

        public abstract FetchPlaceRequest zzc();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str, @RecentlyNonNull List<Place.Field> list) {
        zze zzeVar = new zze();
        zzeVar.zzb(str);
        zzeVar.zza(list);
        return zzeVar;
    }

    @RecentlyNonNull
    public static FetchPlaceRequest newInstance(@RecentlyNonNull String str, @RecentlyNonNull List<Place.Field> list) {
        return builder(str, list).build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNonNull
    public abstract List<Place.Field> getPlaceFields();

    @RecentlyNonNull
    public abstract String getPlaceId();

    @RecentlyNullable
    public abstract String getRegionCode();

    @RecentlyNullable
    public abstract AutocompleteSessionToken getSessionToken();
}
