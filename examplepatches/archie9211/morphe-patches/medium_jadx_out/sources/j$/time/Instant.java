package j$.time;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.squareup.wire.internal.MathMethodsKt;
import j$.time.format.DateTimeFormatter;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class Instant implements Temporal, j$.time.temporal.l, Comparable<Instant>, Serializable {
    public static final Instant c = new Instant(0, 0);
    private static final long serialVersionUID = -665713676816604388L;
    public final long a;
    public final int b;

    static {
        ofEpochSecond(-31557014167219200L, 0L);
        ofEpochSecond(31556889864403199L, 999999999L);
    }

    public Instant(long j, int i) {
        this.a = j;
        this.b = i;
    }

    public static Instant A(long j, int i) {
        if ((((long) i) | j) == 0) {
            return c;
        }
        if (j >= -31557014167219200L && j <= 31556889864403199L) {
            return new Instant(j, i);
        }
        h.k("Instant exceeds minimum or maximum instant");
        return null;
    }

    public static Instant from(TemporalAccessor temporalAccessor) {
        if (temporalAccessor instanceof Instant) {
            return (Instant) temporalAccessor;
        }
        Objects.requireNonNull(temporalAccessor, "temporal");
        try {
            return ofEpochSecond(temporalAccessor.s(j$.time.temporal.a.INSTANT_SECONDS), temporalAccessor.h(j$.time.temporal.a.NANO_OF_SECOND));
        } catch (c e) {
            h.h("Unable to obtain Instant from TemporalAccessor: ", temporalAccessor, temporalAccessor.getClass().getName(), e);
            return null;
        }
    }

    public static Instant ofEpochSecond(long j, long j2) {
        return A(a.O(j, a.S(j2, MathMethodsKt.NANOS_PER_SECOND)), (int) a.R(j2, MathMethodsKt.NANOS_PER_SECOND));
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 2, this);
    }

    public final Instant B(long j, long j2) {
        if ((j | j2) == 0) {
            return this;
        }
        return ofEpochSecond(a.O(a.O(this.a, j), j2 / MathMethodsKt.NANOS_PER_SECOND), ((long) this.b) + (j2 % MathMethodsKt.NANOS_PER_SECOND));
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final Instant c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (Instant) pVar.h(this, j);
        }
        switch (f.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return B(0L, j);
            case 2:
                return B(j / 1000000, (j % 1000000) * 1000);
            case 3:
                return B(j / 1000, (j % 1000) * 1000000);
            case 4:
                return B(j, 0L);
            case 5:
                return B(a.T(j, 60L), 0L);
            case 6:
                return B(a.T(j, 3600L), 0L);
            case 7:
                return B(a.T(j, 43200L), 0L);
            case 8:
                return B(a.T(j, 86400L), 0L);
            default:
                h.b(pVar, "Unsupported unit: ");
                return null;
        }
    }

    public final long D(Instant instant) {
        long jU = a.U(instant.a, this.a);
        long j = instant.b - this.b;
        return (jU <= 0 || j >= 0) ? (jU >= 0 || j <= 0) ? jU : jU + 1 : jU - 1;
    }

    public final long E() {
        long j = this.a;
        return (j >= 0 || this.b <= 0) ? a.O(a.T(j, 1000L), this.b / 1000000) : a.O(a.T(j + 1, 1000L), (this.b / 1000000) - 1000);
    }

    public OffsetDateTime atOffset(ZoneOffset zoneOffset) {
        return OffsetDateTime.A(this, zoneOffset);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (Instant) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        aVar.s(j);
        int i = f.a[aVar.ordinal()];
        if (i == 1) {
            return j != ((long) this.b) ? A(this.a, (int) j) : this;
        }
        if (i == 2) {
            int i2 = ((int) j) * PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
            return i2 != this.b ? A(this.a, i2) : this;
        }
        if (i == 3) {
            int i3 = ((int) j) * 1000000;
            return i3 != this.b ? A(this.a, i3) : this;
        }
        if (i == 4) {
            return j != this.a ? A(j, this.b) : this;
        }
        throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Instant instant) {
        Instant instant2 = instant;
        int iCompare = Long.compare(this.a, instant2.a);
        return iCompare != 0 ? iCompare : this.b - instant2.b;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.INSTANT_SECONDS || nVar == j$.time.temporal.a.NANO_OF_SECOND || nVar == j$.time.temporal.a.MICRO_OF_SECOND || nVar == j$.time.temporal.a.MILLI_OF_SECOND : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Instant) {
            Instant instant = (Instant) obj;
            if (this.a == instant.a && this.b == instant.b) {
                return true;
            }
        }
        return false;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        Instant instantFrom = from(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, instantFrom);
        }
        switch (f.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return a.O(a.T(a.U(instantFrom.a, this.a), MathMethodsKt.NANOS_PER_SECOND), instantFrom.b - this.b);
            case 2:
                return a.O(a.T(a.U(instantFrom.a, this.a), MathMethodsKt.NANOS_PER_SECOND), instantFrom.b - this.b) / 1000;
            case 3:
                return a.U(instantFrom.E(), E());
            case 4:
                return D(instantFrom);
            case 5:
                return D(instantFrom) / 60;
            case 6:
                return D(instantFrom) / 3600;
            case 7:
                return D(instantFrom) / 43200;
            case 8:
                return D(instantFrom) / 86400;
            default:
                h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    public long getEpochSecond() {
        return this.a;
    }

    public int getNano() {
        return this.b;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return j$.time.temporal.o.d(this, nVar).a(nVar.m(this), nVar);
        }
        int i = f.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i == 1) {
            return this.b;
        }
        if (i == 2) {
            return this.b / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
        }
        if (i == 3) {
            return this.b / 1000000;
        }
        if (i == 4) {
            j$.time.temporal.a aVar = j$.time.temporal.a.INSTANT_SECONDS;
            aVar.b.a(this.a, aVar);
        }
        throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
    }

    public final int hashCode() {
        long j = this.a;
        return (this.b * 51) + ((int) (j ^ (j >>> 32)));
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (Instant) a.a(localDate, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(this.a, j$.time.temporal.a.INSTANT_SECONDS).b(this.b, j$.time.temporal.a.NANO_OF_SECOND);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.c) {
            return ChronoUnit.NANOS;
        }
        if (aVar == j$.time.temporal.o.b || aVar == j$.time.temporal.o.a || aVar == j$.time.temporal.o.e || aVar == j$.time.temporal.o.d || aVar == j$.time.temporal.o.f || aVar == j$.time.temporal.o.g) {
            return null;
        }
        return aVar.g(this);
    }

    @Override // j$.time.temporal.Temporal
    public final Temporal q(long j, ChronoUnit chronoUnit) {
        long j2;
        if (j == Long.MIN_VALUE) {
            this = c(Long.MAX_VALUE, chronoUnit);
            j2 = 1;
        } else {
            j2 = -j;
        }
        return this.c(j2, chronoUnit);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        int i;
        if (!(nVar instanceof j$.time.temporal.a)) {
            return nVar.m(this);
        }
        int i2 = f.a[((j$.time.temporal.a) nVar).ordinal()];
        if (i2 == 1) {
            i = this.b;
        } else if (i2 == 2) {
            i = this.b / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
        } else {
            if (i2 != 3) {
                if (i2 == 4) {
                    return this.a;
                }
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
            }
            i = this.b / 1000000;
        }
        return i;
    }

    public final String toString() {
        return DateTimeFormatter.ISO_INSTANT.format(this);
    }
}
