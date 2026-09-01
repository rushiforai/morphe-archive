package j$.time.chrono;

import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class x extends d {
    public static final LocalDate d = LocalDate.of(1873, 1, 1);
    private static final long serialVersionUID = -305327627230580483L;
    public final transient LocalDate a;
    public final transient y b;
    public final transient int c;

    public x(LocalDate localDate) {
        if (localDate.H(d)) {
            j$.time.h.k("JapaneseDate before Meiji 6 is not supported");
            throw null;
        }
        y yVarA = y.A(localDate);
        this.b = yVarA;
        this.c = (localDate.getYear() - yVarA.b.getYear()) + 1;
        this.a = localDate;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new e0((byte) 4, this);
    }

    @Override // j$.time.chrono.d
    public final b C(long j) {
        return H(this.a.P(j));
    }

    @Override // j$.time.chrono.d
    public final b D(long j) {
        return H(this.a.Q(j));
    }

    @Override // j$.time.chrono.d
    public final b E(long j) {
        return H(this.a.S(j));
    }

    public final x F(long j, ChronoUnit chronoUnit) {
        return (x) super.c(j, (j$.time.temporal.p) chronoUnit);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    /* JADX INFO: renamed from: G, reason: merged with bridge method [inline-methods] */
    public final x b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (x) super.b(j, nVar);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        if (s(aVar) == j) {
            return this;
        }
        int[] iArr = w.a;
        int i = iArr[aVar.ordinal()];
        if (i == 3 || i == 8 || i == 9) {
            v vVar = v.c;
            int iA = vVar.G(aVar).a(j, aVar);
            int i2 = iArr[aVar.ordinal()];
            if (i2 == 3) {
                return H(this.a.W(vVar.F(this.b, iA)));
            }
            if (i2 == 8) {
                return H(this.a.W(vVar.F(y.C(iA), this.c)));
            }
            if (i2 == 9) {
                return H(this.a.W(iA));
            }
        }
        return H(this.a.b(j, nVar));
    }

    public final x H(LocalDate localDate) {
        return localDate.equals(this.a) ? this : new x(localDate);
    }

    public final x I(j$.time.format.a aVar) {
        return (x) super.p(aVar);
    }

    @Override // j$.time.chrono.b
    public final a a() {
        return v.c;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b, j$.time.temporal.Temporal
    public final b c(long j, j$.time.temporal.p pVar) {
        return (x) super.c(j, pVar);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b, j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_MONTH || nVar == j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_YEAR || nVar == j$.time.temporal.a.ALIGNED_WEEK_OF_MONTH || nVar == j$.time.temporal.a.ALIGNED_WEEK_OF_YEAR) {
            return false;
        }
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).isDateBased() : nVar != null && nVar.h(this);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof x) {
            return this.a.equals(((x) obj).a);
        }
        return false;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final int hashCode() {
        v.c.getClass();
        return this.a.hashCode() ^ (-688086063);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (x) super.p(localDate);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.i(this);
        }
        if (!d(nVar)) {
            throw new j$.time.temporal.q(j$.time.d.a("Unsupported field: ", nVar));
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        int i = w.a[aVar.ordinal()];
        if (i == 1) {
            return j$.time.temporal.r.f(1L, this.a.J());
        }
        if (i != 2) {
            if (i != 3) {
                return v.c.G(aVar);
            }
            int year = this.b.b.getYear();
            return this.b.B() != null ? j$.time.temporal.r.f(1L, (r5.b.getYear() - year) + 1) : j$.time.temporal.r.f(1L, 999999999 - year);
        }
        y yVarB = this.b.B();
        int iLengthOfYear = (yVarB == null || yVarB.b.getYear() != this.a.getYear()) ? this.a.lengthOfYear() : yVarB.b.F() - 1;
        if (this.c == 1) {
            iLengthOfYear -= this.b.b.F() - 1;
        }
        return j$.time.temporal.r.f(1L, iLengthOfYear);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    /* JADX INFO: renamed from: n */
    public final b q(long j, j$.time.temporal.p pVar) {
        return (x) super.q(j, pVar);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final b p(j$.time.temporal.l lVar) {
        return (x) super.p(lVar);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        return (x) super.q(j, chronoUnit);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        switch (w.a[((j$.time.temporal.a) nVar).ordinal()]) {
            case 2:
                int i = this.c;
                LocalDate localDate = this.a;
                return i == 1 ? (localDate.F() - this.b.b.F()) + 1 : localDate.F();
            case 3:
                return this.c;
            case 4:
            case 5:
            case 6:
            case 7:
                throw new j$.time.temporal.q(j$.time.d.a("Unsupported field: ", nVar));
            case 8:
                return this.b.a;
            default:
                return this.a.s(nVar);
        }
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final long t() {
        return this.a.t();
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final e u(LocalTime localTime) {
        return new g(this, localTime);
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final m v() {
        return this.b;
    }

    @Override // j$.time.chrono.d, j$.time.chrono.b
    public final b x(TemporalAmount temporalAmount) {
        return (x) super.x(temporalAmount);
    }

    @Override // j$.time.chrono.d, j$.time.temporal.Temporal
    public final Temporal c(long j, j$.time.temporal.p pVar) {
        return (x) super.c(j, pVar);
    }

    public x(y yVar, int i, LocalDate localDate) {
        if (!localDate.H(d)) {
            this.b = yVar;
            this.c = i;
            this.a = localDate;
            return;
        }
        j$.time.h.k("JapaneseDate before Meiji 6 is not supported");
        throw null;
    }
}
