package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qqe extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rqe b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qqe(rqe rqeVar, int i) {
        super(1);
        this.a = i;
        this.b = rqeVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        rqe rqeVar = this.b;
        switch (i) {
            case 0:
                rqeVar.d = true;
                rqeVar.f.invoke();
                return c1eVar;
            default:
                zl3 zl3Var = (zl3) obj;
                wg5 wg5Var = rqeVar.b;
                float f = rqeVar.k;
                float f2 = rqeVar.l;
                m50 m50VarB0 = zl3Var.b0();
                long jB = m50VarB0.B();
                m50VarB0.x().h();
                try {
                    ((md5) m50VarB0.b).z(f, f2, 0L);
                    wg5Var.a(zl3Var);
                    return c1eVar;
                } finally {
                    y30.x(m50VarB0, jB);
                }
        }
    }
}
