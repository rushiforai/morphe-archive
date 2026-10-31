package com.teslacoilsw.conditions.rules;

import ab.e0;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.chrono.ChronoLocalDateTime;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.TemporalUnit;
import java.util.List;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s extends kx.d {

    /* renamed from: a, reason: collision with root package name */
    public final ConditionModel.TimeOfDayDurationModel f45560a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45561b = e0.U(kx.b.f72746a);

    public s(ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel) {
        this.f45560a = timeOfDayDurationModel;
    }

    @Override // kx.c
    public final jx.o a(jx.f fVar) {
        ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel = this.f45560a;
        List<DayOfWeek> list = timeOfDayDurationModel.f45545d;
        LocalTime localTime = timeOfDayDurationModel.f45543b;
        for (DayOfWeek dayOfWeek : list) {
            a70.d dVar = fVar.f70411f;
            a70.d dVar2 = fVar.f70411f;
            LocalDateTime localDateTimeWithNano = ((LocalDateTime) dVar.getValue()).with(TemporalAdjusters.previousOrSame(dayOfWeek)).withHour(localTime.getHour()).withMinute(localTime.getMinute()).withSecond(0).withNano(0);
            LocalDateTime localDateTimePlus = localDateTimeWithNano.plus(timeOfDayDurationModel.f45544c, (TemporalUnit) ChronoUnit.MINUTES);
            if (localDateTimeWithNano.compareTo((ChronoLocalDateTime<?>) dVar2.getValue()) <= 0 && ((LocalDateTime) dVar2.getValue()).compareTo((ChronoLocalDateTime<?>) localDateTimePlus) < 0) {
                return new jx.o(true);
            }
        }
        return new jx.o(false);
    }

    @Override // kx.c
    public final ConditionModel b() {
        return this.f45560a;
    }

    @Override // kx.c
    public final Set c() {
        return this.f45561b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s) && Intrinsics.b(this.f45560a, ((s) obj).f45560a);
    }

    public final int hashCode() {
        return this.f45560a.hashCode();
    }

    public final String toString() {
        return "TimeOfDayDurationRule(model=" + this.f45560a + ")";
    }
}
