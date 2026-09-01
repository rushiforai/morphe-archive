package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nge extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ oge d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nge(oge ogeVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ogeVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        oge ogeVar = this.d;
        switch (i) {
            case 0:
                return new nge(ogeVar, n92Var, 0);
            default:
                return new nge(ogeVar, n92Var, 1);
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
        return ((nge) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        oge ogeVar = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    og3 og3Var = ogeVar.e;
                    UserDismissableFlags userDismissableFlags = UserDismissableFlags.VERIFIED_BOOK_AUTHORS_CTA;
                    this.c = 1;
                    if (og3Var.c(userDismissableFlags, this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    Object obj2 = ((bjb) obj).a;
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    gge ggeVar = ogeVar.d;
                    this.c = 1;
                    Object objA = ggeVar.b.a(new tfe(yd4.NetworkOnly), this);
                    if (objA != tb2Var2) {
                        objA = c1eVar;
                    }
                    if (objA == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
        }
        return c1eVar;
    }
}
