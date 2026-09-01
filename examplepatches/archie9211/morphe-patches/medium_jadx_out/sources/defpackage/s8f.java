package defpackage;

import androidx.work.impl.WorkerStoppedException;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s8f extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ u8f d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s8f(u8f u8fVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = u8fVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        u8f u8fVar = this.d;
        switch (i) {
            case 0:
                return new s8f(u8fVar, n92Var, 0);
            default:
                return new s8f(u8fVar, n92Var, 1);
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
        return ((s8f) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object o8fVar;
        int i = this.b;
        u8f u8fVar = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Object objC = u8fVar.c(this);
                    return objC == tb2Var ? tb2Var : objC;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                try {
                    if (i3 == 0) {
                        br7.v(obj);
                        wa6 wa6Var = u8fVar.m;
                        s8f s8fVar = new s8f(u8fVar, n92Var, 0);
                        this.c = 1;
                        obj = vx0.m0(wa6Var, s8fVar, this);
                        if (obj == tb2Var2) {
                            return tb2Var2;
                        }
                    } else {
                        if (i3 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                    }
                    o8fVar = (r8f) obj;
                    break;
                } catch (WorkerStoppedException e) {
                    o8fVar = new q8f(e.a);
                } catch (CancellationException unused) {
                    o8fVar = new o8f();
                } catch (Throwable th) {
                    d87.h().g(v8f.a, "Unexpected error in WorkerWrapper", th);
                    o8fVar = new o8f();
                }
                Object objP = u8fVar.h.p(new i5b(9, new wu2(o8fVar, 4, u8fVar)));
                objP.getClass();
                return objP;
        }
    }
}
