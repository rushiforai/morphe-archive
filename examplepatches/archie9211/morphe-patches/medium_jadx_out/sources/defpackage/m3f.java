package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m3f implements t73 {
    public int a;
    public b72 b;
    public tmb c;
    public a72 d;
    public final ye3 e = new ye3(this);
    public int f = 0;
    public boolean g = false;
    public final y73 h = new y73(this);
    public final y73 i = new y73(this);
    public l3f j = l3f.NONE;

    public m3f(b72 b72Var) {
        this.b = b72Var;
    }

    public static void b(y73 y73Var, y73 y73Var2, int i) {
        y73Var.l.add(y73Var2);
        y73Var.f = i;
        y73Var2.k.add(y73Var);
    }

    public static y73 h(l52 l52Var) {
        l52 l52Var2 = l52Var.f;
        if (l52Var2 == null) {
            return null;
        }
        b72 b72Var = l52Var2.d;
        int i = k3f.a[l52Var2.e.ordinal()];
        if (i == 1) {
            return b72Var.d.h;
        }
        if (i == 2) {
            return b72Var.d.i;
        }
        if (i == 3) {
            return b72Var.e.h;
        }
        if (i == 4) {
            return b72Var.e.k;
        }
        if (i != 5) {
            return null;
        }
        return b72Var.e.i;
    }

    public static y73 i(l52 l52Var, int i) {
        l52 l52Var2 = l52Var.f;
        if (l52Var2 == null) {
            return null;
        }
        b72 b72Var = l52Var2.d;
        m3f m3fVar = i == 0 ? b72Var.d : b72Var.e;
        int i2 = k3f.a[l52Var2.e.ordinal()];
        if (i2 != 1) {
            if (i2 != 2) {
                if (i2 != 3) {
                    if (i2 != 5) {
                        return null;
                    }
                }
            }
            return m3fVar.i;
        }
        return m3fVar.h;
    }

    public final void c(y73 y73Var, y73 y73Var2, int i, ye3 ye3Var) {
        y73Var.l.add(y73Var2);
        y73Var.l.add(this.e);
        y73Var.h = i;
        y73Var.i = ye3Var;
        y73Var2.k.add(y73Var);
        ye3Var.k.add(y73Var);
    }

    public abstract void d();

    public abstract void e();

    public abstract void f();

    public final int g(int i, int i2) {
        b72 b72Var = this.b;
        if (i2 == 0) {
            int i3 = b72Var.w;
            int iMax = Math.max(b72Var.v, i);
            if (i3 > 0) {
                iMax = Math.min(i3, i);
            }
            if (iMax != i) {
                return iMax;
            }
        } else {
            int i4 = b72Var.z;
            int iMax2 = Math.max(b72Var.y, i);
            if (i4 > 0) {
                iMax2 = Math.min(i4, i);
            }
            if (iMax2 != i) {
                return iMax2;
            }
        }
        return i;
    }

    public long j() {
        if (this.e.j) {
            return r2.g;
        }
        return 0L;
    }

    public abstract boolean k();

    /* JADX WARN: Removed duplicated region for block: B:29:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l(defpackage.l52 r13, defpackage.l52 r14, int r15) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m3f.l(l52, l52, int):void");
    }
}
