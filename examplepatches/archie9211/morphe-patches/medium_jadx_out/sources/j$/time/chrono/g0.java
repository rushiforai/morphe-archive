package j$.time.chrono;

import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.ZoneId;
import j$.time.temporal.TemporalAccessor;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g0 extends a implements Serializable {
    public static final g0 c = new g0();
    private static final long serialVersionUID = 2775954514031616474L;

    static {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        HashMap map3 = new HashMap();
        map.put("en", new String[]{"BB", "BE"});
        map.put("th", new String[]{"BB", "BE"});
        map2.put("en", new String[]{"B.B.", "B.E."});
        map2.put("th", new String[]{"พ.ศ.", "ปีก่อนคริสต์กาลที่"});
        map3.put("en", new String[]{"Before Buddhist", "Budhhist Era"});
        map3.put("th", new String[]{"พุทธศักราช", "ปีก่อนคริสต์กาลที่"});
    }

    private g0() {
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    @Override // j$.time.chrono.a
    public final List A() {
        return j$.time.a.P(j0.values());
    }

    @Override // j$.time.chrono.a
    public final String B() {
        return "buddhist";
    }

    @Override // j$.time.chrono.a
    public final String C() {
        return "ThaiBuddhist";
    }

    @Override // j$.time.chrono.a
    public final int F(m mVar, int i) {
        if (mVar instanceof j0) {
            return mVar == j0.BE ? i : 1 - i;
        }
        throw new ClassCastException("Era must be BuddhistEra");
    }

    @Override // j$.time.chrono.a
    public final j$.time.temporal.r G(j$.time.temporal.a aVar) {
        int i = f0.a[aVar.ordinal()];
        if (i == 1) {
            j$.time.temporal.r rVar = j$.time.temporal.a.PROLEPTIC_MONTH.b;
            return j$.time.temporal.r.f(rVar.a + 6516, rVar.d + 6516);
        }
        if (i == 2) {
            j$.time.temporal.r rVar2 = j$.time.temporal.a.YEAR.b;
            return j$.time.temporal.r.g((-(rVar2.a + 543)) + 1, rVar2.d + 543);
        }
        if (i != 3) {
            return aVar.b;
        }
        j$.time.temporal.r rVar3 = j$.time.temporal.a.YEAR.b;
        return j$.time.temporal.r.f(rVar3.a + 543, rVar3.d + 543);
    }

    @Override // j$.time.chrono.a
    public final b J(Map map, j$.time.format.y yVar) {
        return (i0) super.J(map, yVar);
    }

    @Override // j$.time.chrono.a
    public final j N(Instant instant, ZoneId zoneId) {
        return l.B(this, instant, zoneId);
    }

    @Override // j$.time.chrono.a
    public final b i(int i, int i2, int i3) {
        return new i0(LocalDate.of(i - 543, i2, i3));
    }

    @Override // j$.time.chrono.a
    public final b j(TemporalAccessor temporalAccessor) {
        return temporalAccessor instanceof i0 ? (i0) temporalAccessor : new i0(LocalDate.C(temporalAccessor));
    }

    @Override // j$.time.chrono.a
    public final b k(long j) {
        return new i0(LocalDate.M(j));
    }

    @Override // j$.time.chrono.a
    public final b m() {
        return new i0(LocalDate.C(LocalDate.L(j$.time.a.W())));
    }

    @Override // j$.time.chrono.a
    public final b q(int i, int i2) {
        return new i0(LocalDate.N(i - 543, i2));
    }

    @Override // j$.time.chrono.a
    public final m s(int i) {
        if (i == 0) {
            return j0.BEFORE_BE;
        }
        if (i == 1) {
            return j0.BE;
        }
        j$.time.h.d("Invalid era: ", i);
        return null;
    }

    public Object writeReplace() {
        return new e0((byte) 1, this);
    }
}
