package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gvc extends co6 implements b55 {
    public final /* synthetic */ kvc a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gvc(kvc kvcVar, r28 r28Var, b55 b55Var, int i) {
        super(2);
        this.a = kvcVar;
        this.b = r28Var;
        this.c = b55Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iY = tr7.y(this.d | 1);
        f76.v(this.a, this.b, this.c, (x12) obj, iY);
        return c1e.a;
    }
}
