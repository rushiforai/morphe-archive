package j$.time.chrono;

import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h implements TemporalAmount, Serializable {
    public static final /* synthetic */ int e = 0;
    private static final long serialVersionUID = 57387258289L;
    public final a a;
    public final int b;
    public final int c;
    public final int d;

    static {
        j$.time.a.P(new Object[]{ChronoUnit.YEARS, ChronoUnit.MONTHS, ChronoUnit.DAYS});
    }

    public h(a aVar, int i, int i2, int i3) {
        Objects.requireNonNull(aVar, "chrono");
        this.a = aVar;
        this.b = i;
        this.c = i2;
        this.d = i3;
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return this.b == hVar.b && this.c == hVar.c && this.d == hVar.d && this.a.equals(hVar.a);
    }

    @Override // j$.time.temporal.TemporalAmount
    public final Temporal h(Temporal temporal) {
        Objects.requireNonNull(temporal, "temporal");
        a aVar = (a) temporal.m(j$.time.temporal.o.b);
        if (aVar != null && !this.a.equals(aVar)) {
            j$.time.h.g("Chronology mismatch, expected: ", this.a.C(), ", actual: ", aVar.C());
            return null;
        }
        if (this.c == 0) {
            int i = this.b;
            if (i != 0) {
                temporal = temporal.c(i, ChronoUnit.YEARS);
            }
        } else {
            j$.time.temporal.r rVarG = this.a.G(j$.time.temporal.a.MONTH_OF_YEAR);
            long j = (rVarG.a == rVarG.b && rVarG.c == rVarG.d && rVarG.d()) ? (rVarG.d - rVarG.a) + 1 : -1L;
            int i2 = this.b;
            if (j > 0) {
                temporal = temporal.c((((long) i2) * j) + ((long) this.c), ChronoUnit.MONTHS);
            } else {
                if (i2 != 0) {
                    temporal = temporal.c(i2, ChronoUnit.YEARS);
                }
                temporal = temporal.c(this.c, ChronoUnit.MONTHS);
            }
        }
        int i3 = this.d;
        return i3 != 0 ? temporal.c(i3, ChronoUnit.DAYS) : temporal;
    }

    public final int hashCode() {
        return this.a.hashCode() ^ (Integer.rotateLeft(this.d, 16) + (Integer.rotateLeft(this.c, 8) + this.b));
    }

    public final String toString() {
        if (this.b == 0 && this.c == 0 && this.d == 0) {
            return this.a.toString() + " P0D";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(this.a.toString());
        sb.append(" P");
        int i = this.b;
        if (i != 0) {
            sb.append(i);
            sb.append('Y');
        }
        int i2 = this.c;
        if (i2 != 0) {
            sb.append(i2);
            sb.append('M');
        }
        int i3 = this.d;
        if (i3 != 0) {
            sb.append(i3);
            sb.append('D');
        }
        return sb.toString();
    }

    public Object writeReplace() {
        return new e0((byte) 9, this);
    }
}
