package w70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public class h extends x70.d {

    /* renamed from: d, reason: collision with root package name */
    public final SuspendLambda f93911d;

    /* JADX WARN: Multi-variable type inference failed */
    public h(Function2 function2, CoroutineContext coroutineContext, int i5, v70.a aVar) {
        super(coroutineContext, i5, aVar);
        this.f93911d = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // x70.d
    public Object e(v70.x xVar, Continuation continuation) {
        Object objInvoke = this.f93911d.invoke(xVar, continuation);
        return objInvoke == CoroutineSingletons.f71806a ? objInvoke : Unit.f71706a;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // x70.d
    public x70.d f(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return new h(this.f93911d, coroutineContext, i5, aVar);
    }

    @Override // x70.d
    public final String toString() {
        return "block[" + this.f93911d + "] -> " + super.toString();
    }
}
