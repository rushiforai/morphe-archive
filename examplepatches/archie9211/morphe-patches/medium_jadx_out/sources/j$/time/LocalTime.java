package j$.time;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.squareup.wire.internal.MathMethodsKt;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class LocalTime implements Temporal, j$.time.temporal.l, Comparable<LocalTime>, Serializable {
    public static final LocalTime e;
    public static final LocalTime f;
    public static final LocalTime g;
    public static final LocalTime[] h = new LocalTime[24];
    private static final long serialVersionUID = 6414437269572265201L;
    public final byte a;
    public final byte b;
    public final byte c;
    public final int d;

    static {
        int i = 0;
        while (true) {
            LocalTime[] localTimeArr = h;
            if (i >= localTimeArr.length) {
                LocalTime localTime = localTimeArr[0];
                g = localTime;
                LocalTime localTime2 = localTimeArr[12];
                e = localTime;
                f = new LocalTime(23, 59, 59, 999999999);
                return;
            }
            localTimeArr[i] = new LocalTime(i, 0, 0, 0);
            i++;
        }
    }

    public LocalTime(int i, int i2, int i3, int i4) {
        this.a = (byte) i;
        this.b = (byte) i2;
        this.c = (byte) i3;
        this.d = i4;
    }

    public static LocalTime B(int i, int i2, int i3, int i4) {
        return ((i2 | i3) | i4) == 0 ? h[i] : new LocalTime(i, i2, i3, i4);
    }

    public static LocalTime C(TemporalAccessor temporalAccessor) {
        Objects.requireNonNull(temporalAccessor, "temporal");
        LocalTime localTime = (LocalTime) temporalAccessor.m(j$.time.temporal.o.g);
        if (localTime != null) {
            return localTime;
        }
        h.g("Unable to obtain LocalTime from TemporalAccessor: ", temporalAccessor, " of type ", temporalAccessor.getClass().getName());
        return null;
    }

    public static LocalTime E(long j) {
        j$.time.temporal.a.NANO_OF_DAY.s(j);
        int i = (int) (j / 3600000000000L);
        long j2 = j - (((long) i) * 3600000000000L);
        int i2 = (int) (j2 / 60000000000L);
        long j3 = j2 - (((long) i2) * 60000000000L);
        int i3 = (int) (j3 / MathMethodsKt.NANOS_PER_SECOND);
        return B(i, i2, i3, (int) (j3 - (((long) i3) * MathMethodsKt.NANOS_PER_SECOND)));
    }

    public static LocalTime K(DataInput dataInput) throws IOException {
        int i;
        int i2;
        int i3 = dataInput.readByte();
        int i4 = 0;
        if (i3 < 0) {
            i3 = ~i3;
            i2 = 0;
            i = 0;
        } else {
            byte b = dataInput.readByte();
            if (b < 0) {
                int i5 = ~b;
                i = 0;
                i4 = i5;
                i2 = 0;
            } else {
                byte b2 = dataInput.readByte();
                if (b2 < 0) {
                    i2 = ~b2;
                    i = 0;
                    i4 = b;
                } else {
                    i = dataInput.readInt();
                    i4 = b;
                    i2 = b2;
                }
            }
        }
        return of(i3, i4, i2, i);
    }

    public static LocalTime of(int i, int i2, int i3, int i4) {
        j$.time.temporal.a.HOUR_OF_DAY.s(i);
        j$.time.temporal.a.MINUTE_OF_HOUR.s(i2);
        j$.time.temporal.a.SECOND_OF_MINUTE.s(i3);
        j$.time.temporal.a.NANO_OF_SECOND.s(i4);
        return B(i, i2, i3, i4);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 4, this);
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: A, reason: merged with bridge method [inline-methods] */
    public final int compareTo(LocalTime localTime) {
        int iCompare = Integer.compare(this.a, localTime.a);
        return (iCompare == 0 && (iCompare = Integer.compare(this.b, localTime.b)) == 0 && (iCompare = Integer.compare(this.c, localTime.c)) == 0) ? Integer.compare(this.d, localTime.d) : iCompare;
    }

    public final int D(j$.time.temporal.n nVar) {
        switch (j.a[((j$.time.temporal.a) nVar).ordinal()]) {
            case 1:
                return this.d;
            case 2:
                throw new j$.time.temporal.q("Invalid field 'NanoOfDay' for get() method, use getLong() instead");
            case 3:
                return this.d / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
            case 4:
                throw new j$.time.temporal.q("Invalid field 'MicroOfDay' for get() method, use getLong() instead");
            case 5:
                return this.d / 1000000;
            case 6:
                return (int) (L() / 1000000);
            case 7:
                return this.c;
            case 8:
                return M();
            case 9:
                return this.b;
            case 10:
                return (this.a * 60) + this.b;
            case 11:
                return this.a % 12;
            case 12:
                int i = this.a % 12;
                if (i % 12 == 0) {
                    return 12;
                }
                return i;
            case 13:
                return this.a;
            case 14:
                byte b = this.a;
                if (b == 0) {
                    return 24;
                }
                return b;
            case 15:
                return this.a / 12;
            default:
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: F, reason: merged with bridge method [inline-methods] */
    public final LocalTime c(long j, j$.time.temporal.p pVar) {
        if (!(pVar instanceof ChronoUnit)) {
            return (LocalTime) pVar.h(this, j);
        }
        switch (j.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return I(j);
            case 2:
                return I((j % 86400000000L) * 1000);
            case 3:
                return I((j % 86400000) * 1000000);
            case 4:
                return J(j);
            case 5:
                return H(j);
            case 6:
                return G(j);
            case 7:
                return G((j % 2) * 12);
            default:
                h.b(pVar, "Unsupported unit: ");
                return null;
        }
    }

    public final LocalTime G(long j) {
        return j == 0 ? this : B(((((int) (j % 24)) + this.a) + 24) % 24, this.b, this.c, this.d);
    }

    public final LocalTime H(long j) {
        if (j != 0) {
            int i = (this.a * 60) + this.b;
            int i2 = ((((int) (j % 1440)) + i) + 1440) % 1440;
            if (i != i2) {
                return B(i2 / 60, i2 % 60, this.c, this.d);
            }
        }
        return this;
    }

    public final LocalTime I(long j) {
        if (j != 0) {
            long jL = L();
            long j2 = (((j % 86400000000000L) + jL) + 86400000000000L) % 86400000000000L;
            if (jL != j2) {
                return B((int) (j2 / 3600000000000L), (int) ((j2 / 60000000000L) % 60), (int) ((j2 / MathMethodsKt.NANOS_PER_SECOND) % 60), (int) (j2 % MathMethodsKt.NANOS_PER_SECOND));
            }
        }
        return this;
    }

    public final LocalTime J(long j) {
        if (j != 0) {
            int i = (this.b * 60) + (this.a * 3600) + this.c;
            int i2 = ((((int) (j % 86400)) + i) + 86400) % 86400;
            if (i != i2) {
                return B(i2 / NikonType2MakernoteDirectory.TAG_NIKON_SCAN, (i2 / 60) % 60, i2 % 60, this.d);
            }
        }
        return this;
    }

    public final long L() {
        return (((long) this.c) * MathMethodsKt.NANOS_PER_SECOND) + (((long) this.b) * 60000000000L) + (((long) this.a) * 3600000000000L) + ((long) this.d);
    }

    public final int M() {
        return (this.b * 60) + (this.a * 3600) + this.c;
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: N, reason: merged with bridge method [inline-methods] */
    public final LocalTime b(long j, j$.time.temporal.n nVar) {
        if (!(nVar instanceof j$.time.temporal.a)) {
            return (LocalTime) nVar.q(this, j);
        }
        j$.time.temporal.a aVar = (j$.time.temporal.a) nVar;
        aVar.s(j);
        switch (j.a[aVar.ordinal()]) {
            case 1:
                return O((int) j);
            case 2:
                return E(j);
            case 3:
                return O(((int) j) * PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
            case 4:
                return E(j * 1000);
            case 5:
                return O(((int) j) * 1000000);
            case 6:
                return E(j * 1000000);
            case 7:
                int i = (int) j;
                if (this.c != i) {
                    j$.time.temporal.a.SECOND_OF_MINUTE.s(i);
                    return B(this.a, this.b, i, this.d);
                }
                return this;
            case 8:
                return J(j - ((long) M()));
            case 9:
                int i2 = (int) j;
                if (this.b != i2) {
                    j$.time.temporal.a.MINUTE_OF_HOUR.s(i2);
                    return B(this.a, i2, this.c, this.d);
                }
                return this;
            case 10:
                return H(j - ((long) ((this.a * 60) + this.b)));
            case 11:
                return G(j - ((long) (this.a % 12)));
            case 12:
                if (j == 12) {
                    j = 0;
                }
                return G(j - ((long) (this.a % 12)));
            case 13:
                int i3 = (int) j;
                if (this.a != i3) {
                    j$.time.temporal.a.HOUR_OF_DAY.s(i3);
                    return B(i3, this.b, this.c, this.d);
                }
                return this;
            case 14:
                if (j == 24) {
                    j = 0;
                }
                int i4 = (int) j;
                if (this.a != i4) {
                    j$.time.temporal.a.HOUR_OF_DAY.s(i4);
                    return B(i4, this.b, this.c, this.d);
                }
                return this;
            case 15:
                return G((j - ((long) (this.a / 12))) * 12);
            default:
                throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
    }

    public final LocalTime O(int i) {
        if (this.d == i) {
            return this;
        }
        j$.time.temporal.a.NANO_OF_SECOND.s(i);
        return B(this.a, this.b, this.c, i);
    }

    public final void P(DataOutput dataOutput) throws IOException {
        if (this.d != 0) {
            dataOutput.writeByte(this.a);
            dataOutput.writeByte(this.b);
            dataOutput.writeByte(this.c);
            dataOutput.writeInt(this.d);
            return;
        }
        if (this.c != 0) {
            dataOutput.writeByte(this.a);
            dataOutput.writeByte(this.b);
            dataOutput.writeByte(~this.c);
            return;
        }
        byte b = this.b;
        byte b2 = this.a;
        if (b == 0) {
            dataOutput.writeByte(~b2);
        } else {
            dataOutput.writeByte(b2);
            dataOutput.writeByte(~this.b);
        }
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? ((j$.time.temporal.a) nVar).A() : nVar != null && nVar.h(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof LocalTime) {
            LocalTime localTime = (LocalTime) obj;
            if (this.a == localTime.a && this.b == localTime.b && this.c == localTime.c && this.d == localTime.d) {
                return true;
            }
        }
        return false;
    }

    @Override // j$.time.temporal.Temporal
    public final long f(Temporal temporal, j$.time.temporal.p pVar) {
        LocalTime localTimeC = C(temporal);
        if (!(pVar instanceof ChronoUnit)) {
            return pVar.between(this, localTimeC);
        }
        long jL = localTimeC.L() - L();
        switch (j.b[((ChronoUnit) pVar).ordinal()]) {
            case 1:
                return jL;
            case 2:
                return jL / 1000;
            case 3:
                return jL / 1000000;
            case 4:
                return jL / MathMethodsKt.NANOS_PER_SECOND;
            case 5:
                return jL / 60000000000L;
            case 6:
                return jL / 3600000000000L;
            case 7:
                return jL / 43200000000000L;
            default:
                h.b(pVar, "Unsupported unit: ");
                return 0L;
        }
    }

    public int getHour() {
        return this.a;
    }

    public int getMinute() {
        return this.b;
    }

    public int getNano() {
        return this.d;
    }

    public int getSecond() {
        return this.c;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? D(nVar) : j$.time.temporal.o.a(this, nVar);
    }

    public final int hashCode() {
        long jL = L();
        return (int) (jL ^ (jL >>> 32));
    }

    @Override // j$.time.temporal.Temporal
    /* JADX INFO: renamed from: i */
    public final Temporal p(LocalDate localDate) {
        return (LocalTime) a.a(localDate, this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(L(), j$.time.temporal.a.NANO_OF_DAY);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        if (aVar == j$.time.temporal.o.b || aVar == j$.time.temporal.o.a || aVar == j$.time.temporal.o.e || aVar == j$.time.temporal.o.d) {
            return null;
        }
        if (aVar == j$.time.temporal.o.g) {
            return this;
        }
        if (aVar == j$.time.temporal.o.f) {
            return null;
        }
        return aVar == j$.time.temporal.o.c ? ChronoUnit.NANOS : aVar.g(this);
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
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.NANO_OF_DAY ? L() : nVar == j$.time.temporal.a.MICRO_OF_DAY ? L() / 1000 : D(nVar) : nVar.m(this);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(18);
        byte b = this.a;
        byte b2 = this.b;
        byte b3 = this.c;
        int i = this.d;
        sb.append(b < 10 ? "0" : "");
        sb.append((int) b);
        sb.append(b2 < 10 ? ":0" : ":");
        sb.append((int) b2);
        if (b3 > 0 || i > 0) {
            sb.append(b3 < 10 ? ":0" : ":");
            sb.append((int) b3);
            if (i > 0) {
                sb.append('.');
                if (i % 1000000 == 0) {
                    sb.append(Integer.toString((i / 1000000) + PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE).substring(1));
                } else if (i % PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE == 0) {
                    sb.append(Integer.toString((i / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE) + 1000000).substring(1));
                } else {
                    sb.append(Integer.toString(i + 1000000000).substring(1));
                }
            }
        }
        return sb.toString();
    }
}
