package j$.time.temporal;

import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r implements Serializable {
    private static final long serialVersionUID = -7317881728594519368L;
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public r(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public static r f(long j, long j2) {
        if (j <= j2) {
            return new r(j, j, j2, j2);
        }
        j$.time.h.c("Minimum value must be less than maximum value");
        return null;
    }

    public static r g(long j, long j2) {
        if (j > j2) {
            j$.time.h.c("Smallest maximum value must be less than largest maximum value");
            return null;
        }
        if (1 <= j2) {
            return new r(1L, 1L, j, j2);
        }
        j$.time.h.c("Minimum value must be less than maximum value");
        return null;
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        long j = this.a;
        long j2 = this.b;
        if (j > j2) {
            throw new InvalidObjectException("Smallest minimum value must be less than largest minimum value");
        }
        long j3 = this.c;
        long j4 = this.d;
        if (j3 > j4) {
            throw new InvalidObjectException("Smallest maximum value must be less than largest maximum value");
        }
        if (j2 > j4) {
            throw new InvalidObjectException("Minimum value must be less than maximum value");
        }
    }

    public final int a(long j, n nVar) {
        if (d() && e(j)) {
            return (int) j;
        }
        j$.time.h.k(c(j, nVar));
        return 0;
    }

    public final void b(long j, n nVar) {
        if (e(j)) {
            return;
        }
        j$.time.h.k(c(j, nVar));
    }

    public final String c(long j, n nVar) {
        if (nVar == null) {
            return "Invalid value (valid values " + this + "): " + j;
        }
        return "Invalid value for " + nVar + " (valid values " + this + "): " + j;
    }

    public final boolean d() {
        return this.a >= -2147483648L && this.d <= 2147483647L;
    }

    public final boolean e(long j) {
        return j >= this.a && j <= this.d;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof r) {
            r rVar = (r) obj;
            if (this.a == rVar.a && this.b == rVar.b && this.c == rVar.c && this.d == rVar.d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        long j3 = j + (j2 << 16) + (j2 >> 48);
        long j4 = this.c;
        long j5 = j3 + (j4 << 32) + (j4 >> 32);
        long j6 = this.d;
        long j7 = j5 + (j6 << 48) + (j6 >> 16);
        return (int) (j7 ^ (j7 >>> 32));
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        if (this.a != this.b) {
            sb.append('/');
            sb.append(this.b);
        }
        sb.append(" - ");
        sb.append(this.c);
        if (this.c != this.d) {
            sb.append('/');
            sb.append(this.d);
        }
        return sb.toString();
    }
}
