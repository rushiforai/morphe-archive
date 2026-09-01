package defpackage;

import android.view.KeyEvent;
import android.view.ViewConfiguration;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class msb extends el3 implements lk6, xxb {
    public fx8 J;
    public dn4 K;
    public final cd8 L;
    public final az2 M;
    public final vsb N;
    public final hsb O;
    public final es4 P;
    public final k82 Q;
    public h9b R;
    public ksb S;
    public q48 X;
    public xqd Y;

    public msb(xy0 xy0Var, dn4 dn4Var, m68 m68Var, hw8 hw8Var, fx8 fx8Var, nsb nsbVar, boolean z, boolean z2) {
        super(w2g.o, z, m68Var, hw8Var);
        this.J = fx8Var;
        this.K = dn4Var;
        cd8 cd8Var = new cd8();
        this.L = cd8Var;
        az2 az2Var = new az2(new xv2(new qlb((m73) w2g.r)));
        this.M = az2Var;
        fx8 fx8Var2 = this.J;
        dn4 dn4Var2 = this.K;
        vsb vsbVar = new vsb(nsbVar, fx8Var2, dn4Var2 == null ? az2Var : dn4Var2, hw8Var, z2, cd8Var, this, new isb(this, 0));
        this.N = vsbVar;
        hsb hsbVar = new hsb(vsbVar, z);
        this.O = hsbVar;
        es4 es4Var = new es4(2, null, 10);
        I0(es4Var);
        this.P = es4Var;
        k82 k82Var = new k82(hw8Var, vsbVar, z2, xy0Var, new isb(this, 1));
        I0(k82Var);
        this.Q = k82Var;
        I0(new hd8(hsbVar, cd8Var));
        uy0 uy0Var = new uy0();
        uy0Var.o = k82Var;
        I0(uy0Var);
    }

    @Override // defpackage.lk6
    public final boolean D(KeyEvent keyEvent) {
        long jFloatToRawIntBits;
        if (!this.s || ((!fk6.a(nk7.p0(keyEvent), fk6.D) && !fk6.a(rv8.m(keyEvent.getKeyCode()), fk6.C)) || nk7.q0(keyEvent) != 2 || keyEvent.isCtrlPressed())) {
            return false;
        }
        boolean z = this.N.d == hw8.Vertical;
        k82 k82Var = this.Q;
        if (z) {
            int iJ0 = (int) (k82Var.J0() & 4294967295L);
            jFloatToRawIntBits = (((long) Float.floatToRawIntBits(0.0f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(fk6.a(rv8.m(keyEvent.getKeyCode()), fk6.C) ? iJ0 : -iJ0)));
        } else {
            int iJ02 = (int) (k82Var.J0() >> 32);
            jFloatToRawIntBits = (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L) | (((long) Float.floatToRawIntBits(fk6.a(rv8.m(keyEvent.getKeyCode()), fk6.C) ? iJ02 : -iJ02)) << 32);
        }
        vx0.c0(u0(), null, null, new ksb(this, jFloatToRawIntBits, null, 0), 3);
        return true;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.el3
    public final Object M0(dl3 dl3Var, dl3 dl3Var2) {
        s78 s78Var = s78.UserInput;
        vsb vsbVar = this.N;
        Object objF = vsbVar.f(s78Var, new mw9(dl3Var, vsbVar, null, 20), dl3Var2);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : c1e.a;
    }

    @Override // defpackage.el3
    public final void S0(nk3 nk3Var) {
        vx0.c0(this.L.c(), null, null, new nx9(nk3Var, this, null, 29), 3);
    }

    @Override // defpackage.el3
    public final boolean a1() {
        vsb vsbVar = this.N;
        if (vsbVar.a.a()) {
            return true;
        }
        fx8 fx8Var = vsbVar.b;
        return fx8Var != null ? fx8Var.d() : false;
    }

    public final void d1(xy0 xy0Var, dn4 dn4Var, m68 m68Var, hw8 hw8Var, fx8 fx8Var, nsb nsbVar, boolean z, boolean z2) {
        boolean z3;
        boolean z4 = true;
        boolean z5 = false;
        if (this.s != z) {
            this.O.b = z;
            z3 = true;
        } else {
            z3 = false;
        }
        dn4 dn4Var2 = dn4Var == null ? this.M : dn4Var;
        vsb vsbVar = this.N;
        if (!g76.L(vsbVar.a, nsbVar)) {
            vsbVar.a = nsbVar;
            z5 = true;
        }
        vsbVar.b = fx8Var;
        hw8 hw8Var2 = vsbVar.d;
        if (hw8Var2 != hw8Var) {
            vsbVar.d = hw8Var;
            hw8Var2 = hw8Var;
            z5 = true;
        }
        if (vsbVar.e != z2) {
            vsbVar.e = z2;
        } else {
            z4 = z5;
        }
        vsbVar.c = dn4Var2;
        vsbVar.f = this.L;
        k82 k82Var = this.Q;
        k82Var.o = hw8Var;
        k82Var.q = z2;
        k82Var.r = xy0Var;
        this.J = fx8Var;
        this.K = dn4Var;
        dsb dsbVar = w2g.o;
        hw8 hw8Var3 = hw8.Vertical;
        if (hw8Var2 != hw8Var3) {
            hw8Var3 = hw8.Horizontal;
        }
        c1(dsbVar, z, m68Var, hw8Var3, z4);
        if (z3) {
            this.R = null;
            this.S = null;
            dl7.u(this);
        }
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.lk6
    public final boolean j(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        if (this.s && (this.R == null || this.S == null)) {
            this.R = new h9b(9, this);
            this.S = new ksb(this, null);
        }
        h9b h9bVar = this.R;
        if (h9bVar != null) {
            fj6[] fj6VarArr = gyb.a;
            jybVar.d(sxb.d, new i4(null, h9bVar));
        }
        ksb ksbVar = this.S;
        if (ksbVar != null) {
            fj6[] fj6VarArr2 = gyb.a;
            jybVar.d(sxb.e, ksbVar);
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.el3, defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        int i;
        List list = lb9Var.a;
        int size = list.size();
        int i2 = 0;
        while (true) {
            if (i2 >= size) {
                break;
            }
            if (((Boolean) this.r.invoke(new ac9(((rb9) list.get(i2)).i))).booleanValue()) {
                super.y(lb9Var, mb9Var, j);
                break;
            }
            i2++;
        }
        if (this.u == null) {
            i85 i85Var = new i85(this);
            I0(i85Var);
            this.u = i85Var;
        }
        if (this.s) {
            mb9 mb9Var2 = mb9.Initial;
            n92 n92Var = null;
            vsb vsbVar = this.N;
            int i3 = 6;
            if (mb9Var == mb9Var2 && lb9Var.f == 6) {
                q48 q48Var = this.X;
                if (q48Var == null) {
                    q48 q48Var2 = new q48(vsbVar, new zg7(9, ViewConfiguration.get(guc.U(this).getContext())), new lz1(2, this, msb.class, "onWheelScrollStopped", "onWheelScrollStopped-TH1AsA0(J)V", 4, 1), flb.v0(this).y);
                    this.X = q48Var2;
                    q48Var = q48Var2;
                }
                sb2 sb2VarU0 = u0();
                if (q48Var.h == null) {
                    q48Var.h = vx0.c0(sb2VarU0, null, null, new kd7(q48Var, n92Var, i3), 3);
                }
            }
            q48 q48Var3 = this.X;
            if (q48Var3 != null && lb9Var.f == 6) {
                int size2 = list.size();
                int i4 = 0;
                while (true) {
                    if (i4 >= size2) {
                        if (mb9Var == mb9.Initial && q48Var3.d) {
                            q48Var3.f(lb9Var);
                            rh8.a(lb9Var);
                        }
                        if (mb9Var == mb9.Main && !q48Var3.d && q48Var3.f(lb9Var)) {
                            rh8.a(lb9Var);
                        }
                    } else if (((rb9) list.get(i4)).b()) {
                        break;
                    } else {
                        i4++;
                    }
                }
            }
            if (mb9Var == mb9.Initial && ((i = lb9Var.f) == 10 || i == 11 || i == 12)) {
                xqd xqdVar = this.Y;
                if (xqdVar == null) {
                    xqd xqdVar2 = new xqd(vsbVar, new lz1(2, this, msb.class, "onTrackpadScrollStopped", "onTrackpadScrollStopped-TH1AsA0(J)V", 4, 2), flb.v0(this).y);
                    this.Y = xqdVar2;
                    xqdVar = xqdVar2;
                }
                sb2 sb2VarU02 = u0();
                if (xqdVar.g == null) {
                    xqdVar.g = vx0.c0(sb2VarU02, null, null, new gbd(xqdVar, null), 3);
                }
            }
            xqd xqdVar3 = this.Y;
            if (xqdVar3 != null) {
                int i5 = lb9Var.f;
                if (i5 == 10 || i5 == 11 || i5 == 12) {
                    int size3 = list.size();
                    for (int i6 = 0; i6 < size3; i6++) {
                        if (((rb9) list.get(i6)).b()) {
                            return;
                        }
                    }
                    if (mb9Var == mb9.Initial && xqdVar3.d) {
                        xqdVar3.d(lb9Var);
                        rh8.a(lb9Var);
                    }
                    if (mb9Var == mb9.Main && !xqdVar3.d && xqdVar3.d(lb9Var)) {
                        rh8.a(lb9Var);
                    }
                }
            }
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        if (this.n) {
            m73 m73Var = flb.v0(this).y;
            az2 az2Var = this.M;
            az2Var.getClass();
            az2Var.a = new xv2(new qlb(m73Var));
        }
        q48 q48Var = this.X;
        if (q48Var != null) {
            q48Var.c = flb.v0(this).y;
        }
        xqd xqdVar = this.Y;
        if (xqdVar != null) {
            xqdVar.c = flb.v0(this).y;
        }
    }

    @Override // defpackage.el3, defpackage.q28
    public final void z0() {
        H();
        if (this.n) {
            m73 m73Var = flb.v0(this).y;
            az2 az2Var = this.M;
            az2Var.getClass();
            az2Var.a = new xv2(new qlb(m73Var));
        }
        q48 q48Var = this.X;
        if (q48Var != null) {
            q48Var.c = flb.v0(this).y;
        }
        xqd xqdVar = this.Y;
        if (xqdVar != null) {
            xqdVar.c = flb.v0(this).y;
        }
    }

    @Override // defpackage.el3
    public final void R0(long j) {
    }
}
