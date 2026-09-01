package j$.time;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class OffsetTime implements Temporal, j$.time.temporal.l, Comparable<OffsetTime>, Serializable {
    public static final /* synthetic */ int c = 0;
    private static final long serialVersionUID = 7264499704384272492L;
    public final LocalTime a;
    public final ZoneOffset b;

    static {
        LocalTime localTime = LocalTime.e;
        ZoneOffset zoneOffset = ZoneOffset.g;
        localTime.getClass();
        of(localTime, zoneOffset);
        LocalTime localTime2 = LocalTime.f;
        ZoneOffset zoneOffset2 = ZoneOffset.f;
        localTime2.getClass();
        of(localTime2, zoneOffset2);
    }

    public OffsetTime(LocalTime localTime, ZoneOffset zoneOffset) {
        this.a = (LocalTime) Objects.requireNonNull(localTime, "time");
        this.b = (ZoneOffset) Objects.requireNonNull(zoneOffset, "offset");
    }

    public static OffsetTime of(LocalTime localTime, ZoneOffset zoneOffset) {
        return new OffsetTime(localTime, zoneOffset);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 9, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: A, reason: merged with bridge method [inline-methods] */
    public final OffsetTime c(long j, j$.time.temporal.p pVar) {
        return pVar instanceof ChronoUnit ? C(this.a.c(j, pVar), this.b) : (OffsetTime) pVar.h(this, j);
    }

    public final long B() {
        return this.a.L() - (((long) this.b.getTotalSeconds()) * MathMethodsKt.NANOS_PER_SECOND);
    }

    public final OffsetTime C(LocalTime localTime, ZoneOffset zoneOffset) {
        return (this.a == localTime && this.b.equals(zoneOffset)) ? this : new OffsetTime(localTime, zoneOffset);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (OffsetTime) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.OFFSET_SECONDS;
        LocalTime localTime = this.a;
        if (nVar != aVar) {
            return C(localTime.b(j, nVar), this.b);
        }
        j$.time.temporal.a aVar2 = (j$.time.temporal.a) nVar;
        return C(localTime, ZoneOffset.ofTotalSeconds(aVar2.b.a(j, aVar2)));
    }

    @Override // java.lang.Comparable
    public final int compareTo(OffsetTime offsetTime) {
        OffsetTime offsetTime2 = offsetTime;
        if (this.b.equals(offsetTime2.b)) {
            return this.a.compareTo(offsetTime2.a);
        }
        int iCompare = Long.compare(B(), offsetTime2.B());
        return iCompare == 0 ? this.a.compareTo(offsetTime2.a) : iCompare;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() || nVar == j$.time.temporal.a.OFFSET_SECONDS : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof OffsetTime) {
            OffsetTime offsetTime = (OffsetTime) obj;
            if (this.a.equals(offsetTime.a) && this.b.equals(offsetTime.b)) {
                return true;
            }
        }
        return false;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        OffsetTime offsetTime;
        if (temporal instanceof OffsetTime) {
            offsetTime = (OffsetTime) temporal;
        } else {
            try {
                offsetTime = new OffsetTime(LocalTime.C(temporal), ZoneOffset.G(temporal));
            } catch (c e) {
                h.h("Unable to obtain OffsetTime from TemporalAccessor: ", temporal, temporal.getClass().getName(), e);
                return 0L;
            }
        }
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, offsetTime);
        }
        long jB = offsetTime.B() - B();
        switch (o.a[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return jB;
            case 2:
                return jB / 1000;
            case 3:
                return jB / 1000000;
            case 4:
                return jB / MathMethodsKt.NANOS_PER_SECOND;
            case 5:
                return jB / 60000000000L;
            case 6:
                return jB / 3600000000000L;
            case 7:
                return jB / 43200000000000L;
            default:
                h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    public ZoneOffset getOffset() {
        return this.b;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.a(this, nVar);
    }

    public final int hashCode() {
        return this.b.b ^ this.a.hashCode();
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (OffsetTime) a.a(localDate, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.i(this);
        }
        if (nVar == j$.time.temporal.a.OFFSET_SECONDS) {
            return ((j$.time.temporal.a) nVar).b;
        }
        LocalTime localTime = this.a;
        localTime.getClass();
        return j$.time.temporal.o.d(localTime, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(this.a.L(), j$.time.temporal.a.NANO_OF_DAY).b(this.b.getTotalSeconds(), j$.time.temporal.a.OFFSET_SECONDS);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.d || aVar == j$.time.temporal.o.e) {
            return this.b;
        }
        if (((aVar == j$.time.temporal.o.a) || (aVar == j$.time.temporal.o.b)) || aVar == j$.time.temporal.o.f) {
            return null;
        }
        return aVar == j$.time.temporal.o.g ? this.a : aVar == j$.time.temporal.o.c ? ChronoUnit.NANOS : aVar.g(this);
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
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.OFFSET_SECONDS ? this.b.getTotalSeconds() : this.a.s(nVar) : nVar.m(this);
    }

    public LocalTime toLocalTime() {
        return this.a;
    }

    public final String toString() {
        return this.a.toString() + this.b.c;
    }
}
