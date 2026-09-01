package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e0e extends p4d implements d55 {
    public int b;
    public /* synthetic */ Throwable c;
    public /* synthetic */ long d;

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            Throwable th = this.c;
            long j = this.d;
            d87.h().g(f0e.a, "Cannot check for unfinished work", th);
            long jMin = Math.min(j * 30000, f0e.b);
            this.b = 1;
            if (gsa.X(jMin, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return Boolean.TRUE;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        long jLongValue = ((Number) obj3).longValue();
        e0e e0eVar = new e0e(4, (n92) obj4);
        e0eVar.c = (Throwable) obj2;
        e0eVar.d = jLongValue;
        return e0eVar.invokeSuspend(c1e.a);
    }
}
