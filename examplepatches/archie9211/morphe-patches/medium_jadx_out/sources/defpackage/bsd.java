package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bsd implements upc {
    public final hud a;
    public final k49 b;
    public final k49 c;
    public final k49 d;
    public awb e;
    public sfd f;
    public final k49 g;
    public final g49 h;
    public boolean i;
    public final k49 j;
    public dx k;
    public final i49 l;
    public boolean m;
    public final wlc n;
    public final /* synthetic */ dsd o;

    public bsd(dsd dsdVar, Object obj, dx dxVar, hud hudVar) {
        this.o = dsdVar;
        this.a = hudVar;
        k49 k49VarU = qo7.u(obj);
        this.b = k49VarU;
        Object objInvoke = null;
        k49 k49VarU2 = qo7.u(f76.P(0.0f, 0.0f, null, 7));
        this.c = k49VarU2;
        this.d = qo7.u(new sfd((tj4) k49VarU2.getValue(), hudVar, obj, k49VarU.getValue(), dxVar));
        this.g = qo7.u(Boolean.TRUE);
        this.h = new g49(-1.0f);
        this.j = qo7.u(obj);
        this.k = dxVar;
        this.l = new i49(c().c());
        Float f = (Float) qwe.a.get(hudVar);
        if (f != null) {
            float fFloatValue = f.floatValue();
            dx dxVar2 = (dx) hudVar.a.invoke(obj);
            int iB = dxVar2.b();
            for (int i = 0; i < iB; i++) {
                dxVar2.e(i, fFloatValue);
            }
            objInvoke = this.a.b.invoke(dxVar2);
        }
        this.n = f76.P(0.0f, 0.0f, objInvoke, 3);
    }

    public final sfd c() {
        return (sfd) this.d.getValue();
    }

    public final void d(long j) {
        if (this.h.g() == -1.0f) {
            this.m = true;
            if (g76.L(c().c, c().d)) {
                e(c().c);
            } else {
                e(c().g(j));
                this.k = c().e(j);
            }
        }
    }

    public final void e(Object obj) {
        this.j.setValue(obj);
    }

    public final void f(Object obj, boolean z) {
        sfd sfdVar = this.f;
        Object obj2 = sfdVar != null ? sfdVar.c : null;
        k49 k49Var = this.b;
        boolean zL = g76.L(obj2, k49Var.getValue());
        i49 i49Var = this.l;
        k49 k49Var2 = this.d;
        tj4 tj4Var = this.n;
        if (zL) {
            k49Var2.setValue(new sfd(tj4Var, this.a, obj, obj, this.k.c()));
            this.i = true;
            i49Var.h(c().c());
            return;
        }
        k49 k49Var3 = this.c;
        if (!z || this.m || (((tj4) k49Var3.getValue()) instanceof wlc)) {
            tj4Var = (tj4) k49Var3.getValue();
        }
        dsd dsdVar = this.o;
        long jE = dsdVar.e();
        k49 k49Var4 = dsdVar.h;
        k49Var2.setValue(new sfd(jE <= 0 ? tj4Var : new rnc(tj4Var, dsdVar.e()), this.a, obj, k49Var.getValue(), this.k));
        i49Var.h(c().c());
        this.i = false;
        k49Var4.setValue(Boolean.TRUE);
        if (dsdVar.g()) {
            ejc ejcVar = dsdVar.i;
            int size = ejcVar.size();
            long jMax = 0;
            for (int i = 0; i < size; i++) {
                bsd bsdVar = (bsd) ejcVar.get(i);
                jMax = Math.max(jMax, bsdVar.l.g());
                bsdVar.d(0L);
            }
            k49Var4.setValue(Boolean.FALSE);
        }
    }

    public final void g(Object obj, Object obj2, tj4 tj4Var) {
        this.b.setValue(obj2);
        this.c.setValue(tj4Var);
        if (g76.L(c().d, obj) && g76.L(c().c, obj2)) {
            return;
        }
        f(obj, false);
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.j.getValue();
    }

    public final void h(Object obj, tj4 tj4Var) {
        if (this.i) {
            sfd sfdVar = this.f;
            if (g76.L(obj, sfdVar != null ? sfdVar.c : null)) {
                return;
            }
        }
        k49 k49Var = this.b;
        boolean zL = g76.L(k49Var.getValue(), obj);
        g49 g49Var = this.h;
        if (zL && g49Var.g() == -1.0f) {
            return;
        }
        k49Var.setValue(obj);
        this.c.setValue(tj4Var);
        Object value = g49Var.g() == -3.0f ? obj : this.j.getValue();
        k49 k49Var2 = this.g;
        f(value, !((Boolean) k49Var2.getValue()).booleanValue());
        k49Var2.setValue(Boolean.valueOf(g49Var.g() == -3.0f));
        if (g49Var.g() >= 0.0f) {
            e(c().g((long) (g49Var.g() * c().c())));
        } else if (g49Var.g() == -3.0f) {
            e(obj);
        }
        this.i = false;
        g49Var.h(-1.0f);
    }

    public final String toString() {
        return "current value: " + this.j.getValue() + ", target: " + this.b.getValue() + ", spec: " + ((tj4) this.c.getValue());
    }
}
