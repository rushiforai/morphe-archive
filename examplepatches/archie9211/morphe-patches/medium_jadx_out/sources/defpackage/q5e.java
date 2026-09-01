package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q5e implements gb2 {
    public final q5e a;
    public final mu2 b;

    public q5e(q5e q5eVar, mu2 mu2Var) {
        this.a = q5eVar;
        this.b = mu2Var;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    public final void a(mu2 mu2Var) {
        if (this.b == mu2Var) {
            ygf.f("Calling updateData inside updateData on the same DataStore instance is not supported\nsince updates made in the parent updateData call will not be visible to the nested\nupdateData call. See https://issuetracker.google.com/issues/241760537 for details.");
            return;
        }
        q5e q5eVar = this.a;
        if (q5eVar != null) {
            q5eVar.a(mu2Var);
        }
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return hpe.j;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }
}
