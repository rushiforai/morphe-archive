package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gv extends co6 implements x45 {
    public final /* synthetic */ t99[] a;
    public final /* synthetic */ hv b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gv(t99[] t99VarArr, hv hvVar, int i, int i2) {
        super(1);
        this.a = t99VarArr;
        this.b = hvVar;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        s99 s99Var = (s99) obj;
        for (t99 t99Var : this.a) {
            if (t99Var != null) {
                long jA = this.b.a.b.a((((long) t99Var.a) << 32) | (((long) t99Var.b) & 4294967295L), (((long) this.d) & 4294967295L) | (((long) this.c) << 32), ip6.Ltr);
                s99Var.g(t99Var, (int) (jA >> 32), (int) (jA & 4294967295L), 0.0f);
            }
        }
        return c1e.a;
    }
}
