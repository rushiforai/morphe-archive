package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ntc implements x45 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ v52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ dr9 d;
    public final /* synthetic */ rq9 e;
    public final /* synthetic */ String f;

    public ntc(boolean z, v52 v52Var, i52 i52Var, dr9 dr9Var, rq9 rq9Var, String str) {
        this.a = z;
        this.b = v52Var;
        this.c = i52Var;
        this.d = dr9Var;
        this.e = rq9Var;
        this.f = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        rq9 rq9Var;
        h52 h52Var = (h52) obj;
        h52Var.getClass();
        i52 i52Var = h52Var.c;
        q52 q52Var = h52Var.e;
        if (this.a) {
            km4.o(q52Var, this.b, 12.0f, 4);
        } else {
            km4.o(q52Var, this.c.f, 0.0f, 6);
        }
        wgd.k(h52Var.d, i52Var.c, 0.0f, 6);
        wgd.k(h52Var.f, i52Var.e, 10.0f, 4);
        ka1.A(h52Var, null, "spread");
        h52Var.d((this.d.i.e || ((rq9Var = this.e) != null && rq9Var.d) || this.f != null) ? new ze3(null, "wrap") : new ze3(new vj3(0.0f), null));
        return c1e.a;
    }
}
