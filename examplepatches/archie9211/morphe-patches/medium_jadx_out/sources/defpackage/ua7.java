package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ua7 implements Iterable, th6 {
    public final long a;
    public final long b;

    public ua7(long j, long j2) {
        this.a = j;
        if (j < j2) {
            long j3 = j2 % 1;
            long j4 = j % 1;
            long j5 = ((j3 < 0 ? j3 + 1 : j3) - (j4 < 0 ? j4 + 1 : j4)) % 1;
            j2 -= j5 < 0 ? j5 + 1 : j5;
        }
        this.b = j2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ua7)) {
            return false;
        }
        if (isEmpty() && ((ua7) obj).isEmpty()) {
            return true;
        }
        ua7 ua7Var = (ua7) obj;
        return this.a == ua7Var.a && this.b == ua7Var.b;
    }

    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        long j = this.a;
        long j2 = 31 * (j ^ (j >>> 32));
        long j3 = this.b;
        return (int) (j2 + (j3 ^ (j3 >>> 32)));
    }

    public final boolean isEmpty() {
        return this.a > this.b;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new ta7(this.a, this.b);
    }

    public final String toString() {
        return this.a + ".." + this.b;
    }
}
