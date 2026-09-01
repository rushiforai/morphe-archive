package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sg7 extends que {
    public final SourceParameter A;
    public final String B;
    public boolean C;
    public final wua D;
    public final w23 E;
    public final xpc F;
    public final wua G;
    public final f17 H;
    public final xpc I;
    public final wua J;
    public final pc1 K;
    public final w62 L;
    public final pu7 b;
    public final bud c;
    public final mya d;
    public final hha e;
    public final og3 f;
    public final hx4 g;
    public final f88 h;
    public final mya i;
    public final gg5 j;
    public final a1a k;
    public final a1a l;
    public final oxe m;
    public final pkf n;
    public final zxc o;
    public final cr0 p;
    public final og3 q;
    public final o2b r;
    public final vr7 s;
    public final cx2 t;
    public final r6c u;
    public boolean v;
    public final xwc w;
    public final xpc x;
    public final wua y;
    public final String z;

    public sg7(n32 n32Var, pu7 pu7Var, bud budVar, mya myaVar, hha hhaVar, og3 og3Var, hx4 hx4Var, f88 f88Var, mya myaVar2, gg5 gg5Var, a1a a1aVar, a1a a1aVar2, oxe oxeVar, o8c o8cVar, pkf pkfVar, zxc zxcVar, yo8 yo8Var, cr0 cr0Var, og3 og3Var2, o2b o2bVar, hx4 hx4Var2, vr7 vr7Var, kb2 kb2Var, cx2 cx2Var) {
        n32Var.getClass();
        pu7Var.getClass();
        budVar.getClass();
        cr0Var.getClass();
        vr7Var.getClass();
        this.b = pu7Var;
        this.c = budVar;
        this.d = myaVar;
        this.e = hhaVar;
        this.f = og3Var;
        this.g = hx4Var;
        this.h = f88Var;
        this.i = myaVar2;
        this.j = gg5Var;
        this.k = a1aVar;
        this.l = a1aVar2;
        this.m = oxeVar;
        this.n = pkfVar;
        this.o = zxcVar;
        this.p = cr0Var;
        this.q = og3Var2;
        this.r = o2bVar;
        this.s = vr7Var;
        this.t = cx2Var;
        int i = 0;
        n92 n92Var = null;
        r6c r6cVarX = k40.x(0, 7, null);
        this.u = r6cVarX;
        this.w = new xwc(bo.z(r6cVarX), new gg7(this, n92Var, 1));
        xpc xpcVarJ = vv2.j(null);
        this.x = xpcVarJ;
        xwc xwcVar = new xwc(xpcVarJ, new gg7(this, n92Var, i));
        gp1 gp1VarF = f76.F(this);
        u3b u3bVar = l7c.b;
        this.y = bo.e0(xwcVar, gp1VarF, u3bVar, null);
        this.z = "home";
        SourceParameter sourceParameter = new SourceParameter("home", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.A = sourceParameter;
        this.B = gp7.u(sourceParameter);
        int i2 = 3;
        vx0.c0(f76.F(this), null, null, new hf7(yo8Var, n92Var, i), 3);
        vx0.c0(f76.F(this), null, null, new kf7(this, n92Var, i), 3);
        this.D = n32Var.h;
        xpc xpcVar = ((y23) budVar).o;
        this.E = new w23(bo.A(xpcVar), i);
        xpc xpcVarJ2 = vv2.j(Boolean.FALSE);
        this.F = xpcVarJ2;
        this.G = bo.A(xpcVarJ2);
        f17 f17VarB = d46.B();
        lv0 lv0Var = lv0.HOME;
        f17VarB.add(lv0Var);
        f17VarB.add(lv0.YOUR_FOLLOWING_FEED);
        f17VarB.add(lv0.EXPLORE);
        f17VarB.add(lv0.YOUR_LIBRARY);
        f17VarB.add(lv0.YOUR_PROFILE);
        f17 f17VarW = d46.w(f17VarB);
        this.H = f17VarW;
        xpc xpcVarJ3 = vv2.j(lv0Var);
        this.I = xpcVarJ3;
        this.J = bo.e0(w2g.r(k40.T(xpcVarJ3, new pc1(mya.w(myaVar, null, 7), 19, this), new pc1(((vr7) hx4Var2.c).l, 18, hx4Var2), new mg7(i, n92Var, this)), kb2Var), f76.F(this), u3bVar, new dg7(f17VarW, (lv0) xpcVarJ3.getValue()));
        this.K = new pc1(bo.A(xpcVar), 20, this);
        int i3 = 2;
        this.L = new w62(new to4(new to4(new eub(o8cVar, n92Var, 10), new pja(o8cVar.a.d, o8cVar, i3)), new mx2(i3, i2, n92Var), i2), i3);
    }

    public final void e(lv0 lv0Var) {
        xpc xpcVar = this.I;
        xpcVar.getClass();
        xpcVar.m(null, lv0Var);
        if (lv0Var == lv0.YOUR_FOLLOWING_FEED) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            vr7 vr7Var = this.s;
            vr7Var.getClass();
            vr7Var.B(ek6.LAST_FOLLOWED_VIEWED_AT, jCurrentTimeMillis);
        }
    }
}
