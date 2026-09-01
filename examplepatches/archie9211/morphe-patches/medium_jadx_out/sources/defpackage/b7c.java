package defpackage;

import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b7c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ g7c d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b7c(g7c g7cVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = g7cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        g7c g7cVar = this.d;
        switch (i) {
            case 0:
                return new b7c(g7cVar, n92Var, 0);
            default:
                return new b7c(g7cVar, n92Var, 1);
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
        return ((b7c) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        Object obj2 = c1e.a;
        int i2 = 0;
        g7c g7cVar = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ro4 ro4Var = new ro4(g7cVar.e.getData(), new yk(g7cVar, n92Var, 15), 1);
                a7c a7cVar = new a7c(i2, g7cVar);
                this.c = 1;
                return ro4Var.b(a7cVar, this) == tb2Var ? tb2Var : obj2;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                try {
                    if (i4 == 0) {
                        br7.v(obj);
                        tt2 tt2Var = g7cVar.e;
                        e7c e7cVar = new e7c(g7cVar, n92Var, i2);
                        this.c = 1;
                        if (tt2Var.a(e7cVar, this) == tb2Var2) {
                            obj2 = tb2Var2;
                        }
                    } else {
                        if (i4 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                    }
                    return obj2;
                } catch (Exception e) {
                    Log.d("FirebaseSessions", "App backgrounded, failed to update data. Message: " + e.getMessage());
                    t0c t0cVar = g7cVar.h;
                    if (t0cVar == null) {
                        g76.g0("localSessionData");
                        throw null;
                    }
                    g7cVar.d.getClass();
                    g7cVar.h = t0c.a(t0cVar, null, bmd.a(), null, 5);
                    return obj2;
                }
        }
    }
}
