package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lsb extends p4d implements b55 {
    public int b;
    public final /* synthetic */ msb c;
    public final /* synthetic */ float d;
    public final /* synthetic */ float e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lsb(msb msbVar, float f, float f2, n92 n92Var) {
        super(2, n92Var);
        this.c = msbVar;
        this.d = f;
        this.e = f2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new lsb(this.c, this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((lsb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            vsb vsbVar = this.c.N;
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(this.d)) << 32) | (((long) Float.floatToRawIntBits(this.e)) & 4294967295L);
            this.b = 1;
            if (w2g.K(vsbVar, jFloatToRawIntBits, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
