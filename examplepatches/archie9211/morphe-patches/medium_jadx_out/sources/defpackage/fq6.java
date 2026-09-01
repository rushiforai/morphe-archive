package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fq6 implements lvc, bl7 {
    public final /* synthetic */ iq6 a;
    public final /* synthetic */ nq6 b;

    public fq6(nq6 nq6Var) {
        this.b = nq6Var;
        this.a = nq6Var.h;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.a.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.a.N(i);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / this.a.b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.c;
    }

    @Override // defpackage.y66
    public final boolean W() {
        return this.a.W();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.a.b() * f;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        return this.a.c0(j);
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.a.a;
    }

    @Override // defpackage.bl7
    public final al7 h0(int i, int i2, Map map, x45 x45Var, x45 x45Var2) {
        return this.a.h0(i, i2, fy3.a, x45Var, x45Var2);
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        iq6 iq6Var = this.a;
        iq6Var.getClass();
        return ho2.d(iq6Var, f);
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        iq6 iq6Var = this.a;
        iq6Var.getClass();
        return ho2.g(j, iq6Var);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        iq6 iq6Var = this.a;
        iq6Var.getClass();
        return ho2.f(j, iq6Var);
    }

    @Override // defpackage.bl7
    public final al7 q0(int i, int i2, Map map, x45 x45Var) {
        return this.a.h0(i, i2, map, null, x45Var);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        iq6 iq6Var = this.a;
        iq6Var.getClass();
        return ho2.e(j, iq6Var);
    }

    @Override // defpackage.lvc
    public final List x(b55 b55Var, Object obj) {
        nq6 nq6Var = this.b;
        aq6 aq6Var = nq6Var.a;
        f78 f78Var = nq6Var.g;
        aq6 aq6Var2 = (aq6) f78Var.g(obj);
        if (aq6Var2 != null && ((o78) ((v68) aq6Var.o()).b).k(aq6Var2) < nq6Var.d) {
            return aq6Var2.m();
        }
        f78 f78Var2 = nq6Var.l;
        f78 f78Var3 = nq6Var.j;
        o78 o78Var = nq6Var.m;
        if (o78Var.c < nq6Var.e) {
            b26.a("Error: currentApproachIndex cannot be greater than the size of theapproachComposedSlotIds list.");
        }
        aq6 aq6Var3 = (aq6) f78Var.g(obj);
        int i = o78Var.c;
        int i2 = nq6Var.e;
        if (i == i2) {
            o78Var.b(obj);
        } else {
            Object[] objArr = o78Var.a;
            Object obj2 = objArr[i2];
            objArr[i2] = obj;
        }
        nq6Var.e++;
        boolean zB = f78Var3.b(obj);
        if (zB || aq6Var3 != null) {
            if (!zB && aq6Var3 != null) {
                nq6Var.j(((o78) ((v68) aq6Var.o()).b).k(aq6Var3), ((o78) ((v68) aq6Var.o()).b).c);
                nq6Var.o++;
                f78Var.k(obj);
                f78Var3.m(obj, aq6Var3);
                f78Var2.m(obj, nq6Var.e(obj));
                if (aq6Var.H()) {
                    nq6Var.h();
                }
            }
            aq6 aq6Var4 = (aq6) f78Var3.g(obj);
            gq6 gq6Var = aq6Var4 != null ? (gq6) nq6Var.f.g(aq6Var4) : null;
            if (gq6Var != null && gq6Var.d) {
                nq6Var.m(aq6Var4, obj, false, b55Var);
            }
            if ((gq6Var != null ? gq6Var.f : null) != null) {
                nq6Var.c(gq6Var, true);
            }
        } else {
            nq6Var.k(obj, b55Var, false);
            f78Var2.m(obj, nq6Var.e(obj));
        }
        aq6 aq6Var5 = (aq6) f78Var3.g(obj);
        if (aq6Var5 == null) {
            return ey3.a;
        }
        List listJ0 = aq6Var5.G.p.j0();
        v68 v68Var = (v68) listJ0;
        int i3 = ((o78) v68Var.b).c;
        for (int i4 = 0; i4 < i3; i4++) {
            ((yk7) v68Var.get(i4)).f.b = true;
        }
        return listJ0;
    }

    @Override // defpackage.m73
    public final float z(long j) {
        iq6 iq6Var = this.a;
        iq6Var.getClass();
        return km4.i(j, iq6Var);
    }
}
