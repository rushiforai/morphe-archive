package j$.time.chrono;

import j$.time.Instant;
import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class a implements Comparable {
    public static final ConcurrentHashMap a = new ConcurrentHashMap();
    public static final ConcurrentHashMap b = new ConcurrentHashMap();

    static {
        new Locale("ja", "JP", "JP");
    }

    public static a E(String str) {
        Objects.requireNonNull(str, "id");
        while (true) {
            ConcurrentHashMap concurrentHashMap = a;
            a aVar = (a) concurrentHashMap.get(str);
            if (aVar == null) {
                aVar = (a) b.get(str);
            }
            if (aVar != null) {
                return aVar;
            }
            if (concurrentHashMap.get("ISO") != null) {
                for (a aVar2 : ServiceLoader.load(a.class)) {
                    if (str.equals(aVar2.C()) || str.equals(aVar2.B())) {
                        return aVar2;
                    }
                }
                j$.time.h.j(str, "Unknown chronology: ");
                return null;
            }
            o oVar = o.l;
            oVar.getClass();
            H(oVar, "Hijrah-umalqura");
            v vVar = v.c;
            vVar.getClass();
            H(vVar, "Japanese");
            a0 a0Var = a0.c;
            a0Var.getClass();
            H(a0Var, "Minguo");
            g0 g0Var = g0.c;
            g0Var.getClass();
            H(g0Var, "ThaiBuddhist");
            try {
                for (a aVar3 : Arrays.asList(new a[0])) {
                    if (!aVar3.C().equals("ISO")) {
                        H(aVar3, aVar3.C());
                    }
                }
                s sVar = s.c;
                sVar.getClass();
                H(sVar, "ISO");
            } catch (Throwable th) {
                throw new ServiceConfigurationError(th.getMessage(), th);
            }
        }
    }

    public static a H(a aVar, String str) {
        String strB;
        a aVar2 = (a) a.putIfAbsent(str, aVar);
        if (aVar2 == null && (strB = aVar.B()) != null) {
            b.putIfAbsent(strB, aVar);
        }
        return aVar2;
    }

    public static b I(b bVar, long j, long j2, long j3) {
        long j4;
        b bVarC = bVar.c(j, (j$.time.temporal.p) ChronoUnit.MONTHS);
        ChronoUnit chronoUnit = ChronoUnit.WEEKS;
        b bVarC2 = bVarC.c(j2, (j$.time.temporal.p) chronoUnit);
        if (j3 <= 7) {
            if (j3 < 1) {
                bVarC2 = bVarC2.c(j$.time.a.U(j3, 7L) / 7, (j$.time.temporal.p) chronoUnit);
                j4 = (j3 + 6) % 7;
            }
            return bVarC2.p(new j$.time.temporal.m(j$.time.e.A((int) j3).getValue(), 0));
        }
        long j5 = j3 - 1;
        bVarC2 = bVarC2.c(j5 / 7, (j$.time.temporal.p) chronoUnit);
        j4 = j5 % 7;
        j3 = j4 + 1;
        return bVarC2.p(new j$.time.temporal.m(j$.time.e.A((int) j3).getValue(), 0));
    }

    public static void h(Map map, j$.time.temporal.a aVar, long j) {
        Long l = (Long) map.get(aVar);
        if (l == null || l.longValue() == j) {
            map.put(aVar, Long.valueOf(j));
            return;
        }
        throw new j$.time.c("Conflict found: " + aVar + " " + l + " differs from " + aVar + " " + j);
    }

    public abstract List A();

    public abstract String B();

    public abstract String C();

    public e D(TemporalAccessor temporalAccessor) {
        try {
            return j(temporalAccessor).u(LocalTime.C(temporalAccessor));
        } catch (j$.time.c e) {
            throw new j$.time.c("Unable to obtain ChronoLocalDateTime from TemporalAccessor: " + temporalAccessor.getClass(), e);
        }
    }

    public abstract int F(m mVar, int i);

    public abstract j$.time.temporal.r G(j$.time.temporal.a aVar);

    public b J(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.EPOCH_DAY;
        if (map.containsKey(aVar)) {
            return k(((Long) map.remove(aVar)).longValue());
        }
        K(map, yVar);
        b bVarM = M(map, yVar);
        if (bVarM != null) {
            return bVarM;
        }
        j$.time.temporal.a aVar2 = j$.time.temporal.a.YEAR;
        if (map.containsKey(aVar2)) {
            j$.time.temporal.a aVar3 = j$.time.temporal.a.MONTH_OF_YEAR;
            int i = 0;
            if (map.containsKey(aVar3)) {
                if (map.containsKey(j$.time.temporal.a.DAY_OF_MONTH)) {
                    return L(map, yVar);
                }
                j$.time.temporal.a aVar4 = j$.time.temporal.a.ALIGNED_WEEK_OF_MONTH;
                if (map.containsKey(aVar4)) {
                    j$.time.temporal.a aVar5 = j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_MONTH;
                    if (map.containsKey(aVar5)) {
                        int iA = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
                        if (yVar == j$.time.format.y.LENIENT) {
                            long jU = j$.time.a.U(((Long) map.remove(aVar3)).longValue(), 1L);
                            return i(iA, 1, 1).c(jU, (j$.time.temporal.p) ChronoUnit.MONTHS).c(j$.time.a.U(((Long) map.remove(aVar4)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.WEEKS).c(j$.time.a.U(((Long) map.remove(aVar5)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.DAYS);
                        }
                        int iA2 = G(aVar3).a(((Long) map.remove(aVar3)).longValue(), aVar3);
                        int iA3 = G(aVar4).a(((Long) map.remove(aVar4)).longValue(), aVar4);
                        b bVarC = i(iA, iA2, 1).c((G(aVar5).a(((Long) map.remove(aVar5)).longValue(), aVar5) - 1) + ((iA3 - 1) * 7), (j$.time.temporal.p) ChronoUnit.DAYS);
                        if (yVar != j$.time.format.y.STRICT || bVarC.h(aVar3) == iA2) {
                            return bVarC;
                        }
                        j$.time.h.k("Strict mode rejected resolved date as it is in a different month");
                        return null;
                    }
                    j$.time.temporal.a aVar6 = j$.time.temporal.a.DAY_OF_WEEK;
                    if (map.containsKey(aVar6)) {
                        int iA4 = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
                        if (yVar == j$.time.format.y.LENIENT) {
                            return I(i(iA4, 1, 1), j$.time.a.U(((Long) map.remove(aVar3)).longValue(), 1L), j$.time.a.U(((Long) map.remove(aVar4)).longValue(), 1L), j$.time.a.U(((Long) map.remove(aVar6)).longValue(), 1L));
                        }
                        int iA5 = G(aVar3).a(((Long) map.remove(aVar3)).longValue(), aVar3);
                        b bVarP = i(iA4, iA5, 1).c((G(aVar4).a(((Long) map.remove(aVar4)).longValue(), aVar4) - 1) * 7, (j$.time.temporal.p) ChronoUnit.DAYS).p(new j$.time.temporal.m(j$.time.e.A(G(aVar6).a(((Long) map.remove(aVar6)).longValue(), aVar6)).getValue(), i));
                        if (yVar != j$.time.format.y.STRICT || bVarP.h(aVar3) == iA5) {
                            return bVarP;
                        }
                        j$.time.h.k("Strict mode rejected resolved date as it is in a different month");
                        return null;
                    }
                }
            }
            j$.time.temporal.a aVar7 = j$.time.temporal.a.DAY_OF_YEAR;
            if (map.containsKey(aVar7)) {
                int iA6 = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
                if (yVar != j$.time.format.y.LENIENT) {
                    return q(iA6, G(aVar7).a(((Long) map.remove(aVar7)).longValue(), aVar7));
                }
                return q(iA6, 1).c(j$.time.a.U(((Long) map.remove(aVar7)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.DAYS);
            }
            j$.time.temporal.a aVar8 = j$.time.temporal.a.ALIGNED_WEEK_OF_YEAR;
            if (map.containsKey(aVar8)) {
                j$.time.temporal.a aVar9 = j$.time.temporal.a.ALIGNED_DAY_OF_WEEK_IN_YEAR;
                if (map.containsKey(aVar9)) {
                    int iA7 = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
                    if (yVar == j$.time.format.y.LENIENT) {
                        return q(iA7, 1).c(j$.time.a.U(((Long) map.remove(aVar8)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.WEEKS).c(j$.time.a.U(((Long) map.remove(aVar9)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.DAYS);
                    }
                    int iA8 = G(aVar8).a(((Long) map.remove(aVar8)).longValue(), aVar8);
                    b bVarC2 = q(iA7, 1).c((G(aVar9).a(((Long) map.remove(aVar9)).longValue(), aVar9) - 1) + ((iA8 - 1) * 7), (j$.time.temporal.p) ChronoUnit.DAYS);
                    if (yVar != j$.time.format.y.STRICT || bVarC2.h(aVar2) == iA7) {
                        return bVarC2;
                    }
                    j$.time.h.k("Strict mode rejected resolved date as it is in a different year");
                    return null;
                }
                j$.time.temporal.a aVar10 = j$.time.temporal.a.DAY_OF_WEEK;
                if (map.containsKey(aVar10)) {
                    int iA9 = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
                    if (yVar == j$.time.format.y.LENIENT) {
                        return I(q(iA9, 1), 0L, j$.time.a.U(((Long) map.remove(aVar8)).longValue(), 1L), j$.time.a.U(((Long) map.remove(aVar10)).longValue(), 1L));
                    }
                    b bVarP2 = q(iA9, 1).c((G(aVar8).a(((Long) map.remove(aVar8)).longValue(), aVar8) - 1) * 7, (j$.time.temporal.p) ChronoUnit.DAYS).p(new j$.time.temporal.m(j$.time.e.A(G(aVar10).a(((Long) map.remove(aVar10)).longValue(), aVar10)).getValue(), i));
                    if (yVar != j$.time.format.y.STRICT || bVarP2.h(aVar2) == iA9) {
                        return bVarP2;
                    }
                    j$.time.h.k("Strict mode rejected resolved date as it is in a different year");
                    return null;
                }
            }
        }
        return null;
    }

    public void K(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.PROLEPTIC_MONTH;
        Long l = (Long) map.remove(aVar);
        if (l != null) {
            if (yVar != j$.time.format.y.LENIENT) {
                aVar.s(l.longValue());
            }
            b bVarB = m().b(1L, (j$.time.temporal.n) j$.time.temporal.a.DAY_OF_MONTH).b(l.longValue(), (j$.time.temporal.n) aVar);
            h(map, j$.time.temporal.a.MONTH_OF_YEAR, bVarB.h(r6));
            h(map, j$.time.temporal.a.YEAR, bVarB.h(r6));
        }
    }

    public b L(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        int iA = G(aVar).a(((Long) map.remove(aVar)).longValue(), aVar);
        int i = 1;
        if (yVar == j$.time.format.y.LENIENT) {
            long jU = j$.time.a.U(((Long) map.remove(j$.time.temporal.a.MONTH_OF_YEAR)).longValue(), 1L);
            return i(iA, 1, 1).c(jU, (j$.time.temporal.p) ChronoUnit.MONTHS).c(j$.time.a.U(((Long) map.remove(j$.time.temporal.a.DAY_OF_MONTH)).longValue(), 1L), (j$.time.temporal.p) ChronoUnit.DAYS);
        }
        j$.time.temporal.a aVar2 = j$.time.temporal.a.MONTH_OF_YEAR;
        int iA2 = G(aVar2).a(((Long) map.remove(aVar2)).longValue(), aVar2);
        j$.time.temporal.a aVar3 = j$.time.temporal.a.DAY_OF_MONTH;
        int iA3 = G(aVar3).a(((Long) map.remove(aVar3)).longValue(), aVar3);
        if (yVar != j$.time.format.y.SMART) {
            return i(iA, iA2, iA3);
        }
        try {
            return i(iA, iA2, iA3);
        } catch (j$.time.c unused) {
            return this.i(iA, iA2, 1).p(new j$.time.format.a(i));
        }
    }

    public b M(Map map, j$.time.format.y yVar) {
        int iA;
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR_OF_ERA;
        Long l = (Long) map.remove(aVar);
        if (l == null) {
            j$.time.temporal.a aVar2 = j$.time.temporal.a.ERA;
            if (!map.containsKey(aVar2)) {
                return null;
            }
            G(aVar2).b(((Long) map.get(aVar2)).longValue(), aVar2);
            return null;
        }
        Long l2 = (Long) map.remove(j$.time.temporal.a.ERA);
        if (yVar != j$.time.format.y.LENIENT) {
            iA = G(aVar).a(l.longValue(), aVar);
        } else {
            long jLongValue = l.longValue();
            int i = (int) jLongValue;
            if (jLongValue != i) {
                throw new ArithmeticException();
            }
            iA = i;
        }
        if (l2 != null) {
            h(map, j$.time.temporal.a.YEAR, F(s(G(r2).a(l2.longValue(), r2)), iA));
            return null;
        }
        j$.time.temporal.a aVar3 = j$.time.temporal.a.YEAR;
        if (map.containsKey(aVar3)) {
            h(map, aVar3, F(q(G(aVar3).a(((Long) map.get(aVar3)).longValue(), aVar3), 1).v(), iA));
            return null;
        }
        if (yVar == j$.time.format.y.STRICT) {
            map.put(aVar, l);
            return null;
        }
        if (A().isEmpty()) {
            h(map, aVar3, iA);
            return null;
        }
        h(map, aVar3, F((m) r11.get(r11.size() - 1), iA));
        return null;
    }

    public abstract j N(Instant instant, ZoneId zoneId);

    public j O(TemporalAccessor temporalAccessor) {
        try {
            ZoneId zoneIdA = ZoneId.A(temporalAccessor);
            try {
                return N(Instant.from(temporalAccessor), zoneIdA);
            } catch (j$.time.c unused) {
                return l.A(zoneIdA, null, g.A(this, this.D(temporalAccessor)));
            }
        } catch (j$.time.c e) {
            throw new j$.time.c("Unable to obtain ChronoZonedDateTime from TemporalAccessor: " + temporalAccessor.getClass(), e);
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return C().compareTo(((a) obj).C());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && C().compareTo(((a) obj).C()) == 0;
    }

    public final int hashCode() {
        return C().hashCode() ^ getClass().hashCode();
    }

    public abstract b i(int i, int i2, int i3);

    public abstract b j(TemporalAccessor temporalAccessor);

    public abstract b k(long j);

    public abstract /* synthetic */ b m();

    public abstract b q(int i, int i2);

    public abstract m s(int i);

    public final String toString() {
        return C();
    }
}
