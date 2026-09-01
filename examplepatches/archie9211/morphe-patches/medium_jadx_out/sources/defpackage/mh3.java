package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mh3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ph3 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mh3(ph3 ph3Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ph3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new mh3(this.d, n92Var, 0);
            default:
                return new mh3(this.d, n92Var, 1);
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
        return ((mh3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ph3 ph3Var = this.d;
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
                dne smaller = ph3Var.d.a.O().getSmaller();
                if (smaller == null) {
                    return c1eVar;
                }
                pu7 pu7Var = ph3Var.d.a;
                pu7Var.getClass();
                pu7Var.C(ek6.SETTINGS_TEXT_SIZE, smaller.name());
                r6c r6cVar = ph3Var.h;
                jh3 jh3Var = new jh3(smaller);
                this.c = 1;
                return r6cVar.a(jh3Var, this) == tb2Var ? tb2Var : c1eVar;
            default:
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
                dne larger = ph3Var.d.a.O().getLarger();
                if (larger == null) {
                    return c1eVar;
                }
                pu7 pu7Var2 = ph3Var.d.a;
                pu7Var2.getClass();
                pu7Var2.C(ek6.SETTINGS_TEXT_SIZE, larger.name());
                r6c r6cVar2 = ph3Var.h;
                jh3 jh3Var2 = new jh3(larger);
                this.c = 1;
                return r6cVar2.a(jh3Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
