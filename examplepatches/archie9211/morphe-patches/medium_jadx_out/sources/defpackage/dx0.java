package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dx0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sb2 b;
    public final /* synthetic */ v7c c;

    public /* synthetic */ dx0(sb2 sb2Var, v7c v7cVar, int i) {
        this.a = i;
        this.b = sb2Var;
        this.c = v7cVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = this.b;
        v7c v7cVar = this.c;
        switch (i) {
            case 0:
                int i2 = gx0.a[v7cVar.c().ordinal()];
                if (i2 == 1) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 0), 3);
                } else if (i2 != 2) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 2), 3);
                } else {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 1), 3);
                }
                return c1eVar;
            case 1:
                vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 3), 3);
                break;
            case 2:
                vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 4), 3);
                break;
            case 3:
                vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 5), 3);
                break;
            case 4:
                vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 7), 3);
                return c1eVar;
            case 5:
                vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 6), 3);
                return c1eVar;
            default:
                if (((Boolean) ((x45) v7cVar.e.d).invoke(w7c.PartiallyExpanded)).booleanValue()) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, null, 15), 3);
                }
                return Boolean.TRUE;
        }
        return Boolean.TRUE;
    }

    public /* synthetic */ dx0(v7c v7cVar, sb2 sb2Var, int i) {
        this.a = i;
        this.c = v7cVar;
        this.b = sb2Var;
    }
}
