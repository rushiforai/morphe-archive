package j$.time.temporal;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class o {
    public static final j$.time.format.a a = new j$.time.format.a(2);
    public static final j$.time.format.a b = new j$.time.format.a(3);
    public static final j$.time.format.a c = new j$.time.format.a(4);
    public static final j$.time.format.a d = new j$.time.format.a(5);
    public static final j$.time.format.a e = new j$.time.format.a(6);
    public static final j$.time.format.a f = new j$.time.format.a(7);
    public static final j$.time.format.a g = new j$.time.format.a(8);

    public static int a(TemporalAccessor temporalAccessor, n nVar) {
        r rVarJ = temporalAccessor.j(nVar);
        if (!rVarJ.d()) {
            throw new q("Invalid field " + nVar + " for get() method, use getLong() instead");
        }
        long jS = temporalAccessor.s(nVar);
        if (rVarJ.e(jS)) {
            return (int) jS;
        }
        throw new j$.time.c("Invalid value for " + nVar + " (valid values " + rVarJ + "): " + jS);
    }

    public static Temporal b(Temporal temporal, long j, p pVar) {
        long j2;
        if (j == Long.MIN_VALUE) {
            temporal = temporal.c(Long.MAX_VALUE, pVar);
            j2 = 1;
        } else {
            j2 = -j;
        }
        return temporal.c(j2, pVar);
    }

    public static Object c(TemporalAccessor temporalAccessor, j$.time.format.a aVar) {
        if (aVar == a || aVar == b || aVar == c) {
            return null;
        }
        return aVar.g(temporalAccessor);
    }

    public static r d(TemporalAccessor temporalAccessor, n nVar) {
        if (!(nVar instanceof a)) {
            Objects.requireNonNull(nVar, "field");
            return nVar.i(temporalAccessor);
        }
        if (temporalAccessor.d(nVar)) {
            return ((a) nVar).b;
        }
        throw new q(j$.time.d.a("Unsupported field: ", nVar));
    }
}
