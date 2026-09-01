package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class c8b implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ j8b b;
    public final /* synthetic */ dr9 c;
    public final /* synthetic */ k8b d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ c8b(j8b j8bVar, dr9 dr9Var, k8b k8bVar, m45 m45Var, int i, int i2) {
        this.a = i2;
        this.b = j8bVar;
        this.c = dr9Var;
        this.d = k8bVar;
        this.e = m45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(3073);
                lk7.n(this.b, this.c, this.d, this.e, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(3073);
                lk7.p(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
