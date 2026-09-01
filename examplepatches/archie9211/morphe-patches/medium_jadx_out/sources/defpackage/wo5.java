package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wo5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ap5 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wo5(ap5 ap5Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ap5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ap5 ap5Var = this.d;
        switch (i) {
            case 0:
                return new wo5(ap5Var, n92Var, 0);
            case 1:
                return new wo5(ap5Var, n92Var, 1);
            default:
                return new wo5(ap5Var, n92Var, 2);
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
        return ((wo5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        ap5 ap5Var = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    go5 go5Var = ap5Var.d;
                    this.c = 1;
                    Object objD = go5Var.b.D(this);
                    if (objD != tb2Var) {
                        objD = c1eVar;
                    }
                    if (objD == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    og3 og3Var = ap5Var.c;
                    UserDismissableFlags userDismissableFlags = UserDismissableFlags.HOMEFEED_FEATURED_TAB_NEW_LABEL;
                    this.c = 1;
                    if (og3Var.c(userDismissableFlags, this) == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    Object obj2 = ((bjb) obj).a;
                }
                return c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    go5 go5Var2 = ap5Var.d;
                    this.c = 1;
                    Object objC0 = go5Var2.b.c0(this);
                    if (objC0 != tb2Var3) {
                        objC0 = c1eVar;
                    }
                    if (objC0 == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar;
        }
    }
}
