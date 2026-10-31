package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zznx;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class FindCurrentPlaceRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public FindCurrentPlaceRequest build() {
            zza(zznx.zzj(zzb().getPlaceFields()));
            return zzb();
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        public abstract Builder zza(List list);

        public abstract FindCurrentPlaceRequest zzb();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull List<Place.Field> list) {
        zzq zzqVar = new zzq();
        zzqVar.zza(list);
        return zzqVar;
    }

    @RecentlyNonNull
    public static FindCurrentPlaceRequest newInstance(@RecentlyNonNull List<Place.Field> list) {
        return builder(list).build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNonNull
    public abstract List<Place.Field> getPlaceFields();
}
