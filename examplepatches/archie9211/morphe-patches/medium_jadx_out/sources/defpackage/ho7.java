package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ho7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ yn7 d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ int g;
    public final /* synthetic */ int h;

    public /* synthetic */ ho7(m45 m45Var, String str, yn7 yn7Var, r28 r28Var, boolean z, int i, int i2, int i3) {
        this.a = i3;
        this.b = m45Var;
        this.c = str;
        this.d = yn7Var;
        this.e = r28Var;
        this.f = z;
        this.g = i;
        this.h = i2;
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
                mo7.t(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY, this.h);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                mo7.k(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2, this.h);
                break;
        }
        return c1eVar;
    }
}
