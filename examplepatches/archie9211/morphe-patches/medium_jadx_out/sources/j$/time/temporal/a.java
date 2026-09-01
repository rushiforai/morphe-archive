package j$.time.temporal;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.format.x;
import j$.time.format.y;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public enum a implements n {
    NANO_OF_SECOND("NanoOfSecond", r.f(0, 999999999)),
    NANO_OF_DAY("NanoOfDay", r.f(0, 86399999999999L)),
    MICRO_OF_SECOND("MicroOfSecond", r.f(0, 999999)),
    MICRO_OF_DAY("MicroOfDay", r.f(0, 86399999999L)),
    MILLI_OF_SECOND("MilliOfSecond", r.f(0, 999)),
    MILLI_OF_DAY("MilliOfDay", r.f(0, 86399999)),
    SECOND_OF_MINUTE("SecondOfMinute", r.f(0, 59), 0),
    SECOND_OF_DAY("SecondOfDay", r.f(0, 86399)),
    MINUTE_OF_HOUR("MinuteOfHour", r.f(0, 59), 0),
    MINUTE_OF_DAY("MinuteOfDay", r.f(0, 1439)),
    HOUR_OF_AMPM("HourOfAmPm", r.f(0, 11)),
    CLOCK_HOUR_OF_AMPM("ClockHourOfAmPm", r.f(1, 12)),
    HOUR_OF_DAY("HourOfDay", r.f(0, 23), 0),
    CLOCK_HOUR_OF_DAY("ClockHourOfDay", r.f(1, 24)),
    AMPM_OF_DAY("AmPmOfDay", r.f(0, 1), 0),
    DAY_OF_WEEK("DayOfWeek", r.f(1, 7), 0),
    ALIGNED_DAY_OF_WEEK_IN_MONTH("AlignedDayOfWeekInMonth", r.f(1, 7)),
    ALIGNED_DAY_OF_WEEK_IN_YEAR("AlignedDayOfWeekInYear", r.f(1, 7)),
    DAY_OF_MONTH("DayOfMonth", r.g(28, 31), 0),
    DAY_OF_YEAR("DayOfYear", r.g(365, 366)),
    EPOCH_DAY("EpochDay", r.f(-365243219162L, 365241780471L)),
    ALIGNED_WEEK_OF_MONTH("AlignedWeekOfMonth", r.g(4, 5)),
    ALIGNED_WEEK_OF_YEAR("AlignedWeekOfYear", r.f(1, 53)),
    MONTH_OF_YEAR("MonthOfYear", r.f(1, 12), 0),
    PROLEPTIC_MONTH("ProlepticMonth", r.f(-11999999988L, 11999999999L)),
    YEAR_OF_ERA("YearOfEra", r.g(999999999, MathMethodsKt.NANOS_PER_SECOND)),
    YEAR("Year", r.f(-999999999, 999999999), 0),
    ERA("Era", r.f(0, 1), 0),
    INSTANT_SECONDS("InstantSeconds", r.f(Long.MIN_VALUE, Long.MAX_VALUE)),
    OFFSET_SECONDS("OffsetSeconds", r.f(-64800, 64800));

    public final String a;
    public final r b;

    static {
        ChronoUnit chronoUnit = ChronoUnit.NANOS;
    }

    a(String str, r rVar) {
        this.a = str;
        this.b = rVar;
    }

    public final boolean A() {
        return ordinal() < DAY_OF_WEEK.ordinal();
    }

    @Override // j$.time.temporal.n
    public final boolean h(TemporalAccessor temporalAccessor) {
        return temporalAccessor.d(this);
    }

    @Override // j$.time.temporal.n
    public final r i(TemporalAccessor temporalAccessor) {
        return temporalAccessor.j(this);
    }

    @Override // j$.time.temporal.n
    public final boolean isDateBased() {
        return ordinal() >= DAY_OF_WEEK.ordinal() && ordinal() <= ERA.ordinal();
    }

    @Override // j$.time.temporal.n
    public final TemporalAccessor j(Map map, x xVar, y yVar) {
        return null;
    }

    @Override // j$.time.temporal.n
    public final r k() {
        return this.b;
    }

    @Override // j$.time.temporal.n
    public final long m(TemporalAccessor temporalAccessor) {
        return temporalAccessor.s(this);
    }

    @Override // j$.time.temporal.n
    public final Temporal q(Temporal temporal, long j) {
        return temporal.b(j, this);
    }

    public final void s(long j) {
        this.b.b(j, this);
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.a;
    }

    a(String str, r rVar, int i) {
        this.a = str;
        this.b = rVar;
    }
}
