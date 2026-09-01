package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class db7 extends co6 implements m45 {
    public final /* synthetic */ fb7 a;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ v99 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public db7(fb7 fb7Var, long j, long j2, v99 v99Var) {
        super(0);
        this.a = fb7Var;
        this.b = j;
        this.c = j2;
        this.d = v99Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        fb7 fb7Var = this.a;
        fb7Var.z0().a = false;
        fb7Var.z0().b = this.b;
        fb7Var.z0().c = this.c;
        x45 x45VarE = this.d.a.e();
        if (x45VarE != null) {
            x45VarE.invoke(fb7Var.z0());
        }
        return c1e.a;
    }
}
