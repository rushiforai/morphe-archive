package j$.time.chrono;

import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalDateTime;
import j$.time.Year;
import j$.time.ZoneId;
import j$.time.ZonedDateTime;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s extends a implements Serializable {
    public static final s c = new s();
    private static final long serialVersionUID = -1440403870442975015L;

    private s() {
    }

    public static boolean P(long j) {
        if ((3 & j) == 0) {
            return j % 100 != 0 || j % 400 == 0;
        }
        return false;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    @Override // j$.time.chrono.a
    public final List A() {
        return j$.time.a.P(t.values());
    }

    @Override // j$.time.chrono.a
    public final String B() {
        return "iso8601";
    }

    @Override // j$.time.chrono.a
    public final String C() {
        return "ISO";
    }

    @Override // j$.time.chrono.a
    public final e D(TemporalAccessor temporalAccessor) {
        return LocalDateTime.B(temporalAccessor);
    }

    @Override // j$.time.chrono.a
    public final int F(m mVar, int i) {
        if (mVar instanceof t) {
            return mVar == t.CE ? i : 1 - i;
        }
        throw new ClassCastException("Era must be IsoEra");
    }

    @Override // j$.time.chrono.a
    public final j$.time.temporal.r G(j$.time.temporal.a aVar) {
        return aVar.b;
    }

    @Override // j$.time.chrono.a
    public final b J(Map map, j$.time.format.y yVar) {
        return (LocalDate) super.J(map, yVar);
    }

    @Override // j$.time.chrono.a
    public final void K(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.PROLEPTIC_MONTH;
        Long l = (Long) map.remove(aVar);
        if (l != null) {
            if (yVar != j$.time.format.y.LENIENT) {
                aVar.s(l.longValue());
            }
            a.h(map, j$.time.temporal.a.MONTH_OF_YEAR, ((int) j$.time.a.R(l.longValue(), 12L)) + 1);
            a.h(map, j$.time.temporal.a.YEAR, j$.time.a.S(l.longValue(), 12L));
        }
    }

    @Override // j$.time.chrono.a
    public final b L(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR;
        int iA = aVar.b.a(((Long) map.remove(aVar)).longValue(), aVar);
        boolean z = true;
        if (yVar == j$.time.format.y.LENIENT) {
            return LocalDate.of(iA, 1, 1).Q(j$.time.a.U(((Long) map.remove(j$.time.temporal.a.MONTH_OF_YEAR)).longValue(), 1L)).P(j$.time.a.U(((Long) map.remove(j$.time.temporal.a.DAY_OF_MONTH)).longValue(), 1L));
        }
        j$.time.temporal.a aVar2 = j$.time.temporal.a.MONTH_OF_YEAR;
        int iA2 = aVar2.b.a(((Long) map.remove(aVar2)).longValue(), aVar2);
        j$.time.temporal.a aVar3 = j$.time.temporal.a.DAY_OF_MONTH;
        int iA3 = aVar3.b.a(((Long) map.remove(aVar3)).longValue(), aVar3);
        if (yVar == j$.time.format.y.SMART) {
            if (iA2 == 4 || iA2 == 6 || iA2 == 9 || iA2 == 11) {
                iA3 = Math.min(iA3, 30);
            } else if (iA2 == 2) {
                j$.time.l lVar = j$.time.l.FEBRUARY;
                long j = iA;
                int i = Year.b;
                if ((3 & j) != 0 || (j % 100 == 0 && j % 400 != 0)) {
                    z = false;
                }
                iA3 = Math.min(iA3, lVar.B(z));
            }
        }
        return LocalDate.of(iA, iA2, iA3);
    }

    @Override // j$.time.chrono.a
    public final b M(Map map, j$.time.format.y yVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.YEAR_OF_ERA;
        Long l = (Long) map.remove(aVar);
        if (l != null) {
            if (yVar != j$.time.format.y.LENIENT) {
                aVar.s(l.longValue());
            }
            Long l2 = (Long) map.remove(j$.time.temporal.a.ERA);
            if (l2 == null) {
                j$.time.temporal.a aVar2 = j$.time.temporal.a.YEAR;
                Long l3 = (Long) map.get(aVar2);
                if (yVar != j$.time.format.y.STRICT) {
                    a.h(map, aVar2, (l3 == null || l3.longValue() > 0) ? l.longValue() : j$.time.a.U(1L, l.longValue()));
                } else if (l3 != null) {
                    long jLongValue = l3.longValue();
                    long jLongValue2 = l.longValue();
                    if (jLongValue <= 0) {
                        jLongValue2 = j$.time.a.U(1L, jLongValue2);
                    }
                    a.h(map, aVar2, jLongValue2);
                } else {
                    map.put(aVar, l);
                }
            } else if (l2.longValue() == 1) {
                a.h(map, j$.time.temporal.a.YEAR, l.longValue());
            } else {
                if (l2.longValue() != 0) {
                    j$.time.h.j(l2, "Invalid value for era: ");
                    return null;
                }
                a.h(map, j$.time.temporal.a.YEAR, j$.time.a.U(1L, l.longValue()));
            }
        } else {
            j$.time.temporal.a aVar3 = j$.time.temporal.a.ERA;
            if (map.containsKey(aVar3)) {
                aVar3.s(((Long) map.get(aVar3)).longValue());
            }
        }
        return null;
    }

    @Override // j$.time.chrono.a
    public final j N(Instant instant, ZoneId zoneId) {
        Objects.requireNonNull(instant, "instant");
        Objects.requireNonNull(zoneId, "zone");
        return ZonedDateTime.k(instant.getEpochSecond(), instant.getNano(), zoneId);
    }

    @Override // j$.time.chrono.a
    public final j O(TemporalAccessor temporalAccessor) {
        return ZonedDateTime.A(temporalAccessor);
    }

    @Override // j$.time.chrono.a
    public final b i(int i, int i2, int i3) {
        return LocalDate.of(i, i2, i3);
    }

    @Override // j$.time.chrono.a
    public final b j(TemporalAccessor temporalAccessor) {
        return LocalDate.C(temporalAccessor);
    }

    @Override // j$.time.chrono.a
    public final b k(long j) {
        return LocalDate.M(j);
    }

    @Override // j$.time.chrono.a
    public final b m() {
        j$.time.b bVarW = j$.time.a.W();
        Objects.requireNonNull(bVarW, "clock");
        return LocalDate.C(LocalDate.L(bVarW));
    }

    @Override // j$.time.chrono.a
    public final b q(int i, int i2) {
        return LocalDate.N(i, i2);
    }

    @Override // j$.time.chrono.a
    public final m s(int i) {
        if (i == 0) {
            return t.BCE;
        }
        if (i == 1) {
            return t.CE;
        }
        j$.time.h.d("Invalid era: ", i);
        return null;
    }

    public Object writeReplace() {
        return new e0((byte) 1, this);
    }
}
