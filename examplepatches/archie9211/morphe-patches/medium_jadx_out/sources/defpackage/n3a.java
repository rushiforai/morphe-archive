package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n3a implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ float d;
    public final /* synthetic */ long e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;

    public /* synthetic */ n3a(r28 r28Var, long j, float f, long j2, int i, int i2) {
        this.b = r28Var;
        this.c = j;
        this.d = f;
        this.e = j2;
        this.f = i;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.g;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                z3a.d(this.d, this.f, iY, this.c, this.e, (x12) obj, this.b);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                a4a.b(this.d, this.f, iY2, this.c, this.e, (x12) obj, this.b);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ n3a(r28 r28Var, long j, long j2, int i, float f, int i2) {
        this.b = r28Var;
        this.c = j;
        this.e = j2;
        this.f = i;
        this.d = f;
        this.g = i2;
    }
}
