package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d02 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final b02 f2142a;

    public d02(b02 nativeOnePointFiveOverlayFactory) {
        Intrinsics.g(nativeOnePointFiveOverlayFactory, "nativeOnePointFiveOverlayFactory");
        this.f2142a = nativeOnePointFiveOverlayFactory;
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        b02 b02Var = this.f2142a;
        b02Var.getClass();
        Object objB = b02.b(b02Var, (ContinuationImpl) continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }
}
