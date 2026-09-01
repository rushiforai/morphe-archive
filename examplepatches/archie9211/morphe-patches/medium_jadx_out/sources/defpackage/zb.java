package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ int d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ long f;
    public final /* synthetic */ int g;

    public /* synthetic */ zb(m45 m45Var, String str, int i, r28 r28Var, long j, int i2, int i3) {
        this.a = 1;
        this.b = m45Var;
        this.c = str;
        this.d = i;
        this.e = r28Var;
        this.f = j;
        this.g = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                k50.D(this.c, this.e, this.f, this.b, (x12) obj, iY, this.g);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                gsa.J(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2, this.g);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                dm2.g(this.c, this.e, this.f, this.b, (x12) obj, iY3, this.g);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ zb(String str, r28 r28Var, long j, m45 m45Var, int i, int i2, int i3) {
        this.a = i3;
        this.c = str;
        this.e = r28Var;
        this.f = j;
        this.b = m45Var;
        this.d = i;
        this.g = i2;
    }
}
