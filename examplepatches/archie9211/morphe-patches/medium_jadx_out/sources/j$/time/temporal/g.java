package j$.time.temporal;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import j$.time.LocalDate;
import j$.time.chrono.s;
import j$.time.format.x;
import j$.time.format.y;
import java.util.HashMap;
import java.util.Map;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class g implements n {
    public static final g DAY_OF_QUARTER;
    public static final g QUARTER_OF_YEAR;
    public static final g WEEK_BASED_YEAR;
    public static final g WEEK_OF_WEEK_BASED_YEAR;
    public static final int[] a;
    public static final /* synthetic */ g[] b;

    static {
        g gVar = new g() { // from class: j$.time.temporal.c
            @Override // j$.time.temporal.n
            public final boolean h(TemporalAccessor temporalAccessor) {
                if (!temporalAccessor.d(a.DAY_OF_YEAR) || !temporalAccessor.d(a.MONTH_OF_YEAR) || !temporalAccessor.d(a.YEAR)) {
                    return false;
                }
                g gVar2 = i.a;
                return j$.time.a.N(temporalAccessor).equals(s.c);
            }

            @Override // j$.time.temporal.n
            public final r i(TemporalAccessor temporalAccessor) {
                if (!h(temporalAccessor)) {
                    throw new q("Unsupported field: DayOfQuarter");
                }
                long jS = temporalAccessor.s(g.QUARTER_OF_YEAR);
                if (jS != 1) {
                    return jS == 2 ? r.f(1L, 91L) : (jS == 3 || jS == 4) ? r.f(1L, 92L) : k();
                }
                long jS2 = temporalAccessor.s(a.YEAR);
                s.c.getClass();
                return s.P(jS2) ? r.f(1L, 91L) : r.f(1L, 90L);
            }

            @Override // j$.time.temporal.g, j$.time.temporal.n
            public final TemporalAccessor j(Map map, x xVar, y yVar) {
                LocalDate localDateOf;
                long jU;
                a aVar = a.YEAR;
                HashMap map2 = (HashMap) map;
                Long l = (Long) map2.get(aVar);
                n nVar = g.QUARTER_OF_YEAR;
                Long l2 = (Long) map2.get(nVar);
                if (l != null && l2 != null) {
                    int iA = aVar.b.a(l.longValue(), aVar);
                    long jLongValue = ((Long) map2.get(g.DAY_OF_QUARTER)).longValue();
                    g gVar2 = i.a;
                    if (j$.time.a.N(xVar).equals(s.c)) {
                        if (yVar == y.LENIENT) {
                            localDateOf = LocalDate.of(iA, 1, 1).Q(j$.time.a.T(j$.time.a.U(l2.longValue(), 1L), 3L));
                            jU = j$.time.a.U(jLongValue, 1L);
                        } else {
                            localDateOf = LocalDate.of(iA, ((nVar.k().a(l2.longValue(), nVar) - 1) * 3) + 1, 1);
                            if (jLongValue < 1 || jLongValue > 90) {
                                if (yVar == y.STRICT) {
                                    i(localDateOf).b(jLongValue, this);
                                } else {
                                    k().b(jLongValue, this);
                                }
                            }
                            jU = jLongValue - 1;
                        }
                        map2.remove(this);
                        map2.remove(aVar);
                        map2.remove(nVar);
                        return localDateOf.P(jU);
                    }
                    j$.time.h.k("Resolve requires IsoChronology");
                }
                return null;
            }

            @Override // j$.time.temporal.n
            public final r k() {
                return r.g(90L, 92L);
            }

            @Override // j$.time.temporal.n
            public final long m(TemporalAccessor temporalAccessor) {
                if (!h(temporalAccessor)) {
                    throw new q("Unsupported field: DayOfQuarter");
                }
                int iH = temporalAccessor.h(a.DAY_OF_YEAR);
                int iH2 = temporalAccessor.h(a.MONTH_OF_YEAR);
                long jS = temporalAccessor.s(a.YEAR);
                int i = (iH2 - 1) / 3;
                s.c.getClass();
                return iH - g.a[i + (s.P(jS) ? 4 : 0)];
            }

            @Override // j$.time.temporal.n
            public final Temporal q(Temporal temporal, long j) {
                long jM = m(temporal);
                k().b(j, this);
                a aVar = a.DAY_OF_YEAR;
                return temporal.b((j - jM) + temporal.s(aVar), aVar);
            }

            @Override // java.lang.Enum
            public final String toString() {
                return "DayOfQuarter";
            }
        };
        DAY_OF_QUARTER = gVar;
        g gVar2 = new g() { // from class: j$.time.temporal.d
            @Override // j$.time.temporal.n
            public final boolean h(TemporalAccessor temporalAccessor) {
                if (!temporalAccessor.d(a.MONTH_OF_YEAR)) {
                    return false;
                }
                g gVar3 = i.a;
                return j$.time.a.N(temporalAccessor).equals(s.c);
            }

            @Override // j$.time.temporal.n
            public final r i(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return k();
                }
                throw new q("Unsupported field: QuarterOfYear");
            }

            @Override // j$.time.temporal.n
            public final r k() {
                return r.f(1L, 4L);
            }

            @Override // j$.time.temporal.n
            public final long m(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return (temporalAccessor.s(a.MONTH_OF_YEAR) + 2) / 3;
                }
                throw new q("Unsupported field: QuarterOfYear");
            }

            @Override // j$.time.temporal.n
            public final Temporal q(Temporal temporal, long j) {
                long jM = m(temporal);
                k().b(j, this);
                a aVar = a.MONTH_OF_YEAR;
                return temporal.b(((j - jM) * 3) + temporal.s(aVar), aVar);
            }

            @Override // java.lang.Enum
            public final String toString() {
                return "QuarterOfYear";
            }
        };
        QUARTER_OF_YEAR = gVar2;
        g gVar3 = new g() { // from class: j$.time.temporal.e
            @Override // j$.time.temporal.n
            public final boolean h(TemporalAccessor temporalAccessor) {
                if (!temporalAccessor.d(a.EPOCH_DAY)) {
                    return false;
                }
                g gVar4 = i.a;
                return j$.time.a.N(temporalAccessor).equals(s.c);
            }

            @Override // j$.time.temporal.n
            public final r i(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return r.f(1L, g.B(g.A(LocalDate.C(temporalAccessor))));
                }
                throw new q("Unsupported field: WeekOfWeekBasedYear");
            }

            @Override // j$.time.temporal.g, j$.time.temporal.n
            public final TemporalAccessor j(Map map, x xVar, y yVar) {
                LocalDate localDateB;
                long j;
                n nVar = g.WEEK_BASED_YEAR;
                HashMap map2 = (HashMap) map;
                Long l = (Long) map2.get(nVar);
                a aVar = a.DAY_OF_WEEK;
                Long l2 = (Long) map2.get(aVar);
                if (l != null && l2 != null) {
                    int iA = nVar.k().a(l.longValue(), nVar);
                    long jLongValue = ((Long) map2.get(g.WEEK_OF_WEEK_BASED_YEAR)).longValue();
                    g gVar4 = i.a;
                    if (j$.time.a.N(xVar).equals(s.c)) {
                        LocalDate localDateOf = LocalDate.of(iA, 1, 4);
                        if (yVar == y.LENIENT) {
                            long jLongValue2 = l2.longValue();
                            if (jLongValue2 > 7) {
                                long j2 = jLongValue2 - 1;
                                localDateOf = localDateOf.R(j2 / 7);
                                j = j2 % 7;
                            } else {
                                if (jLongValue2 < 1) {
                                    localDateOf = localDateOf.R(j$.time.a.U(jLongValue2, 7L) / 7);
                                    j = (jLongValue2 + 6) % 7;
                                }
                                localDateB = localDateOf.R(j$.time.a.U(jLongValue, 1L)).b(jLongValue2, aVar);
                            }
                            jLongValue2 = j + 1;
                            localDateB = localDateOf.R(j$.time.a.U(jLongValue, 1L)).b(jLongValue2, aVar);
                        } else {
                            int iA2 = aVar.b.a(l2.longValue(), aVar);
                            if (jLongValue < 1 || jLongValue > 52) {
                                if (yVar == y.STRICT) {
                                    r.f(1L, g.B(g.A(localDateOf))).b(jLongValue, this);
                                } else {
                                    k().b(jLongValue, this);
                                }
                            }
                            localDateB = localDateOf.R(jLongValue - 1).b(iA2, aVar);
                        }
                        map2.remove(this);
                        map2.remove(nVar);
                        map2.remove(aVar);
                        return localDateB;
                    }
                    j$.time.h.k("Resolve requires IsoChronology");
                }
                return null;
            }

            @Override // j$.time.temporal.n
            public final r k() {
                return r.g(52L, 53L);
            }

            @Override // j$.time.temporal.n
            public final long m(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return g.s(LocalDate.C(temporalAccessor));
                }
                throw new q("Unsupported field: WeekOfWeekBasedYear");
            }

            @Override // j$.time.temporal.n
            public final Temporal q(Temporal temporal, long j) {
                k().b(j, this);
                return temporal.c(j$.time.a.U(j, m(temporal)), ChronoUnit.WEEKS);
            }

            @Override // java.lang.Enum
            public final String toString() {
                return "WeekOfWeekBasedYear";
            }
        };
        WEEK_OF_WEEK_BASED_YEAR = gVar3;
        g gVar4 = new g() { // from class: j$.time.temporal.f
            @Override // j$.time.temporal.n
            public final boolean h(TemporalAccessor temporalAccessor) {
                if (!temporalAccessor.d(a.EPOCH_DAY)) {
                    return false;
                }
                g gVar5 = i.a;
                return j$.time.a.N(temporalAccessor).equals(s.c);
            }

            @Override // j$.time.temporal.n
            public final r i(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return a.YEAR.b;
                }
                throw new q("Unsupported field: WeekBasedYear");
            }

            @Override // j$.time.temporal.n
            public final r k() {
                return a.YEAR.b;
            }

            @Override // j$.time.temporal.n
            public final long m(TemporalAccessor temporalAccessor) {
                if (h(temporalAccessor)) {
                    return g.A(LocalDate.C(temporalAccessor));
                }
                throw new q("Unsupported field: WeekBasedYear");
            }

            @Override // j$.time.temporal.n
            public final Temporal q(Temporal temporal, long j) {
                if (!h(temporal)) {
                    throw new q("Unsupported field: WeekBasedYear");
                }
                int iA = a.YEAR.b.a(j, g.WEEK_BASED_YEAR);
                LocalDate localDateC = LocalDate.C(temporal);
                int iH = localDateC.h(a.DAY_OF_WEEK);
                int iS = g.s(localDateC);
                if (iS == 53 && g.B(iA) == 52) {
                    iS = 52;
                }
                return temporal.p(LocalDate.of(iA, 1, 4).P(((iS - 1) * 7) + (iH - r3.h(r6))));
            }

            @Override // java.lang.Enum
            public final String toString() {
                return "WeekBasedYear";
            }
        };
        WEEK_BASED_YEAR = gVar4;
        b = new g[]{gVar, gVar2, gVar3, gVar4};
        a = new int[]{0, 90, NikonType2MakernoteDirectory.TAG_UNKNOWN_48, 273, 0, 91, 182, 274};
    }

    public static int A(LocalDate localDate) {
        int year = localDate.getYear();
        int iF = localDate.F();
        if (iF <= 3) {
            return iF - localDate.E().ordinal() < -2 ? year - 1 : year;
        }
        if (iF >= 363) {
            return ((iF - 363) - (localDate.I() ? 1 : 0)) - localDate.E().ordinal() >= 0 ? year + 1 : year;
        }
        return year;
    }

    public static int B(int i) {
        LocalDate localDateOf = LocalDate.of(i, 1, 1);
        if (localDateOf.E() != j$.time.e.THURSDAY) {
            return (localDateOf.E() == j$.time.e.WEDNESDAY && localDateOf.I()) ? 53 : 52;
        }
        return 53;
    }

    public static int s(LocalDate localDate) {
        int iOrdinal = localDate.E().ordinal();
        int iF = localDate.F() - 1;
        int i = (3 - iOrdinal) + iF;
        int i2 = i - ((i / 7) * 7);
        int i3 = i2 - 3;
        if (i3 < -3) {
            i3 = i2 + 4;
        }
        if (iF < i3) {
            if (localDate.F() != 180) {
                localDate = LocalDate.N(localDate.a, 180);
            }
            return (int) r.f(1L, B(A(localDate.S(-1L)))).d;
        }
        int i4 = ((iF - i3) / 7) + 1;
        if (i4 != 53 || i3 == -3 || (i3 == -2 && localDate.I())) {
            return i4;
        }
        return 1;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) b.clone();
    }

    @Override // j$.time.temporal.n
    public final boolean isDateBased() {
        return true;
    }

    public TemporalAccessor j(Map map, x xVar, y yVar) {
        return null;
    }
}
