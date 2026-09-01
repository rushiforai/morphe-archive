package defpackage;

import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ni6 extends ph6 {
    public static final /* synthetic */ int d = 0;
    public final Class b;
    public final vq6 c = vx0.d0(yw6.PUBLICATION, new ji6(this, 0));

    public ni6(Class cls) {
        this.b = cls;
    }

    @Override // defpackage.ym1
    public final Class e() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ni6) {
            return this.b.equals(((ni6) obj).b);
        }
        return false;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.ph6
    public final Collection q() {
        return ey3.a;
    }

    @Override // defpackage.ph6
    public final Collection s(n98 n98Var) {
        k1b k1bVar = ((mi6) this.c.getValue()).d;
        fj6 fj6Var = mi6.g[1];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        return ((ev7) objInvoke).a(n98Var, ng8.FROM_REFLECTION);
    }

    public final String toString() {
        return "file class " + e0b.a(this.b).a();
    }

    @Override // defpackage.ph6
    public final q4a u(int i) {
        otd otdVar = (otd) ((mi6) this.c.getValue()).f.getValue();
        if (otdVar == null) {
            return null;
        }
        lf6 lf6Var = (lf6) otdVar.a;
        e6a e6aVar = (e6a) otdVar.b;
        zz7 zz7Var = (zz7) otdVar.c;
        o75 o75Var = gg6.n;
        o75Var.getClass();
        i6a i6aVar = (i6a) il7.A(e6aVar, o75Var, i);
        if (i6aVar == null) {
            return null;
        }
        y6a y6aVar = e6aVar.g;
        y6aVar.getClass();
        return (q4a) bpe.f(this.b, i6aVar, lf6Var, new wjc(y6aVar), zz7Var, a0.v);
    }

    @Override // defpackage.ph6
    public final Class w() {
        Class cls = (Class) ((mi6) this.c.getValue()).e.getValue();
        return cls == null ? this.b : cls;
    }

    @Override // defpackage.ph6
    public final Collection x(n98 n98Var) {
        k1b k1bVar = ((mi6) this.c.getValue()).d;
        fj6 fj6Var = mi6.g[1];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        return ((ev7) objInvoke).f(n98Var, ng8.FROM_REFLECTION);
    }
}
