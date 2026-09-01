package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class q0a extends bs1 {
    public final p0a b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q0a(pj6 pj6Var) {
        super(pj6Var);
        pj6Var.getClass();
        this.b = new p0a(pj6Var.a());
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return this.b;
    }

    @Override // defpackage.bs1, defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        int iH = h(obj);
        p0a p0aVar = this.b;
        xtc xtcVarA = xtcVar.a(p0aVar);
        o(xtcVarA, obj, iH);
        xtcVarA.s(p0aVar);
    }

    @Override // defpackage.u0, defpackage.pj6
    public final Object d(kw2 kw2Var) {
        return i(kw2Var);
    }

    @Override // defpackage.u0
    public final Object e() {
        return (o0a) k(n());
    }

    @Override // defpackage.u0
    public final int f(Object obj) {
        o0a o0aVar = (o0a) obj;
        o0aVar.getClass();
        return o0aVar.d();
    }

    @Override // defpackage.u0
    public final Iterator g(Object obj) {
        throw new IllegalStateException("This method lead to boxing and must not be used, use writeContents instead");
    }

    @Override // defpackage.u0
    public final Object l(Object obj) {
        o0a o0aVar = (o0a) obj;
        o0aVar.getClass();
        return o0aVar.a();
    }

    @Override // defpackage.bs1
    public final void m(Object obj, int i, Object obj2) {
        ((o0a) obj).getClass();
        throw new IllegalStateException("This method lead to boxing and must not be used, use Builder.append instead");
    }

    public abstract Object n();

    public abstract void o(xtc xtcVar, Object obj, int i);
}
