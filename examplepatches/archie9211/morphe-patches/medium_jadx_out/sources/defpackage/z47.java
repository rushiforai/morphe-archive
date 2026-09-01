package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z47 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ sb2 c;
    public final /* synthetic */ v7c d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ z47(m45 m45Var, sb2 sb2Var, v7c v7cVar, m45 m45Var2, int i) {
        this.a = i;
        this.b = m45Var;
        this.c = sb2Var;
        this.d = v7cVar;
        this.e = m45Var2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = this.c;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                vx0.c0(sb2Var, null, null, new b57(new z23(4, m45Var), this.d, this.e, null, 0), 3);
                break;
            case 1:
                vx0.c0(sb2Var, null, null, new b57(new z23(10, m45Var), this.d, this.e, null, 1), 3);
                break;
            default:
                vx0.c0(sb2Var, null, null, new b57(new z23(9, m45Var), this.d, this.e, null, 1), 3);
                break;
        }
        return c1eVar;
    }
}
