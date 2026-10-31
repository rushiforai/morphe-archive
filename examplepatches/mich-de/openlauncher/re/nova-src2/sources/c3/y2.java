package c3;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class y2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f19478t;

    /* renamed from: u, reason: collision with root package name */
    public int f19479u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f19478t = obj;
        this.f19479u |= Integer.MIN_VALUE;
        z2.b(null, null, this);
        return CoroutineSingletons.f71806a;
    }
}
