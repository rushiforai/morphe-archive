package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fvc extends co6 implements b55 {
    public final /* synthetic */ r28 a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fvc(r28 r28Var, b55 b55Var, int i, int i2) {
        super(2);
        this.a = r28Var;
        this.b = b55Var;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iY = tr7.y(this.c | 1);
        int i = this.d;
        f76.u(this.a, this.b, (x12) obj, iY, i);
        return c1e.a;
    }
}
