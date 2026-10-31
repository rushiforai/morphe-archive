package com.teslacoilsw.conditions.rules;

import ab.e0;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t extends kx.d {

    /* renamed from: a, reason: collision with root package name */
    public final ConditionModel.TimeOfDayHourRangeModel f45562a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45563b;

    public t(ConditionModel.TimeOfDayHourRangeModel timeOfDayHourRangeModel) {
        this.f45562a = timeOfDayHourRangeModel;
        LocalTime localTime = timeOfDayHourRangeModel.f45547b;
        LocalTime localTime2 = timeOfDayHourRangeModel.f45548c;
        this.f45563b = e0.U(kx.b.f72746a);
    }

    @Override // kx.c
    public final jx.o a(jx.f fVar) {
        ConditionModel.TimeOfDayHourRangeModel timeOfDayHourRangeModel = this.f45562a;
        Iterator it = timeOfDayHourRangeModel.f45549d.iterator();
        while (it.hasNext()) {
            if (((LocalDateTime) fVar.f70411f.getValue()).getDayOfWeek() == ((DayOfWeek) it.next())) {
                LocalTime localTime = timeOfDayHourRangeModel.f45547b;
                LocalTime localTime2 = timeOfDayHourRangeModel.f45548c;
                jx.s sVar = new jx.s(localTime, localTime2);
                LocalTime localTime3 = ((LocalDateTime) fVar.f70411f.getValue()).toLocalTime();
                if (!sVar.equals(jx.r.f70423d)) {
                    if (localTime.compareTo(localTime2) > 0) {
                        if (localTime.compareTo(localTime3) <= 0 || localTime3.compareTo(localTime2) <= 0) {
                        }
                    } else if (localTime.compareTo(localTime3) > 0 || localTime3.compareTo(localTime2) > 0) {
                    }
                }
                return new jx.o(true);
            }
        }
        return new jx.o(false);
    }

    @Override // kx.c
    public final ConditionModel b() {
        return this.f45562a;
    }

    @Override // kx.c
    public final Set c() {
        return this.f45563b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t) && Intrinsics.b(this.f45562a, ((t) obj).f45562a);
    }

    public final int hashCode() {
        return this.f45562a.hashCode();
    }

    public final String toString() {
        return "TimeOfDayHourRangeRule(model=" + this.f45562a + ")";
    }
}
