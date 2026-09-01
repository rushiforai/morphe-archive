package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cef extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ ref d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cef(int i, n92 n92Var, ref refVar) {
        super(2, n92Var);
        this.b = i;
        this.d = refVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ref refVar = this.d;
        switch (i) {
            case 0:
                cef cefVar = new cef(0, n92Var, refVar);
                cefVar.c = obj;
                return cefVar;
            default:
                cef cefVar2 = new cef(1, n92Var, refVar);
                cefVar2.c = obj;
                return cefVar2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        qz8 qz8Var = (qz8) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((cef) create(qz8Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((cef) create(qz8Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ref refVar = this.d;
        qz8 qz8Var = (qz8) this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                boolean z = qz8Var instanceof oz8;
                if (z && refVar.G != null) {
                    refVar.G = null;
                    ref.f(refVar, null, null, null, 7);
                }
                if ((qz8Var instanceof nz8) || (z && !((oz8) qz8Var).d)) {
                    xpc xpcVar = refVar.x;
                    Boolean bool = Boolean.FALSE;
                    xpcVar.getClass();
                    xpcVar.m(null, bool);
                }
                break;
            default:
                br7.v(obj);
                String str = (String) refVar.c.a("selected_tag_id");
                boolean z2 = qz8Var instanceof oz8;
                if (z2 && !g76.L(str, refVar.H)) {
                    refVar.H = str;
                    ref.f(refVar, null, null, str, 3);
                }
                if ((qz8Var instanceof nz8) || (z2 && !((oz8) qz8Var).d)) {
                    xpc xpcVar2 = refVar.x;
                    Boolean bool2 = Boolean.FALSE;
                    xpcVar2.getClass();
                    xpcVar2.m(null, bool2);
                }
                break;
        }
        return c1eVar;
    }
}
