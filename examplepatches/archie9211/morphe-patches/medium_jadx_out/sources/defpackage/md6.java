package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class md6 extends uib implements c55 {
    public int c;
    public /* synthetic */ pw2 d;
    public final /* synthetic */ ad e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public md6(ad adVar, n92 n92Var) {
        super(3, n92Var);
        this.e = adVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        md6 md6Var = new md6(this.e, (n92) obj3);
        md6Var.d = (pw2) obj;
        return md6Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ad adVar = this.e;
        jl1 jl1Var = (jl1) adVar.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            pw2 pw2Var = this.d;
            byte bI = jl1Var.I();
            if (bI == 1) {
                return adVar.s(true);
            }
            if (bI == 0) {
                return adVar.s(false);
            }
            if (bI != 6) {
                if (bI == 8) {
                    return adVar.q();
                }
                jl1.q(jl1Var, "Can't begin reading element, unexpected token", 0, null, 6);
                throw null;
            }
            this.c = 1;
            obj = adVar.r(pw2Var, this);
            if (obj == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return (cc6) obj;
    }
}
