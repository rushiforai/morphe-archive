package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pv5 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ c09 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ long e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;

    public /* synthetic */ pv5(c09 c09Var, String str, r28 r28Var, long j, int i, int i2, int i3) {
        this.a = i3;
        this.b = c09Var;
        this.c = str;
        this.d = r28Var;
        this.e = j;
        this.f = i;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                qv5.b(this.b, this.c, this.d, this.e, (x12) obj, iY, this.g);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                rv5.a(this.b, this.c, this.d, this.e, (x12) obj, iY2, this.g);
                break;
        }
        return c1eVar;
    }
}
