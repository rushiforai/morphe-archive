package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class lr8 extends x55 implements c55 {
    public static final lr8 a = new lr8(3, mr8.class, "register", "register(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        mr8 mr8Var = (mr8) obj;
        rwb rwbVar = (rwb) obj2;
        long j = mr8Var.a;
        c1e c1eVar = c1e.a;
        if (j <= 0) {
            rwbVar.e = c1eVar;
            return c1eVar;
        }
        fi2 fi2Var = new fi2(rwbVar, 19, mr8Var);
        rwbVar.getClass();
        ib2 ib2Var = rwbVar.a;
        rwbVar.c = gsa.g0(ib2Var).Q(j, fi2Var, ib2Var);
        return c1eVar;
    }
}
