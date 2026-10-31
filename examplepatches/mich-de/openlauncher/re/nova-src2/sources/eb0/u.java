package eb0;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52650t;

    /* renamed from: u, reason: collision with root package name */
    public int f52651u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52650t = obj;
        this.f52651u |= Integer.MIN_VALUE;
        w0.r(null, this);
        return CoroutineSingletons.f71806a;
    }
}
