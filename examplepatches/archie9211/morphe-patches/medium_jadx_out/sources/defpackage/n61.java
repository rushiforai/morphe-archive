package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n61 implements m61 {
    public final xwd a;
    public we8 b;

    public n61(xwd xwdVar) {
        xwdVar.getClass();
        this.a = xwdVar;
        xwdVar.a();
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return null;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        xwd xwdVar = this.a;
        mn6 mn6VarB = xwdVar.a() == pqe.OUT_VARIANCE ? xwdVar.b() : e().o();
        mn6VarB.getClass();
        return d46.Q(mn6VarB);
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return false;
    }

    @Override // defpackage.m61
    public final xwd d() {
        return this.a;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        vm6 vm6VarE = this.a.b().j0().e();
        vm6VarE.getClass();
        return vm6VarE;
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return ey3.a;
    }

    public final String toString() {
        return "CapturedTypeConstructor(" + this.a + ')';
    }
}
