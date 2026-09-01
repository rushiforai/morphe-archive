package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ku extends p4d implements x45 {
    public final /* synthetic */ ou b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ku(ou ouVar, Object obj, n92 n92Var) {
        super(1, n92Var);
        this.b = ouVar;
        this.c = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new ku(this.b, this.c, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        ku kuVar = (ku) create((n92) obj);
        c1e c1eVar = c1e.a;
        kuVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        ou ouVar = this.b;
        ouVar.c();
        Object objB = ouVar.b(this.c);
        ouVar.c.b.setValue(objB);
        ouVar.e.setValue(objB);
        return c1e.a;
    }
}
