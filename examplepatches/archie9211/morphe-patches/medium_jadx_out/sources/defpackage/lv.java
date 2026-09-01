package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lv extends co6 implements x45 {
    public final /* synthetic */ nv a;
    public final /* synthetic */ t99 b;
    public final /* synthetic */ long c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lv(nv nvVar, t99 t99Var, long j) {
        super(1);
        this.a = nvVar;
        this.b = t99Var;
        this.c = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        xd xdVar = this.a.r.b;
        t99 t99Var = this.b;
        s99.i((s99) obj, t99Var, xdVar.a((((long) t99Var.b) & 4294967295L) | (((long) t99Var.a) << 32), this.c, ip6.Ltr));
        return c1e.a;
    }
}
