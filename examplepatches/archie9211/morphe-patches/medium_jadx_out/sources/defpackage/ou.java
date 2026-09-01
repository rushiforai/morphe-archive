package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ou {
    public final hud a;
    public final Object b;
    public final xw c;
    public final k49 d;
    public final k49 e;
    public final a88 f;
    public final wlc g;
    public final dx h;
    public final dx i;
    public final dx j;
    public final dx k;

    public ou(Object obj, hud hudVar, Object obj2) {
        this.a = hudVar;
        this.b = obj2;
        xw xwVar = new xw(hudVar, obj, null, 60);
        this.c = xwVar;
        this.d = qo7.u(Boolean.FALSE);
        this.e = qo7.u(obj);
        this.f = new a88();
        this.g = new wlc(obj2);
        dx dxVar = xwVar.c;
        boolean z = dxVar instanceof zw;
        dx dxVar2 = z ? yi2.f : dxVar instanceof ax ? yi2.g : dxVar instanceof bx ? yi2.h : yi2.i;
        this.h = dxVar2;
        dx dxVar3 = z ? yi2.b : dxVar instanceof ax ? yi2.c : dxVar instanceof bx ? yi2.d : yi2.e;
        this.i = dxVar3;
        this.j = dxVar2;
        this.k = dxVar3;
    }

    public static Object a(ou ouVar, Object obj, ww wwVar, x45 x45Var, n92 n92Var, int i) {
        if ((i & 2) != 0) {
            wwVar = ouVar.g;
        }
        ww wwVar2 = wwVar;
        Object objInvoke = ouVar.a.b.invoke(ouVar.c.c);
        if ((i & 8) != 0) {
            x45Var = null;
        }
        x45 x45Var2 = x45Var;
        Object objD = ouVar.d();
        hud hudVar = ouVar.a;
        return a88.a(ouVar.f, new ju(ouVar, objInvoke, new sfd(wwVar2, hudVar, objD, obj, (dx) hudVar.a.invoke(objInvoke)), ouVar.c.d, x45Var2, null), n92Var);
    }

    public final Object b(Object obj) {
        dx dxVar = this.h;
        dx dxVar2 = this.j;
        boolean zL = g76.L(dxVar2, dxVar);
        dx dxVar3 = this.k;
        if (!zL || !g76.L(dxVar3, this.i)) {
            hud hudVar = this.a;
            dx dxVar4 = (dx) hudVar.a.invoke(obj);
            int iB = dxVar4.b();
            boolean z = false;
            for (int i = 0; i < iB; i++) {
                if (dxVar4.a(i) < dxVar2.a(i) || dxVar4.a(i) > dxVar3.a(i)) {
                    dxVar4.e(i, iq7.u(dxVar4.a(i), dxVar2.a(i), dxVar3.a(i)));
                    z = true;
                }
            }
            if (z) {
                return hudVar.b.invoke(dxVar4);
            }
        }
        return obj;
    }

    public final void c() {
        xw xwVar = this.c;
        xwVar.c.d();
        xwVar.d = Long.MIN_VALUE;
        this.d.setValue(Boolean.FALSE);
    }

    public final Object d() {
        return this.c.b.getValue();
    }

    public final boolean e() {
        return ((Boolean) this.d.getValue()).booleanValue();
    }

    public final Object f(n92 n92Var, Object obj) {
        Object objA = a88.a(this.f, new ku(this, obj, null), n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public final Object g(p4d p4dVar) {
        Object objA = a88.a(this.f, new lu(this, null, 0), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public /* synthetic */ ou(Object obj, hud hudVar, Object obj2, int i) {
        this(obj, hudVar, (i & 4) != 0 ? null : obj2);
    }
}
