package j$.time;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.format.DateTimeFormatter;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class LocalDateTime implements Temporal, j$.time.temporal.l, j$.time.chrono.e, Serializable {
    public static final LocalDateTime c = of(LocalDate.d, LocalTime.e);
    public static final LocalDateTime d = of(LocalDate.e, LocalTime.f);
    private static final long serialVersionUID = 6207766400415563566L;
    public final LocalDate a;
    public final LocalTime b;

    public LocalDateTime(LocalDate localDate, LocalTime localTime) {
        this.a = localDate;
        this.b = localTime;
    }

    public static LocalDateTime B(TemporalAccessor temporalAccessor) {
        if (temporalAccessor instanceof LocalDateTime) {
            return (LocalDateTime) temporalAccessor;
        }
        if (temporalAccessor instanceof ZonedDateTime) {
            return ((ZonedDateTime) temporalAccessor).l();
        }
        if (temporalAccessor instanceof OffsetDateTime) {
            return ((OffsetDateTime) temporalAccessor).toLocalDateTime();
        }
        try {
            return new LocalDateTime(LocalDate.C(temporalAccessor), LocalTime.C(temporalAccessor));
        } catch (c e) {
            h.h("Unable to obtain LocalDateTime from TemporalAccessor: ", temporalAccessor, temporalAccessor.getClass().getName(), e);
            return null;
        }
    }

    public static LocalDateTime D(long j, int i, ZoneOffset zoneOffset) {
        Objects.requireNonNull(zoneOffset, "offset");
        long j2 = i;
        j$.time.temporal.a.NANO_OF_SECOND.s(j2);
        long totalSeconds = j + ((long) zoneOffset.getTotalSeconds());
        return new LocalDateTime(LocalDate.M(a.S(totalSeconds, 86400L)), LocalTime.E((((long) ((int) a.R(totalSeconds, 86400L))) * MathMethodsKt.NANOS_PER_SECOND) + j2));
    }

    public static LocalDateTime of(LocalDate localDate, LocalTime localTime) {
        Objects.requireNonNull(localDate, "date");
        Objects.requireNonNull(localTime, "time");
        return new LocalDateTime(localDate, localTime);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 5, this);
    }

    public final int A(LocalDateTime localDateTime) {
        int iA = this.a.A(localDateTime.e());
        return iA == 0 ? this.b.compareTo(localDateTime.toLocalTime()) : iA;
    }

    public final boolean C(j$.time.chrono.e eVar) {
        if (eVar instanceof LocalDateTime) {
            return A((LocalDateTime) eVar) < 0;
        }
        long jT = e().t();
        long jT2 = eVar.e().t();
        if (jT >= jT2) {
            return jT == jT2 && toLocalTime().L() < eVar.toLocalTime().L();
        }
        return true;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: E, reason: merged with bridge method [inline-methods] */
    public final LocalDateTime c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (LocalDateTime) pVar.h(this, j);
        }
        switch (i.a[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return G(this.a, 0L, 0L, 0L, j);
            case 2:
                LocalDateTime localDateTimeI = I(this.a.P(j / 86400000000L), this.b);
                return localDateTimeI.G(localDateTimeI.a, 0L, 0L, 0L, (j % 86400000000L) * 1000);
            case 3:
                LocalDateTime localDateTimeI2 = I(this.a.P(j / 86400000), this.b);
                return localDateTimeI2.G(localDateTimeI2.a, 0L, 0L, 0L, (j % 86400000) * 1000000);
            case 4:
                return F(j);
            case 5:
                return G(this.a, 0L, j, 0L, 0L);
            case 6:
                return G(this.a, j, 0L, 0L, 0L);
            case 7:
                LocalDateTime localDateTimeI3 = I(this.a.P(j / 256), this.b);
                return localDateTimeI3.G(localDateTimeI3.a, (j % 256) * 12, 0L, 0L, 0L);
            default:
                return I(this.a.c(j, pVar), this.b);
        }
    }

    public final LocalDateTime F(long j) {
        return G(this.a, 0L, 0L, j, 0L);
    }

    public final LocalDateTime G(LocalDate localDate, long j, long j2, long j3, long j4) {
        long j5 = j | j2 | j3 | j4;
        LocalTime localTime = this.b;
        if (j5 == 0) {
            return I(localDate, localTime);
        }
        long j6 = j / 24;
        long j7 = ((j2 % 1440) * 60000000000L) + ((j3 % 86400) * MathMethodsKt.NANOS_PER_SECOND) + (j4 % 86400000000000L);
        long jL = localTime.L();
        long j8 = ((j % 24) * 3600000000000L) + j7 + jL;
        long jS = a.S(j8, 86400000000000L) + j6 + (j2 / 1440) + (j3 / 86400) + (j4 / 86400000000000L);
        long jR = a.R(j8, 86400000000000L);
        return I(localDate.P(jS), jR == jL ? this.b : LocalTime.E(jR));
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: H, reason: merged with bridge method [inline-methods] */
    public final LocalDateTime b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (LocalDateTime) nVar.q(this, j);
        }
        boolean zA = ((j$.time.temporal.a) nVar).A();
        LocalDate localDate = this.a;
        return zA ? I(localDate, this.b.b(j, nVar)) : I(localDate.b(j, nVar), this.b);
    }

    public final LocalDateTime I(LocalDate localDate, LocalTime localTime) {
        return (this.a == localDate && this.b == localTime) ? this : new LocalDateTime(localDate, localTime);
    }

    @Override // j$.time.chrono.e
    public final j$.time.chrono.a a() {
        return ((LocalDate) e()).a();
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar != null && nVar.h(this);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        return aVar.isDateBased() || aVar.A();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof LocalDateTime) {
            LocalDateTime localDateTime = (LocalDateTime) obj;
            if (this.a.equals(localDateTime.a) && this.b.equals(localDateTime.b)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00bf  */
    @Override // j$.time.temporal.Temporal
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long f(j$.time.temporal.Temporal r11, j$.time.temporal.p r12) {
        /*
            Method dump skipped, instruction units count: 278
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.LocalDateTime.f(j$.time.temporal.Temporal, j$.time.temporal.p):long");
    }

    public String format(DateTimeFormatter dateTimeFormatter) {
        Objects.requireNonNull(dateTimeFormatter, "formatter");
        return dateTimeFormatter.format(this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() ? this.b.h(nVar) : this.a.h(nVar) : j$.time.temporal.o.a(this, nVar);
    }

    public final int hashCode() {
        return this.b.hashCode() ^ this.a.hashCode();
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return I(localDate, this.b);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.i(this);
        }
        if (!((j$.time.temporal.a) nVar).A()) {
            return this.a.j(nVar);
        }
        LocalTime localTime = this.b;
        localTime.getClass();
        return j$.time.temporal.o.d(localTime, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(((LocalDate) e()).t(), j$.time.temporal.a.EPOCH_DAY).b(toLocalTime().L(), j$.time.temporal.a.NANO_OF_DAY);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.f ? this.a : a.w(this, aVar);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        long j2;
        if (j == Long.MIN_VALUE) {
            this = c(Long.MAX_VALUE, chronoUnit);
            j2 = 1;
        } else {
            j2 = -j;
        }
        return this.c(j2, chronoUnit);
    }

    @Override // j$.time.chrono.e
    public final j$.time.chrono.j r(ZoneId zoneId) {
        return ZonedDateTime.B(this, null, zoneId);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() ? this.b.s(nVar) : this.a.s(nVar) : nVar.m(this);
    }

    @Override // j$.time.chrono.e
    /* JADX INFO: renamed from: toLocalDate, reason: merged with bridge method [inline-methods] */
    public LocalDate e() {
        return this.a;
    }

    @Override // j$.time.chrono.e
    public LocalTime toLocalTime() {
        return this.b;
    }

    public final String toString() {
        return this.a.toString() + "T" + this.b.toString();
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: w, reason: merged with bridge method [inline-methods] */
    public final int compareTo(j$.time.chrono.e eVar) {
        return eVar instanceof LocalDateTime ? A((LocalDateTime) eVar) : a.i(this, eVar);
    }
}
