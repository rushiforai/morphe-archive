package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ea1 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ float c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ea1(ga1 ga1Var, y81 y81Var, r28 r28Var, boolean z, float f, int i) {
        this.d = ga1Var;
        this.e = y81Var;
        this.f = r28Var;
        this.b = z;
        this.c = f;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                t40.g((ga1) obj5, (y81) obj4, (r28) obj3, this.b, this.c, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                guc.m((ycd) obj5, this.b, (d9d) obj4, (lbd) obj3, this.c, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ea1(ycd ycdVar, boolean z, d9d d9dVar, lbd lbdVar, float f, int i) {
        this.d = ycdVar;
        this.b = z;
        this.e = d9dVar;
        this.f = lbdVar;
        this.c = f;
    }
}
