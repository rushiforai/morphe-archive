package x70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes5.dex */
public final class h extends g {
    public h(w70.m mVar, CoroutineContext coroutineContext, int i5, v70.a aVar, int i11) {
        super((i11 & 4) != 0 ? -3 : i5, (i11 & 2) != 0 ? EmptyCoroutineContext.f71803a : coroutineContext, (i11 & 8) != 0 ? v70.a.f92141a : aVar, mVar);
    }

    @Override // x70.d
    public final d f(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return new h(i5, coroutineContext, aVar, this.f95229d);
    }

    @Override // x70.d
    public final w70.m g() {
        return this.f95229d;
    }

    @Override // x70.g
    public final Object i(w70.n nVar, Continuation continuation) {
        Object objCollect = this.f95229d.collect(nVar, continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }

    public h(int i5, CoroutineContext coroutineContext, v70.a aVar, w70.m mVar) {
        super(i5, coroutineContext, aVar, mVar);
    }
}
