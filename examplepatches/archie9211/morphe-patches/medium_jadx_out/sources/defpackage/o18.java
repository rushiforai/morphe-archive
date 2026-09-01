package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o18 extends p4d implements c55 {
    public /* synthetic */ float b;
    public final /* synthetic */ x45 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o18(x45 x45Var, n92 n92Var) {
        super(3, n92Var);
        this.c = x45Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        float fFloatValue = ((Number) obj2).floatValue();
        o18 o18Var = new o18(this.c, (n92) obj3);
        o18Var.b = fFloatValue;
        c1e c1eVar = c1e.a;
        o18Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        this.c.invoke(new Float(this.b));
        return c1e.a;
    }
}
