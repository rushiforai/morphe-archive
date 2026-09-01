package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class twb implements c55 {
    public final /* synthetic */ w06 a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ vkb d;
    public final /* synthetic */ m45 e;

    public twb(w06 w06Var, boolean z, boolean z2, vkb vkbVar, m45 m45Var) {
        this.a = w06Var;
        this.b = z;
        this.c = z2;
        this.d = vkbVar;
        this.e = m45Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        ((Number) obj3).intValue();
        p65 p65Var = (p65) ((x12) obj2);
        p65Var.Y(-1525724089);
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = ka1.k(p65Var);
        }
        m68 m68Var = (m68) objM;
        r28 r28VarB = s06.a(o28.b, m68Var, this.a).b(new swb(this.b, m68Var, null, false, this.c, this.d, this.e));
        p65Var.p(false);
        return r28VarB;
    }
}
