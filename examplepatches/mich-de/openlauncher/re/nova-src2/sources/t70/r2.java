package t70;

import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class r2 extends y70.s {

    /* renamed from: e, reason: collision with root package name */
    public final ThreadLocal f88855e;
    private volatile boolean threadLocalIsSet;

    /* JADX WARN: Illegal instructions before constructor call */
    public r2(Continuation continuation, CoroutineContext coroutineContext) {
        s2 s2Var = s2.f88859a;
        super(continuation, coroutineContext.get(s2Var) == null ? coroutineContext.plus(s2Var) : coroutineContext);
        this.f88855e = new ThreadLocal();
        if (continuation.getContext().get(ContinuationInterceptor.f71801cp) instanceof c0) {
            return;
        }
        Object objC = y70.w.c(coroutineContext, null);
        y70.w.a(coroutineContext, objC);
        p0(coroutineContext, objC);
    }

    @Override // y70.s
    public final void m0() {
        o0();
    }

    public final boolean n0() {
        boolean z11 = this.threadLocalIsSet && this.f88855e.get() == null;
        this.f88855e.remove();
        return !z11;
    }

    public final void o0() {
        if (this.threadLocalIsSet) {
            Pair pair = (Pair) this.f88855e.get();
            if (pair != null) {
                y70.w.a((CoroutineContext) pair.f71683a, pair.f71684b);
            }
            this.f88855e.remove();
        }
    }

    public final void p0(CoroutineContext coroutineContext, Object obj) {
        this.threadLocalIsSet = true;
        this.f88855e.set(new Pair(coroutineContext, obj));
    }

    @Override // y70.s, t70.x1
    public final void v(Object obj) {
        o0();
        Object objA = w.a(obj);
        Continuation continuation = this.f96824d;
        CoroutineContext context = continuation.getContext();
        Object objC = y70.w.c(context, null);
        r2 r2VarC = objC != y70.w.f96829a ? z.c(continuation, context, objC) : null;
        try {
            continuation.resumeWith(objA);
            Unit unit = Unit.f71706a;
            if (r2VarC == null || r2VarC.n0()) {
                y70.w.a(context, objC);
            }
        } catch (Throwable th2) {
            if (r2VarC == null || r2VarC.n0()) {
                y70.w.a(context, objC);
            }
            throw th2;
        }
    }
}
