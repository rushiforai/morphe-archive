package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ar7 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ long d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;
    public final /* synthetic */ Object g;

    public /* synthetic */ ar7(fa4 fa4Var, r28 r28Var, float f, long j, int i, int i2) {
        this.g = fa4Var;
        this.b = r28Var;
        this.c = f;
        this.d = j;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                br7.a(this.b, (Float) obj3, this.c, this.d, (x12) obj, iY, this.f);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                ((fa4) obj3).p(this.c, iY2, this.f, this.d, (x12) obj, this.b);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ar7(r28 r28Var, Float f, float f2, long j, int i, int i2) {
        this.b = r28Var;
        this.g = f;
        this.c = f2;
        this.d = j;
        this.e = i;
        this.f = i2;
    }
}
