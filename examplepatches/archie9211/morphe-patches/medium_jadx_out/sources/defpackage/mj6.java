package defpackage;

import java.lang.reflect.Field;
import java.lang.reflect.Member;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class mj6 extends vg6 implements fj6 {
    public static final Object n = new Object();
    public final ph6 h;
    public final String i;
    public final String j;
    public final Object k;
    public final vq6 l;
    public final k1b m;

    public mj6(ph6 ph6Var, String str, String str2, r4a r4aVar, Object obj) {
        this.h = ph6Var;
        this.i = str;
        this.j = str2;
        this.k = obj;
        this.l = vx0.d0(yw6.PUBLICATION, new gj6(this, 0));
        this.m = no7.y(r4aVar, new gj6(this, 1));
    }

    @Override // defpackage.vg6
    public final boolean B() {
        return this.k != h41.NO_RECEIVER;
    }

    public final Member C() {
        if (!y().B()) {
            return null;
        }
        mn1 mn1Var = xmb.a;
        s42 s42VarB = xmb.b(y());
        if (s42VarB instanceof tf6) {
            tf6 tf6Var = (tf6) s42VarB;
            p98 p98Var = tf6Var.r;
            ag6 ag6Var = tf6Var.q;
            if ((ag6Var.b & 16) == 16) {
                yf6 yf6Var = ag6Var.g;
                int i = yf6Var.b;
                if ((i & 1) != 1 || (i & 2) != 2) {
                    return null;
                }
                return this.h.p(p98Var.getString(yf6Var.c), p98Var.getString(yf6Var.d));
            }
        }
        return (Field) this.l.getValue();
    }

    public final Object D() {
        return kk7.s(this.k, y());
    }

    @Override // defpackage.vg6
    /* JADX INFO: renamed from: E, reason: merged with bridge method [inline-methods] */
    public final q4a y() {
        Object objInvoke = this.m.invoke();
        objInvoke.getClass();
        return (q4a) objInvoke;
    }

    public abstract jj6 F();

    public final boolean equals(Object obj) {
        mj6 mj6VarC = bpe.c(obj);
        return mj6VarC != null && g76.L(this.h, mj6VarC.h) && g76.L(this.i, mj6VarC.i) && g76.L(this.j, mj6VarC.j) && g76.L(this.k, mj6VarC.k);
    }

    @Override // defpackage.rg6
    public final String getName() {
        return this.i;
    }

    public final int hashCode() {
        return this.j.hashCode() + wgd.o(this.h.hashCode() * 31, 31, this.i);
    }

    @Override // defpackage.rg6, defpackage.qh6
    public final boolean isSuspend() {
        return false;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        vo7.p(sb, this);
        sb.append(this instanceof fi6 ? "var " : "val ");
        vo7.q(sb, this);
        sb.append(aq7.z(n98.e(this.i)));
        sb.append(": ");
        sb.append(vo7.L(getReturnType()));
        return sb.toString();
    }

    @Override // defpackage.vg6
    public final v41 v() {
        return F().v();
    }

    @Override // defpackage.vg6
    public final ph6 w() {
        return this.h;
    }

    @Override // defpackage.vg6
    public final v41 x() {
        F().getClass();
        return null;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public mj6(ph6 ph6Var, r4a r4aVar) {
        String strB = r4aVar.getName().b();
        strB.getClass();
        this(ph6Var, strB, xmb.b(r4aVar).I(), r4aVar, h41.NO_RECEIVER);
    }
}
