package j$.time.temporal;

import j$.time.format.x;
import j$.time.format.y;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public enum j implements n {
    JULIAN_DAY("JulianDay", 2440588),
    MODIFIED_JULIAN_DAY("ModifiedJulianDay", 40587),
    RATA_DIE("RataDie", 719163);

    private static final long serialVersionUID = -7501623920830201812L;
    public final transient String a;
    public final transient r b;
    public final transient long c;

    static {
        ChronoUnit chronoUnit = ChronoUnit.NANOS;
    }

    j(String str, long j) {
        this.a = str;
        this.b = r.f((-365243219162L) + j, 365241780471L + j);
        this.c = j;
    }

    @Override // j$.time.temporal.n
    public final boolean h(TemporalAccessor temporalAccessor) {
        return temporalAccessor.d(a.EPOCH_DAY);
    }

    @Override // j$.time.temporal.n
    public final r i(TemporalAccessor temporalAccessor) {
        if (temporalAccessor.d(a.EPOCH_DAY)) {
            return this.b;
        }
        j$.time.h.j(this, "Unsupported field: ");
        return null;
    }

    @Override // j$.time.temporal.n
    public final boolean isDateBased() {
        return true;
    }

    @Override // j$.time.temporal.n
    public final TemporalAccessor j(Map map, x xVar, y yVar) {
        long jLongValue = ((Long) ((HashMap) map).remove(this)).longValue();
        j$.time.chrono.a aVarN = j$.time.a.N(xVar);
        y yVar2 = y.LENIENT;
        long j = this.c;
        if (yVar == yVar2) {
            return aVarN.k(j$.time.a.U(jLongValue, j));
        }
        this.b.b(jLongValue, this);
        return aVarN.k(jLongValue - j);
    }

    @Override // j$.time.temporal.n
    public final r k() {
        return this.b;
    }

    @Override // j$.time.temporal.n
    public final long m(TemporalAccessor temporalAccessor) {
        return temporalAccessor.s(a.EPOCH_DAY) + this.c;
    }

    @Override // j$.time.temporal.n
    public final Temporal q(Temporal temporal, long j) {
        if (this.b.e(j)) {
            return temporal.b(j$.time.a.U(j, this.c), a.EPOCH_DAY);
        }
        throw new j$.time.c("Invalid value: " + this.a + " " + j);
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.a;
    }
}
