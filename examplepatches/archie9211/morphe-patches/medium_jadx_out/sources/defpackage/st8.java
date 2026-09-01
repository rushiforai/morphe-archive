package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class st8 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ es4 b;
    public final /* synthetic */ es4 c;
    public final /* synthetic */ int d;
    public final /* synthetic */ vt e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ st8(es4 es4Var, es4 es4Var2, Object obj, int i, vt vtVar, int i2) {
        super(1);
        this.a = i2;
        this.b = es4Var;
        this.c = es4Var2;
        this.f = obj;
        this.d = i;
        this.e = vtVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        vt vtVar = this.e;
        int i2 = this.d;
        Object obj2 = this.f;
        es4 es4Var = this.c;
        es4 es4Var2 = this.b;
        switch (i) {
            case 0:
                vq0 vq0Var = (vq0) obj;
                if (es4Var2 != ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f()) {
                    return Boolean.TRUE;
                }
                boolean zT = gp7.t(es4Var, (es4) obj2, i2, vtVar);
                Boolean boolValueOf = Boolean.valueOf(zT);
                if (zT || !vq0Var.a()) {
                    return boolValueOf;
                }
                return null;
            default:
                vq0 vq0Var2 = (vq0) obj;
                if (es4Var2 != ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f()) {
                    return Boolean.TRUE;
                }
                boolean zA = gr7.A(i2, vtVar, es4Var, (zwa) obj2);
                Boolean boolValueOf2 = Boolean.valueOf(zA);
                if (zA || !vq0Var2.a()) {
                    return boolValueOf2;
                }
                return null;
        }
    }
}
