package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ks7 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ mz1 f;
    public final /* synthetic */ int g;
    public final /* synthetic */ int h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;
    public final /* synthetic */ Object k;

    public /* synthetic */ ks7(int i, r28 r28Var, long j, long j2, float f, yrb yrbVar, mz1 mz1Var, b55 b55Var, mz1 mz1Var2, int i2) {
        this.g = i;
        this.b = r28Var;
        this.d = j;
        this.e = j2;
        this.c = f;
        this.i = yrbVar;
        this.f = mz1Var;
        this.k = b55Var;
        this.j = mz1Var2;
        this.h = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.k;
        Object obj4 = this.j;
        Object obj5 = this.i;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(this.h | 1);
                ns7.c(this.g, this.b, this.d, this.e, this.c, (yrb) obj5, this.f, (b55) obj3, (mz1) obj4, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.g | 1);
                kod.a((nod) obj5, this.b, (m3c) obj4, this.c, (m3c) obj3, this.d, this.e, this.f, (x12) obj, iY2, this.h);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ks7(nod nodVar, r28 r28Var, m3c m3cVar, float f, m3c m3cVar2, long j, long j2, mz1 mz1Var, int i, int i2) {
        this.i = nodVar;
        this.b = r28Var;
        this.j = m3cVar;
        this.c = f;
        this.k = m3cVar2;
        this.d = j;
        this.e = j2;
        this.f = mz1Var;
        this.g = i;
        this.h = i2;
    }
}
