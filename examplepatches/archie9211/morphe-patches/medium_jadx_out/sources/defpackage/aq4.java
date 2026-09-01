package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aq4 {
    public final xp4 a;
    public tk7 b;
    public t99 c;
    public tk7 d;
    public t99 e;
    public f46 f;
    public f46 g;

    public aq4(xp4 xp4Var) {
        this.a = xp4Var;
    }

    public final f46 a(int i, int i2, boolean z) {
        int i3 = zp4.a[this.a.ordinal()];
        if (i3 == 1 || i3 == 2) {
            return null;
        }
        if (i3 == 3) {
            if (z) {
                return this.f;
            }
            return null;
        }
        if (i3 != 4) {
            ygf.a();
            return null;
        }
        if (z) {
            return this.f;
        }
        if (i + 1 < 0 || i2 < 0) {
            return null;
        }
        return this.g;
    }

    public final void b(tk7 tk7Var, tk7 tk7Var2, long j) {
        long jN = qq7.n(j, oq6.Horizontal);
        if (tk7Var != null) {
            int iK = tk7Var.k(f72.g(jN));
            this.f = new f46(f46.a(iK, tk7Var.L(iK)));
            this.b = tk7Var instanceof tk7 ? tk7Var : null;
            this.c = null;
        }
        if (tk7Var2 != null) {
            int iK2 = tk7Var2.k(f72.g(jN));
            this.g = new f46(f46.a(iK2, tk7Var2.L(iK2)));
            this.d = tk7Var2 instanceof tk7 ? tk7Var2 : null;
            this.e = null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof aq4) && this.a == ((aq4) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode() * 961;
    }

    public final String toString() {
        return "FlowLayoutOverflowState(type=" + this.a + ", minLinesToShowCollapse=0, minCrossAxisSizeToShowCollapse=0)";
    }
}
