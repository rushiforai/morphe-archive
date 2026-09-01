package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class xwd {
    public abstract pqe a();

    public abstract mn6 b();

    public abstract boolean c();

    public abstract xwd d(sn6 sn6Var);

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xwd)) {
            return false;
        }
        xwd xwdVar = (xwd) obj;
        return c() == xwdVar.c() && a() == xwdVar.a() && b().equals(xwdVar.b());
    }

    public final int hashCode() {
        int iHashCode = a().hashCode();
        if (nxd.m(b())) {
            return (iHashCode * 31) + 19;
        }
        return (iHashCode * 31) + (c() ? 17 : b().hashCode());
    }

    public final String toString() {
        if (c()) {
            return "*";
        }
        if (a() == pqe.INVARIANT) {
            return b().toString();
        }
        return a() + " " + b();
    }
}
