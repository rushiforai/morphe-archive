package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a59 extends p4d implements x45 {
    public final /* synthetic */ b59 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ x45 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a59(b59 b59Var, String str, x45 x45Var, n92 n92Var) {
        super(1, n92Var);
        this.b = b59Var;
        this.c = str;
        this.d = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new a59(this.b, this.c, this.d, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return ((a59) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        gnb gnbVarB0 = this.b.b.B0(this.c);
        try {
            Object objInvoke = this.d.invoke(gnbVarB0);
            xz5.F(gnbVarB0, null);
            return objInvoke;
        } finally {
        }
    }
}
