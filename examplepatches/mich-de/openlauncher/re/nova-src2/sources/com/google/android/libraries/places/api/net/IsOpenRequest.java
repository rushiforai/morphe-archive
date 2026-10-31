package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zzmt;
import fi.a;

/* loaded from: classes3.dex */
public abstract class IsOpenRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public IsOpenRequest build() {
            IsOpenRequest isOpenRequestZza = zza();
            Place place = isOpenRequestZza.getPlace();
            if (place != null) {
                zzmt.zzf(place.getId() != null, "Place must have a valid place id.");
            }
            return isOpenRequestZza;
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNonNull
        public abstract Place getPlace();

        @RecentlyNonNull
        public abstract String getPlaceId();

        public abstract long getUtcTimeMillis();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        @RecentlyNonNull
        public abstract Builder setPlace(@RecentlyNonNull Place place);

        @RecentlyNonNull
        public abstract Builder setPlaceId(@RecentlyNonNull String str);

        @RecentlyNonNull
        public abstract Builder setUtcTimeMillis(long j11);

        public abstract IsOpenRequest zza();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull Place place) {
        zzu zzuVar = new zzu();
        zzuVar.setPlace(place);
        zzuVar.setUtcTimeMillis(System.currentTimeMillis());
        return zzuVar;
    }

    @RecentlyNonNull
    public static IsOpenRequest newInstance(@RecentlyNonNull Place place) {
        return builder(place).build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNullable
    public abstract Place getPlace();

    @RecentlyNullable
    public abstract String getPlaceId();

    public abstract long getUtcTimeMillis();

    @RecentlyNonNull
    public static IsOpenRequest newInstance(@RecentlyNonNull Place place, long j11) {
        return builder(place, j11).build();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull Place place, long j11) {
        zzu zzuVar = new zzu();
        zzuVar.setPlace(place);
        zzuVar.setUtcTimeMillis(j11);
        return zzuVar;
    }

    @RecentlyNonNull
    public static IsOpenRequest newInstance(@RecentlyNonNull String str) {
        return builder(str).build();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str) {
        zzu zzuVar = new zzu();
        zzuVar.setPlaceId(str);
        zzuVar.setUtcTimeMillis(System.currentTimeMillis());
        return zzuVar;
    }

    @RecentlyNonNull
    public static IsOpenRequest newInstance(@RecentlyNonNull String str, long j11) {
        return builder(str, j11).build();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str, long j11) {
        zzu zzuVar = new zzu();
        zzuVar.setPlaceId(str);
        zzuVar.setUtcTimeMillis(j11);
        return zzuVar;
    }
}
