package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vfc implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bgc b;

    public /* synthetic */ vfc(bgc bgcVar, int i) {
        this.a = i;
        this.b = bgcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean z;
        int i = this.a;
        c1e c1eVar = c1e.a;
        bgc bgcVar = this.b;
        switch (i) {
            case 0:
                s46 s46Var = (s46) obj;
                bgcVar.j.h((int) (s46Var.a >> 32));
                bgcVar.k.h((int) (s46Var.a & 4294967295L));
                return c1eVar;
            case 1:
                float fFloatValue = ((Float) obj).floatValue();
                hp1 hp1Var = bgcVar.b;
                g49 g49Var = bgcVar.c;
                float fU = iq7.u(fFloatValue, hp1Var.a, hp1Var.b);
                if (fU == g49Var.g()) {
                    z = false;
                } else {
                    if (fU != g49Var.g()) {
                        x45 x45Var = bgcVar.d;
                        if (x45Var != null) {
                            x45Var.invoke(Float.valueOf(fU));
                        } else {
                            bgcVar.d(fU);
                        }
                    }
                    m45 m45Var = bgcVar.a;
                    if (m45Var != null) {
                        m45Var.invoke();
                    }
                    z = true;
                }
                return Boolean.valueOf(z);
            default:
                bgcVar.b(0.0f);
                bgcVar.n.invoke();
                return c1eVar;
        }
    }
}
