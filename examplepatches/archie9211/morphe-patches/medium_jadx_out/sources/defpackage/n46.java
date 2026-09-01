package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n46 extends l46 {
    public static final n46 d = new n46(1, 0, 1);

    @Override // defpackage.l46
    public final boolean equals(Object obj) {
        if (!(obj instanceof n46)) {
            return false;
        }
        if (isEmpty() && ((n46) obj).isEmpty()) {
            return true;
        }
        n46 n46Var = (n46) obj;
        return this.a == n46Var.a && this.b == n46Var.b;
    }

    @Override // defpackage.l46
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (this.a * 31) + this.b;
    }

    @Override // defpackage.l46
    public final boolean isEmpty() {
        return this.a > this.b;
    }

    @Override // defpackage.l46
    public final String toString() {
        return this.a + ".." + this.b;
    }
}
