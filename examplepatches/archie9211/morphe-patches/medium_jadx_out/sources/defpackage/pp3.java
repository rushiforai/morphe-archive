package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pp3 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ int b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ pp3(int i, int i2, r28 r28Var, m45 m45Var, int i3) {
        this.b = i;
        this.e = i2;
        this.d = r28Var;
        this.c = m45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                m40.f(this.b, this.e, this.d, this.c, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.e | 1);
                yi2.b(this.b, this.c, this.d, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pp3(int i, m45 m45Var, r28 r28Var, int i2) {
        this.b = i;
        this.c = m45Var;
        this.d = r28Var;
        this.e = i2;
    }
}
