package j$.time;

import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class ZonedDateTime implements Temporal, j$.time.chrono.j, Serializable {
    private static final long serialVersionUID = -6260982410461394882L;
    public final LocalDateTime a;
    public final ZoneOffset b;
    public final ZoneId c;

    public ZonedDateTime(LocalDateTime localDateTime, ZoneOffset zoneOffset, ZoneId zoneId) {
        this.a = localDateTime;
        this.b = zoneOffset;
        this.c = zoneId;
    }

    public static ZonedDateTime A(TemporalAccessor temporalAccessor) {
        if (temporalAccessor instanceof ZonedDateTime) {
            return (ZonedDateTime) temporalAccessor;
        }
        try {
            ZoneId zoneIdA = ZoneId.A(temporalAccessor);
            j$.time.temporal.a aVar = j$.time.temporal.a.INSTANT_SECONDS;
            return temporalAccessor.d(aVar) ? k(temporalAccessor.s(aVar), temporalAccessor.h(j$.time.temporal.a.NANO_OF_SECOND), zoneIdA) : B(LocalDateTime.of(LocalDate.C(temporalAccessor), LocalTime.C(temporalAccessor)), null, zoneIdA);
        } catch (c e) {
            h.h("Unable to obtain ZonedDateTime from TemporalAccessor: ", temporalAccessor, temporalAccessor.getClass().getName(), e);
            return null;
        }
    }

    public static ZonedDateTime B(LocalDateTime localDateTime, ZoneOffset zoneOffset, ZoneId zoneId) {
        Objects.requireNonNull(localDateTime, "localDateTime");
        Objects.requireNonNull(zoneId, "zone");
        if (zoneId instanceof ZoneOffset) {
            return new ZonedDateTime(localDateTime, (ZoneOffset) zoneId, zoneId);
        }
        j$.time.zone.f fVarB = zoneId.B();
        List listF = fVarB.f(localDateTime);
        if (listF.size() == 1) {
            zoneOffset = (ZoneOffset) listF.get(0);
        } else if (listF.size() == 0) {
            Object objE = fVarB.e(localDateTime);
            j$.time.zone.b bVar = objE instanceof j$.time.zone.b ? (j$.time.zone.b) objE : null;
            localDateTime = localDateTime.F(Duration.ofSeconds(bVar.d.getTotalSeconds() - bVar.c.getTotalSeconds()).getSeconds());
            zoneOffset = bVar.d;
        } else if (zoneOffset == null || !listF.contains(zoneOffset)) {
            zoneOffset = (ZoneOffset) Objects.requireNonNull((ZoneOffset) listF.get(0), "offset");
        }
        return new ZonedDateTime(localDateTime, zoneOffset, zoneId);
    }

    public static ZonedDateTime k(long j, int i, ZoneId zoneId) {
        ZoneOffset zoneOffsetD = zoneId.B().d(Instant.ofEpochSecond(j, i));
        return new ZonedDateTime(LocalDateTime.D(j, i, zoneOffsetD), zoneOffsetD, zoneId);
    }

    public static ZonedDateTime ofInstant(LocalDateTime localDateTime, ZoneOffset zoneOffset, ZoneId zoneId) {
        Objects.requireNonNull(localDateTime, "localDateTime");
        Objects.requireNonNull(zoneOffset, "offset");
        Objects.requireNonNull(zoneId, "zone");
        if (zoneId.B().f(localDateTime).contains(zoneOffset)) {
            return new ZonedDateTime(localDateTime, zoneOffset, zoneId);
        }
        localDateTime.getClass();
        return k(a.z(localDateTime, zoneOffset), localDateTime.b.getNano(), zoneId);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 6, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final ZonedDateTime c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (ZonedDateTime) pVar.h(this, j);
        }
        ChronoUnit chronoUnit = (ChronoUnit) pVar;
        boolean z = chronoUnit.compareTo(ChronoUnit.DAYS) >= 0 && chronoUnit != ChronoUnit.FOREVER;
        LocalDateTime localDateTime = this.a;
        if (z) {
            return B(localDateTime.c(j, pVar), this.b, this.c);
        }
        return ofInstant(localDateTime.c(j, pVar), this.b, this.c);
    }

    @Override // j$.time.chrono.j
    /* JADX INFO: renamed from: D, reason: merged with bridge method [inline-methods] */
    public final ZonedDateTime g(ZoneId zoneId) {
        Objects.requireNonNull(zoneId, "zone");
        if (this.c.equals(zoneId)) {
            return this;
        }
        LocalDateTime localDateTime = this.a;
        ZoneOffset zoneOffset = this.b;
        localDateTime.getClass();
        return k(a.z(localDateTime, zoneOffset), this.a.b.getNano(), zoneId);
    }

    @Override // j$.time.chrono.j
    public final j$.time.chrono.a a() {
        return ((LocalDate) e()).a();
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (ZonedDateTime) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        int i = t.a[aVar.ordinal()];
        if (i == 1) {
            return k(j, this.a.b.getNano(), this.c);
        }
        if (i != 2) {
            return B(this.a.b(j, nVar), this.b, this.c);
        }
        ZoneOffset zoneOffsetOfTotalSeconds = ZoneOffset.ofTotalSeconds(aVar.b.a(j, aVar));
        return (zoneOffsetOfTotalSeconds.equals(this.b) || !this.c.B().f(this.a).contains(zoneOffsetOfTotalSeconds)) ? this : new ZonedDateTime(this.a, zoneOffsetOfTotalSeconds, this.c);
    }

    @Override // java.lang.Comparable
    public final /* synthetic */ int compareTo(Object obj) {
        return a.j(this, (j$.time.chrono.j) obj);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (nVar instanceof j$.time.temporal.a) {
            return true;
        }
        return nVar != null && nVar.h(this);
    }

    @Override // j$.time.chrono.j
    public final j$.time.chrono.b e() {
        return this.a.e();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ZonedDateTime) {
            ZonedDateTime zonedDateTime = (ZonedDateTime) obj;
            if (this.a.equals(zonedDateTime.a) && this.b.equals(zonedDateTime.b) && this.c.equals(zonedDateTime.c)) {
                return true;
            }
        }
        return false;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        ZonedDateTime zonedDateTimeA = A(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, zonedDateTimeA);
        }
        ZonedDateTime zonedDateTimeG = zonedDateTimeA.g(this.c);
        ChronoUnit chronoUnit = (ChronoUnit) pVar;
        return (chronoUnit.compareTo(ChronoUnit.DAYS) < 0 || chronoUnit == ChronoUnit.FOREVER) ? OffsetDateTime.of(this.a, this.b).f(OffsetDateTime.of(zonedDateTimeG.a, zonedDateTimeG.b), pVar) : this.a.f(zonedDateTimeG.a, pVar);
    }

    @Override // j$.time.chrono.j
    public ZoneOffset getOffset() {
        return this.b;
    }

    @Override // j$.time.chrono.j
    public ZoneId getZone() {
        return this.c;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return a.o(this, nVar);
        }
        int i = t.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i != 1) {
            return i != 2 ? this.a.h(nVar) : getOffset().getTotalSeconds();
        }
        throw new j$.time.temporal.q("Invalid field 'InstantSeconds' for get() method, use getLong() instead");
    }

    public final int hashCode() {
        return Integer.rotateLeft(this.c.hashCode(), 3) ^ (this.a.hashCode() ^ this.b.b);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return B(LocalDateTime.of(localDate, this.a.toLocalTime()), this.b, this.c);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? (nVar == j$.time.temporal.a.INSTANT_SECONDS || nVar == j$.time.temporal.a.OFFSET_SECONDS) ? ((j$.time.temporal.a) nVar).b : this.a.j(nVar) : nVar.i(this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.f ? this.a.e() : a.x(this, aVar);
    }

    @Override // j$.time.chrono.j
    public final j$.time.chrono.j o(ZoneId zoneId) {
        Objects.requireNonNull(zoneId, "zone");
        return this.c.equals(zoneId) ? this : B(this.a, this.b, zoneId);
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

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i = t.a[((j$.time.temporal.a) nVar).ordinal()];
        return i != 1 ? i != 2 ? this.a.s(nVar) : getOffset().getTotalSeconds() : a.A(this);
    }

    @Override // j$.time.chrono.j
    /* JADX INFO: renamed from: toLocalDateTime, reason: merged with bridge method [inline-methods] */
    public LocalDateTime l() {
        return this.a;
    }

    @Override // j$.time.chrono.j
    public final LocalTime toLocalTime() {
        return this.a.toLocalTime();
    }

    public final String toString() {
        String str = this.a.toString() + this.b.c;
        ZoneOffset zoneOffset = this.b;
        ZoneId zoneId = this.c;
        if (zoneOffset == zoneId) {
            return str;
        }
        return str + "[" + zoneId.toString() + "]";
    }

    @Override // j$.time.chrono.j
    public final /* synthetic */ long z() {
        return a.A(this);
    }
}
