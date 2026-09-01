package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zt7 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ c55 d;
    public final /* synthetic */ c09 e;
    public final /* synthetic */ String f;
    public final /* synthetic */ long g;
    public final /* synthetic */ int h;
    public final /* synthetic */ int i;
    public final /* synthetic */ Object j;

    public /* synthetic */ zt7(mz1 mz1Var, r28 r28Var, m45 m45Var, c55 c55Var, c09 c09Var, String str, long j, int i, int i2) {
        this.j = mz1Var;
        this.b = r28Var;
        this.c = m45Var;
        this.d = c55Var;
        this.e = c09Var;
        this.f = str;
        this.g = j;
        this.h = i;
        this.i = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.h;
        Object obj3 = this.j;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                au7.b(this.b, this.f, this.c, this.d, this.e, (String) obj3, this.g, (x12) obj, iY, this.i);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                au7.a((mz1) obj3, this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY2, this.i);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ zt7(r28 r28Var, String str, m45 m45Var, c55 c55Var, c09 c09Var, String str2, long j, int i, int i2) {
        this.b = r28Var;
        this.f = str;
        this.c = m45Var;
        this.d = c55Var;
        this.e = c09Var;
        this.j = str2;
        this.g = j;
        this.h = i;
        this.i = i2;
    }
}
