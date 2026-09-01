package j$.time;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.squareup.wire.internal.MathMethodsKt;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class Duration implements TemporalAmount, Comparable<Duration>, Serializable {
    public static final Duration c = new Duration(0, 0);
    private static final long serialVersionUID = 3078945930695997490L;
    public final long a;
    public final int b;

    static {
        BigInteger.valueOf(MathMethodsKt.NANOS_PER_SECOND);
    }

    public Duration(long j, int i) {
        this.a = j;
        this.b = i;
    }

    public static Duration i(long j, int i) {
        return (((long) i) | j) == 0 ? c : new Duration(j, i);
    }

    public static Duration j(long j) {
        long j2 = j / MathMethodsKt.NANOS_PER_SECOND;
        int i = (int) (j % MathMethodsKt.NANOS_PER_SECOND);
        if (i < 0) {
            i = (int) (((long) i) + MathMethodsKt.NANOS_PER_SECOND);
            j2--;
        }
        return i(j2, i);
    }

    public static Duration ofMillis(long j) {
        long j2 = j / 1000;
        int i = (int) (j % 1000);
        if (i < 0) {
            i += PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
            j2--;
        }
        return i(j2, i * 1000000);
    }

    public static Duration ofSeconds(long j, long j2) {
        return i(a.O(j, a.S(j2, MathMethodsKt.NANOS_PER_SECOND)), (int) a.R(j2, MathMethodsKt.NANOS_PER_SECOND));
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 1, this);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Duration duration) {
        Duration duration2 = duration;
        int iCompare = Long.compare(this.a, duration2.a);
        return iCompare != 0 ? iCompare : this.b - duration2.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Duration) {
            Duration duration = (Duration) obj;
            if (this.a == duration.a && this.b == duration.b) {
                return true;
            }
        }
        return false;
    }

    public int getNano() {
        return this.b;
    }

    public long getSeconds() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAmount
    public final Temporal h(Temporal temporal) {
        long j = this.a;
        if (j != 0) {
            temporal = temporal.c(j, ChronoUnit.SECONDS);
        }
        int i = this.b;
        return i != 0 ? temporal.c(i, ChronoUnit.NANOS) : temporal;
    }

    public final int hashCode() {
        long j = this.a;
        return (this.b * 51) + ((int) (j ^ (j >>> 32)));
    }

    public long toMillis() {
        long j = this.a;
        long j2 = this.b;
        if (j < 0) {
            j++;
            j2 -= MathMethodsKt.NANOS_PER_SECOND;
        }
        return a.O(a.T(j, 1000L), j2 / 1000000);
    }

    public final String toString() {
        if (this == c) {
            return "PT0S";
        }
        long j = this.a;
        if (j < 0 && this.b > 0) {
            j++;
        }
        long j2 = j / 3600;
        int i = (int) ((j % 3600) / 60);
        int i2 = (int) (j % 60);
        StringBuilder sb = new StringBuilder(24);
        sb.append("PT");
        if (j2 != 0) {
            sb.append(j2);
            sb.append('H');
        }
        if (i != 0) {
            sb.append(i);
            sb.append('M');
        }
        if (i2 == 0 && this.b == 0 && sb.length() > 2) {
            return sb.toString();
        }
        if (this.a >= 0 || this.b <= 0 || i2 != 0) {
            sb.append(i2);
        } else {
            sb.append("-0");
        }
        if (this.b > 0) {
            int length = sb.length();
            long j3 = this.a;
            int i3 = this.b;
            if (j3 < 0) {
                sb.append(2000000000 - ((long) i3));
            } else {
                sb.append(((long) i3) + MathMethodsKt.NANOS_PER_SECOND);
            }
            while (sb.charAt(sb.length() - 1) == '0') {
                sb.setLength(sb.length() - 1);
            }
            sb.setCharAt(length, '.');
        }
        sb.append('S');
        return sb.toString();
    }

    public static Duration ofSeconds(long j) {
        return i(j, 0);
    }
}
