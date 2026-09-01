package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class l46 implements Iterable, th6 {
    public final int a;
    public final int b;
    public final int c;

    public l46(int i, int i2, int i3) {
        if (i3 == 0) {
            ay0.e("Step must be non-zero.");
            throw null;
        }
        if (i3 == Integer.MIN_VALUE) {
            ay0.e("Step must be greater than Int.MIN_VALUE to avoid overflow on negation.");
            throw null;
        }
        this.a = i;
        this.b = hk7.u(i, i2, i3);
        this.c = i3;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof l46)) {
            return false;
        }
        if (isEmpty() && ((l46) obj).isEmpty()) {
            return true;
        }
        l46 l46Var = (l46) obj;
        return this.a == l46Var.a && this.b == l46Var.b && this.c == l46Var.c;
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (((this.a * 31) + this.b) * 31) + this.c;
    }

    public boolean isEmpty() {
        int i = this.b;
        int i2 = this.c;
        int i3 = this.a;
        return i2 > 0 ? i3 > i : i3 < i;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new m46(this.a, this.b, this.c);
    }

    public String toString() {
        StringBuilder sb;
        int i = this.b;
        int i2 = this.c;
        int i3 = this.a;
        if (i2 > 0) {
            sb = new StringBuilder();
            sb.append(i3);
            sb.append("..");
            sb.append(i);
            sb.append(" step ");
            sb.append(i2);
        } else {
            sb = new StringBuilder();
            sb.append(i3);
            sb.append(" downTo ");
            sb.append(i);
            sb.append(" step ");
            sb.append(-i2);
        }
        return sb.toString();
    }
}
