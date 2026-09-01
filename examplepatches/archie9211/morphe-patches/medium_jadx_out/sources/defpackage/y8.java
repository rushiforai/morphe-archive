package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ sr4 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y8(sr4 sr4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = sr4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new y8(this.c, n92Var, 0);
            case 1:
                return new y8(this.c, n92Var, 1);
            case 2:
                return new y8(this.c, n92Var, 2);
            case 3:
                return new y8(this.c, n92Var, 3);
            case 4:
                return new y8(this.c, n92Var, 4);
            case 5:
                return new y8(this.c, n92Var, 5);
            case 6:
                return new y8(this.c, n92Var, 6);
            default:
                return new y8(this.c, n92Var, 7);
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
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 3:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 4:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 5:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 6:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((y8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sr4 sr4Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 1:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 2:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 3:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 4:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 5:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            case 6:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
            default:
                br7.v(obj);
                sr4.a(sr4Var);
                break;
        }
        return c1eVar;
    }
}
