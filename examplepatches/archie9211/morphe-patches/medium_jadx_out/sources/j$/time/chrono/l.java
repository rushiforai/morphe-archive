package j$.time.chrono;

import j$.time.Duration;
import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalDateTime;
import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l implements j, Serializable {
    private static final long serialVersionUID = -5261813987200935591L;
    public final transient g a;
    public final transient ZoneOffset b;
    public final transient ZoneId c;

    public l(ZoneId zoneId, ZoneOffset zoneOffset, g gVar) {
        this.a = (g) Objects.requireNonNull(gVar, "dateTime");
        this.b = (ZoneOffset) Objects.requireNonNull(zoneOffset, "offset");
        this.c = (ZoneId) Objects.requireNonNull(zoneId, "zone");
    }

    public static l A(ZoneId zoneId, ZoneOffset zoneOffset, g gVar) {
        Objects.requireNonNull(gVar, "localDateTime");
        Objects.requireNonNull(zoneId, "zone");
        if (zoneId instanceof ZoneOffset) {
            return new l(zoneId, (ZoneOffset) zoneId, gVar);
        }
        j$.time.zone.f fVarB = zoneId.B();
        LocalDateTime localDateTimeB = LocalDateTime.B(gVar);
        List listF = fVarB.f(localDateTimeB);
        if (listF.size() == 1) {
            zoneOffset = (ZoneOffset) listF.get(0);
        } else if (listF.size() == 0) {
            Object objE = fVarB.e(localDateTimeB);
            j$.time.zone.b bVar = objE instanceof j$.time.zone.b ? (j$.time.zone.b) objE : null;
            gVar = gVar.C(gVar.a, 0L, 0L, Duration.ofSeconds(bVar.d.getTotalSeconds() - bVar.c.getTotalSeconds()).getSeconds(), 0L);
            zoneOffset = bVar.d;
        } else {
            if (zoneOffset == null || !listF.contains(zoneOffset)) {
                zoneOffset = (ZoneOffset) listF.get(0);
            }
            gVar = gVar;
        }
        Objects.requireNonNull(zoneOffset, "offset");
        return new l(zoneId, zoneOffset, gVar);
    }

    public static l B(a aVar, Instant instant, ZoneId zoneId) {
        ZoneOffset zoneOffsetD = zoneId.B().d(instant);
        Objects.requireNonNull(zoneOffsetD, "offset");
        return new l(zoneId, zoneOffsetD, (g) aVar.D(LocalDateTime.D(instant.getEpochSecond(), instant.getNano(), zoneOffsetD)));
    }

    public static l k(a aVar, Temporal temporal) {
        l lVar = (l) temporal;
        if (aVar.equals(lVar.a())) {
            return lVar;
        }
        j$.time.h.f("Chronology mismatch, required: ", aVar.C(), lVar.a().C());
        return null;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new e0((byte) 3, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final l c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return k(a(), pVar.h(this, j));
        }
        return k(a(), this.a.c(j, pVar).k(this));
    }

    @Override // j$.time.chrono.j
    public final a a() {
        return this.a.a.a();
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return k(a(), nVar.q(this, j));
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        int i = k.a[aVar.ordinal()];
        if (i == 1) {
            return c(j - j$.time.a.A(this), ChronoUnit.SECONDS);
        }
        if (i != 2) {
            return A(this.c, this.b, this.a.b(j, nVar));
        }
        ZoneOffset zoneOffsetOfTotalSeconds = ZoneOffset.ofTotalSeconds(aVar.b.a(j, aVar));
        g gVar = this.a;
        gVar.getClass();
        return B(a(), Instant.ofEpochSecond(gVar.D(zoneOffsetOfTotalSeconds), gVar.toLocalTime().getNano()), this.c);
    }

    @Override // java.lang.Comparable
    public final /* synthetic */ int compareTo(Object obj) {
        return j$.time.a.j(this, (j) obj);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (nVar instanceof j$.time.temporal.a) {
            return true;
        }
        return nVar != null && nVar.h(this);
    }

    @Override // j$.time.chrono.j
    public final b e() {
        return this.a.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && j$.time.a.j(this, (j) obj) == 0;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        Objects.requireNonNull(temporal, "endExclusive");
        j jVarO = a().O(temporal);
        if (pVar instanceof ChronoUnit) {
            return this.a.f(jVarO.g(this.b).l(), pVar);
        }
        Objects.requireNonNull(pVar, "unit");
        return pVar.between(this, jVarO);
    }

    @Override // j$.time.chrono.j
    public final j g(ZoneId zoneId) {
        Objects.requireNonNull(zoneId, "zone");
        if (this.c.equals(zoneId)) {
            return this;
        }
        g gVar = this.a;
        ZoneOffset zoneOffset = this.b;
        gVar.getClass();
        return B(a(), Instant.ofEpochSecond(gVar.D(zoneOffset), gVar.toLocalTime().getNano()), zoneId);
    }

    @Override // j$.time.chrono.j
    public final ZoneOffset getOffset() {
        return this.b;
    }

    @Override // j$.time.chrono.j
    public final ZoneId getZone() {
        return this.c;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.a.o(this, nVar);
    }

    public final int hashCode() {
        return Integer.rotateLeft(this.c.hashCode(), 3) ^ (this.a.hashCode() ^ this.b.b);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return k(a(), localDate.k(this));
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? (nVar == j$.time.temporal.a.INSTANT_SECONDS || nVar == j$.time.temporal.a.OFFSET_SECONDS) ? ((j$.time.temporal.a) nVar).b : this.a.j(nVar) : nVar.i(this);
    }

    @Override // j$.time.chrono.j
    public final e l() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ Object m(j$.time.format.a aVar) {
        return j$.time.a.x(this, aVar);
    }

    @Override // j$.time.chrono.j
    public final j o(ZoneId zoneId) {
        return A(zoneId, this.b, this.a);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        return k(a(), j$.time.temporal.o.b(this, j, chronoUnit));
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i = i.a[((j$.time.temporal.a) nVar).ordinal()];
        return i != 1 ? i != 2 ? ((g) l()).s(nVar) : getOffset().getTotalSeconds() : z();
    }

    @Override // j$.time.chrono.j
    public final LocalTime toLocalTime() {
        return ((g) l()).toLocalTime();
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
        return j$.time.a.A(this);
    }
}
