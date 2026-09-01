package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fl0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ hl0 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ xd e;
    public final /* synthetic */ w82 f;
    public final /* synthetic */ float g;
    public final /* synthetic */ int h;
    public final /* synthetic */ m3c i;
    public final /* synthetic */ int j;
    public final /* synthetic */ int k;
    public final /* synthetic */ Object l;

    public /* synthetic */ fl0(String str, hl0 hl0Var, r28 r28Var, xd xdVar, w82 w82Var, float f, int i, m3c m3cVar, m45 m45Var, int i2, int i3) {
        this.b = str;
        this.c = hl0Var;
        this.d = r28Var;
        this.e = xdVar;
        this.f = w82Var;
        this.g = f;
        this.h = i;
        this.i = m3cVar;
        this.l = m45Var;
        this.j = i2;
        this.k = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.j;
        Object obj3 = this.l;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                f76.c(this.b, this.c, this.d, (zw7) obj3, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY, this.k);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                hp7.o(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, (m45) obj3, (x12) obj, iY2, this.k);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fl0(String str, hl0 hl0Var, r28 r28Var, zw7 zw7Var, xd xdVar, w82 w82Var, float f, int i, m3c m3cVar, int i2, int i3) {
        this.b = str;
        this.c = hl0Var;
        this.d = r28Var;
        this.l = zw7Var;
        this.e = xdVar;
        this.f = w82Var;
        this.g = f;
        this.h = i;
        this.i = m3cVar;
        this.j = i2;
        this.k = i3;
    }
}
