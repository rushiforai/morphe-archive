package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rk1 implements Iterable, th6 {
    public final char a;
    public final char b;

    static {
        new rk1((char) 1, (char) 0);
    }

    public rk1(char c, char c2) {
        this.a = c;
        this.b = (char) hk7.u(c, c2, 1);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof rk1)) {
            return false;
        }
        if (isEmpty() && ((rk1) obj).isEmpty()) {
            return true;
        }
        rk1 rk1Var = (rk1) obj;
        return this.a == rk1Var.a && this.b == rk1Var.b;
    }

    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (this.a * 31) + this.b;
    }

    public final boolean isEmpty() {
        return g76.Q(this.a, this.b) > 0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new qk1(this.a, this.b);
    }

    public final String toString() {
        return this.a + ".." + this.b;
    }
}
