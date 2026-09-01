package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lx2(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                lx2 lx2Var = new lx2(2, 0, n92Var);
                lx2Var.c = ((Number) obj).intValue();
                return lx2Var;
            case 1:
                lx2 lx2Var2 = new lx2(2, 1, n92Var);
                lx2Var2.c = ((Number) obj).intValue();
                return lx2Var2;
            default:
                lx2 lx2Var3 = new lx2(2, 2, n92Var);
                lx2Var3.c = ((Number) obj).intValue();
                return lx2Var3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int iIntValue = ((Number) obj).intValue();
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((lx2) create(Integer.valueOf(iIntValue), n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                return Boolean.valueOf(i2 == 0);
            case 1:
                br7.v(obj);
                return Boolean.valueOf(i2 == 0);
            default:
                br7.v(obj);
                return Boolean.valueOf(i2 > 0);
        }
    }
}
