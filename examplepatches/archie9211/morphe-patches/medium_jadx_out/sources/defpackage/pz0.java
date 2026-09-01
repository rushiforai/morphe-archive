package defpackage;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pz0 implements xwe {
    public Object a = wz0.p;
    public x51 b;
    public final /* synthetic */ uz0 c;

    public pz0(uz0 uz0Var) {
        this.c = uz0Var;
    }

    @Override // defpackage.xwe
    public final void a(jwb jwbVar, int i) {
        x51 x51Var = this.b;
        if (x51Var != null) {
            x51Var.a(jwbVar, i);
        }
    }

    public final Object b(p92 p92Var) throws Throwable {
        lk1 lk1VarJ;
        Object obj = this.a;
        boolean z = true;
        if (obj == wz0.p || obj == wz0.l) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = uz0.g;
            uz0 uz0Var = this.c;
            lk1 lk1Var = (lk1) atomicReferenceFieldUpdater.get(uz0Var);
            while (true) {
                if (uz0Var.z()) {
                    this.a = wz0.l;
                    Throwable thP = uz0Var.p();
                    if (thP != null) {
                        int i = gmc.a;
                        throw thP;
                    }
                    z = false;
                } else {
                    long andIncrement = uz0.c.getAndIncrement(uz0Var);
                    long j = wz0.b;
                    long j2 = andIncrement / j;
                    int i2 = (int) (andIncrement % j);
                    if (lk1Var.d != j2) {
                        lk1VarJ = uz0Var.j(j2, lk1Var);
                        if (lk1VarJ == null) {
                            continue;
                        }
                    } else {
                        lk1VarJ = lk1Var;
                    }
                    Object objL = uz0Var.L(lk1VarJ, i2, andIncrement, null);
                    d1g d1gVar = wz0.m;
                    if (objL == d1gVar) {
                        ygf.f("unreachable");
                        return null;
                    }
                    d1g d1gVar2 = wz0.o;
                    if (objL == d1gVar2) {
                        if (andIncrement < uz0Var.v()) {
                            lk1VarJ.a();
                        }
                        lk1Var = lk1VarJ;
                    } else {
                        if (objL == wz0.n) {
                            uz0 uz0Var2 = this.c;
                            x51 x51VarS = wgf.s(pwd.Q(p92Var));
                            try {
                                this.b = x51VarS;
                                Object objL2 = uz0Var2.L(lk1VarJ, i2, andIncrement, this);
                                if (objL2 == d1gVar) {
                                    a(lk1VarJ, i2);
                                } else {
                                    if (objL2 == d1gVar2) {
                                        if (andIncrement < uz0Var2.v()) {
                                            lk1VarJ.a();
                                        }
                                        lk1 lk1Var2 = (lk1) uz0.g.get(uz0Var2);
                                        while (true) {
                                            if (uz0Var2.z()) {
                                                x51 x51Var = this.b;
                                                x51Var.getClass();
                                                this.b = null;
                                                this.a = wz0.l;
                                                Throwable thP2 = uz0Var.p();
                                                if (thP2 == null) {
                                                    x51Var.resumeWith(Boolean.FALSE);
                                                } else {
                                                    x51Var.resumeWith(new ajb(thP2));
                                                }
                                            } else {
                                                long andIncrement2 = uz0.c.getAndIncrement(uz0Var2);
                                                long j3 = wz0.b;
                                                long j4 = andIncrement2 / j3;
                                                int i3 = (int) (andIncrement2 % j3);
                                                if (lk1Var2.d != j4) {
                                                    lk1 lk1VarJ2 = uz0Var2.j(j4, lk1Var2);
                                                    if (lk1VarJ2 != null) {
                                                        lk1Var2 = lk1VarJ2;
                                                    }
                                                }
                                                Object objL3 = uz0Var2.L(lk1Var2, i3, andIncrement2, this);
                                                if (objL3 == wz0.m) {
                                                    a(lk1Var2, i3);
                                                    break;
                                                }
                                                if (objL3 == wz0.o) {
                                                    if (andIncrement2 < uz0Var2.v()) {
                                                        lk1Var2.a();
                                                    }
                                                } else {
                                                    if (objL3 == wz0.n) {
                                                        throw new IllegalStateException("unexpected");
                                                    }
                                                    lk1Var2.a();
                                                    this.a = objL3;
                                                    this.b = null;
                                                }
                                            }
                                        }
                                    } else {
                                        lk1VarJ.a();
                                        this.a = objL2;
                                        this.b = null;
                                    }
                                    x51VarS.j(Boolean.TRUE, null);
                                }
                                return x51VarS.q();
                            } catch (Throwable th) {
                                x51VarS.B();
                                throw th;
                            }
                        }
                        lk1VarJ.a();
                        this.a = objL;
                    }
                }
            }
        }
        return Boolean.valueOf(z);
    }

    public final Object c() throws Throwable {
        Object obj = this.a;
        d1g d1gVar = wz0.p;
        if (obj == d1gVar) {
            ygf.f("`hasNext()` has not been invoked");
            return null;
        }
        this.a = d1gVar;
        if (obj != wz0.l) {
            return obj;
        }
        Throwable thS = this.c.s();
        int i = gmc.a;
        throw thS;
    }
}
