package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j83 extends eqc implements upc {
    public final m45 b;
    public final ajc c;
    public i83 d = new i83(uic.h().g());

    public j83(m45 m45Var, ajc ajcVar) {
        this.b = m45Var;
        this.c = ajcVar;
    }

    @Override // defpackage.dqc
    public final fqc d() {
        return this.d;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.i83 g(defpackage.i83 r21, defpackage.oic r22, boolean r23, defpackage.m45 r24) {
        /*
            Method dump skipped, instruction units count: 396
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j83.g(i83, oic, boolean, m45):i83");
    }

    @Override // defpackage.upc
    public final Object getValue() {
        x45 x45VarE = uic.h().e();
        if (x45VarE != null) {
            x45VarE.invoke(this);
        }
        oic oicVarH = uic.h();
        return g((i83) uic.g(this.d, oicVarH), oicVarH, true, this.b).f;
    }

    public final i83 h() {
        oic oicVarH = uic.h();
        return g((i83) uic.g(this.d, oicVarH), oicVarH, false, this.b);
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        this.d = (i83) fqcVar;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DerivedState(value=");
        i83 i83Var = (i83) uic.f(this.d);
        sb.append(i83Var.c(this, uic.h()) ? String.valueOf(i83Var.f) : "<Not calculated>");
        sb.append(")@");
        sb.append(hashCode());
        return sb.toString();
    }
}
