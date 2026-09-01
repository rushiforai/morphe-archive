package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class up7 implements b55 {
    public final /* synthetic */ int a = 2;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ long d;

    public /* synthetic */ up7(float f, r28 r28Var, long j, int i) {
        this.c = f;
        this.b = r28Var;
        this.d = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                vp7.c(this.c, iY, this.d, (x12) obj, this.b);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                qb8.f(this.c, iY2, this.d, (x12) obj, this.b);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(1);
                bo.u(this.c, iY3, this.d, (x12) obj, this.b);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ up7(r28 r28Var, float f, long j, int i) {
        this.b = r28Var;
        this.c = f;
        this.d = j;
    }

    public /* synthetic */ up7(r28 r28Var, long j, float f, int i) {
        this.b = r28Var;
        this.d = j;
        this.c = f;
    }
}
