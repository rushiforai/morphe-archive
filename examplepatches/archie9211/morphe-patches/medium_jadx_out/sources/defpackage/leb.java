package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class leb implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ leb(sfb sfbVar, boolean z, boolean z2, veb vebVar, r28 r28Var, int i) {
        this.e = sfbVar;
        this.b = z;
        this.c = z2;
        this.f = vebVar;
        this.g = r28Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                ep7.k((sfb) obj5, this.b, this.c, (veb) obj4, (r28) obj3, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                p5d.b(this.b, this.c, (h23) obj5, (m45) obj4, (d56) obj3, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ leb(boolean z, boolean z2, h23 h23Var, m45 m45Var, d56 d56Var, int i) {
        this.b = z;
        this.c = z2;
        this.e = h23Var;
        this.f = m45Var;
        this.g = d56Var;
        this.d = i;
    }
}
