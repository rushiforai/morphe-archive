package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e5d extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ou d;
    public final /* synthetic */ float e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e5d(ou ouVar, float f, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ouVar;
        this.e = f;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new e5d(this.d, this.e, n92Var, 0);
            case 1:
                return new e5d(this.d, this.e, n92Var, 1);
            default:
                return new e5d(this.d, this.e, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((e5d) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        float f = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f2 = new Float(f);
                cud cudVarQ = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(this.d, f2, cudVarQ, null, this, 12) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f3 = new Float(f);
                cud cudVarQ2 = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(this.d, f3, cudVarQ2, null, this, 12) == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f4 = new Float(-f);
                cud cudVarQ3 = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(this.d, f4, cudVarQ3, null, this, 12) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
