package t70;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class s0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f88856t;

    /* renamed from: u, reason: collision with root package name */
    public int f88857u;

    public s0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88856t = obj;
        this.f88857u |= Integer.MIN_VALUE;
        t0.a(this);
        return CoroutineSingletons.f71806a;
    }
}
