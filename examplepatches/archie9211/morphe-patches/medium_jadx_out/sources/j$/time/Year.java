package j$.time;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.format.y;
import j$.time.format.z;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class Year implements Temporal, j$.time.temporal.l, Comparable<Year>, Serializable {
    public static final /* synthetic */ int b = 0;
    private static final long serialVersionUID = -23038383694477807L;
    public final int a;

    static {
        j$.time.format.p pVar = new j$.time.format.p();
        pVar.h(j$.time.temporal.a.YEAR, 4, 10, z.EXCEEDS_PAD);
        pVar.l(Locale.getDefault(), y.SMART, null);
    }

    public Year(int i) {
        this.a = i;
    }

    public static Year of(int i) {
        j$.time.temporal.a.YEAR.s(i);
        return new Year(i);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 11, this);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: A, reason: merged with bridge method [inline-methods] */
    public final Year c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (Year) pVar.h(this, j);
        }
        int i = q.b[((ChronoUnit) pVar).ordinal()];
        if (i == 1) {
            return B(j);
        }
        if (i == 2) {
            return B(a.T(j, 10L));
        }
        if (i == 3) {
            return B(a.T(j, 100L));
        }
        if (i == 4) {
            return B(a.T(j, 1000L));
        }
        if (i == 5) {
            j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
            return b(a.O(s(aVar), j), aVar);
        }
        h.b(pVar, "Unsupported unit: ");
        return null;
    }

    public final Year B(long j) {
        if (j == 0) {
            return this;
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return of(aVar.b.a(((long) this.a) + j, aVar));
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final Year b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (Year) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        aVar.s(j);
        int i = q.a[aVar.ordinal()];
        if (i == 1) {
            if (this.a < 1) {
                j = 1 - j;
            }
            return of((int) j);
        }
        if (i == 2) {
            return of((int) j);
        }
        if (i == 3) {
            return s(j$.time.temporal.a.ERA) == j ? this : of(1 - this.a);
        }
        throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Year year) {
        return this.a - year.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.YEAR || nVar == j$.time.temporal.a.YEAR_OF_ERA || nVar == j$.time.temporal.a.ERA : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Year) && this.a == ((Year) obj).a;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        Year yearOf;
        if (temporal instanceof Year) {
            yearOf = (Year) temporal;
        } else {
            Objects.requireNonNull(temporal, "temporal");
            try {
                if (!j$.time.chrono.s.c.equals(a.N(temporal))) {
                    temporal = LocalDate.C(temporal);
                }
                yearOf = of(temporal.h(j$.time.temporal.a.YEAR));
            } catch (c e) {
                h.h("Unable to obtain Year from TemporalAccessor: ", temporal, temporal.getClass().getName(), e);
                return 0L;
            }
        }
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, yearOf);
        }
        long j = ((long) yearOf.a) - ((long) this.a);
        int i = q.b[((ChronoUnit) pVar).ordinal()];
        if (i == 1) {
            return j;
        }
        if (i == 2) {
            return j / 10;
        }
        if (i == 3) {
            return j / 100;
        }
        if (i == 4) {
            return j / 1000;
        }
        if (i == 5) {
            j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
            return yearOf.s(aVar) - s(aVar);
        }
        h.b(pVar, "Unsupported unit: ");
        return 0L;
    }

    public int getValue() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return j(nVar).a(s(nVar), nVar);
    }

    public final int hashCode() {
        return this.a;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (Year) a.a(localDate, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.YEAR_OF_ERA) {
            return j$.time.temporal.r.f(1L, this.a <= 0 ? MathMethodsKt.NANOS_PER_SECOND : 999999999L);
        }
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        if (a.N(temporal).equals(j$.time.chrono.s.c)) {
            return temporal.b(this.a, j$.time.temporal.a.YEAR);
        }
        h.k("Adjustment only supported on ISO date-time");
        return null;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.b ? j$.time.chrono.s.c : aVar == j$.time.temporal.o.c ? ChronoUnit.YEARS : j$.time.temporal.o.c(this, aVar);
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
        int i = q.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i == 1) {
            int i2 = this.a;
            if (i2 < 1) {
                i2 = 1 - i2;
            }
            return i2;
        }
        if (i == 2) {
            return this.a;
        }
        if (i == 3) {
            return this.a < 1 ? 0 : 1;
        }
        throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
    }

    public final String toString() {
        return Integer.toString(this.a);
    }
}
