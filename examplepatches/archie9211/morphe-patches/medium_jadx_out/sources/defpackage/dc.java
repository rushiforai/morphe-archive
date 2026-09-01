package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dc implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;

    public /* synthetic */ dc(String str, r28 r28Var, String str2, int i, int i2) {
        this.b = str;
        this.d = r28Var;
        this.c = str2;
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
                k50.N(tr7.y(i2 | 1), this.f, (x12) obj, this.d, this.b, this.c);
                break;
            default:
                ((Integer) obj2).getClass();
                vx0.x(tr7.y(i2 | 1), this.f, (x12) obj, this.d, this.b, this.c);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ dc(String str, String str2, r28 r28Var, int i, int i2) {
        this.b = str;
        this.c = str2;
        this.d = r28Var;
        this.e = i;
        this.f = i2;
    }
}
