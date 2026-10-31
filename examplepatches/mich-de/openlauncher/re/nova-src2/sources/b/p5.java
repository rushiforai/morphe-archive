package b;

import ads_mobile_sdk.tx0;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public interface p5 extends u7 {
    tx0 a();

    default Object a(Function2 function2, ContinuationImpl continuationImpl) {
        Object objInvoke = function2.invoke(a(), continuationImpl);
        return objInvoke == CoroutineSingletons.f71806a ? objInvoke : Unit.f71706a;
    }
}
