package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sp7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ float d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;

    public /* synthetic */ sp7(r28 r28Var, long j, float f, int i, int i2, int i3) {
        this.a = i3;
        this.b = r28Var;
        this.c = j;
        this.d = f;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                tp7.c(this.d, iY, this.f, this.c, (x12) obj, this.b);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                tp7.e(this.d, iY2, this.f, this.c, (x12) obj, this.b);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                vp7.b(this.d, iY3, this.f, this.c, (x12) obj, this.b);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                ur7.r(this.d, iY4, this.f, this.c, (x12) obj, this.b);
                break;
        }
        return c1eVar;
    }
}
