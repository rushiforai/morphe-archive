package defpackage;

import com.medium.android.following.FollowingTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xx4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ gz8 d;
    public final /* synthetic */ l78 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xx4(gz8 gz8Var, l78 l78Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = gz8Var;
        this.e = l78Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        l78 l78Var = this.e;
        gz8 gz8Var = this.d;
        switch (i) {
            case 0:
                return new xx4(gz8Var, l78Var, n92Var, 0);
            default:
                return new xx4(gz8Var, l78Var, n92Var, 1);
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
        return ((xx4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.e;
        gz8 gz8Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    int iOrdinal = ((FollowingTab) l78Var.getValue()).ordinal();
                    this.c = 1;
                    return gz8Var.f(iOrdinal, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    int iOrdinal2 = ((gl8) l78Var.getValue()).a.ordinal();
                    this.c = 1;
                    return gz8Var.f(iOrdinal2, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
