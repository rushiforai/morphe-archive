package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hd1 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hd1(mu2 mu2Var, n92 n92Var) {
        super(3, n92Var);
        this.b = 1;
        this.d = mu2Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        int i2 = 3;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj2).intValue();
                hd1 hd1Var = new hd1(i2, 0, (n92) obj3);
                hd1Var.d = (List) obj;
                hd1Var.c = iIntValue;
                return hd1Var.invokeSuspend(c1eVar);
            case 1:
                return new hd1((mu2) this.d, (n92) obj3).invokeSuspend(c1eVar);
            default:
                ((Boolean) obj2).getClass();
                hd1 hd1Var2 = new hd1(i2, 2, (n92) obj3);
                hd1Var2.d = (ug4) obj;
                return hd1Var2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        switch (this.b) {
            case 0:
                List list = (List) this.d;
                int i = this.c;
                br7.v(obj);
                return new f09(list, new Integer(i));
            case 1:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    mu2 mu2Var = (mu2) this.d;
                    this.c = 1;
                    if (mu2Var.b(this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ug4 ug4Var = (ug4) this.d;
                this.c = 1;
                ug4Var.getClass();
                Object objA = ug4.a(ug4Var, this);
                return objA == tb2Var2 ? tb2Var2 : objA;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hd1(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }
}
