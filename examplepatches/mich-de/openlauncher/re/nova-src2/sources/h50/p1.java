package h50;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.AdaptedFunctionReference;

/* loaded from: classes.dex */
public final /* synthetic */ class p1 extends AdaptedFunctionReference implements Function1, SuspendFunction {
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object objC = ((w50.e) this.receiver).c((Continuation) obj);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }
}
