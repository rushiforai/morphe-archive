package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class du extends co6 implements b55 {
    public final /* synthetic */ x45 a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ x45 c;
    public final /* synthetic */ x45 d;
    public final /* synthetic */ int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public du(x45 x45Var, r28 r28Var, x45 x45Var2, x45 x45Var3, int i) {
        super(2);
        this.a = x45Var;
        this.b = r28Var;
        this.c = x45Var2;
        this.d = x45Var3;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        vc2.b(this.a, this.b, this.c, this.d, (x12) obj, tr7.y(this.e | 1));
        return c1e.a;
    }
}
