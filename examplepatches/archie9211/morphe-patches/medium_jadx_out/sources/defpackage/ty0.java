package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ty0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ty0(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                ty0 ty0Var = new ty0((uy0) obj5, (eh8) obj4, (cn) obj3, (le0) obj2, n92Var, 0);
                ty0Var.c = obj;
                return ty0Var;
            default:
                ty0 ty0Var2 = new ty0((rya) obj5, (a1f) obj4, (h00) obj3, (yl2) obj2, n92Var, 1);
                ty0Var2.c = obj;
                return ty0Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ty0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                ((ty0) create((j00) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                sb2 sb2Var = (sb2) this.c;
                uy0 uy0Var = (uy0) obj5;
                n92 n92Var = null;
                vx0.c0(sb2Var, null, null, new l0(uy0Var, (eh8) obj4, (cn) obj3, n92Var, 19), 3);
                return vx0.c0(sb2Var, null, null, new j0(uy0Var, (le0) obj2, n92Var, 29), 3);
            default:
                br7.v(obj);
                du8 du8Var = ((j00) this.c).c;
                if (du8Var != null) {
                    ((rya) obj5).a = kp7.k(kp7.p(((h00) obj3).a, du8Var, (yl2) obj2, ((a1f) obj4).a.b).values());
                }
                return c1e.a;
        }
    }
}
