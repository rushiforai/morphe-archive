package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qrb extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ oya c;
    public final /* synthetic */ float d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qrb(oya oyaVar, float f, n92 n92Var) {
        super(2, n92Var);
        this.c = oyaVar;
        this.d = f;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        qrb qrbVar = new qrb(this.c, this.d, n92Var);
        qrbVar.b = obj;
        return qrbVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        qrb qrbVar = (qrb) create((xrb) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        qrbVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        this.c.a = ((xrb) this.b).a(this.d);
        return c1e.a;
    }
}
