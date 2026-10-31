package vs;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class n extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ boolean f92983t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ boolean f92984u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ boolean f92985v;

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
        boolean zBooleanValue3 = ((Boolean) obj3).booleanValue();
        n nVar = new n(4, (Continuation) obj4);
        nVar.f92983t = zBooleanValue;
        nVar.f92984u = zBooleanValue2;
        nVar.f92985v = zBooleanValue3;
        return nVar.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        return Boolean.valueOf(this.f92983t && this.f92984u && this.f92985v);
    }
}
