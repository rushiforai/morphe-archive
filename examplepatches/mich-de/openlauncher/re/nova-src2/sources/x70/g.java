package x70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import tx.h0;

/* loaded from: classes.dex */
public abstract class g extends d {

    /* renamed from: d, reason: collision with root package name */
    public final w70.m f95229d;

    public g(int i5, CoroutineContext coroutineContext, v70.a aVar, w70.m mVar) {
        super(coroutineContext, i5, aVar);
        this.f95229d = mVar;
    }

    @Override // x70.d, w70.m
    public final Object collect(w70.n nVar, Continuation continuation) {
        if (this.f95220b == -3) {
            CoroutineContext context = continuation.getContext();
            Boolean bool = Boolean.FALSE;
            m3.a0 a0Var = new m3.a0(12);
            CoroutineContext coroutineContext = this.f95219a;
            CoroutineContext coroutineContextPlus = !((Boolean) coroutineContext.fold(bool, a0Var)).booleanValue() ? context.plus(coroutineContext) : t70.z.a(context, coroutineContext, false);
            if (Intrinsics.b(coroutineContextPlus, context)) {
                Object objI = i(nVar, continuation);
                return objI == CoroutineSingletons.f71806a ? objI : Unit.f71706a;
            }
            ContinuationInterceptor.Key key = ContinuationInterceptor.f71801cp;
            if (Intrinsics.b(coroutineContextPlus.get(key), context.get(key))) {
                Object objR = p6.f.R(coroutineContextPlus, p6.f.s(nVar, continuation.getContext()), y70.w.b(coroutineContextPlus), new h0(this, null, 16), continuation);
                return objR == CoroutineSingletons.f71806a ? objR : Unit.f71706a;
            }
        }
        Object objCollect = super.collect(nVar, continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }

    @Override // x70.d
    public final Object e(v70.x xVar, Continuation continuation) {
        Object objI = i(new y(xVar), continuation);
        return objI == CoroutineSingletons.f71806a ? objI : Unit.f71706a;
    }

    public abstract Object i(w70.n nVar, Continuation continuation);

    @Override // x70.d
    public final String toString() {
        return this.f95229d + " -> " + super.toString();
    }
}
