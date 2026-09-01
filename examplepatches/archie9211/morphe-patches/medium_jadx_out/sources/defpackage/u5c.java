package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u5c extends p4d implements c55 {
    public /* synthetic */ boolean b;
    public /* synthetic */ boolean c;
    public final /* synthetic */ v5c d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u5c(v5c v5cVar, n92 n92Var) {
        super(3, n92Var);
        this.d = v5cVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
        u5c u5cVar = new u5c(this.d, (n92) obj3);
        u5cVar.b = zBooleanValue;
        u5cVar.c = zBooleanValue2;
        return u5cVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z = this.b;
        boolean z2 = this.c;
        br7.v(obj);
        return this.d.e(z, z2);
    }
}
