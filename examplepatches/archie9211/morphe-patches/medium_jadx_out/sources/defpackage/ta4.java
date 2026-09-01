package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ta4 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;

    public /* synthetic */ ta4(int i, String str, String str2, String str3) {
        this.a = i;
        this.b = str;
        this.c = str2;
        this.d = str3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        switch (this.a) {
            case 0:
                vp2 vp2Var = (vp2) obj;
                vp2Var.getClass();
                ys2 ys2Var = (ys2) vp2Var.a.e;
                ko2 ko2Var = ys2Var.b;
                sa4 sa4Var = new sa4((cba) ko2Var.Q.get(), ko2Var.q());
                ko2 ko2Var2 = ys2Var.b;
                wrc wrcVar = new wrc((cba) ko2Var2.Q.get(), ko2Var2.q());
                ko2 ko2Var3 = ys2Var.b;
                hx4 hx4Var = new hx4(new hb5((cba) ko2Var3.Q.get()), (cba) ko2Var3.Q.get());
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new ib4(this.b, this.c, this.d, sa4Var, wrcVar, hx4Var, r13Var);
            case 1:
                pq2 pq2Var = (pq2) obj;
                pq2Var.getClass();
                ko2 ko2Var4 = pq2Var.a.b;
                return new yv7(this.b, this.c, this.d, ko2Var4.A(), ko2Var4.q(), ko2Var4.t());
            default:
                tr2 tr2Var = (tr2) obj;
                tr2Var.getClass();
                ys2 ys2Var2 = (ys2) tr2Var.a.e;
                ko2 ko2Var5 = ys2Var2.b;
                return new k6b(this.b, this.c, this.d, new mya((gn9) ko2Var5.u.get(), new ax2(ko2Var5.x(), 11)), ys2Var2.a);
        }
    }
}
