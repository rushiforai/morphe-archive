package j$.time.chrono;

import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.ZoneId;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v extends a implements Serializable {
    public static final v c = new v();
    private static final long serialVersionUID = 459996390165777884L;

    private v() {
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    @Override // j$.time.chrono.a
    public final List A() {
        y[] yVarArr = y.e;
        return j$.time.a.P((y[]) Arrays.copyOf(yVarArr, yVarArr.length));
    }

    @Override // j$.time.chrono.a
    public final String B() {
        return "japanese";
    }

    @Override // j$.time.chrono.a
    public final String C() {
        return "Japanese";
    }

    @Override // j$.time.chrono.a
    public final int F(m mVar, int i) {
        if (!(mVar instanceof y)) {
            throw new ClassCastException("Era must be JapaneseEra");
        }
        y yVar = (y) mVar;
        int year = (yVar.b.getYear() + i) - 1;
        if (i == 1 || (year >= -999999999 && year <= 999999999 && year >= yVar.b.getYear() && mVar == y.A(LocalDate.of(year, 1, 1)))) {
            return year;
        }
        j$.time.h.k("Invalid yearOfEra value");
        return 0;
    }

    @Override // j$.time.chrono.a
    public final j$.time.temporal.r G(j$.time.temporal.a aVar) {
        switch (u.a[aVar.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
                j$.time.h.b(aVar, "Unsupported field: ");
                return null;
            case 5:
                y[] yVarArr = y.e;
                int year = yVarArr[yVarArr.length - 1].b.getYear();
                int year2 = 1000000000 - yVarArr[yVarArr.length - 1].b.getYear();
                int year3 = yVarArr[0].b.getYear();
                int i = 1;
                while (true) {
                    y[] yVarArr2 = y.e;
                    if (i >= yVarArr2.length) {
                        return j$.time.temporal.r.g(year2, 999999999 - year);
                    }
                    y yVar = yVarArr2[i];
                    year2 = Math.min(year2, (yVar.b.getYear() - year3) + 1);
                    year3 = yVar.b.getYear();
                    i++;
                }
                break;
            case 6:
                y yVar2 = y.d;
                long jMin = j$.time.temporal.a.DAY_OF_YEAR.b.c;
                for (y yVar3 : y.e) {
                    jMin = Math.min(jMin, (yVar3.b.lengthOfYear() - yVar3.b.F()) + 1);
                    if (yVar3.B() != null) {
                        jMin = Math.min(jMin, yVar3.B().b.F() - 1);
                    }
                }
                return j$.time.temporal.r.g(jMin, j$.time.temporal.a.DAY_OF_YEAR.b.d);
            case 7:
                return j$.time.temporal.r.f(x.d.getYear(), 999999999L);
            case 8:
                long j = y.d.a;
                y[] yVarArr3 = y.e;
                return j$.time.temporal.r.f(j, yVarArr3[yVarArr3.length - 1].a);
            default:
                return aVar.b;
        }
    }

    @Override // j$.time.chrono.a
    public final b J(Map map, j$.time.format.y yVar) {
        return (x) super.J(map, yVar);
    }

    @Override // j$.time.chrono.a
    public final b M(Map map, j$.time.format.y yVar) {
        x xVarI;
        j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
        Long l = (Long) map.get(aVar);
        y yVarC = l != null ? y.C(G(aVar).a(l.longValue(), aVar)) : null;
        j$.time.temporal.a aVar2 = j$.time.temporal.a.YEAR_OF_ERA;
        Long l2 = (Long) map.get(aVar2);
        int iA = l2 != null ? G(aVar2).a(l2.longValue(), aVar2) : 0;
        if (yVarC == null && l2 != null && !map.containsKey(j$.time.temporal.a.YEAR) && yVar != j$.time.format.y.STRICT) {
            y[] yVarArr = y.e;
            yVarC = ((y[]) Arrays.copyOf(yVarArr, yVarArr.length))[((y[]) Arrays.copyOf(yVarArr, yVarArr.length)).length - 1];
        }
        if (l2 != null && yVarC != null) {
            j$.time.temporal.a aVar3 = j$.time.temporal.a.MONTH_OF_YEAR;
            if (map.containsKey(aVar3)) {
                j$.time.temporal.a aVar4 = j$.time.temporal.a.DAY_OF_MONTH;
                if (map.containsKey(aVar4)) {
                    map.remove(aVar);
                    map.remove(aVar2);
                    if (yVar == j$.time.format.y.LENIENT) {
                        return new x(LocalDate.of((yVarC.b.getYear() + iA) - 1, 1, 1)).F(j$.time.a.U(((Long) map.remove(aVar3)).longValue(), 1L), ChronoUnit.MONTHS).F(j$.time.a.U(((Long) map.remove(aVar4)).longValue(), 1L), ChronoUnit.DAYS);
                    }
                    int iA2 = G(aVar3).a(((Long) map.remove(aVar3)).longValue(), aVar3);
                    int iA3 = G(aVar4).a(((Long) map.remove(aVar4)).longValue(), aVar4);
                    if (yVar != j$.time.format.y.SMART) {
                        LocalDate localDate = x.d;
                        Objects.requireNonNull(yVarC, "era");
                        LocalDate localDateOf = LocalDate.of((yVarC.b.getYear() + iA) - 1, iA2, iA3);
                        if (!localDateOf.H(yVarC.b) && yVarC == y.A(localDateOf)) {
                            return new x(yVarC, iA, localDateOf);
                        }
                        j$.time.h.k("year, month, and day not valid for Era");
                        return null;
                    }
                    if (iA < 1) {
                        j$.time.h.d("Invalid YearOfEra: ", iA);
                        return null;
                    }
                    int year = (yVarC.b.getYear() + iA) - 1;
                    try {
                        xVarI = new x(LocalDate.of(year, iA2, iA3));
                    } catch (j$.time.c unused) {
                        xVarI = new x(LocalDate.of(year, iA2, 1)).I(new j$.time.format.a(1));
                    }
                    if (xVarI.b == yVarC || j$.time.temporal.o.a(xVarI, j$.time.temporal.a.YEAR_OF_ERA) <= 1 || iA <= 1) {
                        return xVarI;
                    }
                    throw new j$.time.c("Invalid YearOfEra for Era: " + yVarC + " " + iA);
                }
            }
            j$.time.temporal.a aVar5 = j$.time.temporal.a.DAY_OF_YEAR;
            if (map.containsKey(aVar5)) {
                map.remove(aVar);
                map.remove(aVar2);
                if (yVar == j$.time.format.y.LENIENT) {
                    return new x(LocalDate.N((yVarC.b.getYear() + iA) - 1, 1)).F(j$.time.a.U(((Long) map.remove(aVar5)).longValue(), 1L), ChronoUnit.DAYS);
                }
                int iA4 = G(aVar5).a(((Long) map.remove(aVar5)).longValue(), aVar5);
                LocalDate localDate2 = x.d;
                Objects.requireNonNull(yVarC, "era");
                LocalDate localDate3 = yVarC.b;
                LocalDate localDateN = iA == 1 ? LocalDate.N(localDate3.getYear(), (yVarC.b.F() + iA4) - 1) : LocalDate.N((localDate3.getYear() + iA) - 1, iA4);
                if (!localDateN.H(yVarC.b) && yVarC == y.A(localDateN)) {
                    return new x(yVarC, iA, localDateN);
                }
                j$.time.h.k("Invalid parameters");
            }
        }
        return null;
    }

    @Override // j$.time.chrono.a
    public final j N(Instant instant, ZoneId zoneId) {
        return l.B(this, instant, zoneId);
    }

    @Override // j$.time.chrono.a
    public final b i(int i, int i2, int i3) {
        return new x(LocalDate.of(i, i2, i3));
    }

    @Override // j$.time.chrono.a
    public final b j(TemporalAccessor temporalAccessor) {
        return temporalAccessor instanceof x ? (x) temporalAccessor : new x(LocalDate.C(temporalAccessor));
    }

    @Override // j$.time.chrono.a
    public final b k(long j) {
        return new x(LocalDate.M(j));
    }

    @Override // j$.time.chrono.a
    public final b m() {
        return new x(LocalDate.C(LocalDate.L(j$.time.a.W())));
    }

    @Override // j$.time.chrono.a
    public final b q(int i, int i2) {
        return new x(LocalDate.N(i, i2));
    }

    @Override // j$.time.chrono.a
    public final m s(int i) {
        return y.C(i);
    }

    public Object writeReplace() {
        return new e0((byte) 1, this);
    }
}
