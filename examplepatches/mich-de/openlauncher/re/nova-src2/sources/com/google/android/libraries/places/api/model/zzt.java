package com.google.android.libraries.places.api.model;

import b.c0;

/* loaded from: classes3.dex */
abstract class zzt extends Period {
    private final TimeOfWeek zza;
    private final TimeOfWeek zzb;

    public zzt(TimeOfWeek timeOfWeek, TimeOfWeek timeOfWeek2) {
        this.zza = timeOfWeek;
        this.zzb = timeOfWeek2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof Period) {
            Period period = (Period) obj;
            TimeOfWeek timeOfWeek = this.zza;
            if (timeOfWeek != null ? timeOfWeek.equals(period.getOpen()) : period.getOpen() == null) {
                TimeOfWeek timeOfWeek2 = this.zzb;
                if (timeOfWeek2 != null ? timeOfWeek2.equals(period.getClose()) : period.getClose() == null) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.Period
    public final TimeOfWeek getClose() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.Period
    public final TimeOfWeek getOpen() {
        return this.zza;
    }

    public final int hashCode() {
        TimeOfWeek timeOfWeek = this.zza;
        int iHashCode = timeOfWeek == null ? 0 : timeOfWeek.hashCode();
        TimeOfWeek timeOfWeek2 = this.zzb;
        return ((iHashCode ^ 1000003) * 1000003) ^ (timeOfWeek2 != null ? timeOfWeek2.hashCode() : 0);
    }

    public final String toString() {
        return c0.n("Period{open=", String.valueOf(this.zza), ", close=", String.valueOf(this.zzb), "}");
    }
}
