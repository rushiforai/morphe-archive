package j$.time;

import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class Period implements TemporalAmount, Serializable {
    public static final Period d = new Period(0, 0, 0);
    public static final Pattern e = Pattern.compile("([-+]?)P(?:([-+]?[0-9]+)Y)?(?:([-+]?[0-9]+)M)?(?:([-+]?[0-9]+)W)?(?:([-+]?[0-9]+)D)?", 2);
    private static final long serialVersionUID = -3587258372562876L;
    public final int a;
    public final int b;
    public final int c;

    static {
        a.P(new Object[]{ChronoUnit.YEARS, ChronoUnit.MONTHS, ChronoUnit.DAYS});
    }

    public Period(int i, int i2, int i3) {
        this.a = i;
        this.b = i2;
        this.c = i3;
    }

    public static Period a(int i, int i2, int i3) {
        return ((i | i2) | i3) == 0 ? d : new Period(i, i2, i3);
    }

    public static int b(CharSequence charSequence, int i, int i2, int i3) {
        if (i < 0 || i2 < 0) {
            return 0;
        }
        if (charSequence.charAt(i) == '+') {
            i++;
        }
        long j = ((long) Integer.parseInt(charSequence.subSequence(i, i2).toString(), 10)) * ((long) i3);
        int i4 = (int) j;
        if (j == i4) {
            return i4;
        }
        try {
            throw new ArithmeticException();
        } catch (ArithmeticException e2) {
            throw new j$.time.format.r("Text cannot be parsed to a Period", charSequence, e2);
        }
    }

    public static Period of(int i, int i2, int i3) {
        return a(i, i2, i3);
    }

    public static Period parse(CharSequence charSequence) {
        Objects.requireNonNull(charSequence, "text");
        Matcher matcher = e.matcher(charSequence);
        if (matcher.matches()) {
            int i = 1;
            int iStart = matcher.start(1);
            int iEnd = matcher.end(1);
            if (iStart >= 0 && iEnd == iStart + 1 && charSequence.charAt(iStart) == '-') {
                i = -1;
            }
            int iStart2 = matcher.start(2);
            int iEnd2 = matcher.end(2);
            int iStart3 = matcher.start(3);
            int iEnd3 = matcher.end(3);
            int iStart4 = matcher.start(4);
            int iEnd4 = matcher.end(4);
            int iStart5 = matcher.start(5);
            int iEnd5 = matcher.end(5);
            if (iStart2 >= 0 || iStart3 >= 0 || iStart4 >= 0 || iStart5 >= 0) {
                try {
                    int iB = b(charSequence, iStart2, iEnd2, i);
                    int iB2 = b(charSequence, iStart3, iEnd3, i);
                    int iB3 = b(charSequence, iStart4, iEnd4, i);
                    int iB4 = b(charSequence, iStart5, iEnd5, i);
                    long j = ((long) iB3) * 7;
                    long j2 = (int) j;
                    if (j != j2) {
                        throw new ArithmeticException();
                    }
                    long j3 = ((long) iB4) + j2;
                    int i2 = (int) j3;
                    if (j3 == i2) {
                        return a(iB, iB2, i2);
                    }
                    throw new ArithmeticException();
                } catch (NumberFormatException e2) {
                    throw new j$.time.format.r("Text cannot be parsed to a Period", charSequence, e2);
                }
            }
        }
        throw new j$.time.format.r("Text cannot be parsed to a Period", charSequence);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new p((byte) 14, this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Period) {
            Period period = (Period) obj;
            if (this.a == period.a && this.b == period.b && this.c == period.c) {
                return true;
            }
        }
        return false;
    }

    public int getDays() {
        return this.c;
    }

    public int getMonths() {
        return this.b;
    }

    public int getYears() {
        return this.a;
    }

    @Override // j$.time.temporal.TemporalAmount
    public final Temporal h(Temporal temporal) {
        Objects.requireNonNull(temporal, "temporal");
        j$.time.chrono.a aVar = (j$.time.chrono.a) temporal.m(j$.time.temporal.o.b);
        if (aVar != null && !j$.time.chrono.s.c.equals(aVar)) {
            throw new c("Chronology mismatch, expected: ISO, actual: " + aVar.C());
        }
        int i = this.b;
        int i2 = this.a;
        if (i != 0) {
            long j = (((long) i2) * 12) + ((long) i);
            if (j != 0) {
                temporal = temporal.c(j, ChronoUnit.MONTHS);
            }
        } else if (i2 != 0) {
            temporal = temporal.c(i2, ChronoUnit.YEARS);
        }
        int i3 = this.c;
        return i3 != 0 ? temporal.c(i3, ChronoUnit.DAYS) : temporal;
    }

    public final int hashCode() {
        return Integer.rotateLeft(this.c, 16) + Integer.rotateLeft(this.b, 8) + this.a;
    }

    public final String toString() {
        if (this == d) {
            return "P0D";
        }
        StringBuilder sb = new StringBuilder("P");
        int i = this.a;
        if (i != 0) {
            sb.append(i);
            sb.append('Y');
        }
        int i2 = this.b;
        if (i2 != 0) {
            sb.append(i2);
            sb.append('M');
        }
        int i3 = this.c;
        if (i3 != 0) {
            sb.append(i3);
            sb.append('D');
        }
        return sb.toString();
    }
}
