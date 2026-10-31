package wk;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class k {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f94541a = {1, 2, 3, 4, 5, 6, 7, 8};

    public static void a(h0 h0Var, h0 h0Var2) {
        h0Var2.o(h0Var.q());
        h0 h0VarB = h0Var.b();
        e eVar = g0.f94519r;
        h0VarB.a(h0Var2);
        h0Var2.h(h0VarB);
        h0 h0VarG = h0Var.g();
        h0Var2.a(h0VarG);
        h0VarG.h(h0Var2);
        o oVar = o.f94555a;
        h0Var.a(oVar);
        h0Var.h(oVar);
    }

    public static h0 b(int i5, p pVar, h0 h0Var, h0 h0Var2, Object obj) {
        return e(i5, pVar, obj, h0Var.j(), h0Var2);
    }

    public static void c(h0 h0Var, h0 h0Var2) {
        h0Var2.r(h0Var.n());
        h0 h0VarI = h0Var.i();
        e eVar = g0.f94519r;
        h0VarI.l(h0Var2);
        h0Var2.k(h0VarI);
        h0 h0VarC = h0Var.c();
        h0Var2.l(h0VarC);
        h0VarC.k(h0Var2);
        o oVar = o.f94555a;
        h0Var.l(oVar);
        h0Var.k(oVar);
    }

    public static h0 d(int i5, p pVar, h0 h0Var, h0 h0Var2, Object obj) {
        if (i5 == 2) {
            h0 h0VarB = b(2, pVar, h0Var, h0Var2, obj);
            a(h0Var, h0VarB);
            return h0VarB;
        }
        if (i5 == 3) {
            h0 h0VarB2 = b(3, pVar, h0Var, h0Var2, obj);
            c(h0Var, h0VarB2);
            return h0VarB2;
        }
        if (i5 == 4) {
            h0 h0VarB3 = b(4, pVar, h0Var, h0Var2, obj);
            a(h0Var, h0VarB3);
            c(h0Var, h0VarB3);
            return h0VarB3;
        }
        if (i5 == 6) {
            h0 h0VarB4 = b(6, pVar, h0Var, h0Var2, obj);
            a(h0Var, h0VarB4);
            return h0VarB4;
        }
        if (i5 == 7) {
            h0 h0VarB5 = b(7, pVar, h0Var, h0Var2, obj);
            c(h0Var, h0VarB5);
            return h0VarB5;
        }
        if (i5 != 8) {
            return b(i5, pVar, h0Var, h0Var2, obj);
        }
        h0 h0VarB6 = b(8, pVar, h0Var, h0Var2, obj);
        a(h0Var, h0VarB6);
        c(h0Var, h0VarB6);
        return h0VarB6;
    }

    public static h0 e(int i5, p pVar, Object obj, int i11, h0 h0Var) {
        switch (i5) {
            case 1:
                return new x(obj, i11, h0Var);
            case 2:
                v vVar = new v(obj, i11, h0Var, 0);
                vVar.f94576f = Long.MAX_VALUE;
                e eVar = g0.f94519r;
                o oVar = o.f94555a;
                vVar.f94577g = oVar;
                vVar.f94578h = oVar;
                return vVar;
            case 3:
                v vVar2 = new v(obj, i11, h0Var, 1);
                vVar2.f94576f = Long.MAX_VALUE;
                e eVar2 = g0.f94519r;
                o oVar2 = o.f94555a;
                vVar2.f94577g = oVar2;
                vVar2.f94578h = oVar2;
                return vVar2;
            case 4:
                w wVar = new w(obj, i11, h0Var);
                wVar.f94579e = Long.MAX_VALUE;
                e eVar3 = g0.f94519r;
                o oVar3 = o.f94555a;
                wVar.f94580f = oVar3;
                wVar.f94581g = oVar3;
                wVar.f94582h = Long.MAX_VALUE;
                wVar.f94583i = oVar3;
                wVar.f94584j = oVar3;
                return wVar;
            case 5:
                return new d0(pVar.f94564h, obj, i11, h0Var);
            case 6:
                b0 b0Var = new b0(pVar.f94564h, obj, i11, h0Var, 0);
                b0Var.f94497e = Long.MAX_VALUE;
                e eVar4 = g0.f94519r;
                o oVar4 = o.f94555a;
                b0Var.f94498f = oVar4;
                b0Var.f94499g = oVar4;
                return b0Var;
            case 7:
                b0 b0Var2 = new b0(pVar.f94564h, obj, i11, h0Var, 1);
                b0Var2.f94497e = Long.MAX_VALUE;
                e eVar5 = g0.f94519r;
                o oVar5 = o.f94555a;
                b0Var2.f94498f = oVar5;
                b0Var2.f94499g = oVar5;
                return b0Var2;
            default:
                c0 c0Var = new c0(pVar.f94564h, obj, i11, h0Var);
                c0Var.f94502d = Long.MAX_VALUE;
                e eVar6 = g0.f94519r;
                o oVar6 = o.f94555a;
                c0Var.f94503e = oVar6;
                c0Var.f94504f = oVar6;
                c0Var.f94505g = Long.MAX_VALUE;
                c0Var.f94506h = oVar6;
                c0Var.f94507i = oVar6;
                return c0Var;
        }
    }

    public static /* synthetic */ boolean f(int i5) {
        return (i5 == 1 || i5 == 2) ? false : true;
    }
}
