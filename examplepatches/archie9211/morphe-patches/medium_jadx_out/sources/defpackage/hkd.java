package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hkd implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ mkd b;
    public final /* synthetic */ float c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ long e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;

    public /* synthetic */ hkd(mkd mkdVar, float f, r28 r28Var, long j, int i, int i2) {
        this.b = mkdVar;
        this.c = f;
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
                ok7.s(this.c, iY, this.g, this.e, (x12) obj, this.d, this.b);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                ok7.r(this.c, iY2, this.g, this.e, (x12) obj, this.d, this.b);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ hkd(mkd mkdVar, r28 r28Var, float f, long j, int i, int i2) {
        this.b = mkdVar;
        this.d = r28Var;
        this.c = f;
        this.e = j;
        this.f = i;
        this.g = i2;
    }
}
