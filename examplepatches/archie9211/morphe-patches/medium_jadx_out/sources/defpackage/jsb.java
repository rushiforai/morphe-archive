package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jsb extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public final /* synthetic */ long c;
    public /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jsb(l78 l78Var, long j, n92 n92Var) {
        super(2, n92Var);
        this.d = l78Var;
        this.c = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                jsb jsbVar = new jsb(this.c, n92Var);
                jsbVar.d = obj;
                return jsbVar;
            default:
                return new jsb((l78) this.d, this.c, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((jsb) create((tsb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((jsb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        long j = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                vsb vsbVar = ((tsb) this.d).a;
                vsbVar.c(vsbVar.k, j, 1);
                break;
            default:
                l78 l78Var = (l78) this.d;
                br7.v(obj);
                if (((h0a) l78Var.getValue()) != null) {
                    l78Var.setValue(null);
                }
                l78Var.setValue(new h0a(j));
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jsb(long j, n92 n92Var) {
        super(2, n92Var);
        this.c = j;
    }
}
