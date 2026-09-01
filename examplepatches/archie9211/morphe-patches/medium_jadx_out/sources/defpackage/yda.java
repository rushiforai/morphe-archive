package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yda extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ db8 d;
    public final /* synthetic */ fha e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yda(db8 db8Var, fha fhaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = db8Var;
        this.e = fhaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new yda(this.d, this.e, n92Var, 0);
            default:
                return new yda(this.d, this.e, n92Var, 1);
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
        return ((yda) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        vob vobVarA;
        vob vobVarA2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        fha fhaVar = this.e;
        db8 db8Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                    } else {
                        br7.v(obj);
                    }
                    break;
                } else {
                    br7.v(obj);
                    ba8 ba8VarF = db8Var.b.f();
                    if (ba8VarF != null && (vobVarA = ba8VarF.a()) != null) {
                        wua wuaVarC = vobVarA.c("publications_result", null);
                        xda xdaVar = new xda(fhaVar, vobVarA, 0);
                        this.c = 1;
                        if (wuaVarC.a.b(xdaVar, this) == tb2Var) {
                        }
                        break;
                    }
                }
                z72.b();
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                    } else {
                        br7.v(obj);
                    }
                    break;
                } else {
                    br7.v(obj);
                    ba8 ba8VarF2 = db8Var.b.f();
                    if (ba8VarF2 != null && (vobVarA2 = ba8VarF2.a()) != null) {
                        wua wuaVarC2 = vobVarA2.c("topics_result", null);
                        xda xdaVar2 = new xda(fhaVar, vobVarA2, 1);
                        this.c = 1;
                        if (wuaVarC2.a.b(xdaVar2, this) == tb2Var2) {
                        }
                        break;
                    }
                }
                z72.b();
                break;
        }
        return null;
    }
}
