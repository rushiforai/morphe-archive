package hq;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.i2;

/* loaded from: classes4.dex */
public final class v extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f60029t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ w f60030u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(w wVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f60029t = i5;
        this.f60030u = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f60029t) {
            case 0:
                return new v(this.f60030u, continuation, 0);
            default:
                return new v(this.f60030u, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f60029t) {
        }
        return ((v) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f60029t;
        w wVar = this.f60030u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                i2 i2Var = wVar.f60036f;
                Boolean bool = Boolean.TRUE;
                i2Var.getClass();
                i2Var.k(null, bool);
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                i2 i2Var2 = wVar.f60036f;
                Boolean bool2 = Boolean.FALSE;
                i2Var2.getClass();
                i2Var2.k(null, bool2);
                break;
        }
        return Unit.f71706a;
    }
}
