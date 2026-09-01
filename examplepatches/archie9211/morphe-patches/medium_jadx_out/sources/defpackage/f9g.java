package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f9g extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ h9g c;
    public final /* synthetic */ long d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f9g(long j, n92 n92Var, h9g h9gVar) {
        super(2, n92Var);
        this.c = h9gVar;
        this.d = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        f9g f9gVar = new f9g(this.d, n92Var, this.c);
        f9gVar.b = obj;
        return f9gVar;
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        f9g f9gVar = (f9g) create((fdg) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        f9gVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        fdg fdgVar = (fdg) this.b;
        h9g h9gVar = this.c;
        boolean zEquals = h9gVar.d.equals(p9g.b);
        c1e c1eVar = c1e.a;
        if (!zEquals) {
            p9g p9gVar = h9gVar.d;
            p9g p9gVar2 = p9g.c;
            if (!p9gVar.equals(p9gVar2) && (!h9gVar.d.equals(p9g.d) || h9g.c(h9gVar.b))) {
                h9gVar.d = p9gVar2;
                vx1 vx1Var = new vx1();
                h9gVar.a = vx1Var;
                vx0.c0((k92) h9gVar.f.c, null, null, new m0(this.d, vx1Var, (n92) null, h9gVar, fdgVar), 3);
            }
        }
        return c1eVar;
    }
}
