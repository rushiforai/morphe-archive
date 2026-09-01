package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pq7 implements m45 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ v7c b;
    public final /* synthetic */ sb2 c;
    public final /* synthetic */ m45 d;

    public /* synthetic */ pq7(sb2 sb2Var, v7c v7cVar, m45 m45Var) {
        this.c = sb2Var;
        this.b = v7cVar;
        this.d = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        sb2 sb2Var = this.c;
        m45 m45Var = this.d;
        v7c v7cVar = this.b;
        int i2 = 3;
        switch (i) {
            case 0:
                vx0.c0(sb2Var, null, null, new kd7(v7cVar, m45Var, n92Var, i2), 3);
                break;
            case 1:
                if (((Boolean) ((x45) v7cVar.e.d).invoke(w7c.Hidden)).booleanValue()) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 11), 3).R(new m18(v7cVar, m45Var, 0));
                }
                break;
            default:
                int i3 = q18.a[v7cVar.c().ordinal()];
                if (i3 == 1) {
                    m45Var.invoke();
                } else if (i3 == 2) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 12), 3);
                } else {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 13), 3);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pq7(v7c v7cVar, sb2 sb2Var, m45 m45Var) {
        this.b = v7cVar;
        this.c = sb2Var;
        this.d = m45Var;
    }

    public /* synthetic */ pq7(v7c v7cVar, m45 m45Var, sb2 sb2Var) {
        this.b = v7cVar;
        this.d = m45Var;
        this.c = sb2Var;
    }
}
