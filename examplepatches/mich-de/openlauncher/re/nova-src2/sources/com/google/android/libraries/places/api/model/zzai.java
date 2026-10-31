package com.google.android.libraries.places.api.model;

import a80.m;
import b.c0;

/* loaded from: classes3.dex */
abstract class zzai extends TimeOfWeek {
    private final LocalDate zza;
    private final DayOfWeek zzb;
    private final LocalTime zzc;
    private final boolean zzd;

    public zzai(LocalDate localDate, DayOfWeek dayOfWeek, LocalTime localTime, boolean z11) {
        this.zza = localDate;
        if (dayOfWeek == null) {
            throw new NullPointerException("Null day");
        }
        this.zzb = dayOfWeek;
        if (localTime == null) {
            throw new NullPointerException("Null time");
        }
        this.zzc = localTime;
        this.zzd = z11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof TimeOfWeek) {
            TimeOfWeek timeOfWeek = (TimeOfWeek) obj;
            LocalDate localDate = this.zza;
            if (localDate != null ? localDate.equals(timeOfWeek.getDate()) : timeOfWeek.getDate() == null) {
                if (this.zzb.equals(timeOfWeek.getDay()) && this.zzc.equals(timeOfWeek.getTime()) && this.zzd == timeOfWeek.isTruncated()) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.TimeOfWeek
    public final LocalDate getDate() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.TimeOfWeek
    public final DayOfWeek getDay() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.TimeOfWeek
    public final LocalTime getTime() {
        return this.zzc;
    }

    public final int hashCode() {
        LocalDate localDate = this.zza;
        return (((((((localDate == null ? 0 : localDate.hashCode()) ^ 1000003) * 1000003) ^ this.zzb.hashCode()) * 1000003) ^ this.zzc.hashCode()) * 1000003) ^ (true != this.zzd ? 1237 : 1231);
    }

    @Override // com.google.android.libraries.places.api.model.TimeOfWeek
    public final boolean isTruncated() {
        return this.zzd;
    }

    public final String toString() {
        LocalTime localTime = this.zzc;
        DayOfWeek dayOfWeek = this.zzb;
        String strValueOf = String.valueOf(this.zza);
        String string = dayOfWeek.toString();
        String string2 = localTime.toString();
        StringBuilder sbW = c0.w("TimeOfWeek{date=", strValueOf, ", day=", string, ", time=");
        sbW.append(string2);
        sbW.append(", truncated=");
        return m.k(sbW, this.zzd, "}");
    }
}
