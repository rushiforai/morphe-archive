package com.google.android.libraries.places.api.model;

import b.c0;
import com.google.android.libraries.places.api.model.OpeningHours;
import java.util.List;

/* loaded from: classes3.dex */
abstract class zzr extends OpeningHours {
    private final OpeningHours.HoursType zza;
    private final List zzb;
    private final List zzc;
    private final List zzd;

    public zzr(OpeningHours.HoursType hoursType, List list, List list2, List list3) {
        this.zza = hoursType;
        if (list == null) {
            throw new NullPointerException("Null periods");
        }
        this.zzb = list;
        if (list2 == null) {
            throw new NullPointerException("Null specialDays");
        }
        this.zzc = list2;
        if (list3 == null) {
            throw new NullPointerException("Null weekdayText");
        }
        this.zzd = list3;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof OpeningHours) {
            OpeningHours openingHours = (OpeningHours) obj;
            OpeningHours.HoursType hoursType = this.zza;
            if (hoursType != null ? hoursType.equals(openingHours.getHoursType()) : openingHours.getHoursType() == null) {
                if (this.zzb.equals(openingHours.getPeriods()) && this.zzc.equals(openingHours.getSpecialDays()) && this.zzd.equals(openingHours.getWeekdayText())) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.OpeningHours
    public final OpeningHours.HoursType getHoursType() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.OpeningHours
    public final List<Period> getPeriods() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.OpeningHours
    public final List<SpecialDay> getSpecialDays() {
        return this.zzc;
    }

    @Override // com.google.android.libraries.places.api.model.OpeningHours
    public final List<String> getWeekdayText() {
        return this.zzd;
    }

    public final int hashCode() {
        OpeningHours.HoursType hoursType = this.zza;
        return (((((((hoursType == null ? 0 : hoursType.hashCode()) ^ 1000003) * 1000003) ^ this.zzb.hashCode()) * 1000003) ^ this.zzc.hashCode()) * 1000003) ^ this.zzd.hashCode();
    }

    public final String toString() {
        List list = this.zzd;
        List list2 = this.zzc;
        List list3 = this.zzb;
        String strValueOf = String.valueOf(this.zza);
        String string = list3.toString();
        return c0.s(c0.w("OpeningHours{hoursType=", strValueOf, ", periods=", string, ", specialDays="), list2.toString(), ", weekdayText=", list.toString(), "}");
    }
}
