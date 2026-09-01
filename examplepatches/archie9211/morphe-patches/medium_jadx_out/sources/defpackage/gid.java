package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gid extends p4d implements x45 {
    public final /* synthetic */ int b;
    public final /* synthetic */ lid c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gid(lid lidVar, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.c = lidVar;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        lid lidVar = this.c;
        switch (i) {
            case 0:
                return new gid(lidVar, n92Var, 0);
            case 1:
                return new gid(lidVar, n92Var, 1);
            case 2:
                return new gid(lidVar, n92Var, 2);
            default:
                return new gid(lidVar, n92Var, 3);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
            case 0:
                ((gid) create(n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((gid) create(n92Var)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((gid) create(n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((gid) create(n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        lid lidVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                lidVar.A = false;
                break;
            case 1:
                br7.v(obj);
                lidVar.c();
                break;
            case 2:
                br7.v(obj);
                lidVar.a(lidVar.A);
                break;
            default:
                br7.v(obj);
                lidVar.o();
                break;
        }
        return c1eVar;
    }
}
