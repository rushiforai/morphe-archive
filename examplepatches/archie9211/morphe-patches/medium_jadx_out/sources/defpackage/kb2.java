package defpackage;

import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class kb2 extends a1 implements gb2 {
    public static final jb2 b = new jb2(wz7.d, new ql1(6));

    public kb2() {
        super(wz7.d);
    }

    public abstract void E0(ib2 ib2Var, Runnable runnable);

    public void F0(ib2 ib2Var, Runnable runnable) throws DispatchException {
        op8.l0(this, ib2Var, runnable);
    }

    public boolean G0(ib2 ib2Var) {
        return !(this instanceof tzd);
    }

    public kb2 H0(int i) {
        wgf.f(i);
        return new az6(this, i);
    }

    @Override // defpackage.a1, defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        hb2Var.getClass();
        if (hb2Var instanceof jb2) {
            jb2 jb2Var = (jb2) hb2Var;
            hb2 hb2Var2 = this.a;
            if ((hb2Var2 != jb2Var && jb2Var.b != hb2Var2) || ((gb2) jb2Var.a.invoke(this)) == null) {
                return this;
            }
        } else if (wz7.d != hb2Var) {
            return this;
        }
        return zx3.a;
    }

    @Override // defpackage.a1, defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        gb2 gb2Var;
        hb2Var.getClass();
        if (!(hb2Var instanceof jb2)) {
            if (wz7.d == hb2Var) {
                return this;
            }
            return null;
        }
        jb2 jb2Var = (jb2) hb2Var;
        hb2 hb2Var2 = this.a;
        if ((hb2Var2 == jb2Var || jb2Var.b == hb2Var2) && (gb2Var = (gb2) jb2Var.a.invoke(this)) != null) {
            return gb2Var;
        }
        return null;
    }

    public String toString() {
        return getClass().getSimpleName() + '@' + vv2.I(this);
    }
}
