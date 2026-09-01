package defpackage;

import com.medium.android.graphql.FullPostQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wc5 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ String f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wc5(n92 n92Var, Object obj, String str, Object obj2, int i) {
        super(3, n92Var);
        this.b = i;
        this.g = obj;
        this.f = str;
        this.h = obj2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.h;
        Object obj5 = this.g;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                wc5 wc5Var = new wc5(n92Var, (xc5) obj5, this.f, (bie) obj4, 0);
                wc5Var.d = do4Var;
                wc5Var.e = obj2;
                return wc5Var.invokeSuspend(c1eVar);
            default:
                wc5 wc5Var2 = new wc5(n92Var, (gn9) obj5, this.f, (FullPostQuery) obj4, 1);
                wc5Var2.d = do4Var;
                wc5Var2.e = obj2;
                return wc5Var2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        bo4 bo4VarQ;
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.h;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                Object obj4 = this.e;
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
                n92 n92Var = null;
                if (vc5.a[((os0) obj4).b.ordinal()] == 1) {
                    bo4VarQ = new u50(7, new oz8(ey3.a, false, false, false));
                } else {
                    xc5 xc5Var = (xc5) obj3;
                    bo4VarQ = xc5Var.d.Q(new yj2(xc5Var, this.f, (bie) obj2, n92Var, 5));
                }
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var, bo4VarQ, this) == tb2Var ? tb2Var : c1eVar;
            default:
                do4 do4Var2 = this.d;
                Object obj5 = this.e;
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
                u50 u50Var = new u50(12, new hm9((gn9) obj3, this.f, (FullPostQuery) obj2, null));
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var2, u50Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
