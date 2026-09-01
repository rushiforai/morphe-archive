package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class n34 implements Runnable, Comparable, yh3 {
    private volatile Object _heap;
    public long a;
    public int b = -1;

    public n34(long j) {
        this.a = j;
    }

    public final dld b() {
        Object obj = this._heap;
        if (obj instanceof dld) {
            return (dld) obj;
        }
        return null;
    }

    public final int c(long j, o34 o34Var, p34 p34Var) {
        synchronized (this) {
            if (this._heap == w2g.l) {
                return 2;
            }
            synchronized (o34Var) {
                try {
                    n34[] n34VarArr = o34Var.a;
                    n34 n34Var = n34VarArr != null ? n34VarArr[0] : null;
                    int i = p34.j;
                    if (m80.a.getIntVolatile(p34Var, p34.h) == 1) {
                        return 1;
                    }
                    if (n34Var == null) {
                        o34Var.c = j;
                    } else {
                        long j2 = n34Var.a;
                        if (j2 - j < 0) {
                            j = j2;
                        }
                        long j3 = o34Var.c;
                        if (j - j3 > 0) {
                            o34Var.c = j;
                        } else {
                            j = j3;
                        }
                    }
                    if (this.a - j < 0) {
                        this.a = j;
                    }
                    o34Var.a(this);
                    return 0;
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        long j = this.a - ((n34) obj).a;
        if (j > 0) {
            return 1;
        }
        return j < 0 ? -1 : 0;
    }

    public final void d(o34 o34Var) {
        if (this._heap != w2g.l) {
            this._heap = o34Var;
        } else {
            ay0.e("Failed requirement.");
        }
    }

    @Override // defpackage.yh3
    public final void dispose() {
        synchronized (this) {
            try {
                Object obj = this._heap;
                d1g d1gVar = w2g.l;
                if (obj == d1gVar) {
                    return;
                }
                o34 o34Var = obj instanceof o34 ? (o34) obj : null;
                if (o34Var != null) {
                    o34Var.c(this);
                }
                this._heap = d1gVar;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public String toString() {
        return "Delayed[nanos=" + this.a + ']';
    }
}
