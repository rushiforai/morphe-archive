package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tpe implements Comparable, Serializable {
    public static final tpe c = new tpe(0, 0);
    public final long a;
    public final long b;

    public tpe(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        vpe vpeVar = new vpe();
        vpeVar.a = this.a;
        vpeVar.b = this.b;
        return vpeVar;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        tpe tpeVar = (tpe) obj;
        tpeVar.getClass();
        long j = tpeVar.a;
        long j2 = this.a;
        if (j2 != j) {
            return Long.compare(j2 ^ Long.MIN_VALUE, j ^ Long.MIN_VALUE);
        }
        return Long.compare(this.b ^ Long.MIN_VALUE, tpeVar.b ^ Long.MIN_VALUE);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tpe)) {
            return false;
        }
        tpe tpeVar = (tpe) obj;
        return this.a == tpeVar.a && this.b == tpeVar.b;
    }

    public final int hashCode() {
        long j = this.a ^ this.b;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        byte[] bArr = new byte[36];
        ek7.B(this.a, bArr, 0, 0, 4);
        bArr[8] = 45;
        ek7.B(this.a, bArr, 9, 4, 6);
        bArr[13] = 45;
        ek7.B(this.a, bArr, 14, 6, 8);
        bArr[18] = 45;
        ek7.B(this.b, bArr, 19, 0, 2);
        bArr[23] = 45;
        ek7.B(this.b, bArr, 24, 2, 8);
        return new String(bArr, wk1.a);
    }
}
