package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b33 extends p4d implements c55 {
    public int b;
    public /* synthetic */ float c;
    public final /* synthetic */ gud d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b33(gud gudVar, n92 n92Var) {
        super(3, n92Var);
        this.d = gudVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        float fFloatValue = ((Number) obj2).floatValue();
        b33 b33Var = new b33(this.d, (n92) obj3);
        b33Var.c = fFloatValue;
        return b33Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        uod uodVar = this.d.o;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            float f = this.c;
            vod vodVarD = uodVar.d();
            xv2 xv2VarB = uodVar.b();
            ww wwVarC = uodVar.c();
            this.b = 1;
            if (a10.i(vodVarD, f, xv2VarB, wwVarC, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
