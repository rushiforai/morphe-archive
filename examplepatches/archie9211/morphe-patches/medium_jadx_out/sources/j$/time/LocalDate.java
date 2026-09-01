package j$.time;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.squareup.wire.internal.MathMethodsKt;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.time.temporal.TemporalAmount;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class LocalDate implements Temporal, j$.time.temporal.l, j$.time.chrono.b, Serializable {
    public static final LocalDate d = of(-999999999, 1, 1);
    public static final LocalDate e = of(999999999, 12, 31);
    private static final long serialVersionUID = 2942565459149668126L;
    public final int a;
    public final short b;
    public final short c;

    static {
        of(1970, 1, 1);
    }

    public LocalDate(int i, int i2, int i3) {
        this.a = i;
        this.b = (short) i2;
        this.c = (short) i3;
    }

    public static LocalDate B(int i, int i2, int i3) {
        int i4 = 28;
        if (i3 > 28) {
            if (i2 != 2) {
                i4 = (i2 == 4 || i2 == 6 || i2 == 9 || i2 == 11) ? 30 : 31;
            } else {
                j$.time.chrono.s.c.getClass();
                if (j$.time.chrono.s.P(i)) {
                    i4 = 29;
                }
            }
            if (i3 > i4) {
                if (i3 == 29) {
                    h.e("Invalid date 'February 29' as '", i, "' is not a leap year");
                    return null;
                }
                throw new c("Invalid date '" + l.D(i2).name() + " " + i3 + "'");
            }
        }
        return new LocalDate(i, i2, i3);
    }

    public static LocalDate C(TemporalAccessor temporalAccessor) {
        Objects.requireNonNull(temporalAccessor, "temporal");
        LocalDate localDate = (LocalDate) temporalAccessor.m(j$.time.temporal.o.f);
        if (localDate != null) {
            return localDate;
        }
        h.g("Unable to obtain LocalDate from TemporalAccessor: ", temporalAccessor, " of type ", temporalAccessor.getClass().getName());
        return null;
    }

    public static LocalDate L(b bVar) {
        Objects.requireNonNull(bVar, "clock");
        long jCurrentTimeMillis = System.currentTimeMillis();
        Instant instant = Instant.c;
        Instant instantA = Instant.A(a.S(jCurrentTimeMillis, 1000L), ((int) a.R(jCurrentTimeMillis, 1000L)) * 1000000);
        ZoneId zoneId = bVar.a;
        Objects.requireNonNull(instantA, "instant");
        Objects.requireNonNull(zoneId, "zone");
        return M(a.S(instantA.getEpochSecond() + ((long) zoneId.B().d(instantA).getTotalSeconds()), 86400L));
    }

    public static LocalDate M(long j) {
        long j2;
        j$.time.temporal.a.EPOCH_DAY.s(j);
        long j3 = 719468 + j;
        if (j3 < 0) {
            long j4 = ((j + 719469) / 146097) - 1;
            j2 = j4 * 400;
            j3 += (-j4) * 146097;
        } else {
            j2 = 0;
        }
        long j5 = ((j3 * 400) + 591) / 146097;
        long j6 = j3 - ((j5 / 400) + (((j5 / 4) + (j5 * 365)) - (j5 / 100)));
        if (j6 < 0) {
            j5--;
            j6 = j3 - ((j5 / 400) + (((j5 / 4) + (365 * j5)) - (j5 / 100)));
        }
        int i = (int) j6;
        int i2 = ((i * 5) + 2) / 153;
        int i3 = ((i2 + 2) % 12) + 1;
        int i4 = (i - (((i2 * 306) + 5) / 10)) + 1;
        long j7 = j5 + j2 + ((long) (i2 / 10));
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return new LocalDate(aVar.b.a(j7, aVar), i3, i4);
    }

    public static LocalDate N(int i, int i2) {
        long j = i;
        j$.time.temporal.a.YEAR.s(j);
        j$.time.temporal.a.DAY_OF_YEAR.s(i2);
        j$.time.chrono.s.c.getClass();
        boolean zP = j$.time.chrono.s.P(j);
        if (i2 == 366 && !zP) {
            h.e("Invalid date 'DayOfYear 366' as '", i, "' is not a leap year");
            return null;
        }
        l lVarD = l.D(((i2 - 1) / 31) + 1);
        if (i2 > (lVarD.B(zP) + lVarD.A(zP)) - 1) {
            lVarD = l.a[(lVarD.ordinal() + 13) % 12];
        }
        return new LocalDate(i, lVarD.getValue(), (i2 - lVarD.A(zP)) + 1);
    }

    public static LocalDate T(int i, int i2, int i3) {
        if (i2 == 2) {
            j$.time.chrono.s.c.getClass();
            i3 = Math.min(i3, j$.time.chrono.s.P((long) i) ? 29 : 28);
        } else if (i2 == 4 || i2 == 6 || i2 == 9 || i2 == 11) {
            i3 = Math.min(i3, 30);
        }
        return new LocalDate(i, i2, i3);
    }

    public static LocalDate now() {
        return L(a.W());
    }

    public static LocalDate of(int i, int i2, int i3) {
        j$.time.temporal.a.YEAR.s(i);
        j$.time.temporal.a.MONTH_OF_YEAR.s(i2);
        j$.time.temporal.a.DAY_OF_MONTH.s(i3);
        return B(i, i2, i3);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 3, this);
    }

    public final int A(LocalDate localDate) {
        int i = this.a - localDate.a;
        return (i == 0 && (i = this.b - localDate.b) == 0) ? this.c - localDate.c : i;
    }

    public final int D(j$.time.temporal.n nVar) {
        switch (g.a[((j$.time.temporal.a) nVar).ordinal()]) {
            case 1:
                return this.c;
            case 2:
                return F();
            case 3:
                return ((this.c - 1) / 7) + 1;
            case 4:
                int i = this.a;
                return i >= 1 ? i : 1 - i;
            case 5:
                return E().getValue();
            case 6:
                return ((this.c - 1) % 7) + 1;
            case 7:
                return ((F() - 1) % 7) + 1;
            case 8:
                throw new j$.time.temporal.q("Invalid field 'EpochDay' for get() method, use getLong() instead");
            case 9:
                return ((F() - 1) / 7) + 1;
            case 10:
                return this.b;
            case 11:
                throw new j$.time.temporal.q("Invalid field 'ProlepticMonth' for get() method, use getLong() instead");
            case 12:
                return this.a;
            case 13:
                return this.a >= 1 ? 1 : 0;
            default:
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
    }

    public final e E() {
        return e.A(((int) a.R(t() + 3, 7L)) + 1);
    }

    public final int F() {
        return (l.D(this.b).A(I()) + this.c) - 1;
    }

    public final long G() {
        return ((((long) this.a) * 12) + ((long) this.b)) - 1;
    }

    public final boolean H(j$.time.chrono.b bVar) {
        return bVar instanceof LocalDate ? A((LocalDate) bVar) < 0 : t() < bVar.t();
    }

    public final boolean I() {
        j$.time.chrono.s sVar = j$.time.chrono.s.c;
        long j = this.a;
        sVar.getClass();
        return j$.time.chrono.s.P(j);
    }

    public final int J() {
        short s = this.b;
        return s != 2 ? (s == 4 || s == 6 || s == 9 || s == 11) ? 30 : 31 : I() ? 29 : 28;
    }

    public final long K(LocalDate localDate) {
        return (((localDate.G() * 32) + ((long) localDate.getDayOfMonth())) - ((G() * 32) + ((long) getDayOfMonth()))) / 32;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: O, reason: merged with bridge method [inline-methods] */
    public final LocalDate c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (LocalDate) pVar.h(this, j);
        }
        switch (g.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return P(j);
            case 2:
                return R(j);
            case 3:
                return Q(j);
            case 4:
                return S(j);
            case 5:
                return S(a.T(j, 10L));
            case 6:
                return S(a.T(j, 100L));
            case 7:
                return S(a.T(j, 1000L));
            case 8:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return b(a.O(s(aVar), j), aVar);
            default:
                h.b(pVar, "Unsupported unit: ");
                return null;
        }
    }

    public final LocalDate P(long j) {
        if (j == 0) {
            return this;
        }
        long j2 = ((long) this.c) + j;
        if (j2 > 0) {
            if (j2 <= 28) {
                return new LocalDate(this.a, this.b, (int) j2);
            }
            if (j2 <= 59) {
                long J = J();
                if (j2 <= J) {
                    return new LocalDate(this.a, this.b, (int) j2);
                }
                short s = this.b;
                if (s < 12) {
                    return new LocalDate(this.a, s + 1, (int) (j2 - J));
                }
                j$.time.temporal.a.YEAR.s(this.a + 1);
                return new LocalDate(this.a + 1, 1, (int) (j2 - J));
            }
        }
        return M(a.O(t(), j));
    }

    public final LocalDate Q(long j) {
        if (j == 0) {
            return this;
        }
        long j2 = (((long) this.a) * 12) + ((long) (this.b - 1)) + j;
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return T(aVar.b.a(a.S(j2, 12L), aVar), ((int) a.R(j2, 12L)) + 1, this.c);
    }

    public final LocalDate R(long j) {
        return P(a.T(j, 7L));
    }

    public final LocalDate S(long j) {
        if (j == 0) {
            return this;
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        return T(aVar.b.a(((long) this.a) + j, aVar), this.b, this.c);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: U, reason: merged with bridge method [inline-methods] */
    public final LocalDate b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (LocalDate) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        aVar.s(j);
        switch (g.a[aVar.ordinal()]) {
            case 1:
                int i = (int) j;
                if (this.c != i) {
                    return of(this.a, this.b, i);
                }
                return this;
            case 2:
                int i2 = (int) j;
                if (F() != i2) {
                    return N(this.a, i2);
                }
                return this;
            case 3:
                return R(j - s(j$.time.temporal.a.ALIGNED_WEEK_OF_MONTH));
            case 4:
                if (this.a < 1) {
                    j = 1 - j;
                }
                return W((int) j);
            case 5:
                return P(j - ((long) E().getValue()));
            case 6:
                return P(j - s(j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_MONTH));
            case 7:
                return P(j - s(j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_YEAR));
            case 8:
                return M(j);
            case 9:
                return R(j - s(j$.time.temporal.a.ALIGNED_WEEK_OF_YEAR));
            case 10:
                int i3 = (int) j;
                if (this.b != i3) {
                    j$.time.temporal.a.MONTH_OF_YEAR.s(i3);
                    return T(this.a, i3, this.c);
                }
                return this;
            case 11:
                return Q(j - G());
            case 12:
                return W((int) j);
            case 13:
                if (s(j$.time.temporal.a.ERA) != j) {
                    return W(1 - this.a);
                }
                return this;
            default:
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
    }

    @Override // j$.time.chrono.b
    /* JADX INFO: renamed from: V, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final LocalDate p(j$.time.temporal.l lVar) {
        return lVar instanceof LocalDate ? (LocalDate) lVar : (LocalDate) lVar.k(this);
    }

    public final LocalDate W(int i) {
        if (this.a == i) {
            return this;
        }
        j$.time.temporal.a.YEAR.s(i);
        return T(i, this.b, this.c);
    }

    @Override // j$.time.chrono.b
    public final j$.time.chrono.a a() {
        return j$.time.chrono.s.c;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return a.t(this, nVar);
    }

    @Override // j$.time.chrono.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof LocalDate) && A((LocalDate) obj) == 0;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        LocalDate localDateC = C(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, localDateC);
        }
        switch (g.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return localDateC.t() - t();
            case 2:
                return (localDateC.t() - t()) / 7;
            case 3:
                return K(localDateC);
            case 4:
                return K(localDateC) / 12;
            case 5:
                return K(localDateC) / 120;
            case 6:
                return K(localDateC) / 1200;
            case 7:
                return K(localDateC) / 12000;
            case 8:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return localDateC.s(aVar) - s(aVar);
            default:
                h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    public int getDayOfMonth() {
        return this.c;
    }

    public int getMonthValue() {
        return this.b;
    }

    public int getYear() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? D(nVar) : j$.time.temporal.o.a(this, nVar);
    }

    @Override // j$.time.chrono.b
    public final int hashCode() {
        int i = this.a;
        return (i & (-2048)) ^ (((i << 11) + (this.b << 6)) + this.c);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.i(this);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        if (!aVar.isDateBased()) {
            throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
        int i = g.a[aVar.ordinal()];
        if (i == 1) {
            return j$.time.temporal.r.f(1L, J());
        }
        if (i == 2) {
            return j$.time.temporal.r.f(1L, lengthOfYear());
        }
        if (i != 3) {
            return i != 4 ? aVar.b : getYear() <= 0 ? j$.time.temporal.r.f(1L, MathMethodsKt.NANOS_PER_SECOND) : j$.time.temporal.r.f(1L, 999999999L);
        }
        return j$.time.temporal.r.f(1L, (l.D(this.b) != l.FEBRUARY || I()) ? 5L : 4L);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return a.a(this, temporal);
    }

    public int lengthOfYear() {
        return I() ? 366 : 365;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.f ? this : a.v(this, aVar);
    }

    @Override // j$.time.chrono.b
    public final j$.time.chrono.b n(long j, j$.time.temporal.p pVar) {
        return c(-1L, pVar);
    }

    @Override // j$.time.chrono.b
    /* JADX INFO: renamed from: plus, reason: merged with bridge method [inline-methods] */
    public LocalDate x(TemporalAmount temporalAmount) {
        if (temporalAmount instanceof Period) {
            Period period = (Period) temporalAmount;
            return Q((((long) period.a) * 12) + ((long) period.b)).P(period.getDays());
        }
        Objects.requireNonNull(temporalAmount, "amountToAdd");
        return (LocalDate) temporalAmount.h(this);
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
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.EPOCH_DAY ? t() : nVar == j$.time.temporal.a.PROLEPTIC_MONTH ? G() : D(nVar) : nVar.m(this);
    }

    @Override // j$.time.chrono.b
    public final long t() {
        long j = this.a;
        long j2 = this.b;
        long j3 = 365 * j;
        long j4 = (((367 * j2) - 362) / 12) + (j >= 0 ? ((j + 399) / 400) + (((3 + j) / 4) - ((99 + j) / 100)) + j3 : j3 - ((j / (-400)) + ((j / (-4)) - (j / (-100))))) + ((long) (this.c - 1));
        if (j2 > 2) {
            j4 = !I() ? j4 - 2 : j4 - 1;
        }
        return j4 - 719528;
    }

    @Override // j$.time.chrono.b
    public final String toString() {
        int i = this.a;
        short s = this.b;
        short s2 = this.c;
        int iAbs = Math.abs(i);
        StringBuilder sb = new StringBuilder(10);
        if (iAbs >= 1000) {
            if (i > 9999) {
                sb.append('+');
            }
            sb.append(i);
        } else if (i < 0) {
            sb.append(i - 10000);
            sb.deleteCharAt(1);
        } else {
            sb.append(i + PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
            sb.deleteCharAt(0);
        }
        sb.append(s < 10 ? "-0" : "-");
        sb.append((int) s);
        sb.append(s2 < 10 ? "-0" : "-");
        sb.append((int) s2);
        return sb.toString();
    }

    @Override // j$.time.chrono.b
    public final j$.time.chrono.e u(LocalTime localTime) {
        return LocalDateTime.of(this, localTime);
    }

    @Override // j$.time.chrono.b
    public final j$.time.chrono.m v() {
        return getYear() >= 1 ? j$.time.chrono.t.CE : j$.time.chrono.t.BCE;
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: y, reason: merged with bridge method [inline-methods] */
    public final int compareTo(j$.time.chrono.b bVar) {
        return bVar instanceof LocalDate ? A((LocalDate) bVar) : a.h(this, bVar);
    }
}
