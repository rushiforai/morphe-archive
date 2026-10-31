package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class c extends h {

    /* renamed from: e, reason: collision with root package name */
    public final SuspendLambda f93865e;

    /* JADX WARN: Multi-variable type inference failed */
    public c(Function2 function2, CoroutineContext coroutineContext, int i5, v70.a aVar) {
        super(function2, coroutineContext, i5, aVar);
        this.f93865e = (SuspendLambda) function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.h, x70.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(v70.x xVar, Continuation continuation) {
        b bVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f93853w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f93853w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = bVar.f93851u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = bVar.f93853w;
        if (i11 == 0) {
            ResultKt.b(obj);
            bVar.f93850t = xVar;
            bVar.f93853w = 1;
            if (super.e(xVar, bVar) == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            xVar = bVar.f93850t;
            ResultKt.b(obj);
        }
        if (((v70.w) xVar).f92201d.A()) {
            return Unit.f71706a;
        }
        throw new IllegalStateException("'awaitClose { yourCallbackOrListener.cancel() }' should be used in the end of callbackFlow block.\nOtherwise, a callback/listener may leak in case of external cancellation.\nSee callbackFlow API documentation for the details.");
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // w70.h, x70.d
    public final x70.d f(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return new c(this.f93865e, coroutineContext, i5, aVar);
    }
}
