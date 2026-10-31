package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.internal.zzmt;
import com.google.android.libraries.places.internal.zzok;

/* loaded from: classes3.dex */
public abstract class LocalTime implements Parcelable, Comparable<LocalTime> {
    @RecentlyNonNull
    public static LocalTime newInstance(int i5, int i11) {
        try {
            zzo zzoVar = new zzo();
            zzoVar.zza(i5);
            zzoVar.zzb(i11);
            LocalTime localTimeZzc = zzoVar.zzc();
            int hours = localTimeZzc.getHours();
            zzmt.zzq(zzok.zzb(0, 23).zzd(Integer.valueOf(hours)), "Hours must not be out-of-range: 0 to 23, but was: %s.", hours);
            int minutes = localTimeZzc.getMinutes();
            zzmt.zzq(zzok.zzb(0, 59).zzd(Integer.valueOf(minutes)), "Minutes must not be out-of-range: 0 to 59, but was: %s.", minutes);
            return localTimeZzc;
        } catch (IllegalStateException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(@RecentlyNonNull LocalTime localTime) {
        int hours;
        int hours2;
        zzmt.zzc(localTime, "compare must not be null.");
        if (this == localTime) {
            return 0;
        }
        if (getHours() == localTime.getHours()) {
            hours = getMinutes();
            hours2 = localTime.getMinutes();
        } else {
            hours = getHours();
            hours2 = localTime.getHours();
        }
        return hours - hours2;
    }

    public abstract int getHours();

    public abstract int getMinutes();
}
