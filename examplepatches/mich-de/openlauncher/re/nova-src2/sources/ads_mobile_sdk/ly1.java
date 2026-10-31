package ads_mobile_sdk;

import b.p2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ly1 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final p2 f6992a;

    public ly1(p2 nativeJavascriptEngine) {
        Intrinsics.g(nativeJavascriptEngine, "nativeJavascriptEngine");
        this.f6992a = nativeJavascriptEngine;
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        Object objA = this.f6992a.a((SuspendLambda) continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
