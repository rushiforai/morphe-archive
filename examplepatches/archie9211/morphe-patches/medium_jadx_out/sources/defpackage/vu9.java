package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vu9 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rya b;
    public final /* synthetic */ sw9 c;

    public /* synthetic */ vu9(rya ryaVar, sw9 sw9Var, int i) {
        this.a = i;
        this.b = ryaVar;
        this.c = sw9Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        xr9 xr9Var = xr9.a;
        sw9 sw9Var = this.c;
        rya ryaVar = this.b;
        switch (i) {
            case 0:
                ryaVar.a = mq9.a((mq9) ryaVar.a, false, 0, false, (bt4) obj, null, null, null, 524031);
                Object objA = sw9Var.B0.a(xr9Var, n92Var);
                return objA == tb2.COROUTINE_SUSPENDED ? objA : c1eVar;
            case 1:
                ryaVar.a = mq9.a((mq9) ryaVar.a, false, 0, false, null, (d88) obj, null, null, 523775);
                Object objA2 = sw9Var.B0.a(xr9Var, n92Var);
                return objA2 == tb2.COROUTINE_SUSPENDED ? objA2 : c1eVar;
            default:
                ryaVar.a = mq9.a((mq9) ryaVar.a, false, 0, false, null, null, (d88) obj, null, 523263);
                Object objA3 = sw9Var.B0.a(xr9Var, n92Var);
                return objA3 == tb2.COROUTINE_SUSPENDED ? objA3 : c1eVar;
        }
    }
}
