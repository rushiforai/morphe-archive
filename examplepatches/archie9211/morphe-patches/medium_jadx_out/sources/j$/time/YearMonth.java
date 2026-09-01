package j$.time;

import com.drew.metadata.photoshop.PhotoshopDirectory;
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
public final class YearMonth implements Temporal, j$.time.temporal.l, Comparable<YearMonth>, Serializable {
    public static final /* synthetic */ int c = 0;
    private static final long serialVersionUID = 4183400860270640070L;
    public final int a;
    public final int b;

    static {
        j$.time.format.p pVar = new j$.time.format.p();
        pVar.h(j$.time.temporal.a.YEAR, 4, 10, z.EXCEEDS_PAD);
        pVar.c('-');
        pVar.g(j$.time.temporal.a.MONTH_OF_YEAR, 2);
        pVar.l(Locale.getDefault(), y.SMART, null);
    }

    public YearMonth(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public static YearMonth of(int i, int i2) {
        j$.time.temporal.a.YEAR.s(i);
        j$.time.temporal.a.MONTH_OF_YEAR.s(i2);
        return new YearMonth(i, i2);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 12, this);
    }

    public final long A() {
        return ((((long) this.a) * 12) + ((long) this.b)) - 1;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: B, reason: merged with bridge method [inline-methods] */
    public final YearMonth c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (YearMonth) pVar.h(this, j);
        }
        switch (r.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return C(j);
            case 2:
                return D(j);
            case 3:
                return D(a.T(j, 10L));
            case 4:
                return D(a.T(j, 100L));
            case 5:
                return D(a.T(j, 1000L));
            case 6:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return b(a.O(s(aVar), j), aVar);
            default:
                h.b(pVar, "Unsupported unit: ");
                return null;
        }
    }

    public final YearMonth C(long j) {
        if (j == 0) {
            return this;
        }
        long j2 = (((long) this.a) * 12) + ((long) (this.b - 1)) + j;
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return E(aVar.b.a(a.S(j2, 12L), aVar), ((int) a.R(j2, 12L)) + 1);
    }

    public final YearMonth D(long j) {
        if (j == 0) {
            return this;
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return E(aVar.b.a(((long) this.a) + j, aVar), this.b);
    }

    public final YearMonth E(int i, int i2) {
        return (this.a == i && this.b == i2) ? this : new YearMonth(i, i2);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: F, reason: merged with bridge method [inline-methods] */
    public final YearMonth b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (YearMonth) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        aVar.s(j);
        int i = r.a[aVar.ordinal()];
        if (i == 1) {
            int i2 = (int) j;
            j$.time.temporal.a.MONTH_OF_YEAR.s(i2);
            return E(this.a, i2);
        }
        if (i == 2) {
            return C(j - A());
        }
        if (i == 3) {
            if (this.a < 1) {
                j = 1 - j;
            }
            int i3 = (int) j;
            j$.time.temporal.a.YEAR.s(i3);
            return E(i3, this.b);
        }
        if (i == 4) {
            int i4 = (int) j;
            j$.time.temporal.a.YEAR.s(i4);
            return E(i4, this.b);
        }
        if (i != 5) {
            throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
        if (s(j$.time.temporal.a.ERA) == j) {
            return this;
        }
        int i5 = 1 - this.a;
        j$.time.temporal.a.YEAR.s(i5);
        return E(i5, this.b);
    }

    @Override // java.lang.Comparable
    public final int compareTo(YearMonth yearMonth) {
        YearMonth yearMonth2 = yearMonth;
        int i = this.a - yearMonth2.a;
        return i == 0 ? this.b - yearMonth2.b : i;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.YEAR || nVar == j$.time.temporal.a.MONTH_OF_YEAR || nVar == j$.time.temporal.a.PROLEPTIC_MONTH || nVar == j$.time.temporal.a.YEAR_OF_ERA || nVar == j$.time.temporal.a.ERA : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof YearMonth) {
            YearMonth yearMonth = (YearMonth) obj;
            if (this.a == yearMonth.a && this.b == yearMonth.b) {
                return true;
            }
        }
        return false;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        YearMonth yearMonthOf;
        if (temporal instanceof YearMonth) {
            yearMonthOf = (YearMonth) temporal;
        } else {
            Objects.requireNonNull(temporal, "temporal");
            try {
                if (!j$.time.chrono.s.c.equals(a.N(temporal))) {
                    temporal = LocalDate.C(temporal);
                }
                yearMonthOf = of(temporal.h(j$.time.temporal.a.YEAR), temporal.h(j$.time.temporal.a.MONTH_OF_YEAR));
            } catch (c e) {
                h.h("Unable to obtain YearMonth from TemporalAccessor: ", temporal, temporal.getClass().getName(), e);
                return 0L;
            }
        }
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, yearMonthOf);
        }
        long jA = yearMonthOf.A() - A();
        switch (r.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return jA;
            case 2:
                return jA / 12;
            case 3:
                return jA / 120;
            case 4:
                return jA / 1200;
            case 5:
                return jA / 12000;
            case 6:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return yearMonthOf.s(aVar) - s(aVar);
            default:
                h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    public int getMonthValue() {
        return this.b;
    }

    public int getYear() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return j(nVar).a(s(nVar), nVar);
    }

    public final int hashCode() {
        return (this.b << 27) ^ this.a;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (YearMonth) a.a(localDate, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.YEAR_OF_ERA) {
            return j$.time.temporal.r.f(1L, getYear() <= 0 ? MathMethodsKt.NANOS_PER_SECOND : 999999999L);
        }
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        if (a.N(temporal).equals(j$.time.chrono.s.c)) {
            return temporal.b(A(), j$.time.temporal.a.PROLEPTIC_MONTH);
        }
        h.k("Adjustment only supported on ISO date-time");
        return null;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.b ? j$.time.chrono.s.c : aVar == j$.time.temporal.o.c ? ChronoUnit.MONTHS : j$.time.temporal.o.c(this, aVar);
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
        int i;
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i2 = r.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i2 == 1) {
            i = this.b;
        } else {
            if (i2 == 2) {
                return A();
            }
            if (i2 == 3) {
                int i3 = this.a;
                if (i3 < 1) {
                    i3 = 1 - i3;
                }
                return i3;
            }
            if (i2 != 4) {
                if (i2 == 5) {
                    return this.a < 1 ? 0 : 1;
                }
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
            }
            i = this.a;
        }
        return i;
    }

    public final String toString() {
        int iAbs = Math.abs(this.a);
        StringBuilder sb = new StringBuilder(9);
        int i = this.a;
        if (iAbs >= 1000) {
            sb.append(i);
        } else if (i < 0) {
            sb.append(i - 10000);
            sb.deleteCharAt(1);
        } else {
            sb.append(i + PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
            sb.deleteCharAt(0);
        }
        sb.append(this.b < 10 ? "-0" : "-");
        sb.append(this.b);
        return sb.toString();
    }
}
