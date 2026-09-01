package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r50 extends p4d implements c55 {
    public /* synthetic */ long b;

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long jLongValue = ((Number) obj2).longValue();
        r50 r50Var = new r50(3, (n92) obj3);
        r50Var.b = jLongValue;
        return r50Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        long j = this.b;
        br7.v(obj);
        return new Long(j);
    }
}
