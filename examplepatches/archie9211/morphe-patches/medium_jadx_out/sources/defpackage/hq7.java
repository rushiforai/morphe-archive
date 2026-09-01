package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hq7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ m45 g;
    public final /* synthetic */ m45 h;
    public final /* synthetic */ int i;
    public final /* synthetic */ int j;

    public /* synthetic */ hq7(r28 r28Var, String str, String str2, String str3, String str4, m45 m45Var, m45 m45Var2, int i, int i2, int i3) {
        this.a = i3;
        this.b = r28Var;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = m45Var;
        this.h = m45Var2;
        this.i = i;
        this.j = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.i;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                iq7.b(this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY, this.j);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                jq7.b(this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY2, this.j);
                break;
        }
        return c1eVar;
    }
}
