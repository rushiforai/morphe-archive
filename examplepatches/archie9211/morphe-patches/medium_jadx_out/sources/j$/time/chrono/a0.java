package j$.time.chrono;

import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.ZoneId;
import j$.time.temporal.TemporalAccessor;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class a0 extends a implements Serializable {
    public static final a0 c = new a0();
    private static final long serialVersionUID = 1039765215346859963L;

    private a0() {
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    @Override // j$.time.chrono.a
    public final List A() {
        return j$.time.a.P(d0.values());
    }

    @Override // j$.time.chrono.a
    public final String B() {
        return "roc";
    }

    @Override // j$.time.chrono.a
    public final String C() {
        return "Minguo";
    }

    @Override // j$.time.chrono.a
    public final int F(m mVar, int i) {
        if (mVar instanceof d0) {
            return mVar == d0.ROC ? i : 1 - i;
        }
        throw new ClassCastException("Era must be MinguoEra");
    }

    @Override // j$.time.chrono.a
    public final j$.time.temporal.r G(j$.time.temporal.a aVar) {
        int i = z.a[aVar.ordinal()];
        if (i == 1) {
            j$.time.temporal.r rVar = j$.time.temporal.a.PROLEPTIC_MONTH.b;
            return j$.time.temporal.r.f(rVar.a - 22932, rVar.d - 22932);
        }
        if (i == 2) {
            j$.time.temporal.r rVar2 = j$.time.temporal.a.YEAR.b;
            return j$.time.temporal.r.g(rVar2.d - 1911, (-rVar2.a) + 1912);
        }
        if (i != 3) {
            return aVar.b;
        }
        j$.time.temporal.r rVar3 = j$.time.temporal.a.YEAR.b;
        return j$.time.temporal.r.f(rVar3.a - 1911, rVar3.d - 1911);
    }

    @Override // j$.time.chrono.a
    public final b J(Map map, j$.time.format.y yVar) {
        return (c0) super.J(map, yVar);
    }

    @Override // j$.time.chrono.a
    public final j N(Instant instant, ZoneId zoneId) {
        return l.B(this, instant, zoneId);
    }

    @Override // j$.time.chrono.a
    public final b i(int i, int i2, int i3) {
        return new c0(LocalDate.of(i + 1911, i2, i3));
    }

    @Override // j$.time.chrono.a
    public final b j(TemporalAccessor temporalAccessor) {
        return temporalAccessor instanceof c0 ? (c0) temporalAccessor : new c0(LocalDate.C(temporalAccessor));
    }

    @Override // j$.time.chrono.a
    public final b k(long j) {
        return new c0(LocalDate.M(j));
    }

    @Override // j$.time.chrono.a
    public final b m() {
        return new c0(LocalDate.C(LocalDate.L(j$.time.a.W())));
    }

    @Override // j$.time.chrono.a
    public final b q(int i, int i2) {
        return new c0(LocalDate.N(i + 1911, i2));
    }

    @Override // j$.time.chrono.a
    public final m s(int i) {
        if (i == 0) {
            return d0.BEFORE_ROC;
        }
        if (i == 1) {
            return d0.ROC;
        }
        j$.time.h.d("Invalid era: ", i);
        return null;
    }

    public Object writeReplace() {
        return new e0((byte) 1, this);
    }
}
