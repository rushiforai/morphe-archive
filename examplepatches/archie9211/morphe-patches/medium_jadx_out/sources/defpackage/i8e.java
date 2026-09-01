package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i8e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ l8e c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i8e(l8e l8eVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = l8eVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new i8e(this.c, n92Var, 0);
            case 1:
                return new i8e(this.c, n92Var, 1);
            case 2:
                return new i8e(this.c, n92Var, 2);
            default:
                return new i8e(this.c, n92Var, 3);
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
                ((i8e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((i8e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((i8e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((i8e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        l8e l8eVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                l8eVar.b();
                break;
            case 1:
                br7.v(obj);
                l8eVar.b();
                break;
            case 2:
                br7.v(obj);
                l8eVar.a(false);
                break;
            default:
                br7.v(obj);
                l8eVar.b();
                break;
        }
        return c1eVar;
    }
}
