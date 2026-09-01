package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x61 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ sh9 c;
    public final /* synthetic */ dr9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x61(sh9 sh9Var, dr9 dr9Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = sh9Var;
        this.d = dr9Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        dr9 dr9Var = this.d;
        sh9 sh9Var = this.c;
        switch (i) {
            case 0:
                return new x61(sh9Var, dr9Var, n92Var, 0);
            default:
                return new x61(sh9Var, dr9Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((x61) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((x61) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        dr9 dr9Var = this.d;
        sh9 sh9Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                sh9Var.B(dr9Var.a, dr9Var.p, dr9Var.x.b);
                break;
            default:
                br7.v(obj);
                sh9Var.B(dr9Var.a, dr9Var.p, dr9Var.x.b);
                break;
        }
        return c1eVar;
    }
}
