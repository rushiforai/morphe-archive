package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gg7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ sg7 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gg7(sg7 sg7Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = sg7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        sg7 sg7Var = this.c;
        switch (i) {
            case 0:
                return new gg7(sg7Var, n92Var, 0);
            default:
                return new gg7(sg7Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((gg7) create(do4Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((gg7) create(do4Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 1;
        sg7 sg7Var = this.c;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        switch (i) {
            case 0:
                br7.v(obj);
                vx0.c0(f76.F(sg7Var), null, null, new kf7(sg7Var, n92Var, 6), 3);
                vx0.c0(f76.F(sg7Var), null, null, new kf7(sg7Var, n92Var, i2), 3);
                break;
            default:
                br7.v(obj);
                if (!sg7Var.v) {
                    sg7Var.v = true;
                    vx0.c0(f76.F(sg7Var), null, null, new kf7(sg7Var, n92Var, 4), 3);
                    vx0.c0(f76.F(sg7Var), null, null, new kf7(sg7Var, n92Var, 5), 3);
                    vx0.c0(f76.F(sg7Var), null, null, new kf7(sg7Var, n92Var, 7), 3);
                }
                break;
        }
        return c1eVar;
    }
}
