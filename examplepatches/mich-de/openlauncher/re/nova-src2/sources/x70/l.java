package x70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import t70.k0;

/* loaded from: classes.dex */
public final class l extends g {

    /* renamed from: e, reason: collision with root package name */
    public final SuspendLambda f95244e;

    /* JADX WARN: Multi-variable type inference failed */
    public l(Function3 function3, w70.m mVar, CoroutineContext coroutineContext, int i5, v70.a aVar) {
        super(i5, coroutineContext, aVar, mVar);
        this.f95244e = (SuspendLambda) function3;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function3] */
    @Override // x70.d
    public final d f(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return new l(this.f95244e, this.f95229d, coroutineContext, i5, aVar);
    }

    @Override // x70.g
    public final Object i(w70.n nVar, Continuation continuation) {
        Object objD = k0.d(new k(this, nVar, null), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }
}
