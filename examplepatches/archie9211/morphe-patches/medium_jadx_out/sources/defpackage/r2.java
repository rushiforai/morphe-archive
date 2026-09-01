package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Ldo4;", "", "Lc1e;", "<anonymous>", "(Ldo4;)V"}, k = 3, mv = {2, 2, 0})
@uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watch$1", f = "AbstractSharedPreferences.kt", l = {300}, m = "invokeSuspend", v = 1)
public final class r2 extends p4d implements b55 {
    int b;
    private /* synthetic */ Object c;
    final /* synthetic */ p2 d;
    final /* synthetic */ ek6 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r2(p2 p2Var, ek6 ek6Var, n92<? super r2> n92Var) {
        super(2, n92Var);
        this.d = p2Var;
        this.e = ek6Var;
    }

    @Override // defpackage.kn0
    public final n92<c1e> create(Object obj, n92<?> n92Var) {
        r2 r2Var = new r2(this.d, this.e, n92Var);
        r2Var.c = obj;
        return r2Var;
    }

    @Override // defpackage.b55
    /* JADX INFO: renamed from: i, reason: merged with bridge method [inline-methods] */
    public final Object invoke(do4 do4Var, n92<? super c1e> n92Var) {
        return ((r2) create(do4Var, n92Var)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        do4 do4Var = (do4) this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            String strR = this.d.r(this.e);
            this.c = null;
            this.b = 1;
            if (do4Var.a(strR, this) == tb2Var) {
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
