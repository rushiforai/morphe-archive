package j$.time.chrono;

import j$.time.LocalDate;
import j$.time.temporal.Temporal;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class y implements m, Serializable {
    public static final y d;
    public static final y[] e;
    private static final long serialVersionUID = 1466499369062886794L;
    public final transient int a;
    public final transient LocalDate b;
    public final transient String c;

    static {
        y yVar = new y(-1, LocalDate.of(1868, 1, 1), "Meiji");
        d = yVar;
        e = new y[]{yVar, new y(0, LocalDate.of(1912, 7, 30), "Taisho"), new y(1, LocalDate.of(1926, 12, 25), "Showa"), new y(2, LocalDate.of(1989, 1, 8), "Heisei"), new y(3, LocalDate.of(2019, 5, 1), "Reiwa")};
    }

    public y(int i, LocalDate localDate, String str) {
        this.a = i;
        this.b = localDate;
        this.c = str;
    }

    public static y A(LocalDate localDate) {
        if (localDate.H(x.d)) {
            j$.time.h.k("JapaneseDate before Meiji 6 are not supported");
            return null;
        }
        for (int length = e.length - 1; length >= 0; length--) {
            y yVar = e[length];
            if (localDate.compareTo(yVar.b) >= 0) {
                return yVar;
            }
        }
        return null;
    }

    public static y C(int i) {
        int i2 = i + 1;
        if (i2 >= 0) {
            y[] yVarArr = e;
            if (i2 < yVarArr.length) {
                return yVarArr[i2];
            }
        }
        j$.time.h.d("Invalid era: ", i);
        return null;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new e0((byte) 5, this);
    }

    public final y B() {
        if (this == e[r0.length - 1]) {
            return null;
        }
        return C(this.a + 1);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ boolean d(j$.time.temporal.n nVar) {
        return j$.time.a.u(this, nVar);
    }

    @Override // j$.time.chrono.m
    public final int getValue() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.a.p(this, nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        j$.time.temporal.a aVar = j$.time.temporal.a.ERA;
        return nVar == aVar ? v.c.G(aVar) : j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(getValue(), j$.time.temporal.a.ERA);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ Object m(j$.time.format.a aVar) {
        return j$.time.a.y(this, aVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ long s(j$.time.temporal.n nVar) {
        return j$.time.a.r(this, nVar);
    }

    public final String toString() {
        return this.c;
    }
}
