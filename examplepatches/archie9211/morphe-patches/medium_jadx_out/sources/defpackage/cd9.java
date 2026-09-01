package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cd9 extends co6 implements m45 {
    public final /* synthetic */ qya a;
    public final /* synthetic */ dd9 b;
    public final /* synthetic */ o46 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cd9(qya qyaVar, dd9 dd9Var, o46 o46Var, long j, long j2) {
        super(0);
        this.a = qyaVar;
        this.b = dd9Var;
        this.c = o46Var;
        this.d = j;
        this.e = j2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        dd9 dd9Var = this.b;
        this.a.a = dd9Var.getPositionProvider().C(this.c, this.d, dd9Var.getParentLayoutDirection(), this.e);
        return c1e.a;
    }
}
