package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qa2 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kx6 b;

    public /* synthetic */ qa2(kx6 kx6Var, int i) {
        this.a = i;
        this.b = kx6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        kx6 kx6Var = this.b;
        switch (i) {
            case 0:
                hp6 hp6Var = (hp6) obj;
                rjd rjdVarD = kx6Var.d();
                if (rjdVarD != null) {
                    rjdVarD.c = hp6Var;
                }
                return c1eVar;
            case 1:
                k49 k49Var = kx6Var.t;
                uid uidVar = (uid) obj;
                String str = uidVar.a.b;
                mx mxVar = kx6Var.j;
                if (!g76.L(str, mxVar != null ? mxVar.b : null)) {
                    kx6Var.k.setValue(ci5.None);
                    if (((Boolean) k49Var.getValue()).booleanValue()) {
                        k49Var.setValue(Boolean.FALSE);
                    } else {
                        kx6Var.s.setValue(Boolean.FALSE);
                    }
                }
                long j = bkd.b;
                kx6Var.f(j);
                kx6Var.e(j);
                kx6Var.u.invoke(uidVar);
                kx6Var.b.b();
                return c1eVar;
            case 2:
                kx6Var.r.b(((qy5) obj).a);
                return c1eVar;
            case 3:
                return Boolean.valueOf(kx6Var.r.b(((qy5) obj).a));
            default:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                kx6Var.q.setValue(bool);
                return c1eVar;
        }
    }
}
