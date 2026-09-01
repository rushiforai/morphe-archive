package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iq6 implements lvc {
    public ip6 a = ip6.Rtl;
    public float b;
    public float c;
    public final /* synthetic */ nq6 d;

    public iq6(nq6 nq6Var) {
        this.d = nq6Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.c;
    }

    @Override // defpackage.y66
    public final boolean W() {
        wp6 wp6Var = this.d.a.G.d;
        return wp6Var == wp6.LookaheadLayingOut || wp6Var == wp6.LookaheadMeasuring;
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.b;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        return Math.round(p0(j));
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.a;
    }

    @Override // defpackage.bl7
    public final al7 h0(int i, int i2, Map map, x45 x45Var, x45 x45Var2) {
        if ((i & (-16777216)) != 0 || ((-16777216) & i2) != 0) {
            b26.b("Size(" + i + " x " + i2 + ") is out of range. Each dimension must be between 0 and 16777215.");
        }
        return new hq6(i, i2, map, x45Var, this, this.d, x45Var2);
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.bl7
    public final al7 q0(int i, int i2, Map map, x45 x45Var) {
        return h0(i, i2, map, null, x45Var);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    @Override // defpackage.lvc
    public final List x(b55 b55Var, Object obj) {
        nq6 nq6Var = this.d;
        nq6Var.h();
        aq6 aq6Var = nq6Var.a;
        wp6 wp6Var = aq6Var.G.d;
        wp6 wp6Var2 = wp6.Measuring;
        if (wp6Var != wp6Var2 && wp6Var != wp6.LayingOut && wp6Var != wp6.LookaheadMeasuring && wp6Var != wp6.LookaheadLayingOut) {
            b26.b("subcompose can only be used inside the measure or layout blocks");
        }
        f78 f78Var = nq6Var.g;
        Object objG = f78Var.g(obj);
        if (objG == null) {
            objG = (aq6) nq6Var.j.k(obj);
            if (objG != null) {
                if (nq6Var.o <= 0) {
                    b26.b("Check failed.");
                }
                nq6Var.o--;
            } else {
                objG = nq6Var.n(obj);
                if (objG == null) {
                    int i = nq6Var.d;
                    aq6 aq6Var2 = new aq6(2);
                    aq6Var.q = true;
                    aq6Var.B(i, aq6Var2);
                    aq6Var.q = false;
                    objG = aq6Var2;
                }
            }
            f78Var.m(obj, objG);
        }
        aq6 aq6Var3 = (aq6) objG;
        if (bu1.A0(nq6Var.d, aq6Var.o()) != aq6Var3) {
            int iK = ((o78) ((v68) aq6Var.o()).b).k(aq6Var3);
            if (iK < nq6Var.d) {
                b26.a("Key \"" + obj + "\" was already used. If you are using LazyColumn/Row please make sure you provide a unique key for each item.");
            }
            int i2 = nq6Var.d;
            if (i2 != iK) {
                nq6Var.j(iK, i2);
            }
        }
        nq6Var.d++;
        nq6Var.m(aq6Var3, obj, false, b55Var);
        return (wp6Var == wp6Var2 || wp6Var == wp6.LayingOut) ? aq6Var3.m() : aq6Var3.l();
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
