package j$.time;

import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class OffsetDateTime implements Temporal, j$.time.temporal.l, Comparable<OffsetDateTime>, Serializable {
    public static final /* synthetic */ int c = 0;
    private static final long serialVersionUID = 2287754244819255394L;
    public final LocalDateTime a;
    public final ZoneOffset b;

    static {
        LocalDateTime localDateTime = LocalDateTime.c;
        ZoneOffset zoneOffset = ZoneOffset.g;
        localDateTime.getClass();
        of(localDateTime, zoneOffset);
        LocalDateTime localDateTime2 = LocalDateTime.d;
        ZoneOffset zoneOffset2 = ZoneOffset.f;
        localDateTime2.getClass();
        of(localDateTime2, zoneOffset2);
    }

    public OffsetDateTime(LocalDateTime localDateTime, ZoneOffset zoneOffset) {
        this.a = (LocalDateTime) Objects.requireNonNull(localDateTime, "dateTime");
        this.b = (ZoneOffset) Objects.requireNonNull(zoneOffset, "offset");
    }

    public static OffsetDateTime A(Instant instant, ZoneId zoneId) {
        Objects.requireNonNull(instant, "instant");
        Objects.requireNonNull(zoneId, "zone");
        ZoneOffset zoneOffsetD = zoneId.B().d(instant);
        return new OffsetDateTime(LocalDateTime.D(instant.getEpochSecond(), instant.getNano(), zoneOffsetD), zoneOffsetD);
    }

    public static OffsetDateTime of(LocalDateTime localDateTime, ZoneOffset zoneOffset) {
        return new OffsetDateTime(localDateTime, zoneOffset);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 10, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: B, reason: merged with bridge method [inline-methods] */
    public final OffsetDateTime c(long j, j$.time.temporal.p pVar) {
        return pVar instanceof ChronoUnit ? C(this.a.c(j, pVar), this.b) : (OffsetDateTime) pVar.h(this, j);
    }

    public final OffsetDateTime C(LocalDateTime localDateTime, ZoneOffset zoneOffset) {
        return (this.a == localDateTime && this.b.equals(zoneOffset)) ? this : new OffsetDateTime(localDateTime, zoneOffset);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (OffsetDateTime) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        int i = n.a[aVar.ordinal()];
        LocalDateTime localDateTime = this.a;
        return i != 1 ? i != 2 ? C(localDateTime.b(j, nVar), this.b) : C(localDateTime, ZoneOffset.ofTotalSeconds(aVar.b.a(j, aVar))) : A(Instant.ofEpochSecond(j, localDateTime.b.getNano()), this.b);
    }

    @Override // java.lang.Comparable
    public final int compareTo(OffsetDateTime offsetDateTime) {
        int iCompare;
        OffsetDateTime offsetDateTime2 = offsetDateTime;
        if (getOffset().equals(offsetDateTime2.getOffset())) {
            iCompare = toLocalDateTime().compareTo(offsetDateTime2.toLocalDateTime());
        } else {
            LocalDateTime localDateTime = this.a;
            ZoneOffset zoneOffset = this.b;
            localDateTime.getClass();
            long jZ = a.z(localDateTime, zoneOffset);
            LocalDateTime localDateTime2 = offsetDateTime2.a;
            ZoneOffset zoneOffset2 = offsetDateTime2.b;
            localDateTime2.getClass();
            iCompare = Long.compare(jZ, a.z(localDateTime2, zoneOffset2));
            if (iCompare == 0) {
                iCompare = this.a.toLocalTime().getNano() - offsetDateTime2.a.toLocalTime().getNano();
            }
        }
        return iCompare == 0 ? toLocalDateTime().compareTo(offsetDateTime2.toLocalDateTime()) : iCompare;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (nVar instanceof j$.time.temporal.a) {
            return true;
        }
        return nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof OffsetDateTime) {
            OffsetDateTime offsetDateTime = (OffsetDateTime) obj;
            if (this.a.equals(offsetDateTime.a) && this.b.equals(offsetDateTime.b)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v11, types: [j$.time.OffsetDateTime] */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4 */
    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        if (temporal instanceof OffsetDateTime) {
            temporal = (OffsetDateTime) temporal;
        } else {
            try {
                ZoneOffset zoneOffsetG = ZoneOffset.G(temporal);
                LocalDate localDate = (LocalDate) temporal.m(j$.time.temporal.o.f);
                LocalTime localTime = (LocalTime) temporal.m(j$.time.temporal.o.g);
                temporal = (localDate == null || localTime == null) ? A(Instant.from(temporal), zoneOffsetG) : new OffsetDateTime(LocalDateTime.of(localDate, localTime), zoneOffsetG);
            } catch (c e) {
                h.h("Unable to obtain OffsetDateTime from TemporalAccessor: ", temporal, temporal.getClass().getName(), e);
                return 0L;
            }
        }
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, temporal);
        }
        ZoneOffset zoneOffset = this.b;
        boolean zEquals = zoneOffset.equals(temporal.b);
        OffsetDateTime offsetDateTime = temporal;
        if (!zEquals) {
            offsetDateTime = new OffsetDateTime(temporal.a.F(zoneOffset.getTotalSeconds() - temporal.b.getTotalSeconds()), zoneOffset);
        }
        return this.a.f(offsetDateTime.a, pVar);
    }

    public ZoneOffset getOffset() {
        return this.b;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return j$.time.temporal.o.a(this, nVar);
        }
        int i = n.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i != 1) {
            return i != 2 ? this.a.h(nVar) : getOffset().getTotalSeconds();
        }
        throw new j$.time.temporal.q("Invalid field 'InstantSeconds' for get() method, use getLong() instead");
    }

    public final int hashCode() {
        return this.b.b ^ this.a.hashCode();
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        LocalDateTime localDateTime = this.a;
        return C(localDateTime.I(localDate, localDateTime.b), this.b);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? (nVar == j$.time.temporal.a.INSTANT_SECONDS || nVar == j$.time.temporal.a.OFFSET_SECONDS) ? ((j$.time.temporal.a) nVar).b : this.a.j(nVar) : nVar.i(this);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(this.a.e().t(), j$.time.temporal.a.EPOCH_DAY).b(this.a.toLocalTime().L(), j$.time.temporal.a.NANO_OF_DAY).b(getOffset().getTotalSeconds(), j$.time.temporal.a.OFFSET_SECONDS);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.d || aVar == j$.time.temporal.o.e) {
            return getOffset();
        }
        if (aVar == j$.time.temporal.o.a) {
            return null;
        }
        return aVar == j$.time.temporal.o.f ? this.a.e() : aVar == j$.time.temporal.o.g ? this.a.toLocalTime() : aVar == j$.time.temporal.o.b ? j$.time.chrono.s.c : aVar == j$.time.temporal.o.c ? ChronoUnit.NANOS : aVar.g(this);
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
        int i = n.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i != 1) {
            return i != 2 ? this.a.s(nVar) : getOffset().getTotalSeconds();
        }
        LocalDateTime localDateTime = this.a;
        ZoneOffset zoneOffset = this.b;
        localDateTime.getClass();
        return a.z(localDateTime, zoneOffset);
    }

    public LocalDateTime toLocalDateTime() {
        return this.a;
    }

    public final String toString() {
        return this.a.toString() + this.b.c;
    }
}
