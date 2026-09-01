package j$.time.chrono;

import j$.time.LocalTime;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import j$.util.Objects;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class d implements b, Temporal, j$.time.temporal.l, Serializable {
    private static final long serialVersionUID = 6282433883239719096L;

    public static b A(a aVar, Temporal temporal) {
        b bVar = (b) temporal;
        if (aVar.equals(bVar.a())) {
            return bVar;
        }
        j$.time.h.f("Chronology mismatch, expected: ", aVar.C(), bVar.a().C());
        return null;
    }

    public final long B(b bVar) {
        if (a().G(j$.time.temporal.a.MONTH_OF_YEAR).d != 12) {
            throw new IllegalStateException("ChronoLocalDateImpl only supports Chronologies with 12 months per year");
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.PROLEPTIC_MONTH;
        long jS = s(aVar) * 32;
        j$.time.temporal.a aVar2 = j$.time.temporal.a.DAY_OF_MONTH;
        return (((bVar.s(aVar) * 32) + ((long) bVar.h(aVar2))) - (jS + ((long) j$.time.temporal.o.a(this, aVar2)))) / 32;
    }

    public abstract b C(long j);

    public abstract b D(long j);

    public abstract b E(long j);

    @Override // j$.time.temporal.Temporal
    public b b(long j, j$.time.temporal.n nVar) {
        if (nVar instanceof j$.time.temporal.a) {
            throw new j$.time.temporal.q(j$.time.d.a("Unsupported field: ", nVar));
        }
        return A(a(), nVar.q(this, j));
    }

    @Override // j$.time.temporal.Temporal
    public b c(long j, j$.time.temporal.p pVar) {
        boolean z = pVar instanceof ChronoUnit;
        if (!z) {
            if (!z) {
                return A(a(), pVar.h(this, j));
            }
            j$.time.h.b(pVar, "Unsupported unit: ");
            return null;
        }
        switch (c.a[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return C(j);
            case 2:
                return C(j$.time.a.T(j, 7L));
            case 3:
                return D(j);
            case 4:
                return E(j);
            case 5:
                return E(j$.time.a.T(j, 10L));
            case 6:
                return E(j$.time.a.T(j, 100L));
            case 7:
                return E(j$.time.a.T(j, 1000L));
            case 8:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return b(j$.time.a.O(s(aVar), j), (j$.time.temporal.n) aVar);
            default:
                j$.time.h.b(pVar, "Unsupported unit: ");
                return null;
        }
    }

    @Override // j$.time.chrono.b, j$.time.temporal.TemporalAccessor
    public /* synthetic */ boolean d(j$.time.temporal.n nVar) {
        return j$.time.a.t(this, nVar);
    }

    @Override // j$.time.chrono.b
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && j$.time.a.h(this, (b) obj) == 0;
    }

    @Override // j$.time.chrono.b, j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        Objects.requireNonNull(temporal, "endExclusive");
        b bVarJ = a().j(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            Objects.requireNonNull(pVar, "unit");
            return pVar.between(this, bVarJ);
        }
        switch (c.a[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return bVarJ.t() - t();
            case 2:
                return (bVarJ.t() - t()) / 7;
            case 3:
                return B(bVarJ);
            case 4:
                return B(bVarJ) / 12;
            case 5:
                return B(bVarJ) / 120;
            case 6:
                return B(bVarJ) / 1200;
            case 7:
                return B(bVarJ) / 12000;
            case 8:
                j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
                return bVarJ.s(aVar) - s(aVar);
            default:
                j$.time.h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.a(this, nVar);
    }

    @Override // j$.time.chrono.b
    public int hashCode() {
        long jT = t();
        return a().hashCode() ^ ((int) (jT ^ (jT >>> 32)));
    }

    @Override // j$.time.temporal.TemporalAccessor
    public /* synthetic */ j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final /* synthetic */ Temporal k(Temporal temporal) {
        return j$.time.a.a(this, temporal);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ Object m(j$.time.format.a aVar) {
        return j$.time.a.v(this, aVar);
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: n, reason: merged with bridge method [inline-methods] */
    public b q(long j, j$.time.temporal.p pVar) {
        return A(a(), j$.time.temporal.o.b(this, j, pVar));
    }

    @Override // j$.time.temporal.Temporal
    public b p(j$.time.temporal.l lVar) {
        return A(a(), lVar.k(this));
    }

    @Override // j$.time.chrono.b
    public long t() {
        return s(j$.time.temporal.a.EPOCH_DAY);
    }

    @Override // j$.time.chrono.b
    public final String toString() {
        long jS = s(j$.time.temporal.a.YEAR_OF_ERA);
        long jS2 = s(j$.time.temporal.a.MONTH_OF_YEAR);
        long jS3 = s(j$.time.temporal.a.DAY_OF_MONTH);
        StringBuilder sb = new StringBuilder(30);
        sb.append(a().toString());
        sb.append(" ");
        sb.append(v());
        sb.append(" ");
        sb.append(jS);
        sb.append(jS2 < 10 ? "-0" : "-");
        sb.append(jS2);
        sb.append(jS3 < 10 ? "-0" : "-");
        sb.append(jS3);
        return sb.toString();
    }

    @Override // j$.time.chrono.b
    public e u(LocalTime localTime) {
        return new g(this, localTime);
    }

    @Override // j$.time.chrono.b
    public m v() {
        return a().s(j$.time.temporal.o.a(this, j$.time.temporal.a.ERA));
    }

    @Override // j$.time.chrono.b
    public b x(TemporalAmount temporalAmount) {
        return A(a(), temporalAmount.h(this));
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: y */
    public final /* synthetic */ int compareTo(b bVar) {
        return j$.time.a.h(this, bVar);
    }
}
