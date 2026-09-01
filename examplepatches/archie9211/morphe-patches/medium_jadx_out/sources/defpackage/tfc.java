package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tfc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ufc b;
    public final /* synthetic */ bgc c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ qfc f;
    public final /* synthetic */ b55 g;
    public final /* synthetic */ c55 h;
    public final /* synthetic */ float i;
    public final /* synthetic */ float j;
    public final /* synthetic */ int k;
    public final /* synthetic */ int l;

    public /* synthetic */ tfc(ufc ufcVar, bgc bgcVar, r28 r28Var, boolean z, qfc qfcVar, b55 b55Var, c55 c55Var, float f, float f2, int i, int i2, int i3) {
        this.a = i3;
        this.b = ufcVar;
        this.c = bgcVar;
        this.d = r28Var;
        this.e = z;
        this.f = qfcVar;
        this.g = b55Var;
        this.h = c55Var;
        this.i = f;
        this.j = f2;
        this.k = i;
        this.l = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.k;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                int iY2 = tr7.y(this.l);
                this.b.c(this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, (x12) obj, iY, iY2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                this.b.b(this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, (x12) obj, iY3, this.l);
                break;
        }
        return c1eVar;
    }
}
