package j$.time.chrono;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g implements e, Temporal, j$.time.temporal.l, Serializable {
    private static final long serialVersionUID = 4556003607393004514L;
    public final transient b a;
    public final transient LocalTime b;

    public g(b bVar, LocalTime localTime) {
        Objects.requireNonNull(bVar, "date");
        Objects.requireNonNull(localTime, "time");
        this.a = bVar;
        this.b = localTime;
    }

    public static g A(a aVar, Temporal temporal) {
        g gVar = (g) temporal;
        if (aVar.equals(gVar.a.a())) {
            return gVar;
        }
        j$.time.h.f("Chronology mismatch, required: ", aVar.C(), gVar.a.a().C());
        return null;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new e0((byte) 2, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: B, reason: merged with bridge method [inline-methods] */
    public final g c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return A(this.a.a(), pVar.h(this, j));
        }
        switch (f.a[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return C(this.a, 0L, 0L, 0L, j);
            case 2:
                g gVarF = F(this.a.c(j / 86400000000L, (j$.time.temporal.p) ChronoUnit.DAYS), this.b);
                return gVarF.C(gVarF.a, 0L, 0L, 0L, (j % 86400000000L) * 1000);
            case 3:
                g gVarF2 = F(this.a.c(j / 86400000, (j$.time.temporal.p) ChronoUnit.DAYS), this.b);
                return gVarF2.C(gVarF2.a, 0L, 0L, 0L, (j % 86400000) * 1000000);
            case 4:
                return C(this.a, 0L, 0L, j, 0L);
            case 5:
                return C(this.a, 0L, j, 0L, 0L);
            case 6:
                return C(this.a, j, 0L, 0L, 0L);
            case 7:
                g gVarF3 = F(this.a.c(j / 256, (j$.time.temporal.p) ChronoUnit.DAYS), this.b);
                return gVarF3.C(gVarF3.a, (j % 256) * 12, 0L, 0L, 0L);
            default:
                return F(this.a.c(j, pVar), this.b);
        }
    }

    public final g C(b bVar, long j, long j2, long j3, long j4) {
        long j5 = j | j2 | j3 | j4;
        LocalTime localTime = this.b;
        if (j5 == 0) {
            return F(bVar, localTime);
        }
        long j6 = j / 24;
        long j7 = ((j2 % 1440) * 60000000000L) + ((j3 % 86400) * MathMethodsKt.NANOS_PER_SECOND) + (j4 % 86400000000000L);
        long jL = localTime.L();
        long j8 = ((j % 24) * 3600000000000L) + j7 + jL;
        long jS = j$.time.a.S(j8, 86400000000000L) + j6 + (j2 / 1440) + (j3 / 86400) + (j4 / 86400000000000L);
        long jR = j$.time.a.R(j8, 86400000000000L);
        return F(bVar.c(jS, (j$.time.temporal.p) ChronoUnit.DAYS), jR == jL ? this.b : LocalTime.E(jR));
    }

    public final /* synthetic */ long D(ZoneOffset zoneOffset) {
        return j$.time.a.z(this, zoneOffset);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: E, reason: merged with bridge method [inline-methods] */
    public final g b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return A(this.a.a(), nVar.q(this, j));
        }
        boolean zA = ((j$.time.temporal.a) nVar).A();
        b bVar = this.a;
        return zA ? F(bVar, this.b.b(j, nVar)) : F(bVar.b(j, nVar), this.b);
    }

    public final g F(Temporal temporal, LocalTime localTime) {
        b bVar = this.a;
        return (bVar == temporal && this.b == localTime) ? this : new g(d.A(bVar.a(), temporal), localTime);
    }

    @Override // j$.time.chrono.e
    public final a a() {
        return this.a.a();
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar != null && nVar.h(this);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        return aVar.isDateBased() || aVar.A();
    }

    @Override // j$.time.chrono.e
    public final b e() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && j$.time.a.i(this, (e) obj) == 0;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        Objects.requireNonNull(temporal, "endExclusive");
        e eVarD = this.a.a().D(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            Objects.requireNonNull(pVar, "unit");
            return pVar.between(this, eVarD);
        }
        ChronoUnit chronoUnit = (ChronoUnit) pVar;
        ChronoUnit chronoUnit2 = ChronoUnit.DAYS;
        if (chronoUnit.compareTo(chronoUnit2) >= 0) {
            b bVarE = eVarD.e();
            if (eVarD.toLocalTime().compareTo(this.b) < 0) {
                bVarE = bVarE.q(1L, chronoUnit2);
            }
            return this.a.f(bVarE, pVar);
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.EPOCH_DAY;
        long jS = eVarD.s(aVar) - this.a.s(aVar);
        switch (f.a[chronoUnit.ordinal()]) {
            case 1:
                jS = j$.time.a.T(jS, 86400000000000L);
                break;
            case 2:
                jS = j$.time.a.T(jS, 86400000000L);
                break;
            case 3:
                jS = j$.time.a.T(jS, 86400000L);
                break;
            case 4:
                jS = j$.time.a.T(jS, 86400L);
                break;
            case 5:
                jS = j$.time.a.T(jS, 1440L);
                break;
            case 6:
                jS = j$.time.a.T(jS, 24L);
                break;
            case 7:
                jS = j$.time.a.T(jS, 2L);
                break;
        }
        return j$.time.a.O(jS, this.b.f(eVarD.toLocalTime(), pVar));
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() ? this.b.h(nVar) : this.a.h(nVar) : j(nVar).a(s(nVar), nVar);
    }

    public final int hashCode() {
        return this.b.hashCode() ^ this.a.hashCode();
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return F(localDate, this.b);
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
        return temporal.b(e().t(), j$.time.temporal.a.EPOCH_DAY).b(toLocalTime().L(), j$.time.temporal.a.NANO_OF_DAY);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ Object m(j$.time.format.a aVar) {
        return j$.time.a.w(this, aVar);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        return A(this.a.a(), j$.time.temporal.o.b(this, j, chronoUnit));
    }

    @Override // j$.time.chrono.e
    public final j r(ZoneId zoneId) {
        return l.A(zoneId, null, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() ? this.b.s(nVar) : this.a.s(nVar) : nVar.m(this);
    }

    @Override // j$.time.chrono.e
    public final LocalTime toLocalTime() {
        return this.b;
    }

    public final String toString() {
        return this.a.toString() + "T" + this.b.toString();
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: w */
    public final /* synthetic */ int compareTo(e eVar) {
        return j$.time.a.i(this, eVar);
    }
}
