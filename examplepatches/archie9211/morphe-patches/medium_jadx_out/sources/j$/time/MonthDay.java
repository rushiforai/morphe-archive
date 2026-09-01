package j$.time;

import j$.time.format.y;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class MonthDay implements TemporalAccessor, j$.time.temporal.l, Comparable<MonthDay>, Serializable {
    public static final /* synthetic */ int c = 0;
    private static final long serialVersionUID = -939150713474957432L;
    public final int a;
    public final int b;

    static {
        j$.time.format.p pVar = new j$.time.format.p();
        pVar.d("--");
        pVar.g(j$.time.temporal.a.MONTH_OF_YEAR, 2);
        pVar.c('-');
        pVar.g(j$.time.temporal.a.DAY_OF_MONTH, 2);
        pVar.l(Locale.getDefault(), y.SMART, null);
    }

    public MonthDay(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public static MonthDay of(int i, int i2) {
        l lVarD = l.D(i);
        Objects.requireNonNull(lVarD, "month");
        j$.time.temporal.a.DAY_OF_MONTH.s(i2);
        if (i2 <= lVarD.C()) {
            return new MonthDay(lVarD.getValue(), i2);
        }
        throw new c("Illegal value for DayOfMonth field, value " + i2 + " is not valid for month " + lVarD.name());
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 13, this);
    }

    @Override // java.lang.Comparable
    public final int compareTo(MonthDay monthDay) {
        MonthDay monthDay2 = monthDay;
        int i = this.a - monthDay2.a;
        return i == 0 ? this.b - monthDay2.b : i;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.MONTH_OF_YEAR || nVar == j$.time.temporal.a.DAY_OF_MONTH : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof MonthDay) {
            MonthDay monthDay = (MonthDay) obj;
            if (this.a == monthDay.a && this.b == monthDay.b) {
                return true;
            }
        }
        return false;
    }

    public int getDayOfMonth() {
        return this.b;
    }

    public int getMonthValue() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return j(nVar).a(s(nVar), nVar);
    }

    public final int hashCode() {
        return (this.a << 6) + this.b;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.MONTH_OF_YEAR) {
            return nVar.k();
        }
        if (nVar != j$.time.temporal.a.DAY_OF_MONTH) {
            return j$.time.temporal.o.d(this, nVar);
        }
        l lVarD = l.D(this.a);
        lVarD.getClass();
        int i = k.a[lVarD.ordinal()];
        return j$.time.temporal.r.g(i != 1 ? (i == 2 || i == 3 || i == 4 || i == 5) ? 30 : 31 : 28, l.D(this.a).C());
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        if (!a.N(temporal).equals(j$.time.chrono.s.c)) {
            h.k("Adjustment only supported on ISO date-time");
            return null;
        }
        Temporal temporalB = temporal.b(this.a, j$.time.temporal.a.MONTH_OF_YEAR);
        j$.time.temporal.a aVar = j$.time.temporal.a.DAY_OF_MONTH;
        return temporalB.b(Math.min(temporalB.j(aVar).d, this.b), aVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.b ? j$.time.chrono.s.c : j$.time.temporal.o.c(this, aVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        int i;
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i2 = m.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i2 == 1) {
            i = this.b;
        } else {
            if (i2 != 2) {
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
            }
            i = this.a;
        }
        return i;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(10);
        sb.append("--");
        sb.append(this.a < 10 ? "0" : "");
        sb.append(this.a);
        sb.append(this.b < 10 ? "-0" : "-");
        sb.append(this.b);
        return sb.toString();
    }
}
